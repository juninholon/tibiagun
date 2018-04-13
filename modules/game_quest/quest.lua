function init()
  connect(g_game, { onGameEnd = onGameEnd })
  connect(g_game, 'onTextMessage', onMissionRefresh)

  shopWindow = g_ui.displayUI('quest')
  shopWindow:hide()
  questInfo = shopWindow:getChildById('infoMission')
  rasButton = shopWindow:getChildById('rasMission')
  rasButton:disable()

  shopTabBar = shopWindow:getChildById('shopTabBar')
  shopTabBar:setContentWidget(shopWindow:getChildById('shopTabContent'))

  principalPanel = g_ui.loadUI('principal')
  shopTabBar:addTab('', principalPanel, '/images/game/other/task_window')

  shopButton = modules.client_topmenu.addRightButton('shopButton', tr('Quest Log'), '/images/topbuttons/questlog', toggle)
  shopButton:setOn(true)
  shopButton:setIcon('/images/topbuttons/questlog')
  shopButton.onClick = function() 
	g_game.talk("!QuestLog Refresh")
	questInfo:setImageSource('/images/game/other/task_window')
	rasButton:disable()
	end
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })
  disconnect(g_game, 'onTextMessage', onMissionRefresh)

  shopWindow:destroy()
  shopButton:destroy()
end

function onGameEnd()
  if shopWindow:isVisible() then
    shopWindow:hide()
  end
end

function show()
  shopWindow:show()
  shopWindow:raise()
  shopWindow:focus()
  g_sounds.getChannel(1):play("/sounds/OpenWindows")
  addEvent(function() shopButton:setIcon('/images/topbuttons/questlog_on') g_effects.fadeIn(shopWindow, 250) end)
end

function hide()
  g_sounds.getChannel(1):play("/sounds/CloseWindows")
  addEvent(function() shopButton:setIcon('/images/topbuttons/questlog') g_effects.fadeOut(shopWindow, 250) end)
  scheduleEvent(function() shopWindow:hide() end, 250)
end

function toggle()
  if shopWindow:isVisible() then
    hide()
	shopButton:setIcon('/images/topbuttons/questlog')
  else
    show()
	shopButton:setIcon('/images/topbuttons/questlog_on')
  end
end

