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
      <td className='url col-xs-9'>
        <a href={"#{@props.link.url}"}>{"#{@props.link.url}"}</a>
      </td>
      <td className='col-xs-3'>
        <div className='badge'>{"#{@props.link.score}"}</div>
        <button className='badge badge-success' onClick={@onUpVote} disabled={@props.link.upVoted}>Up!</button>
        <button className='badge badge-warning' onClick={@onDownVote} disabled={@props.link.downVoted}>Down!</button>
      </td>
    </tr>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)

  onDownVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.downVote(@props.link)

module.exports = LinkComponet
