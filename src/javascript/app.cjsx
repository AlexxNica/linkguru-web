# @cjsx React.DOM
Fluxxor = require 'fluxxor'
React = require 'React'

actions = require './actions'
stores = require './stores'
App = require './views/app'

flux = new Fluxxor.Flux(stores, actions)

React.renderComponent(<App flux={flux} />, document.getElementById("app"))
