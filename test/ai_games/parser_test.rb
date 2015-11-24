require 'test_helper'

module AIGames
  class ParserTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::AIGames::Parser::VERSION
    end
  end
end
