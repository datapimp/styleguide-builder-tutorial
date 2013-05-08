#= require ./config
#= require_tree ./templates

#= require ./lib
#= require ./data
#= require ./views
#= require ./application

#= require 'code_sync'

$ ->
  window.SBApp = new StyleBuilder.Application()
  SBApp.boot()

  SBApp.codeSync = new CodeSync.Client()
