module PublishingPlatformPublishingComponents
  def self.configure
    yield(Config)
  end

  module Config
    APP_COMPONENT_DIRECTORY = "components".freeze

    def self.component_directory_name
      APP_COMPONENT_DIRECTORY
    end

    def self.gem_directory
      Gem::Specification.find_by_name("publishing_platform_publishing_components").gem_dir
    end

    def self.all_stylesheets
      stylesheets = Dir.glob("#{gem_directory}/app/assets/stylesheets/publishing_platform_publishing_components/components/*.scss")

      stylesheets.each_with_object({}) do |path, hsh|
        hsh[path] = "publishing_platform_publishing_components/components/#{File.basename(path, '.*')}.css"
      end
    end    
  end
end