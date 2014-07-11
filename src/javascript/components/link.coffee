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
      <div class='url'>
        {"#{@props.link.url}"}
      </div>
      <div class='score'>
        {"#{@props.link.score}"}
      </div>
      <button class='upVoteButton' onClick={@onUpVote}>Up!</button>
      <button class='downVoteButton' onClick={@onDownVote}>Down!</button>
    </a>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)

  onDownVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.downVote(@props.link)




module.exports = LinkComponet
