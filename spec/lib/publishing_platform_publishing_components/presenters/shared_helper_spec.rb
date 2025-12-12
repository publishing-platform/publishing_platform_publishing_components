require "rails_helper"

RSpec.describe PublishingPlatformPublishingComponents::Presenters::SharedHelper do
  describe "Shared component helper" do
    it "returns a default heading level" do
      shared_helper = described_class.new({})
      heading = shared_helper.get_heading_level
      expect(heading).to eql("h2")
    end

    it "returns a given heading level" do
      shared_helper = described_class.new(heading_level: 6)
      heading = shared_helper.get_heading_level
      expect(heading).to eql("h6")
    end

    it "returns the default heading level if passed value is wrong" do
      shared_helper = described_class.new(heading_level: 9)
      heading = shared_helper.get_heading_level
      expect(heading).to eql("h2")
    end

    it "returns a span instead of a heading if heading level is 0" do
      shared_helper = described_class.new(heading_level: 0)
      result = shared_helper.get_heading_level
      expect(result).to eql("span")
    end

    it "returns a default heading size" do
      shared_helper = described_class.new({})
      heading = shared_helper.get_heading_size
      expect(heading).to eql("h2")
    end

    it "returns a given heading size" do
      shared_helper = described_class.new(heading_size: 6)
      heading = shared_helper.get_heading_size
      expect(heading).to eql("h6")
    end

    it "returns the default heading size if passed value is wrong" do
      shared_helper = described_class.new(heading_level: 9)
      heading = shared_helper.get_heading_size
      expect(heading).to eql("h2")
    end
  end
end
