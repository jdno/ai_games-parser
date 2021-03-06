# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ai_games/parser'

Gem::Specification.new do |spec|
  spec.name          = 'ai_games-parser'
  spec.version       = AiGames::Parser::VERSION
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

  spec.add_runtime_dependency 'ai_games-logger', '~> 0.1'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
  spec.add_development_dependency 'rubocop', '~> 0.35'
end
