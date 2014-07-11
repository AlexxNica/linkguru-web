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
    newDescriptionText: ""

  getStateFromFlux: ->
    flux = @getFlux()
    links: flux.store("LinksStore").getState()

  componentDidMount: ->
    @getFlux().actions.links.load()

  render: ->
    <section className="application-container">
      <div>
        <table className="table">
          <tr>
            <td>Link</td>
            <td>Description</td>
            <td>Vote!</td>

          </tr>
          <tbody>
            {
              @state.links.collection.map (link, i) ->
                <LinkComponent key=i link={link}/>
            }
          </tbody>
        </table>
      </div>
      <div>
        <form onSubmit={ @onNewLinkSubmit }>
          <div className='col-xs-5 form-group'>
            <input type="url"
                   size="100"
                   placeholder="New link"
                   value={ @state.newLinkUrl }
                   onChange={ @handleLinkUrlChange }
                   className='col-xs-5'/>
          </div>
          <div className='col-xs-5 form-group'>
            <textarea type="text"
                      size="300"
                      placeholder="New link"
                      value={ @state.newDescriptionText }
                      onChange={ @handleDescriptionChange }
                      className='col-xs-5'/>
          </div>
          <input type="submit" value="Add Link" className='col-xs-2 btn btn-sm btn-default' />
        </form>
      </div>
    </section>


  handleLinkUrlChange: (e) ->
    @setState(newLinkUrl: e.target.value)

  handleDescriptionChange: (e) ->
    @setState(newDescriptionText: e.target.value)

  onNewLinkSubmit: (e) ->
    e.preventDefault()
    if (@state.newLinkUrl.trim())
      @getFlux().actions.links.addLink
        url: @state.newLinkUrl
        description: @state.newDescriptionText
      @setState newLinkUrl: ""

module.exports = LinksComponent
