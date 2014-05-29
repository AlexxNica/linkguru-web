# @cjsx React.DOM
React = require 'react'
flux = require './lib/flux'
CheckboxWithLabel = require './checkboxWithLabel'

React.renderComponent <CheckboxWithLabel labelOn="On" labelOff="Off" />, document.getElementById('app')
