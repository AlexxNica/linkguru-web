Fluxxor = require("fluxxor")
Const = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links = [{url: 'testurl.com', created_at: 'created_at', score: 1, upVoted: true, downVoted: false}, {url: 'testurl2.com', created_at: 'created_at2', score: 5, upVoted: false, downVoted: true}]

    @bindActions(
      Const.LINKS_UP_VOTE, @onUpVoteLink,
      Const.LINKS_DOWN_VOTE, @onDownVoteLink,
      Const.LINKS_ADD, @onLinkAdd
    )

  onUpVoteLink: (link) ->
    link.score += 1
    link.upVoted = true
    link.downVoted = false
    @emit("change")

  onDownVoteLink: (link) ->
    link.score -= 1
    link.downVoted = true
    link.upVoted = false
    @emit("change")

  getState: ->
    collection: @links

  onLinkAdd: (payload)->
    @links.push
      url: payload.url
      created_at: Date()
      score: 0


module.exports = LinksStore
