class Dispatcher
  constructor: ->
    @callbacks = []

  getCallbacks: (action) ->
    @callbacks.filter((defn) ->
      defn.action is action
    ).map (defn) ->
      defn.callback

  dispatch: (action) ->
    args =  Array.prototype.slice.call(arguments)
    Promise.all @getCallbacks(action).map((callback) ->
      callback.apply callback, args
    )

  register: (action, callback) ->
    @callbacks.push
      action: action
      callback: callback

module.exports = Dispatcher
