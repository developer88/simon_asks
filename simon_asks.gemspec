$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simon_asks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simon_asks"
  s.version     = SimonAsks::VERSION
  s.authors     = ["Andrey Eremin, Anton Volkov"]
  s.email       = ["dsoft88@gmail.com, сhoixer@gmail.com"]
  s.homepage    = "https://github.com/developer88/simon_asks"
  s.summary     = "Lightweight Q&A gem for Rails."
  s.description = "Lightweight gem inspired by Stackoverflow for Ruby on Rails Applications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_dependency "devise", "~> 2.2.3"
  s.add_dependency "cancan", "~> 1.6.7"

  s.add_dependency "acts-as-taggable-on", "~> 2.3.3"
  s.add_dependency "acts_as_votable", "~> 0.5.0"
  s.add_dependency "awesome_nested_set", "~> 2.1.5"

  s.add_dependency "carrierwave", "~> 0.8.0"
  s.add_dependency "fog", "~> 1.9.0"
  s.add_dependency "mini_magick", "~> 3.5.0"

  s.add_dependency "auto_html", "~> 1.6.0"

  s.add_dependency "activeadmin", "~> 0.5.1"
  
  # development
  s.add_development_dependency "sqlite3"
end
