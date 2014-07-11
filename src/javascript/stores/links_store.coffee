Fluxxor = require("fluxxor")
Const = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links = [{url: 'http://www.google.com#q=test1', created_at: 'created_at', score: 1, upVoted: true, downVoted: false},
              {url: 'http://www.google.com#q=test2', created_at: 'created_at2', score: 5, upVoted: false, downVoted: true},
              {url: 'http://www.google.com#q=test3', created_at: 'created_at2', score: 5}]

    @bindActions(
      Const.LINKS_UP_VOTE, @onUpVoteLink,
      Const.LINKS_DOWN_VOTE, @onDownVoteLink,
      Const.LINKS_ADD, @onLinkAdd
    )

  onUpVoteLink: (link) ->
    link.score += if link.downVoted then 2 else 1
    link.upVoted = true
    link.downVoted = false
    @emit("change")

  onDownVoteLink: (link) ->
    link.score -= if link.upVoted then 2 else 1
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
