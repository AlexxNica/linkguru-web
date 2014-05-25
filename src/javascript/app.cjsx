# @cjsx React.DOM
React = require 'react'
CheckboxWithLabel = require './checkboxWithLabel'

React.renderComponent <CheckboxWithLabel labelOn="On" labelOff="Off" />, document.getElementById('app')
