require "rails_helper"

describe "Summary list", type: :view do
  def component_name
    "summary_list"
  end

  it "does not render anything if no data is passed" do
    test_data = {}
    assert_empty render_component(test_data)
  end

  it "renders section title" do
    render_component(title: "Title, summary and body")
    assert_select ".gem-c-summary-list .h4", text: "Title, summary and body"
  end

  it "renders section title with edit and delete actions" do
    render_component(
      title: "Title, summary and body",
      edit: {
        href: "#edit-title-summary-body",
        data_attributes: {
          gtm: "edit-title-summary-body",
        },
      },
      delete: {
        href: "#delete-title-summary-body",
        data_attributes: {
          gtm: "delete-title-summary-body",
        },
      },
    )
    assert_select ".gem-c-summary-list h3.h4.gem-c-summary-list__group-title", text: "Title, summary and body"
    assert_select '.gem-c-summary-list__group-actions-list a[href="#edit-title-summary-body"][data-gtm="edit-title-summary-body"]', text: "Change Title, summary and body"
    assert_select '.gem-c-summary-list__group-actions-list a.link-danger[href="#delete-title-summary-body"][data-gtm="delete-title-summary-body"]', text: "Delete Title, summary and body"
  end

  it "renders section title with custom link text and heading level" do
    render_component(
      title: "Items",
      heading_level: 2,
      heading_size: 3,
      edit: {
        href: "#custom-action",
        link_text: "Reorder",
      },
    )
    assert_select ".gem-c-summary-list h2.h3", text: "Items"
    assert_select '.gem-c-summary-list__group-actions-list a[href="#custom-action"]', text: "Reorder Items"
  end

  it "renders section title with block" do
    render_component(
      title: "Title, summary and body",
      block: sanitize("<p>Some HTML</p>"),
    )
    assert_select ".gem-c-summary-list .h4", text: "Title, summary and body"
    assert_select ".gem-c-summary__block", text: "Some HTML"
  end

  it "renders items" do
    render_component(
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
        },
        {
          field: "Summary",
          value: "Find out more about our reviews on the subject of ethical standards for public service providers, including our 2014 report, 2015 guidance and 2018 follow-up publication.",
        },
      ],
    )
    assert_select ".gem-c-summary-list__row", 2
    assert_select ".gem-c-summary-list__key", text: "Title"
    assert_select ".gem-c-summary-list__value", text: "Find out more about our reviews on the subject of ethical standards for public service providers, including our 2014 report, 2015 guidance and 2018 follow-up publication."
  end

  it "renders items with only the edit action" do
    render_component(
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
          edit: {
            href: "#edit-title",
            data_attributes: {
              gtm: "edit-title",
            },
          },
        },
      ],
    )
    assert_select ".gem-c-summary-list__key", text: "Title"
    assert_select ".gem-c-summary-list__value", text: "Ethical standards for public service providers"
    assert_select 'dd.gem-c-summary-list__actions a[href="#edit-title"][data-gtm="edit-title"]', text: /Change\s*Title\s*/
  end

  it "renders items with only the delete action" do
    render_component(
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
          delete: {
            href: "#delete-title",
            data_attributes: {
              gtm: "delete-title",
            },
          },
        },
      ],
    )
    assert_select ".gem-c-summary-list__key", text: "Title"
    assert_select ".gem-c-summary-list__value", text: "Ethical standards for public service providers"
    assert_select 'dd.gem-c-summary-list__actions a.link-danger[href="#delete-title"][data-gtm="delete-title"]', text: /\s*Delete\s*Title\s*/
  end

  it "renders items with both the edit and the delete action" do
    render_component(
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
          edit: {
            href: "#edit-title",
          },
          delete: {
            href: "#delete-title",
          },
        },
      ],
    )
    assert_select ".gem-c-summary-list__key", text: "Title"
    assert_select ".gem-c-summary-list__value", text: "Ethical standards for public service providers"
    assert_select 'li.gem-c-summary-list__actions-list-item a[href="#edit-title"]', text: /\s*Change\s*Title\s*/
    assert_select 'li.gem-c-summary-list__actions-list-item a.link-danger[href="#delete-title"]', text: /\s*Delete\s*Title\s*/
  end

  it "renders items with custom text for edit and delete action" do
    render_component(
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
          edit: {
            href: "#edit-title",
            link_text: "Edit",
          },
          delete: {
            href: "#delete-title",
            link_text: "Remove",
          },
        },
      ],
    )
    assert_select '.gem-c-summary-list__actions-list-item a[href="#edit-title"]', text: /\s*Edit\s*Title\s*/
    assert_select '.gem-c-summary-list__actions-list-item a.link-danger[href="#delete-title"]', text: /\s*Remove\s*Title\s*/
  end

  it "renders the edit action on section" do
    render_component(
      title: "Title",
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
        },
      ],
      edit: {
        href: "edit-title",
      },
    )
    assert_select 'div.gem-c-summary-list__group-actions-list a[href="edit-title"]', text: /\s*Change\s*Title\s*/
  end

  it "renders the delete action on section" do
    render_component(
      title: "Title",
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
        },
      ],
      delete: {
        href: "delete-title",
      },
    )
    assert_select 'div.gem-c-summary-list__group-actions-list a.link-danger[href="delete-title"]', text: /\s*Delete\s*Title\s*/
  end

  it "renders the edit and delete actions on section" do
    render_component(
      title: "Title",
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
        },
      ],
      edit: {
        href: "edit-title",
        data_attributes: {
          gtm: "edit-title",
        },
      },
      delete: {
        href: "delete-title",
        data_attributes: {
          gtm: "delete-title",
        },
      },
    )
    assert_select 'ul.gem-c-summary-list__actions-list .gem-c-summary-list__actions-list-item a[href="edit-title"][data-gtm="edit-title"]', text: /\s*Change\s*Title\s*/
    assert_select 'ul.gem-c-summary-list__actions-list .gem-c-summary-list__actions-list-item a.link-danger[href="delete-title"][data-gtm="delete-title"]', text: /\s*Delete\s*Title\s*/
  end

  it "renders the edit and delete actions on section with custom text" do
    render_component(
      title: "Title",
      items: [
        {
          field: "Title",
          value: "Ethical standards for public service providers",
        },
      ],
      edit: {
        href: "edit-title",
        link_text: "Edit",
      },
      delete: {
        href: "delete-title",
        link_text: "Destroy",
      },
    )
    assert_select 'ul.gem-c-summary-list__actions-list .gem-c-summary-list__actions-list-item a[href="edit-title"]', text: /\s*Edit\s*Title\s*/
    assert_select 'ul.gem-c-summary-list__actions-list .gem-c-summary-list__actions-list-item a.link-danger[href="delete-title"]', text: /\s*Destroy\s*Title\s*/
  end

  it "renders all links without visually hidden extra text if specified" do
    render_component(
      title: "Something",
      edit: {
        href: "edit-something",
        link_text_no_enhance: true,
      },
      delete: {
        href: "delete-something",
        link_text_no_enhance: true,
      },
      items: [
        {
          field: "Item 1",
          value: "Ethical standards for public service providers",
          edit: {
            href: "#edit-item-1-title",
            link_text_no_enhance: true,
          },
          delete: {
            href: "#delete-item-1-title",
            link_text_no_enhance: true,
          },
        },
        {
          field: "Item 2",
          value: "Ethical standards for janitorial staff",
          edit: {
            href: "#edit-item-2-title",
          },
          delete: {
            href: "#delete-item-2-title",
          },
        },
      ],
    )
    assert_select '.gem-c-summary-list__actions-list a[href="edit-something"]', text: /\s*Change\s*/
    assert_select '.gem-c-summary-list__actions-list a[href="delete-something"]', text: /\s*Delete\s*/

    assert_select '.gem-c-summary-list__row .gem-c-summary-list__actions a[href="#edit-item-1-title"]', text: /\s*Change\s*/
    assert_select '.gem-c-summary-list__row .gem-c-summary-list__actions a.link-danger[href="#delete-item-1-title"]', text: /\s*Delete\s*/

    assert_select '.gem-c-summary-list__row .gem-c-summary-list__actions a[href="#edit-item-2-title"]', text: /\s*Change\s*Item\s*2\s*/
    assert_select '.gem-c-summary-list__row .gem-c-summary-list__actions a.link-danger[href="#delete-item-2-title"]', text: /\s*Delete\s*Item\s*2\s*/
  end

  it "renders component with row data attributes" do
    render_component(
      title: "Title",
      items: [
        {
          field: "One",
          value: "Value 1",
          data: { module: "something" },
        },
      ],
    )

    assert_select ".gem-c-summary-list__row[data-module='something']", text: /One/
  end
end
