view = StyleBuilder.register    "StyleBuilder.components.AssetEditor"
view.extends                    "StyleBuilder.View"

view.configuration
  changeThrottle: 350

view.privateMethods
  beforeRender: ()->
    @$el.append @make("div",class:"asset-editor-wrapper")

  afterRender: ()->
    el = @$('.asset-editor-wrapper')[0]

    @codeMirrorInstance = CodeMirror el,
      lineNumbers: true
      theme: @theme || "lesser-dark"
      mode: @mode
      change: _.debounce(@onEditorChange, @changeThrottle)

  onEditorChange: (changeObject)->
    @trigger "editor:change", @, @codeMirrorInstance.getValue(), changeObject

view.publicMethods
  assetName: ()->
    @example.read("#{ @role }_asset_name")

  loadExample: (@example)->
    @setValue @example.read(@reader)

  setValue: (value)->
    @codeMirrorInstance.setValue(value)

  getValue: ()->
    @codeMirrorInstance.getValue(value)

view.register()