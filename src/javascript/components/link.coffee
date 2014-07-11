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
      <button class='upVoteButton' onClick={@onUpVote}>UpVote!</button>
    </a>

  onUpVote: (e) ->
    e.preventDefault()
    @getFlux().actions.links.upVote(@props.link)




module.exports = LinkComponet
