# @cjsx React.DOM
React = require 'React'
Fluxxor = require 'fluxxor'

FluxChildMixin = Fluxxor.FluxChildMixin(React)

TodoItem = React.createClass
  mixins: [FluxChildMixin],

  propTypes: {
    todo: React.PropTypes.object.isRequired
  },

  render: ->
    style = {
      textDecoration:  if @props.todo.complete then "line-through" else ""
    }

    return <a style={style} onClick={@onClick}>{"#{@props.todo.text}"}</a>

  onClick: ->
    @getFlux().actions.toggleTodo(@props.todo)


module.exports = TodoItem
