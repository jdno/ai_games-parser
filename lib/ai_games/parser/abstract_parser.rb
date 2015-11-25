# Copyright (c) 2015 Jan David Nose
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
require 'ai_games/logger'

module AIGames
  module Parser
    # This class provides an abstract parser that can be extended to implement
    # the logic that is required for a specific competition. It provides methods
    # to communicate with the game engine, but does NOT contain any logic how to
    # parse the engine's commands. This is totally up to the implementations of
    # this class.
    class AbstractParser
      # Initializes the parser. Pass in options using a hash structure.
      def initialize(options = nil)
        initialize_streams options if options
      end

      # Starts the main loop. This loop runs until the game engine closes the
      # console line. During the loop, the parser reads from the game engine,
      # sanitizes the input a little bit, and then passes it to a method that
      # needs to be overwritten by parsers extending this interface.
      def run
        AIGames::Logger.info 'Parser.run : Starting loop'

        loop do
          command = read_from_engine
          break if command.nil?

          command.strip!
          next if command.length == 0

          response = parse split_line command
          write_to_engine response unless response.nil? || response.length < 1
        end

        AIGames::Logger.info 'Parser.run : Stopping loop'
      end

      # Parses the given command array. This method MUST return a valid response
      # string that can be send to the engine.
      # rubocop:disable Lint/UnusedMethodArgument
      def parse(command_array)
        fail 'Method must be overwritten'
      end
      # rubocop:enable Lint/UnusedMethodArgument

      private

      # Initializes the input and output streams that the parser uses. The
      # expected format for the options is a hash with the keys `:input` and
      # `:output`. Use this to mock `STDIN` and `STDOUT` for tests.
      def initialize_streams(options)
        @input = options[:input] if options.key? :input
        @output = options[:output] if options.key? :output
      end

      # Returns the input stream. If no stream has been configured, $stdin is
      # returned.
      def input
        @input ||= $stdin
      end

      # Returns the output stream. If no stream has been configured, $stdout is
      # returned.
      def output
        @output ||= $stdout
      end

      # Reads from the input stream.
      def read_from_engine
        input.gets
      end

      # Writes to the output stream.
      def write_to_engine(string)
        output.puts string
        output.flush
      end

      # Formats a command line for further processing. The input is split at the
      # whitespace character, and all its parts are converted to downcase.
      def split_line(line)
        line.split(' ').map(&:downcase)
      end
    end
  end
end
