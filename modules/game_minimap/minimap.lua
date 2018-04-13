minimapWidget = nil
minimapButton = nil
minimapWindow = nil
otmm = true
preloaded = false
fullmapView = false
oldZoom = nil
oldPos = nil

function init()
  minimapButton = modules.client_topmenu.addRightGameToggleButton('minimapButton', 
    tr('Minimap') .. ' (Ctrl+M)', '/images/topbuttons/minimap', toggle)
  minimapButton:setOn(true)
  minimapButton:setIcon('/images/topbuttons/minimap')

  minimapWindow = g_ui.loadUI('minimap', modules.game_interface.getRightPanel())
  minimapWindow:setContentMinimumHeight(64)

  minimapWidget = minimapWindow:recursiveGetChildById('minimap')

  local gameRootPanel = modules.game_interface.getRootPanel()
  g_keyboard.bindKeyPress('Alt+Left', function() minimapWidget:move(1,0) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Right', function() minimapWidget:move(-1,0) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Up', function() minimapWidget:move(0,1) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Down', function() minimapWidget:move(0,-1) end, gameRootPanel)
  g_keyboard.bindKeyDown('Ctrl+M', toggle)
  g_keyboard.bindKeyDown('Ctrl+Tab', toggleFullMap)

  minimapWindow:setup()

  connect(g_game, {
    connect(g_game, 'onTextMessage', MapaDel),
    onGameStart = online,
    onGameEnd = offline,
  })

  connect(LocalPlayer, {
    onPositionChange = updateCameraPosition
  })

  if g_game.isOnline() then
    online()
--	setMonsterCave(5120, 5131, 6, "20", "Esqueleto | HP: 2000")
  end
end

function MapaDel(mode, text)
--			minimapWidget:addFlag({x = 447, y = 888, z = 7}, 24, "Fortaleza dos Orcs (Nv.20)")
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "DelTSUm") then
			minimapWidget:removeFlag({x = 450, y = 887, z = 7}, 24, "Torre Sentinela\n(Nv.10)")
		elseif string.find(text, "!DeletarDeveresImperiais") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Deveres Imperiais")
		elseif string.find(text, "!UmDelServirObedecer") then
			minimapWidget:removeFlag({x = 533, y = 932, z = 7}, 20, "Objetivo da missão: Servir e Obedecer")
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Servir e Obedecer")
		elseif string.find(text, "!DelOCacaTroll") then
			minimapWidget:removeFlag({x = 568, y = 910, z = 7}, 20, "Objetivo da missão: O Caça Troll")
			minimapWidget:removeFlag({x = 598, y = 905, z = 7}, 20, "Objetivo da missão: O Caça Troll")
			minimapWidget:removeFlag({x = 600, y = 940, z = 10}, 20, "Objetivo da missão: O Caça Troll")
		elseif string.find(text, "!DelAlertaPragas") then
			minimapWidget:removeFlag({x = 487, y = 889, z = 7}, 20, "Objetivo da missão: Alerta de Pragas")
			minimapWidget:removeFlag({x = 474, y = 895, z = 7}, 20, "Objetivo da missão: Alerta de Pragas")
			minimapWidget:removeFlag({x = 458, y = 942, z = 7}, 20, "Objetivo da missão: Alerta de Pragas")
		elseif string.find(text, "!DelEnfermidade") then
			minimapWidget:removeFlag({x = 487, y = 889, z = 7}, 20, "Objetivo da missão: Enfermidade")
			minimapWidget:removeFlag({x = 547, y = 872, z = 7}, 20, "Objetivo da missão: Enfermidade")
		elseif string.find(text, "!DelDomadorFeras") then
			minimapWidget:removeFlag({x = 551, y = 916, z = 7}, 20, "Objetivo da missão: O Domador de Feras")
			minimapWidget:removeFlag({x = 528, y = 879, z = 7}, 20, "Objetivo da missão: O Domador de Feras")
		elseif string.find(text, "!DelTraidor") then
			minimapWidget:removeFlag({x = 543, y = 943, z = 7}, 20, "Objetivo da missão: O Traidor")
			minimapWidget:removeFlag({x = 433, y = 922, z = 7}, 20, "Objetivo da missão: O Traidor")
			minimapWidget:removeFlag({x = 393, y = 889, z = 7}, 20, "Objetivo da missão: O Traidor")
			minimapWidget:removeFlag({x = 374, y = 888, z = 8}, 20, "Objetivo da missão: O Traidor")
		elseif string.find(text, "!DelBencaoDivina") then
			minimapWidget:removeFlag({x = 568, y = 926, z = 7}, 20, "Objetivo da missão: Benção Divina")
		elseif string.find(text, "!DelHonrandoMortos") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Honrando os Mortos")
			minimapWidget:removeFlag({x = 591, y = 931, z = 7}, 20, "Objetivo da missão: Honrando os Mortos")
		elseif string.find(text, "!DelMissaoOficial") then
			minimapWidget:removeFlag({x = 546, y = 895, z = 7}, 20, "Objetivo da missão: Auxiliar de Combatente")
			minimapWidget:removeFlag({x = 535, y = 915, z = 7}, 20, "Objetivo da missão: Auxiliar de Combatente\nLoja de Ferramentas do Gorn.")
			minimapWidget:removeFlag({x = 485, y = 847, z = 7}, 20, "Objetivo da missão: Auxiliar de Combatente\nAcampamento")
		elseif string.find(text, "!DelListaNegra") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 528, y = 879, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 467, y = 870, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 580, y = 974, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 597, y = 904, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 506, y = 958, z = 7}, 20, "Objetivo da missão: Lista Negra")
			minimapWidget:removeFlag({x = 279, y = 626, z = 7}, 20, "Objetivo da missão: Lista Negra")
		elseif string.find(text, "!DelPromessa") then
			minimapWidget:removeFlag({x = 546, y = 895, z = 7}, 20, "Objetivo da missão: A Promessa")
			minimapWidget:removeFlag({x = 507, y = 998, z = 7}, 20, "Objetivo da missão: A Promessa")
		elseif string.find(text, "!DelRaridade") then
			minimapWidget:removeFlag({x = 543, y = 943, z = 7}, 20, "Objetivo da missão: Raridade")
			minimapWidget:removeFlag({x = 503, y = 954, z = 7}, 20, "Objetivo da missão: Raridade")
			minimapWidget:removeFlag({x = 474, y = 923, z = 8}, 20, "Objetivo da missão: Raridade")
		elseif string.find(text, "!DelCurandeiro") then
			minimapWidget:removeFlag({x = 567, y = 937, z = 7}, 20, "Objetivo da missão: O Curandeiro")
			minimapWidget:removeFlag({x = 506, y = 958, z = 7}, 20, "Objetivo da missão: O Curandeiro")
			minimapWidget:removeFlag({x = 596, y = 905, z = 7}, 20, "Objetivo da missão: O Curandeiro")
			minimapWidget:removeFlag({x = 405, y = 883, z = 7}, 20, "Objetivo da missão: O Curandeiro")
		elseif string.find(text, "!DelSlot") then
			minimapWidget:removeFlag({x = 528, y = 937, z = 7}, 20, "Objetivo da missão: Slot")
			minimapWidget:removeFlag({x = 568, y = 911, z = 7}, 20, "Objetivo da missão: Slot")
		elseif string.find(text, "!DelAprimoramento") then
			minimapWidget:removeFlag({x = 568, y = 911, z = 7}, 20, "Objetivo da missão: Slot")
		elseif string.find(text, "!DelAcordoRisco") then
			minimapWidget:removeFlag({x = 544, y = 908, z = 7}, 20, "Objetivo da missão: Acordo de Risco")
			minimapWidget:removeFlag({x = 541, y = 901, z = 7}, 20, "Objetivo da missão: Acordo de Risco")
			minimapWidget:removeFlag({x = 498, y = 927, z = 9}, 20, "Objetivo da missão: Acordo de Risco")
			minimapWidget:removeFlag({x = 498, y = 927, z = 10}, 20, "Objetivo da missão: Acordo de Risco")
		elseif string.find(text, "!DelSincronizacao") then
			minimapWidget:removeFlag({x = 450, y = 887, z = 7}, 20, "Objetivo da missão: Sincronização")
		elseif string.find(text, "!DelDepositoPeles") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Depósito de Peles")
			minimapWidget:removeFlag({x = 507, y = 957, z = 7}, 20, "Objetivo da missão: Depósito de Peles")
			minimapWidget:removeFlag({x = 467, y = 870, z = 7}, 20, "Objetivo da missão: Depósito de Peles")
		elseif string.find(text, "!DelArteCraft") then
			minimapWidget:removeFlag({x = 568, y = 911, z = 7}, 20, "Objetivo da missão: A Arte do Craft")
			minimapWidget:removeFlag({x = 458, y = 952, z = 7}, 20, "Objetivo da missão: A Arte do Craft")
			minimapWidget:removeFlag({x = 528, y = 879, z = 7}, 20, "Objetivo da missão: A Arte do Craft")
			minimapWidget:removeFlag({x = 597, y = 930, z = 7}, 20, "Objetivo da missão: A Arte do Craft")
		elseif string.find(text, "!DelLagrimas") then
			minimapWidget:removeFlag({x = 529, y = 937, z = 7}, 20, "Objetivo da missão: Lagrimas")
			minimapWidget:removeFlag({x = 534, y = 917, z = 7}, 20, "Objetivo da missão: Lagrimas")
		elseif string.find(text, "!DelReceitaCraft") then
			minimapWidget:removeFlag({x = 529, y = 937, z = 7}, 20, "Objetivo da missão: Receita de Craft")
			minimapWidget:removeFlag({x = 506, y = 957, z = 7}, 20, "Objetivo da missão: Receita de Craft")
			minimapWidget:removeFlag({x = 456, y = 964, z = 7}, 20, "Objetivo da missão: Receita de Craft")
		elseif string.find(text, "!DelMinerador") then
			minimapWidget:removeFlag({x = 524, y = 917, z = 7}, 20, "Objetivo da missão: Minerador")
			minimapWidget:removeFlag({x = 464, y = 830, z = 7}, 20, "Objetivo da missão: Minerador")
			minimapWidget:removeFlag({x = 406, y = 826, z = 10}, 20, "Objetivo da missão: Minerador")
		elseif string.find(text, "!DelEntregaEspecial") then
			minimapWidget:removeFlag({x = 537, y = 921, z = 7}, 20, "Objetivo da missão: Entrega Especial")
			minimapWidget:removeFlag({x = 534, y = 926, z = 5}, 20, "Objetivo da missão: Entrega Especial")
			minimapWidget:removeFlag({x = 548, y = 613, z = 7}, 20, "Objetivo da missão: Entrega Especial")
		elseif string.find(text, "!DelLadraoTumulo") then
			minimapWidget:removeFlag({x = 548, y = 611, z = 7}, 20, "Objetivo da missão: Ladrão de Tumulo")
			minimapWidget:removeFlag({x = 522, y = 652, z = 7}, 20, "Objetivo da missão: Ladrão de Tumulo")
		elseif string.find(text, "!DelAguaSuja") then
			minimapWidget:removeFlag({x = 460, y = 664, z = 7}, 20, "Objetivo da missão: Água Suja")
			minimapWidget:removeFlag({x = 460, y = 677, z = 7}, 20, "Objetivo da missão: Água Suja")
		elseif string.find(text, "!DelSuperticao") then
			minimapWidget:removeFlag({x = 460, y = 664, z = 7}, 20, "Objetivo da missão: Supertição")
			minimapWidget:removeFlag({x = 533, y = 749, z = 7}, 20, "Objetivo da missão: Supertição")
		elseif string.find(text, "!DelEstradaLadroes") then
			minimapWidget:removeFlag({x = 565, y = 643, z = 7}, 20, "Objetivo da missão: Estrada de Ladrões")
			minimapWidget:removeFlag({x = 673, y = 741, z = 7}, 20, "Objetivo da missão: Estrada de Ladrões")
		elseif string.find(text, "!DelAreiasFerro") then
			minimapWidget:removeFlag({x = 542, y = 639, z = 7}, 20, "Objetivo da missão: Areias de Ferro")
			minimapWidget:removeFlag({x = 472, y = 723, z = 7}, 20, "Objetivo da missão: Areias de Ferro")
		elseif string.find(text, "!DelDesequilibrio") then
			minimapWidget:removeFlag({x = 542, y = 639, z = 7}, 20, "Objetivo da missão: Desequilibrio")
			minimapWidget:removeFlag({x = 498, y = 593, z = 7}, 20, "Objetivo da missão: Desequilibrio")
		elseif string.find(text, "!DelEscoltaImperial") then
			minimapWidget:removeFlag({x = 571, y = 618, z = 7}, 20, "Objetivo da missão: Escolta Imperial")
		elseif string.find(text, "!DelFelizAniversario") then
			minimapWidget:removeFlag({x = 536, y = 620, z = 7}, 20, "Objetivo da missão: Feliz Aniversário!")
			minimapWidget:removeFlag({x = 417, y = 707, z = 7}, 20, "Objetivo da missão: Feliz Aniversário!")
		elseif string.find(text, "!DelMinaExplosiva") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Mina Explosiva")
			minimapWidget:removeFlag({x = 463, y = 830, z = 7}, 20, "Objetivo da missão: Mina Explosiva")
			minimapWidget:removeFlag({x = 460, y = 815, z = 10}, 20, "Objetivo da missão: Mina Explosiva")
			minimapWidget:removeFlag({x = 446, y = 825, z = 11}, 20, "Objetivo da missão: Mina Explosiva")
		elseif string.find(text, "!DelFalsificadores") then
			minimapWidget:removeFlag({x = 542, y = 639, z = 7}, 20, "Objetivo da missão: Falsificadores")
			minimapWidget:removeFlag({x = 621, y = 716, z = 7}, 20, "Objetivo da missão: Falsificadores")
			minimapWidget:removeFlag({x = 666, y = 706, z = 7}, 20, "Objetivo da missão: Falsificadores")
		elseif string.find(text, "!DelCacaFantasma") then
			minimapWidget:removeFlag({x = 565, y = 643, z = 7}, 20, "Objetivo da missão: O Caça-Fantasma")
			minimapWidget:removeFlag({x = 673, y = 741, z = 7}, 20, "Objetivo da missão: O Caça-Fantasma")
			minimapWidget:removeFlag({x = 571, y = 687, z = 7}, 20, "Objetivo da missão: O Caça-Fantasma")
		elseif string.find(text, "!DelDangerous") then
			minimapWidget:removeFlag({x = 538, y = 921, z = 7}, 20, "Objetivo da missão: Dangerous")
			minimapWidget:removeFlag({x = 539, y = 917, z = 5}, 20, "Objetivo da missão: Dangerous")
		elseif string.find(text, "!DelVocational") then
			minimapWidget:removeFlag({x = 569, y = 924, z = 7}, 20, "Objetivo da missão: Quest Vocacional")
			minimapWidget:removeFlag({x = 570, y = 936, z = 8}, 20, "Objetivo da missão: Quest Vocacional")
		elseif string.find(text, "!DelDesertQuest") then
			minimapWidget:removeFlag({x = 464, y = 722, z = 7}, 20, "Objetivo da missão: Desert Quest")
		elseif string.find(text, "!DelGreenhorn") then
			minimapWidget:removeFlag({x = 381, y = 307, z = 7}, 20, "Objetivo da missão: Arena: Greenhorn")
		elseif string.find(text, "!DelParadoxTower") then
			minimapWidget:removeFlag({x = 434, y = 626, z = 7}, 20, "Objetivo da missão: The Paradox Tower Quest")
		elseif string.find(text, "!DelCarteiro") then
			minimapWidget:removeFlag({x = 734, y = 883, z = 7}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 1215, y = 1417, z = 7}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 1206, y = 1409, z = 8}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 277, y = 616, z = 7}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 280, y = 597, z = 5}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 299, y = 702, z = 7}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 714, y = 761, z = 7}, 20, "Objetivo da missão: Carteiro por um dia")
			minimapWidget:removeFlag({x = 726, y = 765, z = 8}, 20, "Objetivo da missão: Carteiro por um dia")
		elseif string.find(text, "!DelBansheeQuest") then
			minimapWidget:removeFlag({x = 589, y = 691, z = 7}, 20, "Objetivo da missão: Banshee Quest")
			minimapWidget:removeFlag({x = 537, y = 681, z = 9}, 20, "Objetivo da missão: Banshee Quest")
			minimapWidget:removeFlag({x = 617, y = 648, z = 10}, 20, "Objetivo da missão: Banshee Quest")
			minimapWidget:removeFlag({x = 593, y = 725, z = 11}, 20, "Objetivo da missão: Banshee Quest")
			minimapWidget:removeFlag({x = 553, y = 708, z = 10}, 20, "Objetivo da missão: Banshee Quest")
		elseif string.find(text, "!DelRuinasSombrias") then
			minimapWidget:removeFlag({x = 578, y = 639, z = 7}, 20, "Objetivo da missão: Dangerous: Ruinas Sombrias")
			minimapWidget:removeFlag({x = 567, y = 634, z = 8}, 20, "Objetivo da missão: Dangerous: Ruinas Sombrias")
		elseif string.find(text, "!DelPitsInferno") then
			minimapWidget:removeFlag({x = 717, y = 761, z = 7}, 20, "Objetivo da missão: The Pits of Inferno Quest")
		elseif string.find(text, "!DelDarkness") then
			minimapWidget:removeFlag({x = 1141, y = 1242, z = 7}, 20, "Objetivo da missão: Darkness Quest")
		elseif string.find(text, "!DelAnnihilator") then
			minimapWidget:removeFlag({x = 859, y = 972, z = 7}, 20, "Objetivo da missão: The Annihilator Quest")
			minimapWidget:removeFlag({x = 833, y = 1018, z = 9}, 20, "Objetivo da missão: The Annihilator Quest")
			minimapWidget:removeFlag({x = 812, y = 1067, z = 10}, 20, "Objetivo da missão: The Annihilator Quest")
			minimapWidget:removeFlag({x = 788, y = 1092, z = 11}, 20, "Objetivo da missão: The Annihilator Quest")
		elseif string.find(text, "!DelTemploObscuro") then
			minimapWidget:removeFlag({x = 734, y = 881, z = 7}, 20, "Objetivo da missão: Dangerous: Templo Obscuro")
			minimapWidget:removeFlag({x = 734, y = 882, z = 5}, 20, "Objetivo da missão: Dangerous: Templo Obscuro")
		elseif string.find(text, "!DelDemonQuest") then
			minimapWidget:removeFlag({x = 859, y = 972, z = 7}, 20, "Objetivo da missão: Demon Quest")
			minimapWidget:removeFlag({x = 833, y = 1018, z = 9}, 20, "Objetivo da missão: Demon Quest")
			minimapWidget:removeFlag({x = 812, y = 1067, z = 10}, 20, "Objetivo da missão: Demon Quest")
			minimapWidget:removeFlag({x = 775, y = 1076, z = 11}, 20, "Objetivo da missão: Demon Quest")
			minimapWidget:removeFlag({x = 777, y = 1102, z = 12}, 20, "Objetivo da missão: Demon Quest")
		elseif string.find(text, "!DelInquisition") then
			minimapWidget:removeFlag({x = 432, y = 644, z = 7}, 20, "Objetivo da missão: The Inquisition Quest")
			minimapWidget:removeFlag({x = 440, y = 644, z = 15}, 20, "Objetivo da missão: The Inquisition Quest")
		end
		if string.find(text, "BussulaDel") then
			local t = string.explode(text, " ")
			local xpos = t[2]
			local ypos = t[3]
			local zpos = t[4]
			addEvent(function() minimapWidget:addFlag({x = xpos, y = ypos, z = zpos}, 20, "Alvo da Bussula encontrado.") end, 500)
			scheduleEvent(function() minimapWidget:removeFlag({x = xpos, y = ypos, z = zpos}, 20, "Alvo da Bussula encontrado.") end, 10000)
		end
	end
