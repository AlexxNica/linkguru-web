Const = require("./constants")
window.$ = require('zepto-browserify').$
module.exports =
  links:
    upVote: (link) ->
      @dispatch(Const.LINKS_UP_VOTE, link)
    downVote: (link) ->
      @dispatch(Const.LINKS_DOWN_VOTE, link)
    addLink: (link) ->
      @dispatch(Const.LINKS_ADD, link)
    load: ->
      @dispatch Const.LOAD_LINKS
      apiHost = 'http://localhost:3000/'
      $.getJSON apiHost + 'links.json', (result)=>
        @dispatch Const.LOAD_LINKS_SUCCESS, result.links
    search: (query) ->
      @dispatch Const.SEARCH_LINK, query
