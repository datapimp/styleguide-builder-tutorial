app = StyleBuilder.register       "StyleBuilder.Application"
app.extends                       "Luca.Application"

app.configuration
  el: "#viewport"
  name: "SBApp"
  autoBoot: false
  fluid: false
  fullscreen: false

app.configuration
  collectionManagerClass: "StyleBuilder.CollectionManager"

app.configuration
  routes:
    "": "home#index"
    "components": "component_examples#index"
    "components/:selected": "component_examples#show"
    "colors": "color_palette_editor#index"

app.contains
  component: "home"
,
  component: "component_examples"
,
  component: "color_palette_editor"


app.register()