function onMissionRefresh(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "QPrincipal") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
					principalPanel:recursiveGetChildById('Deveres Imperiais'):setColor('white')
				    principalPanel:recursiveGetChildById('Deveres Imperiais'):setIcon('/images/game/quest/aberto')
			elseif t[2] == "50" then
					principalPanel:recursiveGetChildById('Deveres Imperiais'):setColor('green')
				    principalPanel:recursiveGetChildById('Deveres Imperiais'):setIcon('/images/game/quest/concluido')
			end
			if t[3] == "-1" then
					principalPanel:recursiveGetChildById('Servir e Obedecer'):hide()
					principalPanel:recursiveGetChildById('Servir e Obedecer'):raise()
			elseif t[3] == "1" then
					principalPanel:recursiveGetChildById('Servir e Obedecer'):show()
					principalPanel:recursiveGetChildById('Servir e Obedecer'):setColor('white')
				    principalPanel:recursiveGetChildById('Servir e Obedecer'):setIcon('/images/game/quest/aberto')
			elseif t[3] == "50" then
					principalPanel:recursiveGetChildById('Servir e Obedecer'):show()
					principalPanel:recursiveGetChildById('Servir e Obedecer'):setColor('green')
				    principalPanel:recursiveGetChildById('Servir e Obedecer'):setIcon('/images/game/quest/concluido')
			elseif t[4] == "1" then
					principalPanel:recursiveGetChildById('Servir e Obedecer'):show()
					principalPanel:recursiveGetChildById('Servir e Obedecer'):setColor('white')
				    principalPanel:recursiveGetChildById('Servir e Obedecer'):setIcon('/images/game/quest/progress')
			end
			if t[5] == "-1" then
					principalPanel:recursiveGetChildById('O Caca Troll'):hide()
					principalPanel:recursiveGetChildById('O Caca Troll'):raise()
			elseif t[5] == "1" then
					principalPanel:recursiveGetChildById('O Caca Troll'):show()
					principalPanel:recursiveGetChildById('O Caca Troll'):setColor('white')
				    principalPanel:recursiveGetChildById('O Caca Troll'):setIcon('/images/game/quest/aberto')
			elseif t[5] == "50" then
					principalPanel:recursiveGetChildById('O Caca Troll'):show()
					principalPanel:recursiveGetChildById('O Caca Troll'):setColor('green')
				    principalPanel:recursiveGetChildById('O Caca Troll'):setIcon('/images/game/quest/concluido')
			elseif t[6] == "1" then
					principalPanel:recursiveGetChildById('O Caca Troll'):show()
					principalPanel:recursiveGetChildById('O Caca Troll'):setColor('white')
				    principalPanel:recursiveGetChildById('O Caca Troll'):setIcon('/images/game/quest/progress')
			end
			if t[7] == "-1" then
					principalPanel:recursiveGetChildById('Alerta de Pragas'):hide()
					principalPanel:recursiveGetChildById('Alerta de Pragas'):raise()
			elseif t[7] == "1" then
					principalPanel:recursiveGetChildById('Alerta de Pragas'):show()
					principalPanel:recursiveGetChildById('Alerta de Pragas'):setColor('white')
				    principalPanel:recursiveGetChildById('Alerta de Pragas'):setIcon('/images/game/quest/aberto')
			elseif t[7] == "50" then
					principalPanel:recursiveGetChildById('Alerta de Pragas'):show()
					principalPanel:recursiveGetChildById('Alerta de Pragas'):setColor('green')
				    principalPanel:recursiveGetChildById('Alerta de Pragas'):setIcon('/images/game/quest/concluido')
			elseif t[8] == "1" then
					principalPanel:recursiveGetChildById('Alerta de Pragas'):show()
					principalPanel:recursiveGetChildById('Alerta de Pragas'):setColor('white')
				    principalPanel:recursiveGetChildById('Alerta de Pragas'):setIcon('/images/game/quest/progress')
			end
			if t[9] == "-1" then
					principalPanel:recursiveGetChildById('Enfermidade'):hide()
					principalPanel:recursiveGetChildById('Enfermidade'):raise()
			elseif t[9] == "1" then
					principalPanel:recursiveGetChildById('Enfermidade'):show()
					principalPanel:recursiveGetChildById('Enfermidade'):setColor('white')
				    principalPanel:recursiveGetChildById('Enfermidade'):setIcon('/images/game/quest/aberto')
			elseif t[9] == "50" then
					principalPanel:recursiveGetChildById('Enfermidade'):show()
					principalPanel:recursiveGetChildById('Enfermidade'):setColor('green')
				    principalPanel:recursiveGetChildById('Enfermidade'):setIcon('/images/game/quest/concluido')
			elseif t[10] == "1" then
					principalPanel:recursiveGetChildById('Enfermidade'):show()
					principalPanel:recursiveGetChildById('Enfermidade'):setColor('white')
				    principalPanel:recursiveGetChildById('Enfermidade'):setIcon('/images/game/quest/progress')
			end
			if t[11] == "-1" then
					principalPanel:recursiveGetChildById('O Domador de Feras'):hide()
					principalPanel:recursiveGetChildById('O Domador de Feras'):raise()
			elseif t[11] == "1" then
					principalPanel:recursiveGetChildById('O Domador de Feras'):show()
					principalPanel:recursiveGetChildById('O Domador de Feras'):setColor('white')
				    principalPanel:recursiveGetChildById('O Domador de Feras'):setIcon('/images/game/quest/aberto')
			elseif t[11] == "50" then
					principalPanel:recursiveGetChildById('O Domador de Feras'):show()
					principalPanel:recursiveGetChildById('O Domador de Feras'):setColor('green')
				    principalPanel:recursiveGetChildById('O Domador de Feras'):setIcon('/images/game/quest/concluido')
			elseif t[12] == "1" then
					principalPanel:recursiveGetChildById('O Domador de Feras'):show()
					principalPanel:recursiveGetChildById('O Domador de Feras'):setColor('white')
				    principalPanel:recursiveGetChildById('O Domador de Feras'):setIcon('/images/game/quest/progress')
			end
			if t[13] == "-1" then
					principalPanel:recursiveGetChildById('Traidor'):hide()
					principalPanel:recursiveGetChildById('Traidor'):raise()
			elseif t[13] == "1" then
					principalPanel:recursiveGetChildById('Traidor'):show()
					principalPanel:recursiveGetChildById('Traidor'):setColor('white')
				    principalPanel:recursiveGetChildById('Traidor'):setIcon('/images/game/quest/aberto')
			elseif t[13] == "50" then
					principalPanel:recursiveGetChildById('Traidor'):show()
					principalPanel:recursiveGetChildById('Traidor'):setColor('green')
				    principalPanel:recursiveGetChildById('Traidor'):setIcon('/images/game/quest/concluido')
			elseif t[14] == "1" then
					principalPanel:recursiveGetChildById('Traidor'):show()
					principalPanel:recursiveGetChildById('Traidor'):setColor('white')
				    principalPanel:recursiveGetChildById('Traidor'):setIcon('/images/game/quest/progress')
			end
			if t[15] == "-1" then
					principalPanel:recursiveGetChildById('Bencao Divina'):hide()
					principalPanel:recursiveGetChildById('Bencao Divina'):raise()
			elseif t[15] == "1" then
					principalPanel:recursiveGetChildById('Bencao Divina'):show()
					principalPanel:recursiveGetChildById('Bencao Divina'):setColor('white')
				    principalPanel:recursiveGetChildById('Bencao Divina'):setIcon('/images/game/quest/aberto')
			elseif t[15] == "50" then
					principalPanel:recursiveGetChildById('Bencao Divina'):show()
					principalPanel:recursiveGetChildById('Bencao Divina'):setColor('green')
				    principalPanel:recursiveGetChildById('Bencao Divina'):setIcon('/images/game/quest/concluido')
			end
			if t[16] == "-1" then
					principalPanel:recursiveGetChildById('Honrando os Mortos'):hide()
					principalPanel:recursiveGetChildById('Honrando os Mortos'):raise()
			elseif t[16] == "1" then
					principalPanel:recursiveGetChildById('Honrando os Mortos'):show()
					principalPanel:recursiveGetChildById('Honrando os Mortos'):setColor('white')
				    principalPanel:recursiveGetChildById('Honrando os Mortos'):setIcon('/images/game/quest/aberto')
			elseif t[16] == "50" then
					principalPanel:recursiveGetChildById('Honrando os Mortos'):show()
					principalPanel:recursiveGetChildById('Honrando os Mortos'):setColor('green')
				    principalPanel:recursiveGetChildById('Honrando os Mortos'):setIcon('/images/game/quest/concluido')
			elseif t[17] == "1" then
					principalPanel:recursiveGetChildById('Honrando os Mortos'):show()
					principalPanel:recursiveGetChildById('Honrando os Mortos'):setColor('white')
				    principalPanel:recursiveGetChildById('Honrando os Mortos'):setIcon('/images/game/quest/progress')
			end
			if t[18] == "-1" then
					principalPanel:recursiveGetChildById('Missao Oficial'):hide()
					principalPanel:recursiveGetChildById('Missao Oficial'):raise()
			elseif t[18] == "1" then
					principalPanel:recursiveGetChildById('Missao Oficial'):show()
					principalPanel:recursiveGetChildById('Missao Oficial'):setColor('white')
				    principalPanel:recursiveGetChildById('Missao Oficial'):setIcon('/images/game/quest/aberto')
			elseif t[18] == "50" then
					principalPanel:recursiveGetChildById('Missao Oficial'):show()
					principalPanel:recursiveGetChildById('Missao Oficial'):setColor('green')
				    principalPanel:recursiveGetChildById('Missao Oficial'):setIcon('/images/game/quest/concluido')
			elseif t[19] == "1" then
					principalPanel:recursiveGetChildById('Missao Oficial'):show()
					principalPanel:recursiveGetChildById('Missao Oficial'):setColor('white')
				    principalPanel:recursiveGetChildById('Missao Oficial'):setIcon('/images/game/quest/progress')
			end
			if t[20] == "-1" then
					principalPanel:recursiveGetChildById('Lista Negra'):hide()
					principalPanel:recursiveGetChildById('Lista Negra'):raise()
			elseif t[20] == "1" then
					principalPanel:recursiveGetChildById('Lista Negra'):show()
					principalPanel:recursiveGetChildById('Lista Negra'):setColor('white')
				    principalPanel:recursiveGetChildById('Lista Negra'):setIcon('/images/game/quest/aberto')
			elseif t[20] == "50" then
					principalPanel:recursiveGetChildById('Lista Negra'):show()
					principalPanel:recursiveGetChildById('Lista Negra'):setColor('green')
				    principalPanel:recursiveGetChildById('Lista Negra'):setIcon('/images/game/quest/concluido')
			elseif t[21] == "1" then
					principalPanel:recursiveGetChildById('Lista Negra'):show()
					principalPanel:recursiveGetChildById('Lista Negra'):setColor('white')
				    principalPanel:recursiveGetChildById('Lista Negra'):setIcon('/images/game/quest/progress')
			end
		end
		if string.find(text, "CheckDeveresImperiais") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "-1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DeveresImperiais/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDImperiais") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DeveresImperiais/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckServirObedecer") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/ServirObedecer/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearSEObedecer") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/ServirObedecer/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckOCacaTroll") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/OCacaTroll/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearOCacaTroll") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/OCacaTroll/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAlertaPragas") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/AlertaPragas/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAlertaPragas") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/AlertaPragas/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckEnfermidade") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Enfermidade/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearEnfermidade") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Enfermidade/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDomadorFeras") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DomadorFeras/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDomadorFeras") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DomadorFeras/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckTraidor") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" or t[2] == "5" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Traidor/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearTraidor") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Traidor/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckBencaoDivina") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/BencaoDivina/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearBencaoDivina") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/BencaoDivina/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckHonrandoMortos") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/HonrandoMortos/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearHonrandoMortos") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/HonrandoMortos/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckMissaoOficial") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/MissaoOficial/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearMissaoOficial") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/MissaoOficial/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckListaNegra") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/ListaNegra/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearListaNegra") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/ListaNegra/50')
				rasButton:disable()
			end
		end	
	end
		if string.find(text, "DoisQuest") then
			local d = string.explode(text, " ")
			if d[2] == "-1" then
					principalPanel:recursiveGetChildById('Promessa'):hide()
					principalPanel:recursiveGetChildById('Promessa'):raise()
			elseif d[2] == "1" then
					principalPanel:recursiveGetChildById('Promessa'):show()
					principalPanel:recursiveGetChildById('Promessa'):setColor('white')
				    principalPanel:recursiveGetChildById('Promessa'):setIcon('/images/game/quest/aberto')
			elseif d[2] == "50" then
					principalPanel:recursiveGetChildById('Promessa'):show()
					principalPanel:recursiveGetChildById('Promessa'):setColor('green')
				    principalPanel:recursiveGetChildById('Promessa'):setIcon('/images/game/quest/concluido')
			elseif d[3] == "1" then
					principalPanel:recursiveGetChildById('Promessa'):show()
					principalPanel:recursiveGetChildById('Promessa'):setColor('white')
				    principalPanel:recursiveGetChildById('Promessa'):setIcon('/images/game/quest/progress')
			end
			if d[4] == "-1" then
					principalPanel:recursiveGetChildById('Raridade'):hide()
					principalPanel:recursiveGetChildById('Raridade'):raise()
			elseif d[4] == "1" then
					principalPanel:recursiveGetChildById('Raridade'):show()
					principalPanel:recursiveGetChildById('Raridade'):setColor('white')
				    principalPanel:recursiveGetChildById('Raridade'):setIcon('/images/game/quest/aberto')
			elseif d[4] == "50" then
					principalPanel:recursiveGetChildById('Raridade'):show()
					principalPanel:recursiveGetChildById('Raridade'):setColor('green')
				    principalPanel:recursiveGetChildById('Raridade'):setIcon('/images/game/quest/concluido')
			elseif d[5] == "1" then
					principalPanel:recursiveGetChildById('Raridade'):show()
					principalPanel:recursiveGetChildById('Raridade'):setColor('white')
				    principalPanel:recursiveGetChildById('Raridade'):setIcon('/images/game/quest/progress')
			end
			if d[6] == "-1" then
					principalPanel:recursiveGetChildById('Curandeiro'):hide()
					principalPanel:recursiveGetChildById('Curandeiro'):raise()
			elseif d[6] == "1" then
					principalPanel:recursiveGetChildById('Curandeiro'):show()
					principalPanel:recursiveGetChildById('Curandeiro'):setColor('white')
				    principalPanel:recursiveGetChildById('Curandeiro'):setIcon('/images/game/quest/aberto')
			elseif d[6] == "50" then
					principalPanel:recursiveGetChildById('Curandeiro'):show()
					principalPanel:recursiveGetChildById('Curandeiro'):setColor('green')
				    principalPanel:recursiveGetChildById('Curandeiro'):setIcon('/images/game/quest/concluido')
			elseif d[7] == "1" then
					principalPanel:recursiveGetChildById('Curandeiro'):show()
					principalPanel:recursiveGetChildById('Curandeiro'):setColor('white')
				    principalPanel:recursiveGetChildById('Curandeiro'):setIcon('/images/game/quest/progress')
			end
			if d[8] == "-1" then
					principalPanel:recursiveGetChildById('Slot'):hide()
					principalPanel:recursiveGetChildById('Slot'):raise()
			elseif d[8] == "1" then
					principalPanel:recursiveGetChildById('Slot'):show()
					principalPanel:recursiveGetChildById('Slot'):setColor('white')
				    principalPanel:recursiveGetChildById('Slot'):setIcon('/images/game/quest/aberto')
			elseif d[8] == "50" then
					principalPanel:recursiveGetChildById('Slot'):show()
					principalPanel:recursiveGetChildById('Slot'):setColor('green')
				    principalPanel:recursiveGetChildById('Slot'):setIcon('/images/game/quest/concluido')
			elseif d[9] == "1" then
					principalPanel:recursiveGetChildById('Slot'):show()
					principalPanel:recursiveGetChildById('Slot'):setColor('white')
				    principalPanel:recursiveGetChildById('Slot'):setIcon('/images/game/quest/progress')
			end
			if d[10] == "-1" then
					principalPanel:recursiveGetChildById('Aprimoramento'):hide()
					principalPanel:recursiveGetChildById('Aprimoramento'):raise()
			elseif d[10] == "1" then
					principalPanel:recursiveGetChildById('Aprimoramento'):show()
					principalPanel:recursiveGetChildById('Aprimoramento'):setColor('white')
				    principalPanel:recursiveGetChildById('Aprimoramento'):setIcon('/images/game/quest/aberto')
			elseif d[10] == "50" then
					principalPanel:recursiveGetChildById('Aprimoramento'):show()
					principalPanel:recursiveGetChildById('Aprimoramento'):setColor('green')
				    principalPanel:recursiveGetChildById('Aprimoramento'):setIcon('/images/game/quest/concluido')
			elseif d[11] == "1" then
					principalPanel:recursiveGetChildById('Aprimoramento'):show()
					principalPanel:recursiveGetChildById('Aprimoramento'):setColor('white')
				    principalPanel:recursiveGetChildById('Aprimoramento'):setIcon('/images/game/quest/progress')
			end
			if d[12] == "-1" then
					principalPanel:recursiveGetChildById('AcordoRisco'):hide()
					principalPanel:recursiveGetChildById('AcordoRisco'):raise()
			elseif d[12] == "1" then
					principalPanel:recursiveGetChildById('AcordoRisco'):show()
					principalPanel:recursiveGetChildById('AcordoRisco'):setColor('white')
				    principalPanel:recursiveGetChildById('AcordoRisco'):setIcon('/images/game/quest/aberto')
			elseif d[12] == "50" then
					principalPanel:recursiveGetChildById('AcordoRisco'):show()
					principalPanel:recursiveGetChildById('AcordoRisco'):setColor('green')
				    principalPanel:recursiveGetChildById('AcordoRisco'):setIcon('/images/game/quest/concluido')
			elseif d[13] == "1" then
					principalPanel:recursiveGetChildById('AcordoRisco'):show()
					principalPanel:recursiveGetChildById('AcordoRisco'):setColor('white')
				    principalPanel:recursiveGetChildById('AcordoRisco'):setIcon('/images/game/quest/progress')
			end
			if d[14] == "-1" then
					principalPanel:recursiveGetChildById('Sincronizacao'):hide()
					principalPanel:recursiveGetChildById('Sincronizacao'):raise()
			elseif d[14] == "1" then
					principalPanel:recursiveGetChildById('Sincronizacao'):show()
					principalPanel:recursiveGetChildById('Sincronizacao'):setColor('white')
				    principalPanel:recursiveGetChildById('Sincronizacao'):setIcon('/images/game/quest/aberto')
			elseif d[14] == "50" then
					principalPanel:recursiveGetChildById('Sincronizacao'):show()
					principalPanel:recursiveGetChildById('Sincronizacao'):setColor('green')
				    principalPanel:recursiveGetChildById('Sincronizacao'):setIcon('/images/game/quest/concluido')
			end
			if d[15] == "-1" then
					principalPanel:recursiveGetChildById('DepositoPeles'):hide()
					principalPanel:recursiveGetChildById('DepositoPeles'):raise()
			elseif d[15] == "1" then
					principalPanel:recursiveGetChildById('DepositoPeles'):show()
					principalPanel:recursiveGetChildById('DepositoPeles'):setColor('white')
				    principalPanel:recursiveGetChildById('DepositoPeles'):setIcon('/images/game/quest/aberto')
			elseif d[15] == "50" then
					principalPanel:recursiveGetChildById('DepositoPeles'):show()
					principalPanel:recursiveGetChildById('DepositoPeles'):setColor('green')
				    principalPanel:recursiveGetChildById('DepositoPeles'):setIcon('/images/game/quest/concluido')
			elseif d[16] == "1" then
					principalPanel:recursiveGetChildById('DepositoPeles'):show()
					principalPanel:recursiveGetChildById('DepositoPeles'):setColor('white')
				    principalPanel:recursiveGetChildById('DepositoPeles'):setIcon('/images/game/quest/progress')
			end
			if d[17] == "-1" then
					principalPanel:recursiveGetChildById('ArteCraft'):hide()
					principalPanel:recursiveGetChildById('ArteCraft'):raise()
			elseif d[17] == "1" then
					principalPanel:recursiveGetChildById('ArteCraft'):show()
					principalPanel:recursiveGetChildById('ArteCraft'):setColor('white')
				    principalPanel:recursiveGetChildById('ArteCraft'):setIcon('/images/game/quest/aberto')
			elseif d[17] == "50" then
					principalPanel:recursiveGetChildById('ArteCraft'):show()
					principalPanel:recursiveGetChildById('ArteCraft'):setColor('green')
				    principalPanel:recursiveGetChildById('ArteCraft'):setIcon('/images/game/quest/concluido')
			elseif d[18] == "1" then
					principalPanel:recursiveGetChildById('ArteCraft'):show()
					principalPanel:recursiveGetChildById('ArteCraft'):setColor('white')
				    principalPanel:recursiveGetChildById('ArteCraft'):setIcon('/images/game/quest/progress')
			end
			if d[19] == "-1" then
					principalPanel:recursiveGetChildById('Lagrimas'):hide()
					principalPanel:recursiveGetChildById('Lagrimas'):raise()
			elseif d[19] == "1" then
					principalPanel:recursiveGetChildById('Lagrimas'):show()
					principalPanel:recursiveGetChildById('Lagrimas'):setColor('white')
				    principalPanel:recursiveGetChildById('Lagrimas'):setIcon('/images/game/quest/aberto')
			elseif d[19] == "50" then
					principalPanel:recursiveGetChildById('Lagrimas'):show()
					principalPanel:recursiveGetChildById('Lagrimas'):setColor('green')
				    principalPanel:recursiveGetChildById('Lagrimas'):setIcon('/images/game/quest/concluido')
			elseif d[20] == "1" then
					principalPanel:recursiveGetChildById('Lagrimas'):show()
					principalPanel:recursiveGetChildById('Lagrimas'):setColor('white')
				    principalPanel:recursiveGetChildById('Lagrimas'):setIcon('/images/game/quest/progress')
			end		
		end
		if string.find(text, "TresQuest") then
			local c = string.explode(text, " ")
			if c[2] == "-1" then
					principalPanel:recursiveGetChildById('ReceitaCraft'):hide()
					principalPanel:recursiveGetChildById('ReceitaCraft'):raise()
			elseif c[2] == "1" then
					principalPanel:recursiveGetChildById('ReceitaCraft'):show()
					principalPanel:recursiveGetChildById('ReceitaCraft'):setColor('white')
				    principalPanel:recursiveGetChildById('ReceitaCraft'):setIcon('/images/game/quest/aberto')
			elseif c[2] == "50" then
					principalPanel:recursiveGetChildById('ReceitaCraft'):show()
					principalPanel:recursiveGetChildById('ReceitaCraft'):setColor('green')
				    principalPanel:recursiveGetChildById('ReceitaCraft'):setIcon('/images/game/quest/concluido')
			elseif c[3] == "1" then
					principalPanel:recursiveGetChildById('ReceitaCraft'):show()
					principalPanel:recursiveGetChildById('ReceitaCraft'):setColor('white')
				    principalPanel:recursiveGetChildById('ReceitaCraft'):setIcon('/images/game/quest/progress')
			end
			if c[4] == "-1" then
					principalPanel:recursiveGetChildById('Minerador'):hide()
					principalPanel:recursiveGetChildById('Minerador'):raise()
			elseif c[4] == "1" then
					principalPanel:recursiveGetChildById('Minerador'):show()
					principalPanel:recursiveGetChildById('Minerador'):setColor('white')
				    principalPanel:recursiveGetChildById('Minerador'):setIcon('/images/game/quest/aberto')
			elseif c[4] == "50" then
					principalPanel:recursiveGetChildById('Minerador'):show()
					principalPanel:recursiveGetChildById('Minerador'):setColor('green')
				    principalPanel:recursiveGetChildById('Minerador'):setIcon('/images/game/quest/concluido')
			elseif c[5] == "1" then
					principalPanel:recursiveGetChildById('Minerador'):show()
					principalPanel:recursiveGetChildById('Minerador'):setColor('white')
				    principalPanel:recursiveGetChildById('Minerador'):setIcon('/images/game/quest/progress')
			end
			if c[6] == "-1" then
					principalPanel:recursiveGetChildById('EntregaEspecial'):hide()
					principalPanel:recursiveGetChildById('EntregaEspecial'):raise()
			elseif c[6] == "1" then
					principalPanel:recursiveGetChildById('EntregaEspecial'):show()
					principalPanel:recursiveGetChildById('EntregaEspecial'):setColor('white')
				    principalPanel:recursiveGetChildById('EntregaEspecial'):setIcon('/images/game/quest/aberto')
			elseif c[6] == "50" then
					principalPanel:recursiveGetChildById('EntregaEspecial'):show()
					principalPanel:recursiveGetChildById('EntregaEspecial'):setColor('green')
				    principalPanel:recursiveGetChildById('EntregaEspecial'):setIcon('/images/game/quest/concluido')
			elseif c[7] == "1" then
					principalPanel:recursiveGetChildById('EntregaEspecial'):show()
					principalPanel:recursiveGetChildById('EntregaEspecial'):setColor('white')
				    principalPanel:recursiveGetChildById('EntregaEspecial'):setIcon('/images/game/quest/progress')
			end
			if c[8] == "-1" then
					principalPanel:recursiveGetChildById('LadraoTumulo'):hide()
					principalPanel:recursiveGetChildById('LadraoTumulo'):raise()
			elseif c[8] == "1" then
					principalPanel:recursiveGetChildById('LadraoTumulo'):show()
					principalPanel:recursiveGetChildById('LadraoTumulo'):setColor('white')
				    principalPanel:recursiveGetChildById('LadraoTumulo'):setIcon('/images/game/quest/aberto')
			elseif c[8] == "50" then
					principalPanel:recursiveGetChildById('LadraoTumulo'):show()
					principalPanel:recursiveGetChildById('LadraoTumulo'):setColor('green')
				    principalPanel:recursiveGetChildById('LadraoTumulo'):setIcon('/images/game/quest/concluido')
			elseif c[9] == "1" then
					principalPanel:recursiveGetChildById('LadraoTumulo'):show()
					principalPanel:recursiveGetChildById('LadraoTumulo'):setColor('white')
				    principalPanel:recursiveGetChildById('LadraoTumulo'):setIcon('/images/game/quest/progress')
			end
			if c[10] == "-1" then
					principalPanel:recursiveGetChildById('AguaSuja'):hide()
					principalPanel:recursiveGetChildById('AguaSuja'):raise()
			elseif c[10] == "1" then
					principalPanel:recursiveGetChildById('AguaSuja'):show()
					principalPanel:recursiveGetChildById('AguaSuja'):setColor('white')
				    principalPanel:recursiveGetChildById('AguaSuja'):setIcon('/images/game/quest/aberto')
			elseif c[10] == "50" then
					principalPanel:recursiveGetChildById('AguaSuja'):show()
					principalPanel:recursiveGetChildById('AguaSuja'):setColor('green')
				    principalPanel:recursiveGetChildById('AguaSuja'):setIcon('/images/game/quest/concluido')
			elseif c[11] == "1" then
					principalPanel:recursiveGetChildById('AguaSuja'):show()
					principalPanel:recursiveGetChildById('AguaSuja'):setColor('white')
				    principalPanel:recursiveGetChildById('AguaSuja'):setIcon('/images/game/quest/progress')
			end
			if c[12] == "-1" then
					principalPanel:recursiveGetChildById('Superticao'):hide()
					principalPanel:recursiveGetChildById('Superticao'):raise()
			elseif c[12] == "1" then
					principalPanel:recursiveGetChildById('Superticao'):show()
					principalPanel:recursiveGetChildById('Superticao'):setColor('white')
				    principalPanel:recursiveGetChildById('Superticao'):setIcon('/images/game/quest/aberto')
			elseif c[12] == "50" then
					principalPanel:recursiveGetChildById('Superticao'):show()
					principalPanel:recursiveGetChildById('Superticao'):setColor('green')
				    principalPanel:recursiveGetChildById('Superticao'):setIcon('/images/game/quest/concluido')
			elseif c[13] == "1" then
					principalPanel:recursiveGetChildById('Superticao'):show()
					principalPanel:recursiveGetChildById('Superticao'):setColor('white')
				    principalPanel:recursiveGetChildById('Superticao'):setIcon('/images/game/quest/progress')
			end
			if c[14] == "-1" then
					principalPanel:recursiveGetChildById('EstradaLadroes'):hide()
					principalPanel:recursiveGetChildById('EstradaLadroes'):raise()
			elseif c[14] == "1" then
					principalPanel:recursiveGetChildById('EstradaLadroes'):show()
					principalPanel:recursiveGetChildById('EstradaLadroes'):setColor('white')
				    principalPanel:recursiveGetChildById('EstradaLadroes'):setIcon('/images/game/quest/aberto')
			elseif c[14] == "50" then
					principalPanel:recursiveGetChildById('EstradaLadroes'):show()
					principalPanel:recursiveGetChildById('EstradaLadroes'):setColor('green')
				    principalPanel:recursiveGetChildById('EstradaLadroes'):setIcon('/images/game/quest/concluido')
			elseif c[15] == "1" then
					principalPanel:recursiveGetChildById('EstradaLadroes'):show()
					principalPanel:recursiveGetChildById('EstradaLadroes'):setColor('white')
				    principalPanel:recursiveGetChildById('EstradaLadroes'):setIcon('/images/game/quest/progress')
			end
			if c[16] == "-1" then
					principalPanel:recursiveGetChildById('AreiasFerro'):hide()
					principalPanel:recursiveGetChildById('AreiasFerro'):raise()
			elseif c[16] == "1" then
					principalPanel:recursiveGetChildById('AreiasFerro'):show()
					principalPanel:recursiveGetChildById('AreiasFerro'):setColor('white')
				    principalPanel:recursiveGetChildById('AreiasFerro'):setIcon('/images/game/quest/aberto')
			elseif c[16] == "50" then
					principalPanel:recursiveGetChildById('AreiasFerro'):show()
					principalPanel:recursiveGetChildById('AreiasFerro'):setColor('green')
				    principalPanel:recursiveGetChildById('AreiasFerro'):setIcon('/images/game/quest/concluido')
			elseif c[17] == "1" then
					principalPanel:recursiveGetChildById('AreiasFerro'):show()
					principalPanel:recursiveGetChildById('AreiasFerro'):setColor('white')
				    principalPanel:recursiveGetChildById('AreiasFerro'):setIcon('/images/game/quest/progress')
			end
			if c[18] == "-1" then
					principalPanel:recursiveGetChildById('Desequilibrio'):hide()
					principalPanel:recursiveGetChildById('Desequilibrio'):raise()
			elseif c[18] == "1" then
					principalPanel:recursiveGetChildById('Desequilibrio'):show()
					principalPanel:recursiveGetChildById('Desequilibrio'):setColor('white')
				    principalPanel:recursiveGetChildById('Desequilibrio'):setIcon('/images/game/quest/aberto')
			elseif c[18] == "50" then
					principalPanel:recursiveGetChildById('Desequilibrio'):show()
					principalPanel:recursiveGetChildById('Desequilibrio'):setColor('green')
				    principalPanel:recursiveGetChildById('Desequilibrio'):setIcon('/images/game/quest/concluido')
			elseif c[19] == "1" then
					principalPanel:recursiveGetChildById('Desequilibrio'):show()
					principalPanel:recursiveGetChildById('Desequilibrio'):setColor('white')
				    principalPanel:recursiveGetChildById('Desequilibrio'):setIcon('/images/game/quest/progress')
			end
			if c[20] == "-1" then
					principalPanel:recursiveGetChildById('EscoltaImperial'):hide()
					principalPanel:recursiveGetChildById('EscoltaImperial'):raise()
			elseif c[20] == "1" then
					principalPanel:recursiveGetChildById('EscoltaImperial'):show()
					principalPanel:recursiveGetChildById('EscoltaImperial'):setColor('white')
				    principalPanel:recursiveGetChildById('EscoltaImperial'):setIcon('/images/game/quest/aberto')
			elseif c[20] == "50" then
					principalPanel:recursiveGetChildById('EscoltaImperial'):show()
					principalPanel:recursiveGetChildById('EscoltaImperial'):setColor('green')
				    principalPanel:recursiveGetChildById('EscoltaImperial'):setIcon('/images/game/quest/concluido')
			elseif c[21] == "1" then
					principalPanel:recursiveGetChildById('EscoltaImperial'):show()
					principalPanel:recursiveGetChildById('EscoltaImperial'):setColor('white')
				    principalPanel:recursiveGetChildById('EscoltaImperial'):setIcon('/images/game/quest/progress')
			end	
		end
		if string.find(text, "QuatroQuest") then
			local q = string.explode(text, " ")
			if q[2] == "-1" then
					principalPanel:recursiveGetChildById('FelizAniversario'):hide()
					principalPanel:recursiveGetChildById('FelizAniversario'):raise()
			elseif q[2] == "1" then
					principalPanel:recursiveGetChildById('FelizAniversario'):show()
					principalPanel:recursiveGetChildById('FelizAniversario'):setColor('white')
				    principalPanel:recursiveGetChildById('FelizAniversario'):setIcon('/images/game/quest/aberto')
			elseif q[2] == "50" then
					principalPanel:recursiveGetChildById('FelizAniversario'):show()
					principalPanel:recursiveGetChildById('FelizAniversario'):setColor('green')
				    principalPanel:recursiveGetChildById('FelizAniversario'):setIcon('/images/game/quest/concluido')
			elseif q[3] == "1" then
					principalPanel:recursiveGetChildById('FelizAniversario'):show()
					principalPanel:recursiveGetChildById('FelizAniversario'):setColor('white')
				    principalPanel:recursiveGetChildById('FelizAniversario'):setIcon('/images/game/quest/progress')
			end
			if q[4] == "-1" then
					principalPanel:recursiveGetChildById('MinaExplosiva'):hide()
					principalPanel:recursiveGetChildById('MinaExplosiva'):raise()
			elseif q[4] == "1" then
					principalPanel:recursiveGetChildById('MinaExplosiva'):show()
					principalPanel:recursiveGetChildById('MinaExplosiva'):setColor('white')
				    principalPanel:recursiveGetChildById('MinaExplosiva'):setIcon('/images/game/quest/aberto')
			elseif q[4] == "50" then
					principalPanel:recursiveGetChildById('MinaExplosiva'):show()
					principalPanel:recursiveGetChildById('MinaExplosiva'):setColor('green')
				    principalPanel:recursiveGetChildById('MinaExplosiva'):setIcon('/images/game/quest/concluido')
			elseif q[5] == "1" then
					principalPanel:recursiveGetChildById('MinaExplosiva'):show()
					principalPanel:recursiveGetChildById('MinaExplosiva'):setColor('white')
				    principalPanel:recursiveGetChildById('MinaExplosiva'):setIcon('/images/game/quest/progress')
			end
			if q[6] == "-1" then
					principalPanel:recursiveGetChildById('Falsificadores'):hide()
					principalPanel:recursiveGetChildById('Falsificadores'):raise()
			elseif q[6] == "1" then
					principalPanel:recursiveGetChildById('Falsificadores'):show()
					principalPanel:recursiveGetChildById('Falsificadores'):setColor('white')
				    principalPanel:recursiveGetChildById('Falsificadores'):setIcon('/images/game/quest/aberto')
			elseif q[6] == "50" then
					principalPanel:recursiveGetChildById('Falsificadores'):show()
					principalPanel:recursiveGetChildById('Falsificadores'):setColor('green')
				    principalPanel:recursiveGetChildById('Falsificadores'):setIcon('/images/game/quest/concluido')
			elseif q[7] == "1" then
					principalPanel:recursiveGetChildById('Falsificadores'):show()
					principalPanel:recursiveGetChildById('Falsificadores'):setColor('white')
				    principalPanel:recursiveGetChildById('Falsificadores'):setIcon('/images/game/quest/progress')
			end
			if q[8] == "-1" then
					principalPanel:recursiveGetChildById('CacaFantasma'):hide()
					principalPanel:recursiveGetChildById('CacaFantasma'):raise()
			elseif q[8] == "1" then
					principalPanel:recursiveGetChildById('CacaFantasma'):show()
					principalPanel:recursiveGetChildById('CacaFantasma'):setColor('white')
				    principalPanel:recursiveGetChildById('CacaFantasma'):setIcon('/images/game/quest/aberto')
			elseif q[8] == "50" then
					principalPanel:recursiveGetChildById('CacaFantasma'):show()
					principalPanel:recursiveGetChildById('CacaFantasma'):setColor('green')
				    principalPanel:recursiveGetChildById('CacaFantasma'):setIcon('/images/game/quest/concluido')
			elseif q[9] == "1" then
					principalPanel:recursiveGetChildById('CacaFantasma'):show()
					principalPanel:recursiveGetChildById('CacaFantasma'):setColor('white')
				    principalPanel:recursiveGetChildById('CacaFantasma'):setIcon('/images/game/quest/progress')
			end
			if q[10] == "-1" then
					principalPanel:recursiveGetChildById('Dangerous'):hide()
					principalPanel:recursiveGetChildById('Dangerous'):raise()
			elseif q[10] == "1" then
					principalPanel:recursiveGetChildById('Dangerous'):show()
					principalPanel:recursiveGetChildById('Dangerous'):setColor('white')
				    principalPanel:recursiveGetChildById('Dangerous'):setIcon('/images/game/quest/aberto')
			elseif q[10] == "50" then
					principalPanel:recursiveGetChildById('Dangerous'):show()
					principalPanel:recursiveGetChildById('Dangerous'):setColor('green')
				    principalPanel:recursiveGetChildById('Dangerous'):setIcon('/images/game/quest/concluido')
			elseif q[11] == "1" then
					principalPanel:recursiveGetChildById('Dangerous'):show()
					principalPanel:recursiveGetChildById('Dangerous'):setColor('white')
				    principalPanel:recursiveGetChildById('Dangerous'):setIcon('/images/game/quest/progress')
			end
			if q[12] == "-1" then
					principalPanel:recursiveGetChildById('QuestVocacional'):hide()
					principalPanel:recursiveGetChildById('QuestVocacional'):raise()
			elseif q[12] == "1" then
					principalPanel:recursiveGetChildById('QuestVocacional'):show()
					principalPanel:recursiveGetChildById('QuestVocacional'):setColor('white')
				    principalPanel:recursiveGetChildById('QuestVocacional'):setIcon('/images/game/quest/aberto')
			elseif q[12] == "50" then
					principalPanel:recursiveGetChildById('QuestVocacional'):show()
					principalPanel:recursiveGetChildById('QuestVocacional'):setColor('green')
				    principalPanel:recursiveGetChildById('QuestVocacional'):setIcon('/images/game/quest/concluido')
			elseif q[13] == "1" then
					principalPanel:recursiveGetChildById('QuestVocacional'):show()
					principalPanel:recursiveGetChildById('QuestVocacional'):setColor('white')
				    principalPanel:recursiveGetChildById('QuestVocacional'):setIcon('/images/game/quest/progress')
			end
			if q[14] == "-1" then
					principalPanel:recursiveGetChildById('DesertQuest'):hide()
					principalPanel:recursiveGetChildById('DesertQuest'):raise()
			elseif q[14] == "1" then
					principalPanel:recursiveGetChildById('DesertQuest'):show()
					principalPanel:recursiveGetChildById('DesertQuest'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('DesertQuest'):setIcon('/images/game/quest/aberto')
			elseif q[14] == "50" then
					principalPanel:recursiveGetChildById('DesertQuest'):show()
					principalPanel:recursiveGetChildById('DesertQuest'):setColor('green')
				    principalPanel:recursiveGetChildById('DesertQuest'):setIcon('/images/game/quest/concluido')
			end
			if q[15] == "-1" then
					principalPanel:recursiveGetChildById('Habilidades'):hide()
					principalPanel:recursiveGetChildById('Habilidades'):raise()
			elseif q[15] == "1" then
					principalPanel:recursiveGetChildById('Habilidades'):show()
					principalPanel:recursiveGetChildById('Habilidades'):setColor('white')
				    principalPanel:recursiveGetChildById('Habilidades'):setIcon('/images/game/quest/aberto')
			elseif q[15] == "50" then
					principalPanel:recursiveGetChildById('Habilidades'):show()
					principalPanel:recursiveGetChildById('Habilidades'):setColor('green')
				    principalPanel:recursiveGetChildById('Habilidades'):setIcon('/images/game/quest/concluido')
			end
			if q[16] == "-1" then
					principalPanel:recursiveGetChildById('Greenhorn'):hide()
					principalPanel:recursiveGetChildById('Greenhorn'):raise()
			elseif q[16] == "1" then
					principalPanel:recursiveGetChildById('Greenhorn'):show()
					principalPanel:recursiveGetChildById('Greenhorn'):setColor('white')
				    principalPanel:recursiveGetChildById('Greenhorn'):setIcon('/images/game/quest/aberto')
			elseif q[16] == "50" then
					principalPanel:recursiveGetChildById('Greenhorn'):show()
					principalPanel:recursiveGetChildById('Greenhorn'):setColor('green')
				    principalPanel:recursiveGetChildById('Greenhorn'):setIcon('/images/game/quest/concluido')
			end
			if q[17] == "-1" then
					principalPanel:recursiveGetChildById('ParadoxTower'):hide()
					principalPanel:recursiveGetChildById('ParadoxTower'):raise()
			elseif q[17] == "1" then
					principalPanel:recursiveGetChildById('ParadoxTower'):show()
					principalPanel:recursiveGetChildById('ParadoxTower'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('ParadoxTower'):setIcon('/images/game/quest/aberto')
			elseif q[17] == "50" then
					principalPanel:recursiveGetChildById('ParadoxTower'):show()
					principalPanel:recursiveGetChildById('ParadoxTower'):setColor('green')
				    principalPanel:recursiveGetChildById('ParadoxTower'):setIcon('/images/game/quest/concluido')
			end
			if q[18] == "-1" then
					principalPanel:recursiveGetChildById('Carteiro'):hide()
					principalPanel:recursiveGetChildById('Carteiro'):raise()
			elseif q[18] == "1" then
					principalPanel:recursiveGetChildById('Carteiro'):show()
					principalPanel:recursiveGetChildById('Carteiro'):setColor('white')
				    principalPanel:recursiveGetChildById('Carteiro'):setIcon('/images/game/quest/aberto')
			elseif q[18] == "50" then
					principalPanel:recursiveGetChildById('Carteiro'):show()
					principalPanel:recursiveGetChildById('Carteiro'):setColor('green')
				    principalPanel:recursiveGetChildById('Carteiro'):setIcon('/images/game/quest/concluido')
			elseif q[19] == "1" then
					principalPanel:recursiveGetChildById('Carteiro'):show()
					principalPanel:recursiveGetChildById('Carteiro'):setColor('white')
				    principalPanel:recursiveGetChildById('Carteiro'):setIcon('/images/game/quest/progress')
			end
			if q[20] == "-1" then
					principalPanel:recursiveGetChildById('Scrapper'):hide()
					principalPanel:recursiveGetChildById('Scrapper'):raise()
			elseif q[20] == "1" then
					principalPanel:recursiveGetChildById('Scrapper'):show()
					principalPanel:recursiveGetChildById('Scrapper'):setColor('white')
				    principalPanel:recursiveGetChildById('Scrapper'):setIcon('/images/game/quest/aberto')
			elseif q[20] == "50" then
					principalPanel:recursiveGetChildById('Scrapper'):show()
					principalPanel:recursiveGetChildById('Scrapper'):setColor('green')
				    principalPanel:recursiveGetChildById('Scrapper'):setIcon('/images/game/quest/concluido')
			end
		end
		if string.find(text, "CincoQuest") then
			local s = string.explode(text, " ")
			if s[2] == "-1" then
					principalPanel:recursiveGetChildById('BansheeQuest'):hide()
					principalPanel:recursiveGetChildById('BansheeQuest'):raise()
			elseif s[2] == "1" then
					principalPanel:recursiveGetChildById('BansheeQuest'):show()
					principalPanel:recursiveGetChildById('BansheeQuest'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('BansheeQuest'):setIcon('/images/game/quest/aberto')
			elseif s[2] == "50" then
					principalPanel:recursiveGetChildById('BansheeQuest'):show()
					principalPanel:recursiveGetChildById('BansheeQuest'):setColor('green')
				    principalPanel:recursiveGetChildById('BansheeQuest'):setIcon('/images/game/quest/concluido')
			end
			if s[3] == "-1" then
					principalPanel:recursiveGetChildById('RuinasSombrias'):hide()
					principalPanel:recursiveGetChildById('RuinasSombrias'):raise()
			elseif s[3] == "1" then
					principalPanel:recursiveGetChildById('RuinasSombrias'):show()
					principalPanel:recursiveGetChildById('RuinasSombrias'):setColor('white')
				    principalPanel:recursiveGetChildById('RuinasSombrias'):setIcon('/images/game/quest/aberto')
			elseif s[3] == "50" then
					principalPanel:recursiveGetChildById('RuinasSombrias'):show()
					principalPanel:recursiveGetChildById('RuinasSombrias'):setColor('green')
				    principalPanel:recursiveGetChildById('RuinasSombrias'):setIcon('/images/game/quest/concluido')
			end
			if s[4] == "-1" then
					principalPanel:recursiveGetChildById('Warlord'):hide()
					principalPanel:recursiveGetChildById('Warlord'):raise()
			elseif s[4] == "1" then
					principalPanel:recursiveGetChildById('Warlord'):show()
					principalPanel:recursiveGetChildById('Warlord'):setColor('white')
				    principalPanel:recursiveGetChildById('Warlord'):setIcon('/images/game/quest/aberto')
			elseif s[4] == "50" then
					principalPanel:recursiveGetChildById('Warlord'):show()
					principalPanel:recursiveGetChildById('Warlord'):setColor('green')
				    principalPanel:recursiveGetChildById('Warlord'):setIcon('/images/game/quest/concluido')
			end
			if s[5] == "-1" then
					principalPanel:recursiveGetChildById('PitsInferno'):hide()
					principalPanel:recursiveGetChildById('PitsInferno'):raise()
			elseif s[5] == "1" then
					principalPanel:recursiveGetChildById('PitsInferno'):show()
					principalPanel:recursiveGetChildById('PitsInferno'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('PitsInferno'):setIcon('/images/game/quest/aberto')
			elseif s[5] == "50" then
					principalPanel:recursiveGetChildById('PitsInferno'):show()
					principalPanel:recursiveGetChildById('PitsInferno'):setColor('green')
				    principalPanel:recursiveGetChildById('PitsInferno'):setIcon('/images/game/quest/concluido')
			end
			if s[6] == "-1" then
					principalPanel:recursiveGetChildById('Darkness'):hide()
					principalPanel:recursiveGetChildById('Darkness'):raise()
			elseif s[6] == "1" then
					principalPanel:recursiveGetChildById('Darkness'):show()
					principalPanel:recursiveGetChildById('Darkness'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('Darkness'):setIcon('/images/game/quest/aberto')
			elseif s[6] == "50" then
					principalPanel:recursiveGetChildById('Darkness'):show()
					principalPanel:recursiveGetChildById('Darkness'):setColor('green')
				    principalPanel:recursiveGetChildById('Darkness'):setIcon('/images/game/quest/concluido')
			end
			if s[7] == "-1" then
					principalPanel:recursiveGetChildById('Annihilator'):hide()
					principalPanel:recursiveGetChildById('Annihilator'):raise()
			elseif s[7] == "1" then
					principalPanel:recursiveGetChildById('Annihilator'):show()
					principalPanel:recursiveGetChildById('Annihilator'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('Annihilator'):setIcon('/images/game/quest/aberto')
			elseif s[7] == "50" then
					principalPanel:recursiveGetChildById('Annihilator'):show()
					principalPanel:recursiveGetChildById('Annihilator'):setColor('green')
				    principalPanel:recursiveGetChildById('Annihilator'):setIcon('/images/game/quest/concluido')
			end
			if s[8] == "-1" then
					principalPanel:recursiveGetChildById('TemploObscuro'):hide()
					principalPanel:recursiveGetChildById('TemploObscuro'):raise()
			elseif s[8] == "1" then
					principalPanel:recursiveGetChildById('TemploObscuro'):show()
					principalPanel:recursiveGetChildById('TemploObscuro'):setColor('white')
				    principalPanel:recursiveGetChildById('TemploObscuro'):setIcon('/images/game/quest/aberto')
			elseif s[8] == "50" then
					principalPanel:recursiveGetChildById('TemploObscuro'):show()
					principalPanel:recursiveGetChildById('TemploObscuro'):setColor('green')
				    principalPanel:recursiveGetChildById('TemploObscuro'):setIcon('/images/game/quest/concluido')
			end
			if s[9] == "-1" then
					principalPanel:recursiveGetChildById('DemonQuest'):hide()
					principalPanel:recursiveGetChildById('DemonQuest'):raise()
			elseif s[9] == "1" then
					principalPanel:recursiveGetChildById('DemonQuest'):show()
					principalPanel:recursiveGetChildById('DemonQuest'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('DemonQuest'):setIcon('/images/game/quest/aberto')
			elseif s[9] == "50" then
					principalPanel:recursiveGetChildById('DemonQuest'):show()
					principalPanel:recursiveGetChildById('DemonQuest'):setColor('green')
				    principalPanel:recursiveGetChildById('DemonQuest'):setIcon('/images/game/quest/concluido')
			end
			if s[10] == "-1" then
					principalPanel:recursiveGetChildById('Inquisition'):hide()
					principalPanel:recursiveGetChildById('Inquisition'):raise()
			elseif s[10] == "1" then
					principalPanel:recursiveGetChildById('Inquisition'):show()
					principalPanel:recursiveGetChildById('Inquisition'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('Inquisition'):setIcon('/images/game/quest/aberto')
			elseif s[10] == "50" then
					principalPanel:recursiveGetChildById('Inquisition'):show()
					principalPanel:recursiveGetChildById('Inquisition'):setColor('green')
				    principalPanel:recursiveGetChildById('Inquisition'):setIcon('/images/game/quest/concluido')
			end
			if s[11] == "-1" then
					principalPanel:recursiveGetChildById('Nation'):hide()
					principalPanel:recursiveGetChildById('Nation'):raise()
			elseif s[11] == "1" then
					principalPanel:recursiveGetChildById('Nation'):show()
					principalPanel:recursiveGetChildById('Nation'):setColor('#f4b042')
				    principalPanel:recursiveGetChildById('Nation'):setIcon('/images/game/quest/aberto')
			elseif s[11] == "50" then
					principalPanel:recursiveGetChildById('Nation'):show()
					principalPanel:recursiveGetChildById('Nation'):setColor('green')
				    principalPanel:recursiveGetChildById('Nation'):setIcon('/images/game/quest/concluido')
			end
		end
		if string.find(text, "CheckPromessa") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Promessa/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearPromessa") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Promessa/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckRaridade") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Raridade/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearRaridade") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Raridade/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckCurandeiro") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Curandeiro/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearCurandeiro") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Curandeiro/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckSlot") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Slot/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearSlot") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Slot/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAprimoramento") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Aprimoramento/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAprimoramento") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Aprimoramento/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAcordoRisco") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/AcordoRisco/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAcordoRisco") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/AcordoRisco/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckSincronizacao") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Sincronizacao/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearSincronizacao") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Sincronizacao/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDepositoPeles") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DepositoPeles/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDepositoPeles") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DepositoPeles/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckArteCraft") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/ArteCraft/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearArteCraft") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/ArteCraft/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckLagrimasQuest") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Lagrimas/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearLagrimasQuest") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Lagrimas/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckReceitaCraft") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/ReceitaCraft/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearReceitaCraft") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/ReceitaCraft/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckMinerador") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Minerador/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearMinerador") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Minerador/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckEntregaEspecial") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/EntregaEspecial/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearEntregaEspecial") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/EntregaEspecial/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckLadraoTumulo") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/LadraoTumulo/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearLadraoTumulo") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/LadraoTumulo/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAguaSuja") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/AguaSuja/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAguaSuja") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/AguaSuja/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckSuperticao") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Superticao/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearSuperticao") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Superticao/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckEstradaLadroes") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/EstradaLadroes/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearEstradaLadroes") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/EstradaLadroes/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAreiasFerro") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/AreiasFerro/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAreiasFerro") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/AreiasFerro/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDesequilibrio") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Desequilibrio/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDesequilibrio") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Desequilibrio/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckEscoltaImperial") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/EscoltaImperial/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearEscoltaImperial") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/EscoltaImperial/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckFelizAniversario") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/FelizAniversario/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearFelizAniversario") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/FelizAniversario/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckMinaExplosiva") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/MinaExplosiva/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearMinaExplosiva") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/MinaExplosiva/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckFalsificadores") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Falsificadores/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearFalsificadores") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Falsificadores/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckCacaFantasma") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/CacaFantasma/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearCacaFantasma") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/CacaFantasma/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDangerous") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Dangerous/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDangerous") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Dangerous/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckQuestVocacional") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/QuestVocacional/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearQuestVocacional") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/QuestVocacional/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckHabilidades") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Habilidades/'..t[2]..'')
				rasButton.onClick = function() rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Habilidades/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDesertQuest") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DesertQuest/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDesertQuest") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DesertQuest/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckGreenhorn") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Arena/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearGreenhorn") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Arena/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckParadoxTower") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/ParadoxTower/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearParadoxTower") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/ParadoxTower/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckScrapper") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Arena/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearScrapper") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Arena/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckCarteiro") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" or t[2] == "3" or t[2] == "4" or t[2] == "5" or t[2] == "6" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Carteiro/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearCarteiro") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Carteiro/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckBansheeQuest") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/BansheeQuest/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearBansheeQuest") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/BansheeQuest/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckRuinasSombrias") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/RuinasSombrias/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearRuinasSombrias") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/RuinasSombrias/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckWarlord") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Arena/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearWarlord") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Arena/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckPitsInferno") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/PitsInferno/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearPitsInferno") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/PitsInferno/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDarkness") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Darkness/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDarkness") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Darkness/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckAnnihilator") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Annihilator/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearAnnihilator") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Annihilator/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckTemploObscuro") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/TemploObscuro/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearTemploObscuro") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/TemploObscuro/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckDemonQuest") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DemonQuest/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearDemonQuest") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DemonQuest/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckInquisition") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/Inquisition/'..t[2]..'')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearInquisition") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/Inquisition/50')
				rasButton:disable()
			end
		end
		if string.find(text, "CheckNation") then
			local t = string.explode(text, " ")
			g_sounds.getChannel(1):play("/sounds/OpenWindows")
			if t[2] == "1" or t[2] == "2" then
				rasButton:enable()
				questInfo:setImageSource('/images/game/quest/DeveresImperiais/-1')
				rasButton.onClick = function() g_game.talk("!QuestLog RastrearNation") rasButton:disable() g_sounds.getChannel(1):play("/sounds/OpenWindows") end
			else
				questInfo:setImageSource('/images/game/quest/DeveresImperiais/50')
				rasButton:disable()
			end
		end
		
