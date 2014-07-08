# @cjsx React.DOM
Fluxxor = require 'fluxxor'
# CheckboxWithLabel = require './checkboxWithLabel'

# React.renderComponent <CheckboxWithLabel labelOn="On" labelOff="Off" />, document.getElementById('app')
AppDispatcher = require './dispatchers/App'

AppDispatcher.dispatch 'initialize'
# window.flux = flux
