$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
  s.name        = 'table_checksum'
  s.version     = '0.0.1'
  s.summary     = "Table checksum"
  s.description = "Creates checksum of tables/models using CREATE CHECKSUM sql query"
  s.authors     = ["Filip Zachar"]
  s.email       = 'tulak45@gmail.com'
  s.homepage    = 'http://github.com/tulak/table_checksum'
  
  s.require_paths = ["lib"]
  s.files         = `git ls-files`.split("\n")
end