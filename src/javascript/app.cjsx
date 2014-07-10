# @cjsx React.DOM
Fluxxor = require 'fluxxor'
React = require 'React'

actions = require './actions'
stores = require './stores'

flux = new Fluxxor.Flux(stores, actions)
