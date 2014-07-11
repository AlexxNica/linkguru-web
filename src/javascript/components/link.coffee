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
      <button class='upVoteButton' onClick={@onUpVote}>UpVote!</button>
    </a>


module.exports = LinkComponet
