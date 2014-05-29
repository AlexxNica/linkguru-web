flux = require "../lib/flux"
React = require("react");
# Loader = require("../helpers/Loader");
AppView = require("../views/App");
AppData = require("../stores/AppData");
AppState = require("../stores/AppState");
AppDispatcher = new flux.Dispatcher();

AppDispatcher.register "initialize", ->
  console.log 'init app'

module.exports = AppDispatcher
