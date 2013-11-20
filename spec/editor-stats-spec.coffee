{_, $, RootView} = require 'atom'

describe "EditorStats", ->
  [editorStats] = []

  simulateKeyUp = (key) ->
    e = $.Event "keydown", keyCode: key.charCodeAt(0)
    atom.rootView.trigger(e)

  simulateClick = ->
    e = $.Event "mouseup"
    atom.rootView.trigger(e)

  beforeEach ->
    atom.rootView = new RootView
    atom.rootView.openSync('sample.js')
    editorStats = atom.packages.activatePackage('editor-stats').mainModule.stats

  describe "when a keyup event is triggered", ->
    beforeEach ->
      expect(_.values(editorStats.eventLog)).not.toContain 1
      expect(_.values(editorStats.eventLog)).not.toContain 2

    it "records the number of times a keyup is triggered", ->
      simulateKeyUp('a')
      expect(_.values(editorStats.eventLog)).toContain 1
      simulateKeyUp('b')
      expect(_.values(editorStats.eventLog)).toContain 2

  describe "when a mouseup event is triggered", ->
    it "records the number of times a mouseup is triggered", ->
      simulateClick()
      expect(_.values(editorStats.eventLog)).toContain 1
      simulateClick()
      expect(_.values(editorStats.eventLog)).toContain 2
