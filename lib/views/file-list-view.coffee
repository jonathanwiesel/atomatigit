{View} = require 'atom'
FileView = require './file-view'
FileList = require '../models/file-list'

module.exports =
class FileListView extends View
  @content: ->
    @div =>
      @div "untracked:"
      @div outlet: "untracked_dom"
      @div "unstaged:"
      @div outlet: "unstaged_dom"
      @div "staged:"
      @div outlet: "staged_dom"

  initialize: (file_list) ->
    @file_list = file_list
    @file_list.on 'add', =>
      console.log "changed!"
      @repaint()

  empty_lists: ->
    @untracked_dom.empty()
    @unstaged_dom.empty()
    @staged_dom.empty()

  repaint: ->
    @empty_lists()
    for file in @file_list.untracked()
      @untracked_dom.append new FileView file

    for file in @file_list.unstaged()
      @unstaged_dom.append new FileView file

    for file in @file_list.staged()
      @staged_dom.append new FileView file