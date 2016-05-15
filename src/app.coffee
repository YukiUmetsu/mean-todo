'use strict'

express = require 'express'
parser = require 'body-parser'
router = require './api'

app = express()

require './database'
require './seed'

app.use '/', express.static 'public'
app.use parser.json()

app.use '/api', router

app.listen 3000, ()->
  console.log "The server is running on port 3000!"

