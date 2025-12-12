require "rails_helper"

describe "All components" do
  Dir.glob("app/views/publishing_platform_publishing_components/components/*.erb").each do |filename|
    template = filename.split("/").last
    component_name = template.sub("_", "").sub(".html.erb", "")

    describe component_name do
      yaml_file = "#{__dir__}/../../app/views/publishing_platform_publishing_components/components/docs/#{component_name}.yml"

      it "is documented" do
        expect(File).to exist(yaml_file)
      end

      it "has the correct documentation" do
        # Psych 4's YAML.unsafe_load_file === Psych 3's YAML.load_file
        # but until we drop support for Ruby 2.7 and Ruby 3.0, we need to support both major versions of Psych
        yaml = YAML.respond_to?(:unsafe_load_file) ? YAML.unsafe_load_file(yaml_file) : YAML.load_file(yaml_file)

        expect(yaml["name"]).not_to be_nil
        expect(yaml["description"]).not_to be_nil
        expect(yaml["examples"]).not_to be_nil
        expect(
          yaml["accessibility_criteria"] || yaml["shared_accessibility_criteria"],
        ).not_to be_nil
      end

      it "has the correct class in the ERB template", skip: component_name.in?(%w[]) do
        erb = File.read(filename)

        class_name = "gem-c-#{component_name.dasherize}"

        expect(erb).to match(class_name), class_name
      end

      it "has a correctly named spec file" do
        rspec_file = "#{__dir__}/../../spec/components/#{component_name.tr('-', '_')}_spec.rb"

        expect(File).to exist(rspec_file)
      end

      it "has a correctly named SCSS file", skip: component_name.in?(%w[accordion contextual_breadcrumbs contextual_footer contextual_sidebar error_summary google_tag_manager_script layout_for_admin list machine_readable_metadata meta_tags]) do
        puts component_name
        css_file = "#{__dir__}/../../app/assets/stylesheets/publishing_platform_publishing_components/components/_#{component_name.tr('_', '-')}.scss"

        expect(File).to exist(css_file)
      end

      it "doesn't use `html_safe`", skip: component_name.in?(%w[publishing_platform_markdown]) do
        file = File.read(filename)

        expect(file).not_to match "html_safe"
      end
    end
  end
end
