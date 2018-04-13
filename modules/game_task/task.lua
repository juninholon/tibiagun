function init()
  connect(g_game, { onGameEnd = onGameEnd })
  connect(g_game, 'onTextMessage', onTaskRefresh)

  shopWindow = g_ui.displayUI('task')
  shopWindow:hide()
  
  PontosRank = shopWindow:getChildById('rankUpgradePoints')
  RankUpgrade = shopWindow:getChildById('rankButton')
  UmIconShop = shopWindow:getChildById('tearShop1')
  DoisIconShop = shopWindow:getChildById('tearShop2')
  TresIconShop = shopWindow:getChildById('tearShop3')
  QuatroIconShop = shopWindow:getChildById('tearShop4')
  CincoIconShop = shopWindow:getChildById('tearShop5')
  
  LagrimaAzulUmIcon = shopWindow:getChildById('tearBlue1')
  LagrimaAzulDoisIcon = shopWindow:getChildById('tearBlue2')
  LagrimaAzulTresIcon = shopWindow:getChildById('tearBlue3')
  LagrimaAzulQuatroIcon = shopWindow:getChildById('tearBlue4')
  LagrimaAzulCincoIcon = shopWindow:getChildById('tearBlue5')
  LagrimaAzulSeisIcon = shopWindow:getChildById('tearBlue6')
  LagrimaAzul = shopWindow:getChildById('tearBlueValue')
  LagrimaAmarela = shopWindow:getChildById('tearYellowValue')
  LagrimaVermelha = shopWindow:getChildById('tearRedValue')
  
  IconShopUm = shopWindow:getChildById('interfaceShop1')
  ValueShopUm = shopWindow:getChildById('tearShop1')
  BuyShopUm = shopWindow:getChildById('shopButton1')
  IconShopDois = shopWindow:getChildById('interfaceShop2')
  ValueShopDois = shopWindow:getChildById('tearShop2')
  BuyShopDois = shopWindow:getChildById('shopButton2')
  IconShopTres = shopWindow:getChildById('interfaceShop3')
  ValueShopTres = shopWindow:getChildById('tearShop3')
  BuyShopTres = shopWindow:getChildById('shopButton3')
  IconShopQuatro = shopWindow:getChildById('interfaceShop4')
  ValueShopQuatro = shopWindow:getChildById('tearShop4')
  BuyShopQuatro = shopWindow:getChildById('shopButton4')
  IconShopCinco = shopWindow:getChildById('interfaceShop5')
  ValueShopCinco = shopWindow:getChildById('tearShop5')
  BuyShopCinco = shopWindow:getChildById('shopButton5')
  
  --== FLAG 01 ==--
  FlagUm = shopWindow:getChildById('flag1')
  IconFlagUm = shopWindow:getChildById('monsterFlag1')
  NameFlagUm = shopWindow:getChildById('monsterText1')
  ButtonFlagUm = shopWindow:getChildById('startButton1')
  KillFlagUm = shopWindow:getChildById('kill1')
  CoinFlagUm = shopWindow:getChildById('coin1')
  TearFlagUm = shopWindow:getChildById('tearBlue1')
  --== FLAG 02 ==--
  FlagDois = shopWindow:getChildById('flag2')
  IconFlagDois = shopWindow:getChildById('monsterFlag2')
  NameFlagDois = shopWindow:getChildById('monsterText2')
  ButtonFlagDois = shopWindow:getChildById('startButton2')
  KillFlagDois = shopWindow:getChildById('kill2')
  CoinFlagDois = shopWindow:getChildById('coin2')
  TearFlagDois = shopWindow:getChildById('tearBlue2')
  --== FLAG 03 ==--
  FlagTres = shopWindow:getChildById('flag3')
  IconFlagTres = shopWindow:getChildById('monsterFlag3')
  NameFlagTres = shopWindow:getChildById('monsterText3')
  ButtonFlagTres = shopWindow:getChildById('startButton3')
  KillFlagTres = shopWindow:getChildById('kill3')
  CoinFlagTres = shopWindow:getChildById('coin3')
  TearFlagTres = shopWindow:getChildById('tearBlue3')
  --== FLAG 04 ==--
  FlagQuatro = shopWindow:getChildById('flag4')
  IconFlagQuatro = shopWindow:getChildById('monsterFlag4')
  NameFlagQuatro = shopWindow:getChildById('monsterText4')
  ButtonFlagQuatro = shopWindow:getChildById('startButton4')
  KillFlagQuatro = shopWindow:getChildById('kill4')
  CoinFlagQuatro = shopWindow:getChildById('coin4')
  TearFlagQuatro = shopWindow:getChildById('tearBlue4')
  --== FLAG 05 ==--
  FlagCinco = shopWindow:getChildById('flag5')
  IconFlagCinco = shopWindow:getChildById('monsterFlag5')
  NameFlagCinco = shopWindow:getChildById('monsterText5')
  ButtonFlagCinco = shopWindow:getChildById('startButton5')
  KillFlagCinco = shopWindow:getChildById('kill5')
  CoinFlagCinco = shopWindow:getChildById('coin5')
  TearFlagCinco = shopWindow:getChildById('tearBlue5')
  --== FLAG 06 ==--
  FlagSeis = shopWindow:getChildById('flag6')
  IconFlagSeis = shopWindow:getChildById('monsterFlag6')
  NameFlagSeis = shopWindow:getChildById('monsterText6')
  ButtonFlagSeis = shopWindow:getChildById('startButton6')
  KillFlagSeis = shopWindow:getChildById('kill6')
  CoinFlagSeis = shopWindow:getChildById('coin6')
  TearFlagSeis = shopWindow:getChildById('tearBlue6')
  
  RankPoints = shopWindow:getChildById('rankUpgradePoints')

  shopTabBar = shopWindow:getChildById('shopTabBar')
  shopTabBar:setContentWidget(shopWindow:getChildById('shopTabContent'))

  rankUmPanel = g_ui.loadUI('rank')
  shopTabBar:addTab('Task', rankUmPanel, '/images/game/other/task_window')

 shopButton = modules.client_topmenu.addRightGameButton('shopButton', tr('Lista Negra (Task)'), '/images/topbuttons/task', toggle)
 shopButton:setOn(true)
 shopButton:setIcon('/images/topbuttons/task')
 shopButton.onClick = function()
	g_game.talk("!Rank Refresh") 
	LagrimaAzul:setText('0')
	LagrimaAmarela:setText('0')
	LagrimaVermelha:setText('0')
	
	LagrimaAzulUmIcon:setIcon('/images/game/other/1')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/1')
	LagrimaAzulTresIcon:setIcon('/images/game/other/1')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/1')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/1')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/1')
	UmIconShop:setIcon('/images/game/other/1')
	DoisIconShop:setIcon('/images/game/other/1')
	TresIconShop:setIcon('/images/game/other/1')
	QuatroIconShop:setIcon('/images/game/other/1')
	CincoIconShop:setIcon('/images/game/other/1')
	
	IconShopUm:setIcon('')
	IconShopUm:setImageSource('/images/ui/item')
	IconShopUm:setTooltip(tr('Nada'))
	ValueShopUm:setText('0')
	ValueShopUm:setColor('#3088d8')
	BuyShopUm.onClick = function() end
	IconShopDois:setTooltip(tr('Nada'))
	IconShopDois:setIcon('')
	IconShopDois:setImageSource('/images/ui/item')
	ValueShopDois:setText('0')
	ValueShopDois:setColor('#3088d8')
	BuyShopDois.onClick = function() end
	IconShopTres:setTooltip(tr('Nada'))
	IconShopTres:setIcon('')
	IconShopTres:setImageSource('/images/ui/item')
	ValueShopTres:setText('0')
	ValueShopTres:setColor('#3088d8')
	BuyShopTres.onClick = function() end
	IconShopQuatro:setTooltip(tr('Nada'))
	IconShopQuatro:setIcon('')
	IconShopQuatro:setImageSource('/images/ui/item')
	ValueShopQuatro:setText('0')
	ValueShopQuatro:setColor('#3088d8')
	BuyShopQuatro.onClick = function() end
	IconShopCinco:setTooltip(tr('Nada'))
	IconShopCinco:setIcon('')
	IconShopCinco:setImageSource('/images/ui/item')
	ValueShopCinco:setText('0')
	ValueShopCinco:setColor('#3088d8')
	BuyShopCinco.onClick = function() end
	
	FlagUm:setImageColor('white')
	IconFlagUm:setImageSource('')
	NameFlagUm:setText('==')
	ButtonFlagUm:setText('Iniciar')
	ButtonFlagUm:setIcon('/images/game/other/start')
	ButtonFlagUm:setTooltip(tr('Iniciar Task'))
	ButtonFlagUm.onClick = function() end
	KillFlagUm:setText('')
	CoinFlagUm:setText('')
	TearFlagUm:setText('')
	
	FlagDois:setImageColor('white')
	IconFlagDois:setImageSource('')
	NameFlagDois:setText('==')
	ButtonFlagDois:setText('Iniciar')
	ButtonFlagDois:setIcon('/images/game/other/start')
	ButtonFlagDois:setTooltip(tr('Iniciar Task'))
	ButtonFlagDois.onClick = function() end
	KillFlagDois:setText('')
	CoinFlagDois:setText('')
	TearFlagDois:setText('')
	
	FlagTres:setImageColor('white')
	IconFlagTres:setImageSource('')
	NameFlagTres:setText('==')
	ButtonFlagTres:setText('Iniciar')
	ButtonFlagTres:setIcon('/images/game/other/start')
	ButtonFlagTres:setTooltip(tr('Iniciar Task'))
	ButtonFlagTres.onClick = function() end
	KillFlagTres:setText('')
	CoinFlagTres:setText('')
	TearFlagTres:setText('')
	
	FlagQuatro:setImageColor('white')
	IconFlagQuatro:setImageSource('')
	NameFlagQuatro:setText('==')
	ButtonFlagQuatro:setText('Iniciar')
	ButtonFlagQuatro:setIcon('/images/game/other/start')
	ButtonFlagQuatro:setTooltip(tr('Iniciar Task'))
	ButtonFlagQuatro.onClick = function() end
	KillFlagQuatro:setText('')
	CoinFlagQuatro:setText('')
	TearFlagQuatro:setText('')
	
	FlagCinco:setImageColor('white')
	IconFlagCinco:setImageSource('')
	NameFlagCinco:setText('==')
	ButtonFlagCinco:setText('Iniciar')
	ButtonFlagCinco:setIcon('/images/game/other/start')
	ButtonFlagCinco:setTooltip(tr('Iniciar Task'))
	ButtonFlagCinco.onClick = function() end
	KillFlagCinco:setText('')
	CoinFlagCinco:setText('')
	TearFlagCinco:setText('')
	
	FlagSeis:setImageColor('white')
	IconFlagSeis:setImageSource('')
	NameFlagSeis:setText('==')
	ButtonFlagSeis:setText('Iniciar')
	ButtonFlagSeis:setIcon('/images/game/other/start')
	ButtonFlagSeis:setTooltip(tr('Iniciar Task'))
	ButtonFlagSeis.onClick = function() end
	KillFlagSeis:setText('')
	CoinFlagSeis:setText('')
	TearFlagSeis:setText('')
  end
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })
  disconnect(g_game, 'onTextMessage', onTaskRefresh)

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
  addEvent(function() shopButton:setIcon('/images/topbuttons/task_on') g_effects.fadeIn(shopWindow, 250) end)
