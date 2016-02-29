require 'http'
require 'timeout'
require 'ox'

# CBR rates expert class
class CbrRatesProvider < HttpApiClient

  URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze
  DATE_PARAM = 'date_req'.freeze
  DATE_FORMAT = '%d/%m/%Y'.freeze

  attr_accessor :date

  def initialize(date)
    self.date = Date.parse(date)
  end

  def get(code)
    params = { DATE_PARAM => date.strftime(DATE_FORMAT) }
    rate_nodes = fetch_and_parse(URL, params)
    rate_node = rate_nodes.find { |node| node.CharCode.text == code }
    return rate_node.Value.text.tr(',', '.').to_f if rate_node
  end

  private

  def fetch_and_parse(url, params)
    xml = http_get(url, params)
    doc = Ox.load(xml.to_s)
    doc.locate('ValCurs/*')
  end

  def service_name
    'CBR'
  end

end
