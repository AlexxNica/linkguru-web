# @cjsx React.DOM
React = require 'react'

NeatComponent = React.createClass
  render: ->
    {showTitle, neat} = @props

    <div className="neat-component">
      {<h1>A Component is Super Neat</h1> if showTitle}
      {<p>is this component neat?<br />{neat} x {times}</p> for times in [1..10]}
    </div>

React.renderComponent <NeatComponent showTitle=true neat='Many Neat' />, document.getElementById('app')
