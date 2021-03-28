Gem::Specification.new do |spec|
  spec.name          = 'steam'
  spec.version       = '1.0'
  spec.summary       = %q(A Ruby library for Steam's API.)
  spec.authors       = ['Justin Bishop']
  spec.email         = ['jubishop@gmail.com']
  spec.homepage      = 'https://github.com/jubishop/steam'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']
  spec.bindir        = 'bin'
  spec.executables   = []
  spec.metadata      = {
    'source_code_uri' => 'https://github.com/jubishop/steam',
    'steep_types' => 'sig'
  }
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')
  spec.add_runtime_dependency('core')
  spec.add_runtime_dependency('datacache')
  spec.add_runtime_dependency('duration')
  spec.add_runtime_dependency('http')
end
