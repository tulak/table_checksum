module TableChecksum
  class PerRequestCache
    class << self
      def open_the_cache
        @cache ||= {}
        @cache[self.cache_key] ||= {}
      end
    
      def cache_key
        "#{Process.pid}_#{Thread.current.object_id}".to_sym
      end

      def clear_the_cache
        @cache.delete(self.cache_key)
      end

      def fetch(key, &block)
        return yield if @cache.nil?
        @cache[self.cache_key][key] ||= yield
      end
    end
 
    def initialize(app)
      @app = app
    end
 
    def call(env)
      self.class.open_the_cache
      @app.call(env)
    ensure
      self.class.clear_the_cache
    end
  end
end