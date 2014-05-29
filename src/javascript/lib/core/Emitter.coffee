Emitter =
  allListeners: ->
    @listeners = []  unless @listeners
    @listeners

  clearListeners: ->
    @listeners.pop()  while @listeners.length
    return

  getListeners: (type) ->
    @allListeners().filter (defn) ->
      defn.type is type


  emit: (type) ->
    args = Array.from(arguments_).slice(1)
    @getListeners(type).forEach (defn) ->
      defn.callback.apply defn.context or defn.callback, args
      return

    return

  on: (type, callback, context) ->
    @allListeners().push
      type: type
      callback: callback
      context: context

    return

  once: (type, callback, context) ->
    self = this
    wrap = wrap = ->
      callback.apply this, arguments_
      self.off type, wrap
      return

    @on type, wrap, context
    return

  off: (type, callback) ->
    listeners = @allListeners()
    i = listeners.length
    unless type
      @clearListeners()
      return
    while i--
      defn = listeners[i]
      continue  if defn.type isnt type
      listeners.splice i, 1  if not callback or defn.callback is callback
    return

module.exports = Emitter
