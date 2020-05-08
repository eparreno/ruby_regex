# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby_regex"
  s.version = "0.2.0"
  s.author = "Emili Parreno"
  s.email = "emili@eparreno.com"
  s.license = "MIT"
  s.homepage = "http://github.com/eparreno/ruby_regex"
  s.date = %q{2020-05-08}
  s.description = "Ruby regular expressions library"
  s.require_paths = ["lib"]
  s.rubygems_version = %q{3.0.3}
  s.summary = %q{none}
  s.test_files = ["test/ruby_regex_test.rb", "test/fixtures/emails.yml"]
  s.files = ["CHANGELOG", "README.md", "LICENSE", "lib/ruby_regex.rb"]
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
end
