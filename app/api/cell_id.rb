require "rexml/document"
class CellId
  def initialize()
    @key = '665510f6-8779-4285-ac54-8e20de26cef4'
    @base_url = 'http://www.opencellid.org'
    @get_url = '/cell/get'
  end
  
  def process_location(mcc = nil, mnc = nil, lac = nil, cellid = nil)
    result = {}
    uri = URI("#{@base_url}#{@get_url}")
    params = { :key => @key, :mcc => mcc, :mnc => mnc, :lac => lac, :cellid => cellid }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    document = REXML::Document.new(response.body)
    result[:status] = REXML::XPath.first(document, "/rsp/@stat").to_s
    if result[:status] == 'ok'
      result[:lat] = REXML::XPath.first(document, "/rsp/cell/@lat").to_s
      result[:lon] = REXML::XPath.first(document, "/rsp/cell/@lon").to_s
    else
      result[:reason] = REXML::XPath.first(document, "/rsp/err/@info").to_s
    end
    return result
  end
end
