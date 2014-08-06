{WorkspaceView} = require 'atom'
FatArrow = require '../lib/fat-arrow'

describe "FatArrow", ->
  [activationPromise, editor, editorView] = []

  arrowShow = (calledTimes, actual) ->
    for [1..calledTimes]
      editorView.trigger 'fat-arrow:show'
    waitsForPromise -> activationPromise
    runs ->
      expect(editor.getSelectedText()).toEqual(actual)

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspaceView.openSync()
    editorView = atom.workspaceView.getActiveView()
    editor = editorView.getEditor()
    activationPromise = atom.packages.activatePackage('fat-arrow')

  describe 'when the fat-arrow:show event is triggered', ->
    describe 'once', ->
      it 'is selected a fat arrow', ->
        arrowShow(1, ' => ')

    describe 'twice', ->
      it 'is selected a narrow arrow', ->
        arrowShow(2, ' -> ')

    describe '3 times', ->
      it 'is selected a fat arrow without space', ->
        arrowShow(3, '=>')

    describe '4 times', ->
      it 'is selected a narrow arrow without space', ->
        arrowShow(4, '->')

    describe '5 times', ->
      it 'is selected a narrow arrow', ->
        arrowShow(5, ' => ')
