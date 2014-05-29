Emitter = require("./Emitter")

class Proxy extends Emitter
  constructor: (store) ->
    @store = store
    @listeners = @store.allListeners()
  get: (key) ->
    @store.get key

module.exports = (store) ->
  new Proxy(store)
