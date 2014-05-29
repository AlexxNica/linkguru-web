class Emitter
  allListeners: ->
    @listeners = []  unless @listeners
    @listeners

  clearListeners: ->
    @listeners.pop()  while @listeners.length

  getListeners: (type) ->
    @allListeners().filter (defn) ->
      defn.type is type

  emit: (type) ->
    args = Array.from(arguments_).slice(1)
    @getListeners(type).forEach (defn) ->
      defn.callback.apply defn.context or defn.callback, args

  on: (type, callback, context) ->
    @allListeners().push
      type: type
      callback: callback
      context: context

  once: (type, callback, context) ->
    self = this
    wrap = wrap = ->
      callback.apply this, arguments_
      self.off type, wrap
    @on type, wrap, context

  off: (type, callback) ->
    listeners = @allListeners()
    i = listeners.length
    unless type
      @clearListeners()

    while i--
      defn = listeners[i]
      continue  if defn.type isnt type
      listeners.splice i, 1  if not callback or defn.callback is callback

module.exports = Emitter
