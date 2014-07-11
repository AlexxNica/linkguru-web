Fluxxor = require("fluxxor")
Const = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links = [{url: 'testurl.com', created_at: 'created_at '}, {url: 'testurl2.com', created_at: 'created_at2'}]
    @bindAction(
      Const.LINKS_ADD, @onLinkAdd
    )

  getState: ->
    collection: @links

  onLinkAdd: (payload)->
    @links.push
      url: payload.url
      created_at: Date()


module.exports = LinksStore
