Gem::Specification.new do |spec|
  spec.name          = "steam"
  spec.version       = "1.0"
  spec.date          = "2020-05-30"
  spec.summary       = %q{A Ruby library for Steam's API}
  spec.authors       = ["Justin Bishop"]
  spec.email         = ["jubishop@gmail.com"]
  spec.homepage      = "https://github.com/jubishop/steam"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.1")
  spec.metadata["source_code_uri"] = "https://github.com/jubishop/steam"
  spec.files         = Dir["lib/**/*.rb"]
  spec.add_runtime_dependency 'core'
  spec.add_runtime_dependency 'datacache'
  spec.add_runtime_dependency 'duration'
  spec.add_runtime_dependency 'http'
end
