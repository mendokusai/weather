module Weather
  module Tools
    # Simply outputs the version of the current gem.
    class Version < Base
      def call
        log("Weather #{Weather::VERSION}")
      end
    end
  end
end
