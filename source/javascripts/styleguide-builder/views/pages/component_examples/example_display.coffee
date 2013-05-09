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

view.configuration
  componentEvents:
    "style_content example:recompiled" : "onStyleCompilation"
    "markup_content example:recompiled" : "onMarkupCompilation"

view.privateMethods
  beforeRender: ()->
    @setEmptyState("on")
    StyleBuilder.Page::beforeRender?.apply(@, arguments)

  onStyleCompilation: (compiled, example)->
    $("style[data-example-id='#{ example.id }']").remove()
    $('head').append "<style data-example-id='#{ example.id }' type='text/css'>#{ compiled }</style>"

  onMarkupCompilation: (compiled, example)->
    fn = (compiled)->
      eval("this.JST['examples/#{ example.id }']=#{ compiled }")

    fn.call(window, compiled)

    _.delay ()=>
      @renderPreviewContent()
    , 150

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
      try
        @previewCanvas().html Luca.template("examples/#{ @example.id }")
      catch e
        # Force a change event in the editor.
        # This is a hack to handle the adding of a new example for which there
        # may not yet be a JST template.  This will result in a blank one being created.
        value = @getMarkupContent().getValue()
        @getMarkupContent().setValue("#{ value } ")


  loadExample: (@example)->
    @setEmptyState('off')
    @$('h3.title').html @example.read('name')
    @$('p.description').html @example.read('description')

    @displayMarkupExample()
    @displayStyleExample()
    @renderPreviewContent()


view.register()