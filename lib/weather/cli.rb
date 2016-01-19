module Weather
  class CLI
    attr_accessor :output_stream, :error_stream

    def initialize(argv)
      @argv = argv
      @output_stream = STDOUT
      @error_stream = STDERR
    end

    def call
      with_options(tool).call
    end

    private

    def tool
      @tool ||= begin
        case @argv[0]
        when 'help', '--help'
          Weather::Tools::Help.new
        when '-v', '--version'
          Weather::Tools::Version.new
        when 'canberra'
          Weather::Tools::Report.new(@argv[1])
        else
          Weather::Tools::Help.new
        end
      end
    end

    def with_options(tool)
      tool.output_stream = output_stream
      tool.error_stream = error_stream
      tool
    end
  end
end