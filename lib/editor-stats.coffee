StatsTracker = require './stats-tracker'

module.exports =
  activate: ->
    @stats = new StatsTracker()
    atom.workspaceView.command 'editor-stats:toggle', =>
      @createView().toggle(@stats)

  deactivate: ->
    @editorStatsView = null
    @stats = null

  createView: ->
    unless @editorStatsView
      EditorStatsView  = require './editor-stats-view'
      @editorStatsView = new EditorStatsView()
    @editorStatsView
