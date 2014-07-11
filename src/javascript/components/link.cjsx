# @cjsx React.DOM

React = require("React")
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)


LinkComponet = React.createClass
  mixins: [FluxChildMixin]

  propTypes: {
    link: React.PropTypes.object.isRequired
  },
  handleQuery: (value) ->
    query = @props.query
    if query
      value.replace(query, "<span class='query-match'>#{query}</span>")
    else
      value

  render: ->
    <tr>
      <div clasName='row'>
        <td className='url col-xs-4'>
          <a href={"#{@props.link.url}"} dangerouslySetInnerHTML={{__html: "#{@handleQuery(@props.link.url)}"}} />
        </td>
        <td className='description col-xs-5'>
          <p dangerouslySetInnerHTML={{__html: "#{@handleQuery(@props.link.description)}"}} />
        </td>
        <td className='col-xs-3 btn-group'>
          <span className='score pull-left'>{"#{@props.link.score}"}</span>
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
