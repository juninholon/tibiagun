function init()
	connect(g_game, 'onTextMessage', serverComunication)
	connect(g_game, { onGameEnd = hide } )
end

function terminate()
	disconnect(g_game, { onGameEnd = hide })
	disconnect(g_game, 'onTextMessage', serverComunication)
end

function serverComunication(mode, text)
	if not g_game.isOnline() then
		return
	end
	local gameMapPanel = modules.game_interface.getMapPanel()
	if mode == MessageModes.Failure then
	if text:find("##TutorialZero") then
			TutorUm = g_ui.displayUI('TutorUm')
			TutorUm:setParent(modules.game_interface.getRootPanel())
			TutorUm:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			TutorUm:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			TutorUm:setMarginTop(10)
			TutorUm:setMarginRight(10)
			TutorUm.onClick = function() TutorUm:hide() end
			addEvent(function() g_effects.fadeIn(TutorUm, 500) end)
			scheduleEvent(function() TutorUm:hide() end, 10000)	
		end
		if text:find("##TutorialUm") then
			TutorDois = g_ui.displayUI('TutorDois')
			TutorDois:setParent(modules.game_interface.getRootPanel())
			TutorDois:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			TutorDois:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			TutorDois:setMarginTop(10)
			TutorDois:setMarginRight(10)
			TutorDois.onClick = function() TutorDois:hide() end
			addEvent(function() g_effects.fadeIn(TutorDois, 500) end)
			scheduleEvent(function() TutorDois:hide() end, 10000)
		end
		if text:find("##TaskIconTutor") then
			TutorTres = g_ui.displayUI('TutorTres')
			TutorTres:setParent(modules.game_interface.getRootPanel())
			TutorTres:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			TutorTres:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			TutorTres:setMarginTop(10)
			TutorTres:setMarginRight(10)
			TutorTres.onClick = function() TutorTres:hide() end
			addEvent(function() g_effects.fadeIn(TutorTres, 500) end)
			scheduleEvent(function() TutorTres:hide() end, 10000)
		end
		if text:find("##AbilityTree") then
			TutorQuatro = g_ui.displayUI('TutorQuatro')
			TutorQuatro:setParent(modules.game_interface.getRootPanel())
			TutorQuatro:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			TutorQuatro:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			TutorQuatro:setMarginTop(10)
			TutorQuatro:setMarginRight(10)
			TutorQuatro.onClick = function() TutorQuatro:hide() end
			addEvent(function() g_effects.fadeIn(TutorQuatro, 500) end)
			scheduleEvent(function() TutorQuatro:hide() end, 10000)
		end
		if text:find("##TutorDois") then
			TutorCinco = g_ui.displayUI('TutorCinco')
			TutorCinco:setParent(modules.game_interface.getRootPanel())
			TutorCinco:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			TutorCinco:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			TutorCinco:setMarginTop(10)
			TutorCinco:setMarginRight(10)
			TutorCinco.onClick = function() TutorCinco:hide() end
			addEvent(function() g_effects.fadeIn(TutorCinco, 500) end)
			scheduleEvent(function() TutorCinco:hide() end, 10000)
		end
		if text:find("RewardWar") then
			local t = string.explode(text, " ")
		-- 	doPlayerSendCancel(cid,"RewardWar 6000 4 1 12")
			Reward = g_ui.displayUI('Reward')
			Recom01 = Reward:getChildById('slotrec01')
			Recom02 = Reward:getChildById('slotrec02')
			Recom03 = Reward:getChildById('slotrec03')
			Recom04 = Reward:getChildById('textRec')
			Recom01:setImageSource('img/g')
			Recom02:setImageSource('img/box')
			Recom03:setImageSource('img/craft')
			Recom01:setTooltip(tr('Você recebeu:\n'..t[2]..' gold coins.'))
			if t[3] == "0" then
				Recom02:disable()
				Recom02:setImageColor('#515151')
			elseif t[3] == "1" then
				Recom02:enable()
				Recom02:setImageSource('img/box')
				Recom02:setImageColor('white')
				Recom02:setTooltip(tr('Você recebeu:\npresent box (comum).'))
			elseif t[3] == "2" then
				Recom02:enable()
				Recom02:setImageSource('img/box')
				Recom02:setImageColor('white')
				Recom02:setTooltip(tr('Você recebeu:\npresent box (melhorada).'))
			elseif t[3] == "3" then
				Recom02:enable()
				Recom02:setImageSource('img/box')
				Recom02:setImageColor('white')
				Recom02:setTooltip(tr('Você recebeu:\npresent box (perfeita).'))
			elseif t[3] == "4" then
				Recom02:enable()
				Recom02:setImageSource('img/box')
				Recom02:setImageColor('white')
				Recom02:setTooltip(tr('Você recebeu:\npresent box (rara).'))
			elseif t[3] == "5" then
				Recom02:enable()
				Recom02:setImageSource('img/box')
				Recom02:setImageColor('white')
				Recom02:setTooltip(tr('Você recebeu:\npresent box (lendária).'))
			end
			if t[4] == "0" then
				Recom03:disable()
				Recom03:setImageColor('#515151')
			elseif t[4] == "1" then
				Recom03:enable()
				Recom03:setImageSource('img/craft')
				Recom03:setImageColor('white')
				Recom03:setTooltip(tr('Você recebeu:\nreceita de craft (comum).'))
			elseif t[4] == "2" then
				Recom03:enable()
				Recom03:setImageSource('img/craft')
				Recom03:setImageColor('white')
				Recom03:setTooltip(tr('Você recebeu:\nreceita de craft (premium).'))
			elseif t[4] == "3" then
				Recom03:enable()
				Recom03:setImageSource('img/craft')
				Recom03:setImageColor('white')
				Recom03:setTooltip(tr('Você recebeu:\nreceita de craft (deluxe).'))
			end
			if t[5] == "0" then
				Recom04:setText('Pontos de Honra:\n[ 0 ]')
				Recom04:setColor('red')
			else
				Recom04:setText('Pontos de Honra:\n[ '..t[5]..' ]')
				Recom04:setColor('green')
			end
		end
		if text:find("onPlacar") then
			DGTimer = g_ui.displayUI('DGTime')
			DGTimer:setParent(modules.game_interface.getRootPanel())
			DGTimer:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			DGTimer:setMarginTop(10)
		elseif text:find("onTime") then
			local t = string.explode(text, " ")
			PlacarKina = DGTimer:getChildById('textKinaPlacar')
			PlacarBrood = DGTimer:getChildById('textBroodPlacar')
			Timer = DGTimer:getChildById('textTime')
			PlacarKina:setText(''..t[2])
			PlacarBrood:setText(''..t[3])
			Timer:setText(t[4]..':'..t[5])
		elseif text:find("ClosedTime") then
			DGTimer:hide()
		end
		if text:find("@#ObjetivosLocal") then
		local t = string.explode(text, " ")
			Objetivos = g_ui.displayUI('Objetivos')
			Objetivos:setParent(modules.game_interface.getRootPanel())
			Objetivos:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			Objetivos:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			Objetivos:setMarginTop(10)
			Objetivos:setMarginRight(10)
			ContBau = Objetivos:getChildById('contBau')
			TextoBau = Objetivos:getChildById('textBau')
			ContMonster = Objetivos:getChildById('contMonster')
			TextoMonster = Objetivos:getChildById('textMonster')
			ContBoss = Objetivos:getChildById('contBoss')
			TextoBoss = Objetivos:getChildById('textBoss')
			ContPassage = Objetivos:getChildById('contPassage')
			TextoPassage = Objetivos:getChildById('textPassage')
			if t[2] == "-1" then ContBau:setText('0/'..t[3]) else ContBau:setText(t[2]..'/'..t[3]) end
			if t[4] == "-1" then ContMonster:setText('0/'..t[5]) else ContMonster:setText(t[4]..'/'..t[5]) end
			if t[6] == "-1" then ContBoss:setText('0/'..t[7]) else ContBoss:setText(t[6]..'/'..t[7]) end
			if t[8] == "-1" then ContPassage:setText('0/'..t[9]) else ContPassage:setText(t[8]..'/'..t[9]) end
			if t[2] == t[3] then ContBau:setColor('yellow') TextoBau:setColor('yellow') end
			if t[4] == t[5] then ContMonster:setColor('yellow') TextoMonster:setColor('yellow') end
			if t[6] == t[7] then ContBoss:setColor('yellow') TextoBoss:setColor('yellow') end
			if t[8] == t[9] then ContPassage:setColor('yellow') TextoPassage:setColor('yellow') end
			Objetivos.onClick = function() Objetivos:hide() end
			addEvent(function() g_effects.fadeIn(Objetivos, 500) end)
			scheduleEvent(function() Objetivos:hide() end, 10000)
		elseif text:find("##FecharObjetivosLocal") then
			Objetivos:hide()
		end
		if text:find("@MissionDesbloqueada") then
			Mission = g_ui.displayUI('Mission')
			Mission:setParent(modules.game_interface.getRootPanel())
			Mission:addAnchor(AnchorRight, 'gameRightPanel', AnchorLeft)
			Mission:addAnchor(AnchorTop, 'gameMapPanel', AnchorTop)
			Mission:setMarginTop(10)
			Mission:setMarginRight(10)
			Mission.onClick = function() Mission:hide() end
			addEvent(function() g_effects.fadeIn(Mission, 500) end)
			scheduleEvent(function() Mission:hide() end, 10000)
		end
		if text:find("$@$TutorHideName") then
			gameMapPanel:setDrawNames(false)
			gameMapPanel:setDrawHealthBars(false)
		elseif text:find("$@$TutorHideHealth") then
			gameMapPanel:setDrawNames(true)
			gameMapPanel:setDrawHealthBars(true)
        end
    end
end
