(->
  "use strict"
  Store = ->
    @data = {}
    return

  Object.assign Store::, require("./Emitter"),
    has: (key) ->
      @data.hasOwnProperty key

    get: (key) ->
      @data[key]

    set: (key, value) ->
      changeset = {}
      data = key
      if value isnt `undefined`
        data = {}
        data[key] = value
      Object.keys(data).forEach ((key) ->
        oldValue = @get(key)
        value = data[key]
        changeset[key] = oldValue
        @data[key] = value
        @emit "change:" + key, value, oldValue
        return
      ), this
      @emit "change", changeset
      return

    unset: (key) ->
      if @has(key)
        oldValue = @get(key)
        delete @data[key]

        @emit "change:" + key, `undefined`, oldValue
      return

    clear: ->
      changeset = {}
      Object.keys(@data).forEach ((key) ->
        changeset[key] = @get(key)
        @unset key
        return
      ), this
      @emit "change", changeset
      return

  module.exports = Store
  return
).call this
