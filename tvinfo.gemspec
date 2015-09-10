# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tvinfo/version'

Gem::Specification.new do |spec|
  spec.name          = "tvinfo"
  spec.version       = Tvinfo::VERSION
  spec.authors       = ["Tom Gehrke"]
  spec.email         = ["phyrog@cognitive-coding.com"]

  spec.summary       = %q{A grabber for TV show information}
  spec.description   = %q{Grabs TV show information from the TvDb and saves them to a caldav calendar.}
  spec.homepage      = "http://example.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "open-uri-and-write"
end
