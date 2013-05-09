collection = StyleBuilder.register  "StyleBuilder.collections.Colors"
collection.extends                  "StyleBuilder.Collection"

collection.defines
  model: StyleBuilder.models.Color
  fetch: ()->
    @reset StyleBuilder.collections.Colors.testData
