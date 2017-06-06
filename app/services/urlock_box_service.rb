class UrlockBoxService

  def self.get_links
    response = Faraday.get("http://damp-journey-77886.herokuapp.com/api/v1/hot_urls")
    JSON.parse(response.body, symbolize_names: true)
  end
end
