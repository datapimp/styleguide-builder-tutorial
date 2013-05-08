view = StyleBuilder.register    "StyleBuilder.components.AssetEditor"
view.extends                    "StyleBuilder.View"

view.configuration
  changeThrottle: 1200

view.privateMethods
  beforeRender: ()->
    @$el.append @make("div",class:"asset-editor-wrapper")

  afterRender: ()->
    el = @$('.asset-editor-wrapper')[0]

    @codeMirrorInstance = CodeMirror el,
      lineNumbers: true
      theme: @theme || "lesser-dark"
      mode: @mode

    @changeHandler = _.debounce (change)=>
      @onEditorChange.call(@, change )
    , @changeThrottle

  listenForChanges: ()->
    @codeMirrorInstance.on "change", @changeHandler

  onEditorChange: (changeObject)->
    console.log "On Editor Change", arguments

    return unless @example

    [name, rest...] = @assetName().split('.')

    # This currently depends on code sync running
    # eventually I need to figure out a suitable backend
    # that will compile skim templates and sass files on demand
    $.ajax
      type: "POST"
      url: "http://localhost:9295/source"
      data: JSON.stringify
        name: name
        extension: rest.join(".")
        contents: @getValue()
      success: (response)=>
        if response?.compiled
          @trigger "example:recompiled", response.compiled, @example

view.publicMethods
  assetName: ()->
    @example.read("#{ @role }_asset_name")

  loadExample: (@example)->
    @codeMirrorInstance?.off "change", @changeHandler
    @setValue @example.read(@reader)
    @listenForChanges()

  setValue: (value)->
    @codeMirrorInstance.setValue(value)

  getValue: ()->
    @codeMirrorInstance.getValue()

view.register()