model = StyleBuilder.register "StyleBuilder.models.ComponentExample"
model.extends                 "StyleBuilder.Model"

model.publicMethods
  markupContent: ()->
    @get("markup_content").join ""

  styleContent: ()->
    @get("style_content").join ""


model.register()
