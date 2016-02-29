require 'http'
require 'timeout'
require 'ox'

# CBR rates expert class
class CbrRatesProvider

  URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze
  DATE_PARAM = 'date_req'.freeze
  DATE_FORMAT = '%d/%m/%Y'.freeze
  HTTP_TIMEOUT_SECS = 1500

  attr_accessor :date

  def initialize(date)
    self.date = Date.parse(date)
  end

  def get(code)
    params = { DATE_PARAM => date.strftime(DATE_FORMAT) }
    rate_nodes = request_and_parse(URL, params)
    rate_node = rate_nodes.find { |node| node.CharCode.text == code }
    return rate_node.Value.text.tr(',', '.').to_f if rate_node
  end

  private

  def request_and_parse(url, params)
    logger.debug "requesting #{url.inspect} with parameters #{params.inspect}"
    t0 = Time.now
    xml = http_timeout.get(url, params: params).to_s
    logger.debug "CBR answered in #{Time.now - t0}s"

    doc = Ox.load(xml)
    doc.locate('ValCurs/*')
  end

  def http_gem_timeout
    # due to strangeness of HTTP gem timeout API this needs to be divided - resulting timeout will be the whole
    HTTP_TIMEOUT_SECS / 3
  end

  def http_timeout
    HTTP.timeout(:global, write: http_gem_timeout, connect: http_gem_timeout, read: http_gem_timeout)
  end

end
