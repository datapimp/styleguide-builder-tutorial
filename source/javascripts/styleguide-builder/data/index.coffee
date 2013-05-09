# Here is where we store all of the component definitions
# for our data sources.  A data source is composed of a model definition,
# and a collection definition.

# The base model and collection for our app are defined here:
#= require ./model
#= require ./collection

# The specific data sources are defined here.  Everything inherits from
# the base classes included above.
#
#
#
#
#= require ./component_examples
#= require ./colors
#
#
#
# The Collection Manager for our app is defined here.  It is responsible
# for loading all of the data sources in our app.

#= require_self

class StyleBuilder.CollectionManager extends Luca.CollectionManager
  initialCollections:[
    "colors"
    "component_examples"
  ]
