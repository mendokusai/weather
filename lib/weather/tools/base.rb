module Weather
  module Tools
    # Tools::Base provides common functionality for streaming.
    # Cross them as you like!
    class Base
      attr_accessor :output_stream, :error_stream

      private

      def log(message)
        output_stream << "#{message}\n"
      end

      def error(message)
        error_stream << "#{message}\n"
      end
    end
  end
end
