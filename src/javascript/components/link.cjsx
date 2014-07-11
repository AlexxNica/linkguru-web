# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)


LinkComponet = React.createClass
  mixins: [FluxChildMixin]

  propTypes: {
    link: React.PropTypes.object.isRequired
  },

  render: ->
    <tr>
      <div clasName='row'>
        <td className='url col-xs-4'>
          <a href={"#{@props.link.url}"}>{"#{@props.link.url}"}</a>
        </td>
        <td className='description col-xs-5'>
          <p>{"#{@props.link.description}"}</p>
        </td>
        <td className='col-xs-3 btn-group'>
          <span className='label label-info inline pull-left label-big'>{"#{@props.link.score}"}</span>
          <button className='btn btn-sm btn-success' onClick={@onUpVote} disabled={@props.link.upVoted}>Up!</button>
          <button className='btn btn-sm btn-danger' onClick={@onDownVote} disabled={@props.link.downVoted}>Down!</button>
        </td>
      </div>
    </tr>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)

  onDownVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.downVote(@props.link)

module.exports = LinkComponet
