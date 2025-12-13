Rails.application.routes.draw do
  get "layout", to: "welcome#layout"
  get "tabsexample", to: "welcome#tabsexample"
  get "component/:component/:example/preview" => "component#preview", as: :component_preview
end
