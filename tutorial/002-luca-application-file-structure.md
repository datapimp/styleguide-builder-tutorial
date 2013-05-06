### Luca Application File Structure

Luca applications rely on Sprockets Asset Manifests to organize components, and generally as a style decision, follow the one class / component per file guideline.  You can use any organization system you like, but the framework's documentation generation tools are optimized for this style.

A typical Luca application has the following underlying file structure:

#### Javascript Asset Organization

```
- app/assets/javascripts/styleguide-builder
  - collections
    - index.coffee
  - dependencies
    - index.coffee
  - lib
  - models
    - index.coffee
  - templates
  - views
    - pages
    - components
    - index.coffee
  - application.coffee
  - config.coffee
  - index.coffee
```

#### Stylesheet Asset Organization
```
- app/assets/stylesheets/styleguide-builder
  - styleguide-builder
    - dependenciess
    - index.css
```

The way our application code, and the styles are included via the asset pipeline would look like:

```slim
head
  = stylesheet_link_tag 'styleguide-builder/dependencies', 'styleguide-builder'
body
  = javascript_include_tag 'styleguide-builder/dependencies', 'styleguide-builder'
```

Note: The various files named `index.coffee`, `index.css` are sprockets manifest conventions that allow folders to be included by name, and give you control over the exact load order of the files.  The collections, models, and views index files define the base classes that each Model, Collection, and View class in the application inherit from, and then include each of the file in the folder.

#### Component Definitions

For documentation and organization purposes, the various collections, models, views files follow the one component definition per file guideline.  Each component and class is defined separately and registered with the Luca component registry.  These will all get glued together by the application.

#### styleguide-builder/config.coffee

The config.coffee file for our application defines the initial namespaces where all of our components will be defined, and set up global level configuration declarations for the framework.

```coffeescript
```

#### styleguide-builder/index.coffee

The index.coffee file for our application controls the load order of all of the components, and contains the instructions for booting the application and rendering it.

```coffeescript
```