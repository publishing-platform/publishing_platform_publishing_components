require "rails_helper"

describe "Error summary", type: :view do
  def component_name
    "navigation"
  end

  it "does not render anything if no data is passed" do
    test_data = {}
    assert_empty render_component(test_data)
  end

  it "renders list of navigation item links" do
    render_component(
      navigation_items: [
        {
          text: "Example link 1",
          href: "#",
        },
        {
          text: "Example link 2",
          href: "#",
        },
        {
          text: "Example link 3",
          href: "#",
        },
      ],
    )

    assert_select "ul.gem-c-navigation.nav.col-12.col-md-auto.mb-2.justify-content-center.mb-md-0"
    assert_select "a.py-2.link-body-emphasis.text-decoration-none", 3
    assert_select "a.py-2.link-body-emphasis.text-decoration-none.me-3", 2
  end
end
