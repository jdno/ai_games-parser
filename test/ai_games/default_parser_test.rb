require 'test_helper'
require 'ai_games/parser/default_parser'

module AIGames
  module Parser
    class DefaultParserTest < Minitest::Test
      def setup
        @input = StringIO.new
        @output = StringIO.new
        @parser = DefaultParser.new(input: @input, output: @output)
      end

      def test_initialize
        assert_equal @input, @parser.send(:input)
        assert_equal @output, @parser.send(:output)
      end

      def test_parse
        assert_raises RuntimeError do
          @parser.parse "This won't work"
        end
      end
    end
  end
end
