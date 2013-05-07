console.log "Model"
model = StyleBuilder.register "StyleBuilder.models.ComponentExample"
model.extends                 "StyleBuilder.Model"

model.publicMethods
  markupContent: ()->
    @get("markup_content").join "\n"

  styleContent: ()->
    @get("style_content").join "\n"


model.register()
