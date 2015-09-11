Gem::Specification.new do |s|
  s.name = 'ipscanner'
  s.version = '0.2.0'
  s.summary = 'ipscanner'
  s.authors = ['James Robertson']
  s.description = "Ping every address on a IPV4 Subnet e.g. 192.168.1.x"
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/ipscanner.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/ipscanner'
  s.required_ruby_version = '>= 2.1.2'
end
