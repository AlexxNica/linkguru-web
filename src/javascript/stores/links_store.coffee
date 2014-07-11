Fluxxor = require("fluxxor")
Const = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links =  [{url: 'testurl.com', created_at: 'created_at', score: 1}, {url: 'testurl2.com', created_at: 'created_at2', score: 5}]
    @loading = false
    @error = null

    @bindActions(
      Const.LINKS_UP_VOTE, @onUpVoteLink,
      Const.LINKS_DOWN_VOTE, @onDownVoteLink,
      Const.LINKS_ADD, @onLinkAdd,
      Const.LOAD_LINKS, @onLoadLinks,
      Const.LOAD_LINKS_SUCCESS, @onLoadLinksSuccess,
      Const.LOAD_LINKS_FAIL, @onLoadLinksFail
    )

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
    { loading: @loading, error: @error, collection: @links }

  onLinkAdd: (payload)->
    @links.push
      url: payload.url
      created_at: Date()
      score: 0
      description: ""

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
