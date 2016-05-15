'use strict'

mongoose = require 'mongoose'

todoSchema = new mongoose.Schema {
  name: String,
  completed: Boolean
}

model = mongoose.model 'Todo', todoSchema

module.exports = model