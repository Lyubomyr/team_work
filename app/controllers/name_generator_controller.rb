class NameGeneratorController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def generate
    generate_names
    @result.each do |r|
      NameGeneration.create name: r
    end
    CheckDomainsWorker.perform_async(@result)
    render nothing: true
  end

  def update_domains
    result = []
    @generated_names = ""
    list = params[:list].reject { |c| c.empty? }
    if list.present? && list.count > 1
      generate_names
      gnames = NameGeneration.where(name: @result)
      gnames.each do |g|
        result.push(g.domains_info || g.name) if g
      end
    end
    @generated_names = result.compact.join("\r\n")
  end

  private

  def generate_names
    lists = params[:list].map{|l| l.split("\r\n")}.reject { |c| c.empty? }.map{|l| l.map{|l| l.strip.humanize} }
    @result = lists[0].product(lists[1])
    @result += lists[1].product(lists[0])
    @result = @result.map{|r| r.join }.uniq
  end
end