end

function hide()
  g_sounds.getChannel(1):play("/sounds/CloseWindows")
  addEvent(function() shopButton:setIcon('/images/topbuttons/task') g_effects.fadeOut(shopWindow, 250) end)
  scheduleEvent(function() shopWindow:hide() end, 250)
end

function toggle()
  if shopWindow:isVisible() then
    hide()
	shopButton:setIcon('/images/topbuttons/task')
  else
    show()
	shopButton:setIcon('/images/topbuttons/task_on')
  end
end

function ReabrirTask()
local acceptFunc = function()
    g_game.talk("!Rank Refresh") 
	shopWindow:show()
	shopWindow:raise()
	shopWindow:focus()
	addEvent(function() g_effects.fadeIn(shopWindow, 250) end)

	LagrimaAzulUmIcon:setIcon('/images/game/other/1')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/1')
	LagrimaAzulTresIcon:setIcon('/images/game/other/1')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/1')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/1')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/1')
	UmIconShop:setIcon('/images/game/other/1')
	DoisIconShop:setIcon('/images/game/other/1')
	TresIconShop:setIcon('/images/game/other/1')
	QuatroIconShop:setIcon('/images/game/other/1')
	CincoIconShop:setIcon('/images/game/other/1')
	
	IconShopUm:setIcon('')
	IconShopUm:setImageSource('/images/ui/item')
	IconShopUm:setTooltip(tr('Nada'))
	ValueShopUm:setText('0')
	ValueShopUm:setColor('#3088d8')
	BuyShopUm.onClick = function() end
	IconShopDois:setTooltip(tr('Nada'))
	IconShopDois:setIcon('')
	IconShopDois:setImageSource('/images/ui/item')
	ValueShopDois:setText('0')
	ValueShopDois:setColor('#3088d8')
	BuyShopDois.onClick = function() end
	IconShopTres:setTooltip(tr('Nada'))
	IconShopTres:setIcon('')
	IconShopTres:setImageSource('/images/ui/item')
	ValueShopTres:setText('0')
	ValueShopTres:setColor('#3088d8')
	BuyShopTres.onClick = function() end
	IconShopQuatro:setTooltip(tr('Nada'))
	IconShopQuatro:setIcon('')
	IconShopQuatro:setImageSource('/images/ui/item')
	ValueShopQuatro:setText('0')
	ValueShopQuatro:setColor('#3088d8')
	BuyShopQuatro.onClick = function() end
	IconShopCinco:setTooltip(tr('Nada'))
	IconShopCinco:setIcon('')
	IconShopCinco:setImageSource('/images/ui/item')
	ValueShopCinco:setText('0')
	ValueShopCinco:setColor('#3088d8')
	BuyShopCinco.onClick = function() end
	
	FlagUm:setImageColor('white')
	IconFlagUm:setImageSource('')
	NameFlagUm:setText('==')
	ButtonFlagUm:setText('Iniciar')
	ButtonFlagUm:setIcon('/images/game/other/start')
	ButtonFlagUm:setTooltip(tr('Iniciar Task'))
	ButtonFlagUm.onClick = function() end
	KillFlagUm:setText('')
	CoinFlagUm:setText('')
	TearFlagUm:setText('')
	
	FlagDois:setImageColor('white')
	IconFlagDois:setImageSource('')
	NameFlagDois:setText('==')
	ButtonFlagDois:setText('Iniciar')
	ButtonFlagDois:setIcon('/images/game/other/start')
	ButtonFlagDois:setTooltip(tr('Iniciar Task'))
	ButtonFlagDois.onClick = function() end
	KillFlagDois:setText('')
	CoinFlagDois:setText('')
	TearFlagDois:setText('')
	
	FlagTres:setImageColor('white')
	IconFlagTres:setImageSource('')
	NameFlagTres:setText('==')
	ButtonFlagTres:setText('Iniciar')
	ButtonFlagTres:setIcon('/images/game/other/start')
	ButtonFlagTres:setTooltip(tr('Iniciar Task'))
	ButtonFlagTres.onClick = function() end
	KillFlagTres:setText('')
	CoinFlagTres:setText('')
	TearFlagTres:setText('')
	
	FlagQuatro:setImageColor('white')
	IconFlagQuatro:setImageSource('')
	NameFlagQuatro:setText('==')
	ButtonFlagQuatro:setText('Iniciar')
	ButtonFlagQuatro:setIcon('/images/game/other/start')
	ButtonFlagQuatro:setTooltip(tr('Iniciar Task'))
	ButtonFlagQuatro.onClick = function() end
	KillFlagQuatro:setText('')
	CoinFlagQuatro:setText('')
	TearFlagQuatro:setText('')
	
	FlagCinco:setImageColor('white')
	IconFlagCinco:setImageSource('')
	NameFlagCinco:setText('==')
	ButtonFlagCinco:setText('Iniciar')
	ButtonFlagCinco:setIcon('/images/game/other/start')
	ButtonFlagCinco:setTooltip(tr('Iniciar Task'))
	ButtonFlagCinco.onClick = function() end
	KillFlagCinco:setText('')
	CoinFlagCinco:setText('')
	TearFlagCinco:setText('')
	
	FlagSeis:setImageColor('white')
	IconFlagSeis:setImageSource('')
	NameFlagSeis:setText('==')
	ButtonFlagSeis:setText('Iniciar')
	ButtonFlagSeis:setIcon('/images/game/other/start')
	ButtonFlagSeis:setTooltip(tr('Iniciar Task'))
	ButtonFlagSeis.onClick = function() end
	KillFlagSeis:setText('')
	CoinFlagSeis:setText('')
	TearFlagSeis:setText('')
	
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
	acceptWindow = displayGeneralBox(tr('Informativo'), tr("Você avançou de RANK. Novos monstros estão disponíveis."),
	  { { text=tr('Abrir Task'), callback=acceptFunc },
		anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
end

function onTaskRefresh(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "RankPoints") then
		local t = string.explode(text, " ")
			RankPoints:setText(t[2]..'/'..t[3])
		end
		if string.find(text, "FailPointsRank") then
			RankPoints:setColor('red')
		end
		if string.find(text, "SucessPointsRank") then
			RankPoints:setColor('green')
		end
		if string.find(text, "FecharJanelaTask") then
			addEvent(function() g_effects.fadeOut(shopWindow, 250) end)
			scheduleEvent(function() shopWindow:hide() end, 250)
			ReabrirTask()
		end
		if string.find(text, "RankLock") then
			local t = string.explode(text, " ")
			if t[2] == "1" then
				rankUmPanel:recursiveGetChildById('Rank2'):enable()
				rankUmPanel:recursiveGetChildById('Rank2'):setIcon('')
			else
				rankUmPanel:recursiveGetChildById('Rank2'):disable()
				rankUmPanel:recursiveGetChildById('Rank2'):setIcon('/images/game/other/lock')
			end
			if t[3] == "1" then
				rankUmPanel:recursiveGetChildById('Rank3'):enable()
				rankUmPanel:recursiveGetChildById('Rank3'):setIcon('')
			else
				rankUmPanel:recursiveGetChildById('Rank3'):disable()
				rankUmPanel:recursiveGetChildById('Rank3'):setIcon('/images/game/other/lock')
			end
			if t[4] == "1" then
				rankUmPanel:recursiveGetChildById('Rank4'):enable()
				rankUmPanel:recursiveGetChildById('Rank4'):setIcon('')
			else
				rankUmPanel:recursiveGetChildById('Rank4'):disable()
				rankUmPanel:recursiveGetChildById('Rank4'):setIcon('/images/game/other/lock')
			end
			if t[5] == "1" then
				rankUmPanel:recursiveGetChildById('Rank5'):enable()
				rankUmPanel:recursiveGetChildById('Rank5'):setIcon('')
			else
				rankUmPanel:recursiveGetChildById('Rank5'):disable()
				rankUmPanel:recursiveGetChildById('Rank5'):setIcon('/images/game/other/lock')
			end
			if t[6] == "1" then
				rankUmPanel:recursiveGetChildById('Rank6'):enable()
				rankUmPanel:recursiveGetChildById('Rank6'):setIcon('')
			else
				rankUmPanel:recursiveGetChildById('Rank6'):disable()
				rankUmPanel:recursiveGetChildById('Rank6'):setIcon('/images/game/other/lock')
			end
			if t[7] == "6" then
				RankUpgrade:disable()
			else
				RankUpgrade:enable()
			end
		end
		if string.find(text, "CheckLagrimas") then
			local t = string.explode(text, " ")		
				LagrimaAzul:setText(''..t[2])
				LagrimaAmarela:setText(''..t[3])
				LagrimaVermelha:setText(''..t[4])
		end
		--== RANK UM CHECKS
		if string.find(text, "RotwormCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Monstros incluidos nessa task:\n• Rotworm\n• Carrion Worm'))
		end
		if string.find(text, "RotwormCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "OrcsCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Monstros incluidos nessa task:\n• Orc\n• Orc Spearman\n• Orc Warrior\n• Orc Berserker\n• Orc Warlord\n• Orc Leader\n• Orc Shaman\n• Orc Rider'))
		end
		if string.find(text, "OrcsCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "CyclopsCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Monstros incluidos nessa task:\n• Cyclops\n• Cyclops Smith\n• Cyclops Drone'))
		end
		if string.find(text, "CyclopsCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "TrollsCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Monstros incluidos nessa task:\n• Troll\n• Frost Troll\n• Swamp Troll'))
		end
		if string.find(text, "TrollsCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "MinotaurCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Monstros incluidos nessa task:\n• Minotaur\n• Minotaur Archer\n• Minotaur Guard\n• Minotaur Mage'))
		end
		if string.find(text, "MinotaurCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "ElfCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Monstros incluidos nessa task:\n• Elf\n• Elf Scout\n• Elf Arcanist'))
		end
		if string.find(text, "ElfCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK DOIS CHECKS
		if string.find(text, "DragonCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DragonCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "AncientScarabCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "AncientScarabCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "BogRaiderCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "BogRaiderCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "TarantulaCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "TarantulaCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "AnkaCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "AnkaCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "QuarasCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Monstros incluidos nessa task:\n• Quara Constrictor\n• Quara Hydromancer\n• Quara Mantassin\n• Quara Pincher\n• Quara Predator'))
		end
		if string.find(text, "QuarasCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK TRES CHECKS
		if string.find(text, "NightmareCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "NightmareCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "GiantSpiderCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "GiantSpiderCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DragonLordCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DragonLordCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "AtormentadorCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "AtormentadorCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "HeroCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "HeroCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "BansheeCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "BansheeCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK QUATRO CHECKS
		if string.find(text, "BukanessCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "BukanessCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "LizardsCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Monstros incluidos nessa task:\n• Lizard High Guard\n• Lizard Zaogun\n• Lizard Chosen'))
		end
		if string.find(text, "LizardsCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DrakensCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Monstros incluidos nessa task:\n• Draken Warmaster\n• Draken Spellweaver\n• Draken Elite\n• Draken Abomination'))
		end
		if string.find(text, "DrakensCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "MedusaCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "MedusaCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "SerpentSpawnCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "SerpentSpawnCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "HydraCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "HydraCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK CINCO CHECKS
		if string.find(text, "FrostDragonCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "FrostDragonCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DemonCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DemonCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "HellspawnCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "HellspawnCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "GrimReaperCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "GrimReaperCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DefilerCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DefilerCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "BehemothCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "BehemothCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK SEIS CHECKS
		if string.find(text, "CerberusCheckStart") then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "CerberusCheckCancel") then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DarkTorturerCheckStart") then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DarkTorturerCheckCancel") then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "DragonGhastlyCheckStart") then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "DragonGhastlyCheckCancel") then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "HellhoundCheckStart") then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "HellhoundCheckCancel") then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "PlaguesmithCheckStart") then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "PlaguesmithCheckCancel") then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
		end
		if string.find(text, "UndeadCheckStart") then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
		end
		if string.find(text, "UndeadCheckCancel") then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
		end
		--== RANK UM
		if string.find(text, "UmRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Monstros incluidos nessa task:\n• Rotworm\n• Carrion Worm'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "50" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Monstros incluidos nessa task:\n• Orc\n• Orc Spearman\n• Orc Warrior\n• Orc Berserker\n• Orc Warlord\n• Orc Leader\n• Orc Shaman\n• Orc Rider'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "50" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Monstros incluidos nessa task:\n• Cyclops\n• Cyclops Smith\n• Cyclops Drone'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "50" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Monstros incluidos nessa task:\n• Troll\n• Frost Troll\n• Swamp Troll'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "50" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Monstros incluidos nessa task:\n• Minotaur\n• Minotaur Archer\n• Minotaur Guard\n• Minotaur Mage'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "50" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Monstros incluidos nessa task:\n• Elf\n• Elf Scout\n• Elf Arcanist'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "50" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		end
		--== RANK DOIS
		if string.find(text, "DoisRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "100" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "100" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "100" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "100" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "5" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Monstros incluidos nessa task:\n• Quara Constrictor\n• Quara Hydromancer\n• Quara Mantassin\n• Quara Pincher\n• Quara Predator'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "100" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		
		end
		--== RANK TRES
		if string.find(text, "TresRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "200" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "200" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "200" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "10" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "200" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "200" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		
		end
		--== RANK QUATRO
		if string.find(text, "QuatroRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "10" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Monstros incluidos nessa task:\n• Lizard High Guard\n• Lizard Zaogun\n• Lizard Chosen'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "300" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Monstros incluidos nessa task:\n• Draken Warmaster\n• Draken Spellweaver\n• Draken Elite\n• Draken Abomination'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "300" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "300" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "300" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "300" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		
		end
		--== RANK CINCO
		if string.find(text, "CincoRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "400" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "400" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "400" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "400" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "400" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "400" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		
		end
		--== RANK SEIS
		if string.find(text, "SeisRankCheck") then
			local t = string.explode(text, " ")
			if t[2] == "-1" then
				ButtonFlagUm:setIcon('/images/game/other/start')
				FlagUm:setImageColor('white')
				ButtonFlagUm:setText('Iniciar')
				ButtonFlagUm:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[3] == "1" then
				ButtonFlagUm:setIcon('/images/game/other/cancel')
				FlagUm:setImageColor('red')
				ButtonFlagUm:setText('Cancelar')
				ButtonFlagUm:setTooltip(tr('Cancelar esta task.'))
			elseif t[2] == "5" then
				ButtonFlagUm:setIcon('/images/game/other/coin')
				FlagUm:setImageColor('green')
				ButtonFlagUm:setText('Prêmio')
				ButtonFlagUm:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[4] == "-1" then
				ButtonFlagDois:setIcon('/images/game/other/start')
				FlagDois:setImageColor('white')
				ButtonFlagDois:setText('Iniciar')
				ButtonFlagDois:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[5] == "1" then
				ButtonFlagDois:setIcon('/images/game/other/cancel')
				FlagDois:setImageColor('red')
				ButtonFlagDois:setText('Cancelar')
				ButtonFlagDois:setTooltip(tr('Cancelar esta task.'))
			elseif t[4] == "200" then
				ButtonFlagDois:setIcon('/images/game/other/coin')
				FlagDois:setImageColor('green')
				ButtonFlagDois:setText('Prêmio')
				ButtonFlagDois:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[6] == "-1" then
				ButtonFlagTres:setIcon('/images/game/other/start')
				FlagTres:setImageColor('white')
				ButtonFlagTres:setText('Iniciar')
				ButtonFlagTres:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[7] == "1" then
				ButtonFlagTres:setIcon('/images/game/other/cancel')
				FlagTres:setImageColor('red')
				ButtonFlagTres:setText('Cancelar')
				ButtonFlagTres:setTooltip(tr('Cancelar esta task.'))
			elseif t[6] == "200" then
				ButtonFlagTres:setIcon('/images/game/other/coin')
				FlagTres:setImageColor('green')
				ButtonFlagTres:setText('Prêmio')
				ButtonFlagTres:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[8] == "-1" then
				ButtonFlagQuatro:setIcon('/images/game/other/start')
				FlagQuatro:setImageColor('white')
				ButtonFlagQuatro:setText('Iniciar')
				ButtonFlagQuatro:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[9] == "1" then
				ButtonFlagQuatro:setIcon('/images/game/other/cancel')
				FlagQuatro:setImageColor('red')
				ButtonFlagQuatro:setText('Cancelar')
				ButtonFlagQuatro:setTooltip(tr('Cancelar esta task.'))
			elseif t[8] == "200" then
				ButtonFlagQuatro:setIcon('/images/game/other/coin')
				FlagQuatro:setImageColor('green')
				ButtonFlagQuatro:setText('Prêmio')
				ButtonFlagQuatro:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[10] == "-1" then
				ButtonFlagCinco:setIcon('/images/game/other/start')
				FlagCinco:setImageColor('white')
				ButtonFlagCinco:setText('Iniciar')
				ButtonFlagCinco:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[11] == "1" then
				ButtonFlagCinco:setIcon('/images/game/other/cancel')
				FlagCinco:setImageColor('red')
				ButtonFlagCinco:setText('Cancelar')
				ButtonFlagCinco:setTooltip(tr('Cancelar esta task.'))
			elseif t[10] == "200" then
				ButtonFlagCinco:setIcon('/images/game/other/coin')
				FlagCinco:setImageColor('green')
				ButtonFlagCinco:setText('Prêmio')
				ButtonFlagCinco:setTooltip(tr('Receber sua recompensa.'))
			end
			if t[12] == "-1" then
				ButtonFlagSeis:setIcon('/images/game/other/start')
				FlagSeis:setImageColor('white')
				ButtonFlagSeis:setText('Iniciar')
				ButtonFlagSeis:setTooltip(tr('Clique aqui para iniciar esta Task.'))
			elseif t[13] == "1" then
				ButtonFlagSeis:setIcon('/images/game/other/cancel')
				FlagSeis:setImageColor('red')
				ButtonFlagSeis:setText('Cancelar')
				ButtonFlagSeis:setTooltip(tr('Cancelar esta task.'))
			elseif t[12] == "200" then
				ButtonFlagSeis:setIcon('/images/game/other/coin')
				FlagSeis:setImageColor('green')
				ButtonFlagSeis:setText('Prêmio')
				ButtonFlagSeis:setTooltip(tr('Receber sua recompensa.'))
			end
		
		end
	
	end
end

function Rank1()
	g_game.talk("!Rank RankUm")
	IconFlagUm:setImageSource('/images/game/other/Task/Rotworm')
	IconFlagUm:setImageSize('32 32')
	IconFlagUm:setImageOffset('15 15')
	NameFlagUm:setText('Rotworm')
	KillFlagUm:setText('x50')
	CoinFlagUm:setText('300')
	TearFlagUm:setText('01')
	TearFlagUm:setColor('#3088d8')
	LagrimaAzulUmIcon:setIcon('/images/game/other/1')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank RotwormTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Orc')
	IconFlagDois:setImageSize('32 32')
	IconFlagDois:setImageOffset('15 15')
	NameFlagDois:setText('Orcs')
	KillFlagDois:setText('x50')
	CoinFlagDois:setText('500')
	TearFlagDois:setText('01')
	TearFlagDois:setColor('#3088d8')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/1')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank OrcsTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Cyclops')
	IconFlagTres:setImageSize('64 64')
	IconFlagTres:setImageOffset('1 1')
	NameFlagTres:setText('Cyclops')
	KillFlagTres:setText('x50')
	CoinFlagTres:setText('1500')
	TearFlagTres:setText('01')
	TearFlagTres:setColor('#3088d8')
	LagrimaAzulTresIcon:setIcon('/images/game/other/1')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank CyclopsTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Troll')
	IconFlagQuatro:setImageSize('38 33')
	IconFlagQuatro:setImageOffset('13 16')
	NameFlagQuatro:setText('Trolls')
	KillFlagQuatro:setText('x50')
	CoinFlagQuatro:setText('300')
	TearFlagQuatro:setText('01')
	TearFlagQuatro:setColor('#3088d8')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/1')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank TrollsTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Minotaur')
	IconFlagCinco:setImageSize('32 32')
	IconFlagCinco:setImageOffset('15 15')
	NameFlagCinco:setText('Minotaurs')
	KillFlagCinco:setText('x50')
	CoinFlagCinco:setText('500')
	TearFlagCinco:setText('01')
	TearFlagCinco:setColor('#3088d8')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/1')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank MinotaurTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Elf')
	IconFlagSeis:setImageSize('32 32')
	IconFlagSeis:setImageOffset('15 15')
	NameFlagSeis:setText('Elf')
	KillFlagSeis:setText('x50')
	CoinFlagSeis:setText('1000')
	TearFlagSeis:setText('01')
	TearFlagSeis:setColor('#3088d8')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/1')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank ElfTask") end
	
	UmIconShop:setIcon('/images/game/other/1')
	IconShopUm:setIcon('/images/game/craft/Espingarda')
	IconShopUm:setImageSource('/images/ui/perfeito')
	IconShopUm:setTooltip(tr('Perfeita Espingarda\nDano: [70-130]'))
	ValueShopUm:setText('03')
	ValueShopUm:setColor('#3088d8')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRUShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/1')
	IconShopDois:setIcon('/images/game/craft/Rifle de Precisao')
	IconShopDois:setImageSource('/images/ui/melhorado')
	IconShopDois:setTooltip(tr('Melhorada Rifle de Precisão\nDano: [95-180]'))
	ValueShopDois:setText('05')
	ValueShopDois:setColor('#3088d8')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRUShopDois") end
	
	TresIconShop:setIcon('/images/game/other/1')
	IconShopTres:setIcon('/images/game/craft/Pistola Colt')
	IconShopTres:setImageSource('/images/ui/item')
	IconShopTres:setTooltip(tr('Pistola Colt +3\nDano: [5-15]\nSlot: [ ]'))
	ValueShopTres:setText('04')
	ValueShopTres:setColor('#3088d8')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRUShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/1')
	IconShopQuatro:setIcon('/images/game/other/Nucleo')
	IconShopQuatro:setImageSource('/images/ui/item')
	IconShopQuatro:setTooltip(tr('Núcleo de Aprimoramento\nAumenta a defesa de seus equipamentos.'))
	ValueShopQuatro:setText('06')
	ValueShopQuatro:setColor('#3088d8')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRUShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/1')
	IconShopCinco:setIcon('/images/game/craft/Mini Uzi')
	IconShopCinco:setImageSource('/images/ui/item')
	IconShopCinco:setTooltip(tr('Mini Uzi +5\nDano: [5-20]\nSlot: [ ]\nSlot: [ ]'))
	ValueShopCinco:setText('10')
	ValueShopCinco:setColor('#3088d8')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRUShopCinco") end
end
function Rank2()
	g_game.talk("!Rank RankDois")
	IconFlagUm:setImageSource('/images/game/other/Task/Dragon')
	IconFlagUm:setImageSize('64 64')
	IconFlagUm:setImageOffset('1 1')
	NameFlagUm:setText('Dragon')
	KillFlagUm:setText('x100')
	CoinFlagUm:setText('2000')
	TearFlagUm:setText('02')
	TearFlagUm:setColor('#3088d8')
	LagrimaAzulUmIcon:setIcon('/images/game/other/1')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank DragonTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Ancient_Scarab')
	IconFlagDois:setImageSize('64 64')
	IconFlagDois:setImageOffset('1 1')
	NameFlagDois:setText('Ancient Scarab')
	KillFlagDois:setText('x100')
	CoinFlagDois:setText('2650')
	TearFlagDois:setText('02')
	TearFlagDois:setColor('#3088d8')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/1')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank AncientScarabTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Bog_Raider')
	IconFlagTres:setImageSize('46 43')
	IconFlagTres:setImageOffset('10 10')
	NameFlagTres:setText('Bog Raider')
	KillFlagTres:setText('x100')
	CoinFlagTres:setText('2500')
	TearFlagTres:setText('02')
	TearFlagTres:setColor('#3088d8')
	LagrimaAzulTresIcon:setIcon('/images/game/other/1')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank BogRaiderTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Tarantula')
	IconFlagQuatro:setImageSize('46 47')
	IconFlagQuatro:setImageOffset('8 8')
	NameFlagQuatro:setText('Tarantula')
	KillFlagQuatro:setText('x100')
	CoinFlagQuatro:setText('1000')
	TearFlagQuatro:setText('02')
	TearFlagQuatro:setColor('#3088d8')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/1')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank TarantulaTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Grim_Reaper')
	IconFlagCinco:setImageSize('64 64')
	IconFlagCinco:setImageOffset('-5 -15')
	NameFlagCinco:setText('Anka')
	KillFlagCinco:setText('x5')
	CoinFlagCinco:setText('12000')
	TearFlagCinco:setText('02')
	TearFlagCinco:setColor('#3088d8')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/1')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank AnkaTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Quara_Constrictor')
	IconFlagSeis:setImageSize('64 64')
	IconFlagSeis:setImageOffset('-5 -5')
	NameFlagSeis:setText('Quaras')
	KillFlagSeis:setText('x100')
	CoinFlagSeis:setText('3000')
	TearFlagSeis:setText('02')
	TearFlagSeis:setColor('#3088d8')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/1')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank QuarasTask") end
	
	UmIconShop:setIcon('/images/game/other/1')
	IconShopUm:setIcon('/images/game/craft/Espingarda Mossberg')
	IconShopUm:setImageSource('/images/ui/melhorado')
	IconShopUm:setTooltip(tr('Melhorada Espingarda Mossberg +3\nDano: [85-195]\nSlot: [Regenerar HP]'))
	ValueShopUm:setText('23')
	ValueShopUm:setColor('#3088d8')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRDShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/1')
	IconShopDois:setIcon('/images/game/craft/Pistola Desert Eagle')
	IconShopDois:setImageSource('/images/ui/item')
	IconShopDois:setTooltip(tr('Pistola Desert Eagle +5\nDano: [90-160]\nSlot: [ ]\nSlot: [ ]'))
	ValueShopDois:setText('25')
	ValueShopDois:setColor('#3088d8')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRDShopDois") end
	
	TresIconShop:setIcon('/images/game/other/1')
	IconShopTres:setIcon('/images/game/craft/Metralhadora Colt M4A1')
	IconShopTres:setImageSource('/images/ui/item')
	IconShopTres:setTooltip(tr('Metralhadora Colt M4A1 +3\nDano: [10-35]\nSlot: [Converte HP]'))
	ValueShopTres:setText('25')
	ValueShopTres:setColor('#3088d8')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRDShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/1')
	IconShopQuatro:setIcon('/images/game/craft/Rifle Hawkeye')
	IconShopQuatro:setImageSource('/images/ui/perfeito')
	IconShopQuatro:setTooltip(tr('Perfeita Rifle Hawkeye +2\nDano: [135-250]'))
	ValueShopQuatro:setText('23')
	ValueShopQuatro:setColor('#3088d8')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRDShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/1')
	IconShopCinco:setIcon('/images/game/other/Amuleto_Restaurador_3')
	IconShopCinco:setImageSource('/images/ui/item')
	IconShopCinco:setTooltip(tr('Amuleto Restaurador +3\nRestaura +3 de HP a cada 1 segundos.'))
	ValueShopCinco:setText('20')
	ValueShopCinco:setColor('#3088d8')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRDShopCinco") end
end
function Rank3()
	g_game.talk("!Rank RankTres")
	IconFlagUm:setImageSource('/images/game/other/Task/Nightmare')
	IconFlagUm:setImageSize('64 64')
	IconFlagUm:setImageOffset('-10 -10')
	NameFlagUm:setText('Nightmare')
	KillFlagUm:setText('x200')
	CoinFlagUm:setText('6000')
	LagrimaAzulUmIcon:setIcon('/images/game/other/2')
	TearFlagUm:setText('03')
	TearFlagUm:setColor('yellow')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank NightmareTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Giant_Spider')
	IconFlagDois:setImageSize('60 61')
	IconFlagDois:setImageOffset('1 1')
	NameFlagDois:setText('Giant Spider')
	KillFlagDois:setText('x200')
	CoinFlagDois:setText('7500')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/2')
	TearFlagDois:setText('03')
	TearFlagDois:setColor('yellow')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank GiantSpiderTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Dragon_Lord')
	IconFlagTres:setImageSize('64 64')
	IconFlagTres:setImageOffset('1 1')
	NameFlagTres:setText('Dragon Lord')
	KillFlagTres:setText('x200')
	CoinFlagTres:setText('6500')
	LagrimaAzulTresIcon:setIcon('/images/game/other/2')
	TearFlagTres:setText('03')
	TearFlagTres:setColor('yellow')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank DragonLordTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Atormentador')
	IconFlagQuatro:setImageSize('64 64')
	IconFlagQuatro:setImageOffset('-10 -10')
	NameFlagQuatro:setText('Atormentador')
	KillFlagQuatro:setText('x10')
	CoinFlagQuatro:setText('35000')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/2')
	TearFlagQuatro:setText('03')
	TearFlagQuatro:setColor('yellow')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank AtormentadorTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Hero')
	IconFlagCinco:setImageSize('32 32')
	IconFlagCinco:setImageOffset('15 15')
	NameFlagCinco:setText('Hero')
	KillFlagCinco:setText('x200')
	CoinFlagCinco:setText('7000')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/2')
	TearFlagCinco:setText('03')
	TearFlagCinco:setColor('yellow')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank HeroTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Banshee')
	IconFlagSeis:setImageSize('32 32')
	IconFlagSeis:setImageOffset('15 15')
	NameFlagSeis:setText('Banshee')
	KillFlagSeis:setText('x200')
	CoinFlagSeis:setText('5000')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/2')
	TearFlagSeis:setText('03')
	TearFlagSeis:setColor('yellow')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank BansheeTask") end
	
	UmIconShop:setIcon('/images/game/other/2')
	IconShopUm:setIcon('/images/game/craft/Revolver Taurus')
	IconShopUm:setImageSource('/images/ui/melhorado')
	IconShopUm:setTooltip(tr('Melhorada Revólver Taurus +3\nDano: [105-205]\nSlot: [ ]'))
	ValueShopUm:setText('65')
	ValueShopUm:setColor('yellow')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRTShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/2')
	IconShopDois:setIcon('/images/game/craft/Fuzil Colt')
	IconShopDois:setImageSource('/images/ui/raro')
	IconShopDois:setTooltip(tr('Rara Fuzil Colt\nDano: [45-75]'))
	ValueShopDois:setText('55')
	ValueShopDois:setColor('yellow')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRTShopDois") end
	
	TresIconShop:setIcon('/images/game/other/2')
	IconShopTres:setIcon('/images/game/craft/Rifle Remington')
	IconShopTres:setImageSource('/images/ui/perfeito')
	IconShopTres:setTooltip(tr('Perfeita Rifle Remington +3\nDano: [190-340]\nSlot: [ ]'))
	ValueShopTres:setText('69')
	ValueShopTres:setColor('yellow')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRTShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/2')
	IconShopQuatro:setIcon('/images/game/craft/Soldier Helmet')
	IconShopQuatro:setImageSource('/images/ui/Perfeito')
	IconShopQuatro:setTooltip(tr('Perfeito Soldier Helmet\nArm: [16].'))
	ValueShopQuatro:setText('06')
	ValueShopQuatro:setColor('yellow')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRTShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/2')
	IconShopCinco:setIcon('/images/game/other/Amuleto_Do_Ogro_3')
	IconShopCinco:setImageSource('/images/ui/item')
	IconShopCinco:setTooltip(tr('Amuleto do Ogro +3\nProtection physical +3.'))
	ValueShopCinco:setText('45')
	ValueShopCinco:setColor('yellow')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRTShopCinco") end
end
function Rank4()
	g_game.talk("!Rank RankQuatro")
	IconFlagUm:setImageSource('/images/game/other/Task/Bukaness')
	IconFlagUm:setImageSize('64 64')
	IconFlagUm:setImageOffset('1 1')
	NameFlagUm:setText('Bukaness')
	KillFlagUm:setText('x10')
	CoinFlagUm:setText('50000')
	LagrimaAzulUmIcon:setIcon('/images/game/other/2')
	TearFlagUm:setText('04')
	TearFlagUm:setColor('yellow')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank BukanessTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Lizards')
	IconFlagDois:setImageSize('64 64')
	IconFlagDois:setImageOffset('-5 -1')
	NameFlagDois:setText('Lizards')
	KillFlagDois:setText('x300')
	CoinFlagDois:setText('10000')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/2')
	TearFlagDois:setText('04')
	TearFlagDois:setColor('yellow')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank LizardsTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Drakens')
	IconFlagTres:setImageSize('64 64')
	IconFlagTres:setImageOffset('-5 -5')
	NameFlagTres:setText('Drakens')
	KillFlagTres:setText('x300')
	CoinFlagTres:setText('15000')
	LagrimaAzulTresIcon:setIcon('/images/game/other/2')
	TearFlagTres:setText('04')
	TearFlagTres:setColor('yellow')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank DrakensTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Medusa')
	IconFlagQuatro:setImageSize('64 64')
	IconFlagQuatro:setImageOffset('-10 -10')
	NameFlagQuatro:setText('Medusa')
	KillFlagQuatro:setText('x300')
	CoinFlagQuatro:setText('12000')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/2')
	TearFlagQuatro:setText('04')
	TearFlagQuatro:setColor('yellow')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank MedusaTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Serpent_Spawn')
	IconFlagCinco:setImageSize('64 64')
	IconFlagCinco:setImageOffset('-10 -5')
	NameFlagCinco:setText('Serpent Spawn')
	KillFlagCinco:setText('x300')
	CoinFlagCinco:setText('14000')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/2')
	TearFlagCinco:setText('04')
	TearFlagCinco:setColor('yellow')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank SerpentSpawnTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Hydra')
	IconFlagSeis:setImageSize('64 64')
	IconFlagSeis:setImageOffset('1 1')
	NameFlagSeis:setText('Hydra')
	KillFlagSeis:setText('x300')
	CoinFlagSeis:setText('15000')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/2')
	TearFlagSeis:setText('04')
	TearFlagSeis:setColor('yellow')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank HydraTask") end
	
	UmIconShop:setIcon('/images/game/other/2')
	IconShopUm:setIcon('/images/game/craft/Espingarda Silver')
	IconShopUm:setImageSource('/images/ui/melhorado')
	IconShopUm:setTooltip(tr('Melhorada Espingarda Silver +3\nDano: [110-245]\nSlot: [ ]'))
	ValueShopUm:setText('90')
	ValueShopUm:setColor('yellow')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRQShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/2')
	IconShopDois:setIcon('/images/game/craft/Pistola Gerard')
	IconShopDois:setImageSource('/images/ui/perfeito')
	IconShopDois:setTooltip(tr('Perfeita Pistola Gerard\nDano: [120-270]'))
	ValueShopDois:setText('90')
	ValueShopDois:setColor('yellow')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRQShopDois") end
	
	TresIconShop:setIcon('/images/game/other/2')
	IconShopTres:setIcon('/images/game/craft/Metralhadora HK MP5 K')
	IconShopTres:setImageSource('/images/ui/raro')
	IconShopTres:setTooltip(tr('Rara Metralhadora HK MP5 K +3\nDano: [20-55]\nSlot: [Critical Damage]'))
	ValueShopTres:setText('90')
	ValueShopTres:setColor('yellow')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRQShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/2')
	IconShopQuatro:setIcon('/images/game/craft/Rifle Saffari')
	IconShopQuatro:setImageSource('/images/ui/raro')
	IconShopQuatro:setTooltip(tr('Rara Rifle Saffari +3\nDano: [195-390]\nSlot: [ ]'))
	ValueShopQuatro:setText('95')
	ValueShopQuatro:setColor('yellow')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRQShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/2')
	IconShopCinco:setIcon('/images/game/craft/Plate Armor')
	IconShopCinco:setImageSource('/images/ui/raro')
	IconShopCinco:setTooltip(tr('Rara Plate Armor\nArm: [23].'))
	ValueShopCinco:setText('70')
	ValueShopCinco:setColor('yellow')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRQShopCinco") end
end
function Rank5()
	g_game.talk("!Rank RankCinco")
	IconFlagUm:setImageSource('/images/game/other/Task/Frost_Dragon')
	IconFlagUm:setImageSize('64 64')
	IconFlagUm:setImageOffset('1 1')
	NameFlagUm:setText('Frost Dragon')
	KillFlagUm:setText('x400')
	CoinFlagUm:setText('35000')
	LagrimaAzulUmIcon:setIcon('/images/game/other/3')
	TearFlagUm:setText('05')
	TearFlagUm:setColor('red')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank FrostDragonTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Demon')
	IconFlagDois:setImageSize('64 64')
	IconFlagDois:setImageOffset('1 1')
	NameFlagDois:setText('Demon')
	KillFlagDois:setText('x400')
	CoinFlagDois:setText('37000')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/3')
	TearFlagDois:setText('05')
	TearFlagDois:setColor('red')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank DemonTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Hellspawn')
	IconFlagTres:setImageSize('32 64')
	IconFlagTres:setImageOffset('15 -2')
	NameFlagTres:setText('Hellspawn')
	KillFlagTres:setText('x400')
	CoinFlagTres:setText('32000')
	LagrimaAzulTresIcon:setIcon('/images/game/other/3')
	TearFlagTres:setText('05')
	TearFlagTres:setColor('red')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank HellspawnTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Grim_Reaper')
	IconFlagQuatro:setImageSize('64 64')
	IconFlagQuatro:setImageOffset('-15 -15')
	NameFlagQuatro:setText('Grim Reaper')
	KillFlagQuatro:setText('x400')
	CoinFlagQuatro:setText('30000')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/3')
	TearFlagQuatro:setText('05')
	TearFlagQuatro:setColor('red')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank GrimReaperTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Defiler')
	IconFlagCinco:setImageSize('62 53')
	IconFlagCinco:setImageOffset('1 1')
	NameFlagCinco:setText('Defiler')
	KillFlagCinco:setText('x400')
	CoinFlagCinco:setText('40000')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/3')
	TearFlagCinco:setText('05')
	TearFlagCinco:setColor('red')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank DefilerTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Behemoth')
	IconFlagSeis:setImageSize('64 64')
	IconFlagSeis:setImageOffset('1 1')
	NameFlagSeis:setText('Behemoth')
	KillFlagSeis:setText('x400')
	CoinFlagSeis:setText('30000')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/3')
	TearFlagSeis:setText('05')
	TearFlagSeis:setColor('red')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank BehemothTask") end
	
	UmIconShop:setIcon('/images/game/other/3')
	IconShopUm:setIcon('/images/game/craft/Pistola N7')
	IconShopUm:setImageSource('/images/ui/item')
	IconShopUm:setTooltip(tr('Pistola N7 +3\nDano: [185-355]\nSlot: [ ]'))
	ValueShopUm:setText('100')
	ValueShopUm:setColor('red')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRCShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/3')
	IconShopDois:setIcon('/images/game/craft/Metralhadora FN Scar')
	IconShopDois:setImageSource('/images/ui/perfeito')
	IconShopDois:setTooltip(tr('Perfeita Metralhadora FN Scar +3\nDano: [40-85]\nSlot: [ ]'))
	ValueShopDois:setText('120')
	ValueShopDois:setColor('red')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRCShopDois") end
	
	TresIconShop:setIcon('/images/game/other/3')
	IconShopTres:setIcon('/images/game/craft/Rifle McMillan')
	IconShopTres:setImageSource('/images/ui/melhorado')
	IconShopTres:setTooltip(tr('Melhorada Rifle McMillan +3\nDano: [230-450]\nSlot: [ ]'))
	ValueShopTres:setText('130')
	ValueShopTres:setColor('red')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRCShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/3')
	IconShopQuatro:setIcon('/images/game/craft/RPG-7')
	IconShopQuatro:setImageSource('/images/ui/item')
	IconShopQuatro:setTooltip(tr('RPG-7\nDano: [485-1025]'))
	ValueShopQuatro:setText('200')
	ValueShopQuatro:setColor('red')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRCShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/3')
	IconShopCinco:setIcon('/images/game/other/Summon_Bag_Raro')
	IconShopCinco:setImageSource('/images/ui/raro')
	IconShopCinco:setTooltip(tr('Summon Bag (Raro)\nUse para ganhar um summon de forma aleatória.'))
	ValueShopCinco:setText('25')
	ValueShopCinco:setColor('red')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRCShopCinco") end
end
function Rank6()
	g_game.talk("!Rank RankSeis")
	IconFlagUm:setImageSource('/images/game/other/Task/Hellhound')
	IconFlagUm:setImageSize('64 64')
	IconFlagUm:setImageOffset('-5 1')
	NameFlagUm:setText('Cerberus')
	KillFlagUm:setText('x5')
	CoinFlagUm:setText('75000')
	LagrimaAzulUmIcon:setIcon('/images/game/other/3')
	TearFlagUm:setText('06')
	TearFlagUm:setColor('red')
	ButtonFlagUm.onClick = function() g_game.talk("!Rank CerberusTask") end
	
	IconFlagDois:setImageSource('/images/game/other/Task/Atormentador')
	IconFlagDois:setImageSize('64 64')
	IconFlagDois:setImageOffset('-5 -10')
	NameFlagDois:setText('Dark Torturer')
	KillFlagDois:setText('x200')
	CoinFlagDois:setText('50000')
	LagrimaAzulDoisIcon:setIcon('/images/game/other/3')
	TearFlagDois:setText('06')
	TearFlagDois:setColor('red')
	ButtonFlagDois.onClick = function() g_game.talk("!Rank DarkTorturerTask") end
	
	IconFlagTres:setImageSource('/images/game/other/Task/Ghastly_Dragon')
	IconFlagTres:setImageSize('64 64')
	IconFlagTres:setImageOffset('-5 1')
	NameFlagTres:setText('Ghastly Dragon')
	KillFlagTres:setText('x200')
	CoinFlagTres:setText('50000')
	LagrimaAzulTresIcon:setIcon('/images/game/other/3')
	TearFlagTres:setText('06')
	TearFlagTres:setColor('red')
	ButtonFlagTres.onClick = function() g_game.talk("!Rank GhastlyDragonTask") end
	
	IconFlagQuatro:setImageSource('/images/game/other/Task/Hellhound')
	IconFlagQuatro:setImageSize('64 64')
	IconFlagQuatro:setImageOffset('-5 2')
	NameFlagQuatro:setText('Hellhound')
	KillFlagQuatro:setText('x200')
	CoinFlagQuatro:setText('50000')
	LagrimaAzulQuatroIcon:setIcon('/images/game/other/3')
	TearFlagQuatro:setText('06')
	TearFlagQuatro:setColor('red')
	ButtonFlagQuatro.onClick = function() g_game.talk("!Rank HellhoundTask") end
	
	IconFlagCinco:setImageSource('/images/game/other/Task/Plaguesmith')
	IconFlagCinco:setImageSize('64 64')
	IconFlagCinco:setImageOffset('-10 -15')
	NameFlagCinco:setText('Plaguesmith')
	KillFlagCinco:setText('x200')
	CoinFlagCinco:setText('50000')
	LagrimaAzulCincoIcon:setIcon('/images/game/other/3')
	TearFlagCinco:setText('06')
	TearFlagCinco:setColor('red')
	ButtonFlagCinco.onClick = function() g_game.talk("!Rank PlaguesmithTask") end
	
	IconFlagSeis:setImageSource('/images/game/other/Task/Undead_Dragon')
	IconFlagSeis:setImageSize('64 64')
	IconFlagSeis:setImageOffset('-2 -2')
	NameFlagSeis:setText('Undead Dragon')
	KillFlagSeis:setText('x200')
	CoinFlagSeis:setText('50000')
	LagrimaAzulSeisIcon:setIcon('/images/game/other/3')
	TearFlagSeis:setText('06')
	TearFlagSeis:setColor('red')
	ButtonFlagSeis.onClick = function() g_game.talk("!Rank UndeadDragonTask") end
	
	UmIconShop:setIcon('/images/game/other/3')
	IconShopUm:setIcon('/images/game/other/loja_remota')
	IconShopUm:setImageSource('/images/ui/item')
	IconShopUm:setTooltip(tr('Loja Remota (Comum)\nVenda seus itens em qualquer lugar.\n[Cargas: 200]'))
	ValueShopUm:setText('60')
	ValueShopUm:setColor('red')
	BuyShopUm.onClick = function() g_game.talk("!Rank BuyRSShopUm") end
	
	DoisIconShop:setIcon('/images/game/other/3')
	IconShopDois:setIcon('/images/game/craft/Pistola Flintlock')
	IconShopDois:setImageSource('/images/ui/melhorado')
	IconShopDois:setTooltip(tr('Melhorada Pistola Flintlock +3\nDano: [190-370]\nSlot: [ ]'))
	ValueShopDois:setText('155')
	ValueShopDois:setColor('red')
	BuyShopDois.onClick = function() g_game.talk("!Rank BuyRSShopDois") end
	
	TresIconShop:setIcon('/images/game/other/3')
	IconShopTres:setIcon('/images/game/craft/Fuzil Beretta')
	IconShopTres:setImageSource('/images/ui/raro')
	IconShopTres:setTooltip(tr('Rara Fuzil Beretta +3\nDano: [25-75]\nSlot: [ ]'))
	ValueShopTres:setText('140')
	ValueShopTres:setColor('red')
	BuyShopTres.onClick = function() g_game.talk("!Rank BuyRSShopTres") end
	
	QuatroIconShop:setIcon('/images/game/other/3')
	IconShopQuatro:setIcon('/images/game/craft/Rifle Cheytac')
	IconShopQuatro:setImageSource('/images/ui/melhorado')
	IconShopQuatro:setTooltip(tr('Melhorada Rifle Cheytac +3\nDano: [270-540]\nSlot: [ ]'))
	ValueShopQuatro:setText('150')
	ValueShopQuatro:setColor('red')
	BuyShopQuatro.onClick = function() g_game.talk("!Rank BuyRSShopQuatro") end
	
	CincoIconShop:setIcon('/images/game/other/3')
	IconShopCinco:setIcon('/images/game/other/Summon_Bag_Deluxe')
	IconShopCinco:setImageSource('/images/ui/lendario')
	IconShopCinco:setTooltip(tr('Summon Bag (Deluxe)\nUse para ganhar um summon de forma aleatória.'))
	ValueShopCinco:setText('50')
	ValueShopCinco:setColor('red')
	BuyShopCinco.onClick = function() g_game.talk("!Rank BuyRSShopCinco") end
end
