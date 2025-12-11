module PublishingPlatformPublishingComponents
  module Presenters
    class SharedHelper
      attr_reader :options, :margin_bottom, :heading_level, :classes

      def initialize(local_assigns)
        @options = local_assigns
        @margin_bottom = @options[:margin_bottom] || 3
        @heading_level = @options[:heading_level] || 2
        @heading_size = @options[:heading_size] || 2
      end

      def get_heading_level
        return [*1..6].include?(@heading_level) ? "h#{@heading_level}" : "h2" unless @heading_level.zero?

        "span"
      end

      def get_heading_size
        [*1..6].include?(@heading_size) ? "h#{@heading_size}" : "h2"
      end
    end
  end
end
