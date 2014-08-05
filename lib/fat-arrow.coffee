FAT_ARROW = ' => '
ARROW = ' -> '

module.exports =

  activate: (state) ->
    atom.workspaceView.command 'fat-arrow:show', => @show()

  show: ->
    editor = atom.workspace.activePaneItem
    selectedText = editor.getSelectedText()

    if selectedText && selectedText == FAT_ARROW
      insertText = ARROW
    else
      insertText = FAT_ARROW
    editor.insertText(insertText, {select: true, undo: 'skip'})
