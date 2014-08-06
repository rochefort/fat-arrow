CANDIDATES = [' => ', ' -> ', '=>', '->']

module.exports =

  activate: (state) ->
    atom.workspaceView.command 'fat-arrow:show', => @show()

  show: ->
    editor = atom.workspace.activePaneItem
    selectedText = editor.getSelectedText()
    nextIndex = @_nextIndex(selectedText)
    editor.insertText(CANDIDATES[nextIndex], {select: true, undo: 'skip'})

  _nextIndex: (selectedText) ->
    return 0 unless selectedText
    index = CANDIDATES.indexOf(selectedText)
    if (index >= CANDIDATES.length - 1)
      return 0
    else
      return index + 1
