# @cjsx React.DOM

React = require("react")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)


Search = React.createClass
  mixins: [FluxChildMixin]

  render: ->
    <div className="search-input col-xs-4">
      <input placeholder="Search..." className="form-control" name="search-value" onChange={@onChange} />
    </div>

  onChange: (e) ->
    value = e.target.value
    @getFlux().actions.links.search(value)

module.exports = Search
