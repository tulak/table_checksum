module TableChecksum
  class Railtie < Rails::Railtie
    initializer "table_checksum.insert_middleware" do |app|
      app.config.middleware.use "TableChecksum::PerRequestCache"
    end
  end
end