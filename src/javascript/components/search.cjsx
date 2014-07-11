# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)


Search = React.createClass
  mixins: [FluxChildMixin]

  render: ->
    <div>
      <input onChange={@onChange} />
    </div>

  onChange: (e) ->
    value = e.target.value
    @getFlux().actions.links.search(value)

module.exports = Search
