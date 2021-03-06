module Intelipost
  class Api
    attr_accessor :api_key

    def initialize(api_key, environment=nil)
      self.api_key = api_key
      $logger = Logging.logger(log_env(environment))
      $logger.level = :info
    end

    def CepLocation
      ApiComponents::CepLocation.new(self.api_key)
    end

    def Quote
      ApiComponents::Quote.new(self.api_key)
    end

    def log_env(environment)
      if environment.nil?
        STDOUT
      else
        "logs/intelipost_#{environment}.log"
      end
    end
  end
end
