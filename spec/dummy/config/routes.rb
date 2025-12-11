Rails.application.routes.draw do
  get "tabsexample", to: "welcome#tabsexample"
  get "component/:component/:example/preview" => "component#preview", as: :component_preview
end
