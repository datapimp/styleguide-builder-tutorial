view = StyleBuilder.register "StyleBuilder.views.ComponentExampleSelector"
view.extends                 "Luca.CollectionView"

view.configuration
  tagName: "div"

  itemTagName: "div"

  collection: "component_examples"

  itemRenderer: (item)->
    name = item.model.get("name")
    @make("a", class:"link", "data-model-id": item.model.id, name)

  events:
    "click .collection-item" : (e)->
      $target = @$(e.target)
      $target = $target.closest('.collection-item')

      model   = @collection.at $target.data('index')

      @trigger "on:selection", model

view.register()