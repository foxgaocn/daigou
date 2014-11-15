task :create_rate => :environment do
  Rails.cache.write('exchange_rate', 5.97)
end