view = StyleBuilder.register "StyleBuilder.views.ExampleDisplay"
view.extends                 "Luca.View"

view.configuration
  bodyTemplate: "component_examples/example_display_layout"

view.privateMethods
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

  previewCanvas: ()->
    @$('.preview-canvas')

  loadStyleContent: (content)->
    unless @styleEditor?
      @styleEditor = CodeMirror @styleContainer()[0],
        mode: "sass"
        theme: "lesser-dark"
        lineNumbers: true

    @styleEditor.setValue("#{content}")

    @

  loadMarkupContent: (content)->
    unless @markupEditor?
      @markupEditor = CodeMirror @markupContainer()[0],
        mode: "haml"
        theme: "lesser-dark"
        lineNumbers: true

    @markupEditor.setValue("#{content}")

    @

view.publicMethods
  loadExample: (example)->
    @setEmptyState('off')
    @$('h3').html example.read('name')
    @loadMarkupContent example.markupContent()
    @loadStyleContent example.styleContent()
    @previewCanvas().html Luca.template("examples/#{ example.id }")

view.register()