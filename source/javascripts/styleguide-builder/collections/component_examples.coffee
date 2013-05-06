collection = StyleBuilder.register      "StyleBuilder.collections.ComponentExamples"
collection.extends                      "StyleBuilder.Collection"

collection.defines
  name:       "component_examples"
  fetch: ()->
    @reset StyleBuilderBootstrap.component_examples
