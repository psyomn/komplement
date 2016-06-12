# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'komplement/version'

Gem::Specification.new do |gem|
  gem.name          = "komplement"
  gem.version       = Komplement::VERSION
  gem.summary       = %q{Simple sanity checking tool for your html}
  gem.description   = <<DESC
    Simple sanity checking tool for your html, that will
    scan files, and detect html elements you might be unaware of}
DESC
  gem.license       = "MIT"
  gem.authors       = ["Simon Symeonidis"]
  gem.email         = "lethaljellybean@gmail.com"
  gem.homepage      = "https://github.com/psyomn/komplement#readme"

  gem.files         = `git ls-files`.split($/)

  `git submodule --quiet foreach --recursive pwd`.split($/).each do |submodule|
    submodule.sub!("#{Dir.pwd}/",'')

    Dir.chdir(submodule) do
      `git ls-files`.split($/).map do |subpath|
        gem.files << File.join(submodule,subpath)
      end
    end
  end

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.10'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rdoc', '~> 4.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'

  gem.add_runtime_dependency 'nokogiri', '~> 1.6'
  gem.add_runtime_dependency 'colorize', '~> 0.7.7'
end
