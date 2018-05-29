# coding: utf-8
Gem::Specification.new do |spec|
  spec.name     = "blake2b"
  spec.version  = "0.9.0"
  spec.authors  = ["Franck Verrot", "Mauricio Gomes"]
  spec.email    = ["mauricio@edge14.com"]
  spec.homepage = "https://github.com/mgomes/blake2b"
  spec.license  = "GPL-3.0"

  spec.summary     = "A cryptographic hash function faster than MD5, SHA-1, SHA-2, and SHA-3 for 64-bit systems."
  spec.required_ruby_version = ">= 2.1.0"
  spec.description = "A cryptographic hash function faster than MD5, SHA-1, SHA-2, and SHA-3 for 64-bit systems."
  spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.extensions << "ext/blake2_ext/extconf.rb"

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake-compiler", "~> 0.9"
  spec.add_development_dependency "bundler"      , "~> 1.5"
  spec.add_development_dependency "rake"         , "~> 11.1"
  spec.add_development_dependency "minitest"     , "~> 5.8"
  spec.add_development_dependency "pry"          , "~> 0.10"
end
