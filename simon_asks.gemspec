$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simon_asks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simon_asks"
  s.version     = SimonAsks::VERSION
  s.authors     = ["Andrey Eremin, Anton Volkov"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "https://github.com/developer88/simon_asks"
  s.summary     = "TODO: Summary of SimonAsks."
  s.description = "TODO: Description of SimonAsks."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
