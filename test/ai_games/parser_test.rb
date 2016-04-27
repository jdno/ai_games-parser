require 'test_helper'

module AiGames
  class ParserTest < Minitest::Test
    def setup
      @input = StringIO.new
      @output = StringIO.new
      @parser = Parser.new(input: @input, output: @output)
    end

    def test_that_it_has_a_version_number
      refute_nil ::AiGames::Parser::VERSION
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
