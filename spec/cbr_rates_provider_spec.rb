RSpec.describe CbrRatesProvider do

  let(:date) { '2015-10-15' }

  [['USD', 63.1248]].each do |code, expected_rate|
    context code do
      context 'should work' do

        before :example do
          stub_request(:get, 'http://www.cbr.ru/scripts/XML_daily.asp?date_req=15/10/2015').
            to_return(status: 200, body: load_fixture_text("#{date}.xml"))
        end

        subject do
          CbrRatesProvider.new(date).get(code)
        end

        it { is_expected.to eq(expected_rate) }

      end
    end
  end
end
