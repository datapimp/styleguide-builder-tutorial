### Building Our First Screen

The first component we are going to build in the styleguide builder is the screen which allows our designer to build
a collection of examples that display the components in her styleguide.  This will include two user interace elements,
a list which shows the available components, and a display area which shows the styled example.

( drawing of an example )

So, if we break the page above into the separate elements, what do we have?

We have two regions, on the left, a navigation menu which lists items from a collection. And on the right, a display area which is responsible for rendering whatever component is selected.  But, this isn't breaking it down far enough.  In addition to the two view elements we just
described, there is a data source that contains all of the component examples, and there is something which monitors the state of the view and tracks which is the current component that is selected and should be displayed.

In Luca, we would structure this as follows:

- The Data Source
  - Collection: `StyleBuilder.collections.ComponentExample`
  - Model with attributes for:
    - the example markup
    - information about which variants
    - component specific styling

- The Screen
  - Page: `StyleBuilder.pages.ComponentExamples`
  - Based on the `Luca.components.Page` view, which allows us
    to define an HTML layout with named regions.
  - contains two different views, each assigned to its own region
  - maintains the state of which component is selected
  - provides route handlers to match URL fragments in the Router

- Component Example Selector
  - role: "component_selector"
  - renders items from the component_examples collection
  - listens for the click event in the DOM
    - upon click, triggers the "on:selection" event

- Component Example Display Area
  - Display sample markup code
  - Display rendered markup



