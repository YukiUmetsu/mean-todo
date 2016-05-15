'use strict'

mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/mean-todo', (error)->
  if error
    console.log 'Failed to connect mongodb!'
  else
    console.log 'successfully connected to mongodb'