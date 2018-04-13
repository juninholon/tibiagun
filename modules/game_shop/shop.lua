--[[
		Armas que não estão na lista pois deram problemas na imagem:
			• Espingarda Falcon
			• Metralhadora FN P90
			• Mini Uzi com Silenciador
			• Pistola Glock
			• Pistola KWC P226
		Existe, ao todo, 161 Itens.
]]

function init()
  connect(g_game, { onGameEnd = onGameEnd })
  connect(g_game, 'onTextMessage', CraftRefresh)

  shopWindow = g_ui.displayUI('shop')
  shopWindow:hide()

  shopTabBar = shopWindow:getChildById('shopTabBar')
  shopTabBar:setContentWidget(shopWindow:getChildById('shopTabContent'))

  helmetPanel = g_ui.loadUI('premium')
  shopTabBar:addTab('', helmetPanel, '/images/game/other/PremiumTime')

  armorPanel = g_ui.loadUI('consumiveis')
  shopTabBar:addTab('', armorPanel, '/images/game/other/Consumiveis')

  itensPanel = g_ui.loadUI('itens')
  shopTabBar:addTab('', itensPanel, '/images/game/other/Especiais')

  legsPanel = g_ui.loadUI('outfits')
  shopTabBar:addTab('', legsPanel, '/images/game/other/Outfits')
  
  bootsPanel = g_ui.loadUI('especial')
  shopTabBar:addTab('', bootsPanel, '/images/game/other/Extras')
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })
  disconnect(g_game, 'onTextMessage', CraftRefresh)

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
  addEvent(function() g_effects.fadeIn(shopWindow, 250) end)
end

function hide()
  addEvent(function() shopButton:setIcon('/images/topbuttons/shop') g_effects.fadeOut(shopWindow, 250) end)
  scheduleEvent(function() shopWindow:hide() end, 250)
  g_sounds.getChannel(1):play("/sounds/CloseWindows")
end

function toggle()
  if shopWindow:isVisible() then
    hide()
	shopButton:setIcon('/images/topbuttons/shop')
  else 
    show()
	shopButton:setIcon('/images/topbuttons/shop')
  end
end

function CraftRefresh(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "OpenShopWindow") then
		local t = string.explode(text, " ")
		  shopWindow:show()
		  shopWindow:raise()
		  shopWindow:focus()
		  g_sounds.getChannel(1):play("/sounds/OpenWindows")
		  addEvent(function() g_effects.fadeIn(shopWindow, 250) end)
		end
		Coins = shopWindow:getChildById('textCoins')
		if string.find(text, "ContVipCoins") then
		local t = string.explode(text, " ")
			if t[2] == "-1" or t[2] == "0" then
				Coins:setText('0')
			else
				Coins:setText(''..t[2])
			end
		end
	end
end

