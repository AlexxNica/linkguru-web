actions =
  addTodo: (text) ->
    @dispatch('ADD_TODO', {text: text})

  toggleTodo: (todo) ->
    @dispatch('TOGGLE_TODO', {todo: todo})

  clearTodos: ->
    @dispatch('CLEAR_TODOS')

module.exports = actions
