require 'spec_helper'

describe Weather::CLI do
  let(:instance) { Weather::CLI.new(argv) }
  let(:stdout) { [] }
  let(:stderr) { [] }

  before do
    instance.output_stream = stdout
    instance.error_stream = stderr
  end

  describe "#call" do
    context 'for "help"' do
      let(:argv) { %w( help ) }

      it "prints the help information" do
        instance.call

        expect(stdout).to include("usage: weather [--version] <location> <today>\n")
        expect(stdout).to include(" acceptable date terms: today | tomorrow | this week\n")
      end
    end

    context 'for "--version"' do
      let(:argv) { %w( --version ) }

      it 'prints the version information' do
        instance.call

        expect(stdout).to include("Weather #{Weather::VERSION}\n")
      end
    end
  end
end