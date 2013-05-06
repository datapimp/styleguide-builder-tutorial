# Setting Up The Project

To begin with, we start by creating a middleman app.  If you aren't familiar, [middleman](http://middlemanapp.com) is a static site generator that takes advantage of all of the client side technology stack you would find in Ruby on Rails.  It allows us to use all of the asset pipeline gems, and templating languages, and has a really elegant build process.

If you haven't already, install middleman using ruby gems.

```
gem install middleman
```

We will create the project:

```
middleman init styleguide-builder
```

This will create a folder which has the following structure:

- source

  here is where we store our application code, stylesheet, images, and the like.  we will modify the file structure to mimic what you would find in a typical rails app.

  The source folder will contain the following folders.

  app is where we will store our code:

  - app/assets/javascripts
  - app/assets/stylesheets
  - app/assets/images

  vendor is where we will store any third party libraries we depend on, that middleman isn't able to pull directly from the asset pipeline gems we are going to rely on:

  - vendor/assets/javascripts
  - vendor/assets/stylesheets

- config.rb

  here is where we configure middleman, the build process, etc.

- Gemfile

  here is where we will include several different asset pipeline gems, such as luca, codemirror-rails, as well as some templating languages and sass


Let's begin.  If you want to follow along and do this setup work yourself:

First off, let's setup the Gemfile dependencies:

Open up the Gemfile and add the following:

```ruby
<%= IO.read('../Gemfile') %>
```

Go ahead and run `bundle install` to get all of the gems we need.


Now we will go in and setup the file structure of our application
```
cd styleguide-builder/source
rm -rf javascripts images stylesheets layouts index.html.erb
mkdir -p vendor/assets/javascripts vendor/assets/stylesheets vendor/assets/images app/assets/javascripts app/assets/stylesheets app/assets/images layouts
touch layouts/layout.slim index.html.slim
```

The layout file contains the basic HTML skeleton, javascript, and stylesheet includes for our project.  Along with a single HTML DIV element with the id of `viewport`.  This is where the application will be rendered.

```slim
<%= IO.read('../source/layouts/layout.slim') %>
```

If you notice the `javascript_include_tag` and `stylesheet_link_tag` these are all asset pipeline helpers to include the code we are writing, as well as the libraries we depend on.

