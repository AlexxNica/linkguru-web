Fluxxor = require("fluxxor")
Constants = require("../constants")

LinksStore = Fluxxor.createStore
  initialize: (options) ->
    @links = [{url: 'testurl.com', created_at: 'created_at '}, {url: 'testurl2.com', created_at: 'created_at2'}]

  getState: ->
    collection: @links


module.exports = LinksStore
