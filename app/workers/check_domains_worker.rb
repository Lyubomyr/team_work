class CheckDomainsWorker
  include Sidekiq::Worker

  def perform(list)
    list.each do |r|
      com_response = JSON.parse(RestClient::Resource.new("http://whoiz.herokuapp.com/lookup.json?url=#{r}.com").get)
      com_aval = com_response.try(:[], "available?")
      net_response = JSON.parse(RestClient::Resource.new("http://whoiz.herokuapp.com/lookup.json?url=#{r}.net").get)
      net_aval = net_response.try(:[], "available?")
      aval = "#{r}.com - #{com_aval}, #{r}.net - #{net_aval}"
      NameGeneration.find_by_name(r).update_attributes(domains_info: aval)
    end
  end
end
