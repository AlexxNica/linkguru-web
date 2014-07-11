Fluxxor = require("fluxxor")
Const = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links = [{url: 'testurl.com', created_at: 'created_at', score: 1}, {url: 'testurl2.com', created_at: 'created_at2', score: 5}]

    @bindAction(
      Const.LINKS_ADD, @onLinkAdd
    )

  getState: ->
    collection: @links

  onLinkAdd: (payload)->
    @links.push
      url: payload.url
      created_at: Date()
      score: 0


module.exports = LinksStore