end

function DeveresImperiais()
	g_game.talk("!QuestLog DeveresImperiais")
end
function ServirObedecer()
	g_game.talk("!QuestLog ServirObedecer")
end
function OCacaTroll()
	g_game.talk("!QuestLog OCacaTroll")
end
function AlertaPragas()
	g_game.talk("!QuestLog AlertaPragas")
end
function Enfermidade()
	g_game.talk("!QuestLog Enfermidade")
end
function DomadorFeras()
	g_game.talk("!QuestLog DomadorFeras")
end
function Traidor()
	g_game.talk("!QuestLog Traidor")
end
function BencaoDivina()
	g_game.talk("!QuestLog BencaoDivina")
end
function HonrandoMortos()
	g_game.talk("!QuestLog HonrandoMortos")
end
function MissaoOficial()
	g_game.talk("!QuestLog MissaoOficial")
end
function ListaNegra()
	g_game.talk("!QuestLog ListaNegra")
end
function Promessa()
	g_game.talk("!QuestLog Promessa")
end
function Raridade()
	g_game.talk("!QuestLog Raridade")
end
function Curandeiro()
	g_game.talk("!QuestLog Curandeiro")
end
function Slot()
	g_game.talk("!QuestLog Slot")
end
function Aprimoramento()
	g_game.talk("!QuestLog Aprimoramento")
