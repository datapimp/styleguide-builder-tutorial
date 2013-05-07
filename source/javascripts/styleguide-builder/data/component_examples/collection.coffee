collection = StyleBuilder.register  "StyleBuilder.collections.ComponentExamples"
collection.extends                  "StyleBuilder.Collection"

collection.defines
  model: StyleBuilder.models.ComponentExample
  fetch: ()->
    models = StyleBuilderBootstrap.component_examples
    @reset(models)