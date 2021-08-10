require 'uri'
require 'net/http'

module ApplicationHelper
  def cat_image
    uri = URI('https://api.thecatapi.com/v1/images/search')
    params = { api_key: ENV['cat_api_key'] }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get(uri)
    JSON.parse(res)[0]['url']
  end
end
