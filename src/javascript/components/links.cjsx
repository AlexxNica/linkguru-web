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
        <div>
          <form onSubmit={ @onNewLinkSubmit } className='form-inline new-link-form'>
            <div className='form-group col-xs-4'>
              <input type="url"
                     size='30'
                     placeholder="Link url..."
                     value={ @state.newLinkUrl }
                     onChange={ @handleLinkUrlChange }
                     className='form-control'/>
            </div>
            <div className='form-group col-xs-6'>
              <input  type="text"
                      size='60'
                      placeholder="Description..."
                      value={ @state.newDescriptionText }
                      onChange={ @handleDescriptionChange }
                      className='form-control'/>
            </div>
            <div className='form-group col-xs-2'>
              <input type="submit" value="Add Link" className='btn btn-sm btn-default' />
            </div>
          </form>
        </div>
      </div>
      <div>
        <table className="table links-collection">
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
