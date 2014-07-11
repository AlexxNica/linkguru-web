# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin

LinkComponent = require './link'

LinksComponent = React.createClass
  mixins: [FluxChildMixin, StoreWatchMixin("LinksStore")]

  getStateFromFlux: ->
    flux = @getFlux()
    return links: flux.store("LinksStore").getState()

  render: ->
    return (
      <section className="application-container">
        <div>
          <ul>
            { @state.links.collection.map((link, i) ->
              return(
                <div class="row">
                  <LinkComponent link={link}/>
                </div>
                )
            )}
          </ul>
        </div>
      </section>
    )

module.exports = LinksComponent
