class NameGeneratorController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def generate
    res = []
    lists = params[:list].map{|l| l.split("\r\n")}.reject { |c| c.empty? }.map{|l| l.map{|l| l.strip.humanize} }
    result = lists[0].product(lists[1])
    result += lists[1].product(lists[0])
    result = result.map{|r| r.join }.uniq
    result.each do |r|
      com_response = JSON.parse(RestClient::Resource.new("http://whoiz.herokuapp.com/lookup.json?url=#{r}.com").get)
      com_aval = com_response.try(:[], "available?")
      net_response = JSON.parse(RestClient::Resource.new("http://whoiz.herokuapp.com/lookup.json?url=#{r}.net").get)
      net_aval = net_response.try(:[], "available?")
      res << "#{r} : com - #{com_aval}  net - #{net_aval}"
    end
    @generated_names = res.join("\r\n")
  end
end
