CANDIDATES = [' => ', ' -> ', '=>', '->']

module.exports =

  activate: (state) ->
    atom.workspaceView.command 'fat-arrow:show', => @show()

  show: ->
    editor = atom.workspace.activePaneItem
    selectedText = editor.getSelectedText()

    if selectedText
      index = CANDIDATES.indexOf(selectedText) + 1
    else
      index = 0
    editor.insertText(CANDIDATES[index], {select: true, undo: 'skip'})
