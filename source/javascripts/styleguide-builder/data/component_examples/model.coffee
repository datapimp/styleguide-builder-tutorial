model = StyleBuilder.register "StyleBuilder.models.ComponentExample"
model.extends                 "StyleBuilder.Model"

model.configuration
  defaults:
    name: "Component Example"
    description: "A Component Example is some sample markup which demonstrates the effect of having a certain combination of one or more CSS classes applied to it"
    markup_content: ".component-example\n  h5 This is what a component might look like"
    style_content: ".component-example\n  color: #000"
    markup_content_asset_name: "component-example.jst.skim"
    style_content_asset_name: "component-example.css.sass"

model.publicMethods

  markupContent: ()->
    @get("markup_content").join("")

  styleContent: ()->
    @get("style_content").join("")


model.register()
