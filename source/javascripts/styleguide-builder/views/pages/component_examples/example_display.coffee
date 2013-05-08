view = StyleBuilder.register "StyleBuilder.views.ExampleDisplay"
view.extends                 "StyleBuilder.Page"

view.configuration
  template: "component_examples/example_display_layout"
  regions:
    style_content:
      role: "style_content"
      name: "style_content_editor"
      type: "asset_editor"
      mode: "sass"
      reader: "styleContent"

    markup_content:
      role: "markup_content"
      name: "markup_content_editor"
      reader: "markupContent"
      type: "asset_editor"
      mode: "haml"

view.privateMethods
  beforeRender: ()->
    @setEmptyState("on")
    StyleBuilder.Page::beforeRender?.apply(@, arguments)

  setEmptyState:(state="off")->
    if state is "on"
      @$("[data-state]").hide()
      @$("[data-state='no-example-selected']").show()
    else
      @$("[data-state]").show()
      @$("[data-state='no-example-selected']").hide()

  previewCanvas: ()->
    @$('#preview-canvas')

  displayStyleExample: ()->
    @getStyleContent().loadExample(@example)

  displayMarkupExample: ()->
    @getMarkupContent().loadExample(@example)

view.publicMethods
  renderPreviewContent: ()->
    if @example?
      @displayMarkupExample()
      @displayStyleExample()
      @previewCanvas().html Luca.template("examples/#{ @example.id }")

  loadExample: (@example)->
    @setEmptyState('off')
    @$('h3.title').html @example.read('name')
    @$('p.description').html @example.read('description')
    @renderPreviewContent()


view.register()