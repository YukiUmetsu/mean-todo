'user strict'

Todo = require './models/todo.js'

todos = [
  'Feed the dog',
  'Walk the kids',
  'Water the trees'
]

todos.forEach (todo, index)->
  Todo.find {name: todo}, (error, todos)->
    if !error && !todos.length
      Todo.create {complete: false, name: todo}