end
function AcordoRisco()
	g_game.talk("!QuestLog AcordoRisco")
end
function Sincronizacao()
	g_game.talk("!QuestLog Sincronizacao")
end
function DepositoPeles()
	g_game.talk("!QuestLog DepositoPeles")
end
function ArteCraft()
	g_game.talk("!QuestLog ArteCraft")
end
function Lagrimas()
	g_game.talk("!QuestLog LagrimasQuest")
end
function ReceitaCraft()
	g_game.talk("!QuestLog ReceitaCraft")
end
function Minerador()
	g_game.talk("!QuestLog Minerador")
end
function EntregaEspecial()
	g_game.talk("!QuestLog EntregaEspecial")
end
function LadraoTumulo()
	g_game.talk("!QuestLog LadraoTumulo")
end
function AguaSuja()
	g_game.talk("!QuestLog AguaSuja")
end
function Superticao()
	g_game.talk("!QuestLog Superticao")
end
function EstradaLadroes()
	g_game.talk("!QuestLog EstradaLadroes")
end
function AreiasFerro()
	g_game.talk("!QuestLog AreiasFerro")
end
function Desequilibrio()
	g_game.talk("!QuestLog Desequilibrio")
end
function EscoltaImperial()
	g_game.talk("!QuestLog EscoltaImperial")
