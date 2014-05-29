(->
  "use strict"
  module.exports = (store) ->
    Proxy = ->
      @listeners = store.allListeners()
      return

    Proxy:: = Object.assign(
      get: (key) ->
        store.get key
    , require("./Emitter"))
    new Proxy()

  return
).call this
