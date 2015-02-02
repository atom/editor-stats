StatsTracker = require './stats-tracker'

module.exports =
  activate: ->
    @stats = new StatsTracker()
    atom.commands.add 'atom-workspace', 'editor-stats:toggle', =>
      @createView().toggle(@stats)

  deactivate: ->
    @editorStatsView = null
    @stats = null

  createView: ->
    unless @editorStatsView
      EditorStatsView  = require './editor-stats-view'
      @editorStatsView = new EditorStatsView()
    @editorStatsView
