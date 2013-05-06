app = StyleBuilder.register       "StyleBuilder.Application"
app.extends                       "Luca.Application"

app.configuration
  el: "#viewport"
  name: "SBApp"
  autoBoot: false
  fluid: true
  fullscreen: true
  routes:
    "": "home"


app.contains
  component: "home"

app.register()