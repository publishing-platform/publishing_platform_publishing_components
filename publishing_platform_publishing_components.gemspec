$LOAD_PATH.push File.expand_path("lib", __dir__)

require "publishing_platform_publishing_components/version"

Gem::Specification.new do |spec|
  spec.name        = "publishing_platform_publishing_components"
  spec.version     = PublishingPlatformPublishingComponents::VERSION
  spec.authors     = ["Publishing Platform"]
  spec.summary     = "A gem to document components in Publishing Platform frontend applications"
  spec.description = "A gem to document components in Publishing Platform frontend applications"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.files = Dir["{node_modules/bootstrap,app,config,lib}/**/*", "LICENSE", "Rakefile", "README.md"].reject { |f| f["app/javascript"] }

  spec.add_dependency "kramdown"
  spec.add_dependency "publishing_platform_app_config"
  spec.add_dependency "rails", ">= 8.0.0"
  spec.add_dependency "rouge"
  spec.add_dependency "sprockets", ">= 3"
  spec.add_dependency "sprockets-rails"

  spec.add_development_dependency "dartsass-rails"
  spec.add_development_dependency "publishing_platform_rubocop"
  spec.add_development_dependency "publishing_platform_test"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "terser"
end
