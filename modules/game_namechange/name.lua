function init()
  g_ui.importStyle('name')

  bugReportWindow = g_ui.createWidget('NameReportWindow', rootWidget)
  bugReportWindow:hide()

  oldTextEdit = bugReportWindow:getChildById('oldTextEdit')
  newTextEdit = bugReportWindow:getChildById('newTextEdit')
end

function terminate()
  bugReportWindow:hide()
end

function doNameChange()
  local text = bugReportWindow:getChildById('oldTextEdit'):getText()
  local text1 = bugReportWindow:getChildById('newTextEdit'):getText()
  g_game.talk('/name ' .. text .. ', ' .. text1)
  bugReportWindow:hide()
end

function show()
  if g_game.isOnline() then
    oldTextEdit:setText('')
    newTextEdit:setText('')
    bugReportWindow:show()
    bugReportWindow:raise()
    bugReportWindow:focus()
  end
end
