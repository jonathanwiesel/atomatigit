{Model} = require 'backbone'

##
# DiffLine represents a single line of a diff.
# Someday we might want to be able to jump straight to
# this line, but for now it only needs to manage whether it's
# an addition, subtraction, or context line.

module.exports =
class DiffLine extends Model
  line: ->
    @get "line"

  type: ->
    if !!(@line().match /^\+/)
      "addition"
    else if !!(@line().match /^\-/)
      "subtraction"
    else
      "context"

  repo: ->
    @get "repo"

  markup: ->
    @line().replace /\ /g, "&nbsp;"
