class WelcomeController < ApplicationController
  def tabsexample
    render "tabs_example"
  end

  def layout
    render "layout_example", layout: "dummy_layout"
  end
end
