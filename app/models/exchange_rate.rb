class ExchangeRate < ActiveRecord::Base
  after_create :refresh_cache

  def refresh_cache
    Rails.cache.write('exchange_rate', rate.round(3).to_f)
  end
end