require 'table_checksum/per_request_cache'
require 'table_checksum/railitie' if defined? Rails

module TableChecksum
  def self.for table
    table = table.table_name if table.respond_to? :table_name
    PerRequestCache.fetch(table) do
      ActiveRecord::Base.connection.execute("CHECKSUM TABLE #{table}").first
    end
  end
  
  module ActiveRecordClassMethods
    def checksum
      TableChecksum.for(self)
    end
    
    def cache_key
      checksum.to_param
    end
  end
end

ActiveRecord::Base.class_eval do
  extend TableChecksum::ActiveRecordClassMethods
end