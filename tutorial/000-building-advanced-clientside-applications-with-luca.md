# Building Advanced Clientside Applications With Luca

This is a walk through for building a single page app with Luca.  Luca is designed for building advanced applications with moderately complex architecture.  It provides you with all of the components you need to build a single page app with multiple screens, many different models, and complex interactions between a number of UI components.

The advantage to using Luca comes from the ability to focus on your UI components in isolation to perfect them, and then combine them together
to form more complex screens and user interfaces.  Over time you will build a large library of consistent, well tested, and re-usable components that come completely styled with twitter bootstrap, and these components will only need to be glued together and configured to achieve their specific purpose.  This allows for a highly accelerated development workflow that is very easy to iterate on, which will result in very effective and enjoyable user interactions with minimal development effort.

In this tutorial, we are going to build an application that makes it easy to to build a front-end style guide.

The tutorial will be broken up into the following:

#### Setting up the project

Here we will go through setting up the project, the third party dependencies, and the general file structure and organization for a Luca application.  We will create base classes for Models, Views, and Collections, which are the tiniest building blocks from which we will begin constructing our application.

#### The Luca Application

The `Luca.Application` class is the main entry point and global state machine for our single page app.  It is the brain and spine, the Backbone if you will. It controls which screen is visible, acts as a global event bus, keeps track of all of the resource collections and data sources, and is responsible for managing session information about the current user.

Whenever a user first visits the application, the application boots and renders the user interface.  We will dive into see what exactly is going on under the hood in a Luca application when this happens.

#### Setting up your data sources

Any application sits on top of multiple data sources.  In Luca, these data sources are generally RESTful endpoints which provide access to a `Collection` of `Models`.  The `Luca.Application` makes use of the `CollectionManager` to make sure these data sources are available and that communication with the server is happening with the proper authentication and default parameters.

#### Defining the different 'screens' in your application

Luca makes it easy to develop single page apps.  However, just because the app is a 'single' page, doesn't mean the app doesn't have many different mutually exclusive sections, pages, or screens, which need to be visible or hidden depending on what the user wishes to do.  We will go over how to make use of Luca's advanced routing syntax to tie URL fragments to the pages in your application.

We will explore the concept of `Pages`, `Containers`, and `Views` to see how smaller UI components are glued together to form more complex components, and how components are tied together to form pages.  We will explore how these pages and components interact with your data sources.

