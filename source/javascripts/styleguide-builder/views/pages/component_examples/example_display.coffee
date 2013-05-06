view = StyleBuilder.register "StyleBuilder.views.ExampleDisplay"
view.extends                 "Luca.View"

view.defines
  bodyTemplate: "component_examples/example_display_layout"

  beforeRender: ()->
    @setEmptyState("on")

  setEmptyState:(state="off")->
    if state is "on"
      @$("[data-state]").hide()
      @$("[data-state='no-example-selected']").show()
    else
      @$("[data-state]").show()
      @$("[data-state='no-example-selected']").hide()

  markupContainer: ()->
    @$('.code-container .markup')

  styleContainer: ()->
    @$('.code-container .style')

  loadExample: (example)->
    @setEmptyState('off')

    @$('h3').html example.read('name')
    @markupContainer().html example.read("markup_content")
    @styleContainer().html example.read("style_content")