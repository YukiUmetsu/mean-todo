'use strict'

express = require 'express'
parser = require 'body-parser'
Todo = require '../models/todo'

router = express.Router()

router.get '/todos', (req, res)->
  Todo.find {}, (error, todos)->
    if error
      return res.status(500).json {message: error.message}
    res.json {todos: todos}


# POST TODOS
router.post '/todos', (req, res)->
  todo = req.body
  Todo.create todo, (error, todo)->
    if error
      return res.status(500).json {error: error.message}
    res.json {'todo': todo, message: 'Todo Created'}

# PUT Todo
router.put '/todos/:id', (req, res)->
  id = req.params.id
  todo = req.body

  if todo && todo._id != id
    res.status(500).json { error: "Ids don't match!" }
  
  Todo.findByIdAndUpdate id, todo, {new: true}, (error, todo)->
    if error
      return res.status(500).json {error: error.message}
    res.json {'todo': todo, message: 'Todo Updated'}

# DELETE Todo
router.delete '/todos/:id', (req, res)->
  id = req.params.id
  Todo.findByIdAndRemove id, (error)->
    if error
      return res.status(500).json {error: error.message}
    #res.json {'todo': todo, message: 'Todo Deleted'}

module.exports = router