task :create_rate => :environment do
  floating_rate = 0.3
  url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22AUDCNY%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
  response = HTTParty.get(url)
  rate = response['query']['results']['rate']['Ask'].to_f + floating_rate
  # rate = '%.2f' % rate
  # if ExchangeRate.any?
  #   ExchangeRate.first.update_attribute(:rate, rate)
  # else
  #   ExchangeRate.create(rate:rate)
  # end
  Rails.cache.write('exchange_rate', rate)
end