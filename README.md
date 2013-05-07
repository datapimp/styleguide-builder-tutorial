# StyleGuide Builder / Work In Progress

An app that allows you to display examples of common re-usable elements in your application's style.

A Style Guide is a great way to provide a living, visual test of your application's stylesheets, and is a good way of providing front end developers with documentation of the CSS classes and markup conventions available to them.

It helps maintain consistent visual styling and promotes the re-use of existing style rules and conventions, in an aim to keep your front end code base consistent and to prevent the duplication of redundant CSS declarations as your stylesheets grow.

### Running The App
```
git clone https://github.com/datapimp/styleguide-builder-tutorial.git
cd styleguide-builder-tutorial
bundle
bundle exec middleman # runs a web server on http://localhost:4567
```

### Follow along with the tutorial

This is a tutorial for building an application with the Luca framework.  You can follow along with the tutorial by reading the files in the tutorial folder.

### User Stories

- As a designer, I should be able to define a color palette.  I should be able to name each color and assign a hex value to it.  This variable should be available as a SASS variable.

- As a designer, I should be able to define typography settings for various elements such as headings, paragraphs, etc.  These should be available as SASS variables and as CSS classes that can be applied to elements

- As a designer, I should be able to define CSS class based variants to be applied to various elements.

- As a designer, I should see the results of my CSS code changes immediately apply to the example markup when I make the changes to the Code

- As a front end developer, I should be able to browse the results of the designers settings