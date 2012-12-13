# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fsck/version"

Gem::Specification.new do |s|
  s.name        = "fsck"
  s.version     = Fsck::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Thorn"]
  s.email       = ["thorncp@gmail.com"]
  s.homepage    = ""
  s.summary     = "A gem that allows you to be yourself while writing code."
  s.description = s.summary

  s.rubyforge_project = "fsck"

  s.required_ruby_version = "~> 1.9.2"

  s.add_development_dependency "rspec", "~> 2.3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