end
function FelizAniversario()
	g_game.talk("!QuestLog FelizAniversario")
end
function MinaExplosiva()
	g_game.talk("!QuestLog MinaExplosiva")
end
function Falsificadores()
	g_game.talk("!QuestLog Falsificadores")
end
function CacaFantasma()
	g_game.talk("!QuestLog CacaFantasma")
end
function Dangerous()
	g_game.talk("!QuestLog Dangerous")
end
function QuestVocacional()
	g_game.talk("!QuestLog QuestVocacional")
end
function Habilidades()
	g_game.talk("!QuestLog Habilidades")
end
function DesertQuest()
	g_game.talk("!QuestLog DesertQuest")
end
function Greenhorn()
	g_game.talk("!QuestLog Greenhorn")
end
function ParadoxTower()
	g_game.talk("!QuestLog ParadoxTower")
end
function Scrapper()
	g_game.talk("!QuestLog Scrapper")
end
function Carteiro()
	g_game.talk("!QuestLog Carteiro")
end
function BansheeQuest()
	g_game.talk("!QuestLog BansheeQuest")
end
function RuinasSombrias()
	g_game.talk("!QuestLog RuinasSombrias")
end
function Warlord()
	g_game.talk("!QuestLog Warlord")
end
function PitsInferno()
	g_game.talk("!QuestLog PitsInferno")
end
function Darkness()
	g_game.talk("!QuestLog Darkness")
end
function Annihilator()
	g_game.talk("!QuestLog Annihilator")
end
function TemploObscuro()
	g_game.talk("!QuestLog TemploObscuro")
end
function DemonQuest()
	g_game.talk("!QuestLog DemonQuest")
end
function Inquisition()
	g_game.talk("!QuestLog Inquisition")
end
function Nation()
	g_game.talk("!QuestLog Nation")
end