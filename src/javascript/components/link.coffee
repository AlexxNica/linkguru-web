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
      <div className='url col-xs-3'>
        {"#{@props.link.url}"}
      </div>
      <div className='score col=xs=3'>
        {"#{@props.link.score}"}
      </div>
      <button className='upVoteButton col-xs-3' onClick={@onUpVote}>Up!</button>
      <button className='downVoteButton col-xs-3' onClick={@onDownVote}>Down!</button>
    </a>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)

  onDownVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.downVote(@props.link)




module.exports = LinkComponet
