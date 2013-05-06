#= require ./component_examples/index
#= require_self

page = StyleBuilder.register      "StyleBuilder.pages.ComponentExamples"
page.extends                      "StyleBuilder.Page"

page.configuration
  template: "pages/component_examples"
  regions:
    display:
      component: "example_display"
    list:
      name: "example_selector"
      component: "component_example_selector"

page.configuration
  defaultState:
    "current_component": undefined

page.configuration
  componentEvents:
    "example_selector on:selection": "onComponentSelection"

page.privateMethods
  onComponentSelection: (componentExample)->
    display = @getExampleDisplay()
    display.loadExample(componentExample)

page.publicMethods
  show: (selected)->

  index: ()->

page.register()