module Weather
  module Tools
    class Help < Base
      def call
        log("usage: weather [--version] <location> <today>")
        log(" acceptable date terms: today | tomorrow | this week")
      end
    end
  end
end
