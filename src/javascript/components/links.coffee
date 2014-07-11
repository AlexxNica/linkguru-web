# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin

LinkComponent = require './link'

LinksComponent = React.createClass
  mixins: [FluxChildMixin, StoreWatchMixin("LinksStore")]


  getInitialState: ->
    newLinkUrl: ""

  getStateFromFlux: ->
    flux = @getFlux()
    links: flux.store("LinksStore").getState()

  render: ->
    <section className="application-container">
      <div>
        <ul>
          {
            @state.links.collection.map (link, i) ->
              <div className="row">
                <LinkComponent link={link}/>
              </div>
          }
        </ul>
      </div>
      <div>
        <form onSubmit={ @onNewLinkSubmit }>
          <input type="url"
                 size="100"
                 placeholder="New link"
                 value={ @state.newLinkUrl }
                 onChange={ @handleLinkUrlChange } />
          <input type="submit" value="Add Link" />
        </form>
      </div>
    </section>


  handleLinkUrlChange: (e) ->
    @setState(newLinkUrl: e.target.value)

  onNewLinkSubmit: (e) ->
    e.preventDefault()
    if (@state.newLinkUrl.trim())
      @getFlux().actions.links.addLink url: @state.newLinkUrl
      @setState newLinkUrl: ""

module.exports = LinksComponent
