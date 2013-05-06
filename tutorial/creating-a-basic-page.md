### Creating a basic page

One of the simplest components we can create is a page which does nothing more than render some HTML content.

We will use the very first default screen for our application as an example.  We will name it 'home'.

Start off by creating a template in the templates/pages folder of the project, name it `home.jst.skim`.

The contents of that file are as follows:

```
<%= IO.read('../source/javascripts/styleguide-builder/templates/pages/home.jst.skim')
```

The view component needed to register this page is simple:

```
<%= IO.read('../source/javascripts/styleguide-builder/views/pages/home.coffee')
```

This simply registers a component named 'home' with the application's registry, which allows us to reference
this page in the application, and tie it to a route.

In our stylebuilder application, we added the home component as an item in the `contains` directive:

```coffeescript
...
app.contains
  component: "home"
```

And you'll notice we set the default route to use the `home` component:

```coffeescript
...
app.configuration
  routes:
    "" : "home"
```

When we open up the application, we will notice the contents of our home template being rendered.

