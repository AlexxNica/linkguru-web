# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxMixin = Fluxxor.FluxMixin(React)
# StoreWatchMixin = Fluxxor.StoreWatchMixin

LinksComponent = require './links'
Search = require "./search"

Application = React.createClass
  mixins: [FluxMixin]

  render: ->
    <section className="application-container">
      <div className="container links-container">
        <Search />
        <LinksComponent/>
      </div>
    </section>

module.exports = Application
