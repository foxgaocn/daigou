if(defined? ExchangeRate)
  ExchangeRate.destroy_all
  ExchangeRate.create({rate: 5.45})
end