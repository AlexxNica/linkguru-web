Fluxxor = require 'fluxxor'

TodoStore = Fluxxor.createStore(

  actions:
    'ADD_TODO': 'onAddTodo'
    'TOGGLE_TODO': 'onToggleTodo'
    'CLEAR_TODOS': 'onClearTodos'

  initialize: ->
    @todos = []

  onAddTodo: (payload) ->
    @todos.push({text: payload.text, complete: false})
    @emit("change")

  onToggleTodo: (payload) ->
    payload.todo.complete = !payload.todo.complete;
    @emit("change")

  onClearTodos: ->
    @todos = @todos.filter( (todo) ->
        return !todo.complete
    )
    @emit("change");

  getState: ->
    return {
      todos: @todos
    }
)

module.exports = TodoStore
