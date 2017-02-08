# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby_regex"
  s.version = "0.1.2"
  s.author = "Emili Parreno"
  s.email = "emili@eparreno.com"
  s.homepage = "http://github.com/eparreno/ruby_regex"
  s.date = %q{2017-02-08}
  s.description = "Ruby regular expressions library"
  s.has_rdoc = true
  s.require_paths = ["lib"]
  s.rubygems_version = %q{2.6.8}
  s.summary = %q{none}
  s.test_files = ["test/ruby_regex_test.rb", "test/fixtures/emails.yml"]
  s.files = ["CHANGELOG", "README.rdoc", "LICENSE", "lib/ruby_regex.rb"]
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
end
