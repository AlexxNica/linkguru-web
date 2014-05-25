# @cjsx React.DOM
React = require 'react'

CheckboxWithLabel = React.createClass
  getInitialState: ->
    isChecked: false
  onChange: ->
    @setState isChecked: not @state.isChecked
  render: ->
    <label>
      <input type="checkbox" checked={@state.isChecked} onChange={@onChange} />
      {if @state.isChecked then @props.labelOn else @props.labelOff}
    </label>

module.exports = CheckboxWithLabel
