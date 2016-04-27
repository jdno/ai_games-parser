# AIGames::Parser

[![Build Status](https://travis-ci.org/jdno/ai_games-parser.svg?branch=develop)](https://travis-ci.org/jdno/ai_games-parser)
[![Code Climate](https://codeclimate.com/github/jdno/ai_games-parser/badges/gpa.svg)](https://codeclimate.com/github/jdno/ai_games-parser)
[![Test Coverage](https://codeclimate.com/github/jdno/ai_games-parser/badges/coverage.svg)](https://codeclimate.com/github/jdno/ai_games-parser/coverage)

This gem provides a parser that can be used to communicate with the game engine
in The AI Games' competitions. By extending it, the parser can be customized to
work in any competition.

## Installation

Add this line to your bot's Gemfile:

```ruby
gem 'ai_games-parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ai_games-parser

## Usage

The gem provides an abstract parser in `AIGames::Parser`. Extend this class, and
overwrite the method `parse(command_array)` to customize your parser for the
specific challenge.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jdno/ai_games-parser. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

Copyright (c) 2016 [Jan David Nose](https://github.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
