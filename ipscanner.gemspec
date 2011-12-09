Gem::Specification.new do |s|
  s.name = 'ipscanner'
  s.version = '0.1.4'
  s.summary = 'ipscanner'
  s.authors = ['James Robertson']
  s.description = "Ping every address on a IPV4 Subnet e.g. 192.168.1.x"
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('net-ping')
end
