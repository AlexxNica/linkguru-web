class Dispatcher
  @callbacks = []

  getCallbacks: (action) ->
    @callbacks.filter((defn) ->
      defn.action is action
    ).map (defn) ->
      defn.callback

  dispatch: (action) ->
    args = Array.from(arguments_).slice(1)
    Promise.all @getCallbacks(action).map((callback) ->
      callback.apply callback, args
    )

  register: (action, callback) ->
    @callbacks.push
      action: action
      callback: callback

module.exports = Dispatcher
