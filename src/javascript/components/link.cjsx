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
    <a>
      <div className='url col-xs-9'>
        <a href={@props.link.url}>{"#{@props.link.url}"}</a>
      </div>
      <div className='col-xs-3'>
        <span className='label label-info'>{"#{@props.link.score}"}</span>

        <button className='upVoteButton btn btn-success' onClick={@onUpVote} disabled={@props.link.upVoted}>Up!</button>
        <button className='downVoteButton btn btn-danger' onClick={@onDownVote} disabled={@props.link.downVoted}>Down!</button>
      </div>
    </a>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)

  onDownVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.downVote(@props.link)




module.exports = LinkComponet