function Premium7()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop PA7Days')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar:\n\n[Premium Time - 7 Dias]"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Premium15()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop PA15Days')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar:\n\n[Premium Time - 15 Dias]"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Premium30()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop PA30Days')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar:\n\n[Premium Time - 30 Dias]"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Premium60()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop PA60Days')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar:\n\n[Premium Time - 60 Dias]"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Ancient_Rune()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop AncientRune')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 3.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Ancient Rune"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Spyreport()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Spyreport')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 1.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Spy Report"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Blue_Note()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop BlueNote')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 2.50 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Blue Note"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Nucleo()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop NucleoAprimoramento')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 10.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Nucleo de Aprimoramento?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Great_Health_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop GreatHealthPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 120.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Great Health Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Great_Mana_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop GreatManaPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 120.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Great Mana Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Great_Spirit_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop GreatSpiritPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 120.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Great Spirit Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Health_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop HealthPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 80.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Health Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Mana_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop ManaPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 80.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Mana Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Strong_Health_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop StrongHealthPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 100.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Strong Health Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Strong_Mana_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop StrongManaPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 100.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Strong Mana Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Ultimate_Health_Potion()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop UltimateHealthPotion')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 150.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Ultimate Health Potion"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Granada_de_Gelo()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop GranadadeGelo')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 100.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Granada de Gelo"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Granadas()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Granadas')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 100.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Granadas"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Granada_de_Eletrochoque()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop GranadadeEletrochoque')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 100.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Granada de Eletrochoque"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Cartucho_de_Balas_Pistola()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CartuchodeBalasPistola')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 200.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Cartucho de Balas Pistola"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Cartucho_de_Balas_Metralhadora()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CartuchodeBalasMetralhadora')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 200.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Cartucho de Balas Metralhadora"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Cartucho_de_Balas_Rifle()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CartuchodeBalasRifle')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 200.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Cartucho de Balas Rifle"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Cartucho_de_Balas_Espingarda()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CartuchodeBalasEspingarda')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 200.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Cartucho de Balas Espingarda"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Foguetes()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Foguetes')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 200.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x100] Foguetes"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Reset_Slot_Um()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop ResetSlotUm')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 0.42 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Reset Slot Um"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Reset_Slot_Dois()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop ResetSlotDois')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 0.42 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Reset Slot Dois"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Loja_Remota()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop LojaRemota')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 2.50 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Loja Remota"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Summon_Bag_Supreme()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop SummonBagSupreme')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 8.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Summon Bag [Supreme]"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Perfeito_Nucleo_de_Aprimoramento()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop PerfeitoNApri')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 1.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Perfeito Nucleo de Aprimoramento"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Backpack_of_Holding()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop BackpackHolding')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 15.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Backpack of Holding"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Brocade_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop BrocadeBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Brocade Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Camouflage_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CamouflageBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Camouflage Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Crown_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop CrownBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 17.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Crown Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Demon_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop DemonBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Demon Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Dragon_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop DragonBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 17.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Dragon Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Expedition_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop ExpeditionBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Expedition Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Fur_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop FurBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Fur Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Heart_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop HeartBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Heart Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Minotaur_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop MinotaurBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Minotaur Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Moon_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop MoonBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Moon Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Santa_Backpack()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop SantaBackpack')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você precisa de 18.00 oz para concluir a compra.\n\nDeseja realmente comprar: [x1] Santa Backpack"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Assassin()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Assassin')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Assassin Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Barbarian()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Barbarian')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Barbarian Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Beggar()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Beggar')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Beggar Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Brotherhood()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Brotherhood')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Brotherhood Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Citizen()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Citizen')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Citizen Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Demonhunter()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Demonhunter')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Demonhunter Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Druid()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Druid')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Druid Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Hunter()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Hunter')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Hunter Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Jester()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Jester')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Jester Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Knight()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Knight')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Knight Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Knightmare()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Knightmare')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Knightmare Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Mage()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Mage')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Mage Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Nobleman()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Nobleman')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Nobleman Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Norseman()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Norseman')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Norseman Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Oriental()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Oriental')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Oriental Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Pirate()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Pirate')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Pirate Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Shaman()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Shaman')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Shaman Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Summoner()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Summoner')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Summoner Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Warmaster()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Warmaster')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Warmaster Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Warrior()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Warrior')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Warrior Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Wayfarer()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Wayfarer')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Wayfarer Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Wizard()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Wizard')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Wizard Outfit Full?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Blessing()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Blessing')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: All Blessing"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Skull()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Skull')
	acceptWindow:destroy()
	acceptWindow = nil
	shopWindow:hide()
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("É necessário está sem Battler para poder deslogar.\nDeseja realmente comprar: Skull Remover?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Stamina()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop Stamina')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você será deslogado automaticamente para aplicar os efeitos.\nÉ necessário está em Protection Zone(PZ)\nDeseja realmente comprar: Full Stamina?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function NameChange()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    modules.game_namechange.show()
	acceptWindow:destroy()
	acceptWindow = nil
	shopWindow:hide()
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Você será deslogado automaticamente para aplicar os efeitos.\nÉ necessário está em Protection Zone(PZ)\nDeseja realmente mudar seu nome?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function SexChange()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!BuyShop SexChange')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Confirmar Compra'), tr("Deseja realmente comprar: Sex Change?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