end

function terminate()
  if g_game.isOnline() then
    saveMap()
  end

  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline,
  })

  disconnect(LocalPlayer, {
    onPositionChange = updateCameraPosition
  })

  local gameRootPanel = modules.game_interface.getRootPanel()
  g_keyboard.unbindKeyPress('Alt+Left', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Right', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Up', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Down', gameRootPanel)
  g_keyboard.unbindKeyDown('Ctrl+M')
  g_keyboard.unbindKeyDown('Ctrl+Shift+M')

  minimapWindow:destroy()
  minimapButton:destroy()
end

function toggle()
  if minimapButton:isOn() then
	g_sounds.getChannel(1):play("/sounds/CloseWindows")
    minimapWindow:close()
	minimapButton:setIcon('/images/topbuttons/minimap')
    minimapButton:setOn(false)
  else
	g_sounds.getChannel(1):play("/sounds/OpenWindows")
    minimapWindow:open()
	minimapButton:setIcon('/images/topbuttons/minimap_on')
    minimapButton:setOn(true)
  end
end

function setMonsterCave(posx, posy, posz, icon, description)
	local pos = {}
	pos.x = posx
	pos.y = posy
	pos.z = posz
	minimapWidget:addFlag(pos, icon, description)
end

function removeMonsterCave(posx, posy, posz, icon, description)
	local pos = {}
	pos.x = posx
	pos.y = posy
	pos.z = posz
	minimapWidget:removeFlag(pos, icon, description)
end

function onMiniWindowClose()
  minimapButton:setOn(false)
  minimapButton:setIcon('/images/topbuttons/minimap')
end

function preload()
  loadMap(false)
  preloaded = true
end

function online()
  loadMap(not preloaded)
  updateCameraPosition()
end

function offline()
  saveMap()
end

function loadMap(clean)
  local clientVersion = g_game.getClientVersion()

  if clean then
    g_minimap.clean()
  end

  if otmm then
    local minimapFile = '/minimap.otmm'
    if g_resources.fileExists(minimapFile) then
      g_minimap.loadOtmm(minimapFile)
    end
  else
    local minimapFile = '/minimap_' .. clientVersion .. '.otcm'
    if g_resources.fileExists(minimapFile) then
      g_map.loadOtcm(minimapFile)
    end
  end
  minimapWidget:load()
end

function saveMap()
  local clientVersion = g_game.getClientVersion()
  if otmm then
    local minimapFile = '/minimap.otmm'
    g_minimap.saveOtmm(minimapFile)
  else
    local minimapFile = '/minimap_' .. clientVersion .. '.otcm'
    g_map.saveOtcm(minimapFile)
  end
  minimapWidget:save()
end

function updateCameraPosition()
  local player = g_game.getLocalPlayer()
  if not player then return end
  local pos = player:getPosition()
  if not pos then return end
  if not minimapWidget:isDragging() then
    if not fullmapView then
      minimapWidget:setCameraPosition(player:getPosition())
    end
    minimapWidget:setCrossPosition(player:getPosition())
  end
end

function toggleFullMap()
  if not fullmapView then
    fullmapView = true
    minimapWindow:hide()
    minimapWidget:setParent(modules.game_interface.getRootPanel())
    minimapWidget:fill('parent')
    minimapWidget:setAlternativeWidgetsVisible(true)
  else
    fullmapView = false
    minimapWidget:setParent(minimapWindow:getChildById('contentsPanel'))
    minimapWidget:fill('parent')
    minimapWindow:show()
    minimapWidget:setAlternativeWidgetsVisible(false)
  end

  local zoom = oldZoom or 0
  local pos = oldPos or minimapWidget:getCameraPosition()
  oldZoom = minimapWidget:getZoom()
  oldPos = minimapWidget:getCameraPosition()
  minimapWidget:setZoom(zoom)
  minimapWidget:setCameraPosition(pos)
end
