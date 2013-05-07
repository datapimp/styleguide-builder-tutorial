app = StyleBuilder.register       "StyleBuilder.Application"
app.extends                       "Luca.Application"

app.configuration
  el: "#viewport"
  name: "SBApp"
  autoBoot: false
  fluid: true
  fullscreen: true

app.configuration
  collectionManagerClass: "StyleBuilder.CollectionManager"

app.configuration
  routes:
    "": "home#index"
    "components": "component_examples#index"
    "components/:selected": "component_examples#show"

app.contains
  component: "home"
,
  component: "component_examples"

app.register()