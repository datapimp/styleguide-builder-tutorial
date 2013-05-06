#= require ./config
#= require_tree ./templates

#= require ./lib
#= require ./models
#= require ./collections
#= require ./views
#= require ./application

$ ->
  window.SBApp = new StyleBuilder.Application()
  SBApp.boot()
