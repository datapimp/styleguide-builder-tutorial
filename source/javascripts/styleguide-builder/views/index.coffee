#= require_self
#= require ./components
#= require ./pages

view  = StyleBuilder.register   "StyleBuilder.View"
view.extends                    "Luca.View"

view.defines
  autoBindEventHandlers: true


page = StyleBuilder.register   "StyleBuilder.Page"
page.extends                   "Luca.components.Page"
page.defines
  autoBindEventHandlers: true