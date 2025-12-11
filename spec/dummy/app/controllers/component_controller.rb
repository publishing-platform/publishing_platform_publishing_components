class ComponentController < ApplicationController
  def preview
    @component_doc = component_docs.get(params[:component])
    @component_example = @component_doc.examples.find { |f| f.id == params[:example] }
  end

private

  def component_docs
    @component_docs ||= PublishingPlatformPublishingComponents::ComponentDocs.new
  end
end
