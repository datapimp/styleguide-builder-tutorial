#= require_tree ./component_examples
#= require_self

page = StyleBuilder.register      "StyleBuilder.pages.ComponentExamples"
page.extends                      "StyleBuilder.Page"

page.configuration
  template: "pages/component_examples"
  regions:
    display:
      name: "component_example_display_area"
      role: "display_area"

    list:
      type: "collection"
      role: "component_selector"
      collection: "component_examples"
      itemRenderer: (item)->
        "sup"

page.register()