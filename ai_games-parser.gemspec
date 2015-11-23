# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ai_games/parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'ai_games-parser'
  spec.version       = AIGames::Parser::VERSION
  spec.authors       = ['Jan David Nose']
  spec.email         = ['jandavid@awesometechnology.de']

  spec.summary       = "Skeleton for a parser for The AI Games' competitions"
  spec.description   = <<-EOF
This gem provides a parser that can be used to communicate with the game engine
in The AI Games' competitions. By extending it, the parser can be customized to
work in any competition.
  EOF
  spec.homepage      = 'https://github.com/jdno/ai_games-parser'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ai_games-logger'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rubocop'
end
