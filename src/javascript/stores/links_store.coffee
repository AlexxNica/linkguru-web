Fluxxor = require("fluxxor")
Const = require("../constants")
_ = require("Underscore")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links =  []
    @searchResult = null
    @loading = false
    @error = null

    @bindActions(
      Const.LINKS_UP_VOTE, @onUpVoteLink,
      Const.LINKS_DOWN_VOTE, @onDownVoteLink,
      Const.LINKS_ADD, @onLinkAdd,
      Const.LOAD_LINKS, @onLoadLinks,
      Const.LOAD_LINKS_SUCCESS, @onLoadLinksSuccess,
      Const.LOAD_LINKS_FAIL, @onLoadLinksFail
      Const.SEARCH_LINK, @onSearchLink
    )

  getLinks: ->
    @searchResult || @links

  onSearchLink: (query) ->
    if query
      @searchResult = _.filter @links, (link) ->
        link.url.indexOf(query) != -1
    else
      @searchResult = null
    @emit("change")

  onUpVoteLink: (link) ->
    return true if link.upVoted
    link.score += if link.downVoted then 2 else 1
    link.upVoted = true
    link.downVoted = false
    @emit("change")

  onDownVoteLink: (link) ->
    return true if link.downVoted
    link.score -= if link.upVoted then 2 else 1
    link.downVoted = true
    link.upVoted = false
    @emit("change")

  getState: ->
    { loading: @loading, error: @error, collection: @getLinks() }

  onLinkAdd: (payload)->
    @links.push
      url: payload.url
      created_at: Date()
      score: 0
      description: payload.description

  onLoadLinks: ->
    @loading = true
    @links = []
    @error = null
    @emit 'change'

  onLoadLinksSuccess: (links)->
    @loading = false
    @links = links
    @emit 'change'

  onLoadLinksFail: (payload)->
    @loading = false
    @error = payload.error
    @emit 'change'

module.exports = LinksStore
