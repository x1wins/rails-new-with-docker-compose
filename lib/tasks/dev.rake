require 'factory_bot_rails'

namespace :dev do
  desc "insert shippings data"
  task shippings_seeds: :environment do
    Rails.logger.debug "Creating shipping..."
    threads = []
    10.times do |j|
      threads << Thread.new do
        ActiveRecord::Base.connection_pool.release_connection
        ActiveRecord::Base.connection_pool.with_connection do
          1_000_000.times do |i|
            FactoryBot.create :shipping
          end
        end
      end
    end
    threads.each{|t| t.join}
    Rails.logger.debug "shipping created..."
  end

end
