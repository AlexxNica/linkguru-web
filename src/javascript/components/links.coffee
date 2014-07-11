# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin


LinksComponnet = React.createClass
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
                  <li class="col-xs-6">
                    {link.url}
                  </li>
                  <div class="col-xs-6">
                    {link.created_at}
                  </div>
                </div>
                )
            )}
          </ul>
        </div>
      </section>
    )

module.exports = LinksComponnet
