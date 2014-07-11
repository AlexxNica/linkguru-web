# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxMixin = Fluxxor.FluxMixin(React)
# StoreWatchMixin = Fluxxor.StoreWatchMixin

LinksComponent = require './links'

Application = React.createClass
  mixins: [FluxMixin]

  render: ->
    return (
      <section className="application-container">
        <div class="links-container">
          <LinksComponent/>
        </div>
      </section>
    )

module.exports = Application
