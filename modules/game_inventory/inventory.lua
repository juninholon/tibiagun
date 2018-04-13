Icons = {}
Icons[PlayerStates.Poison] = { tooltip = tr('You are poisoned'), path = '/images/game/states/poisoned', id = 'condition_poisoned' }
Icons[PlayerStates.Burn] = { tooltip = tr('You are burning'), path = '/images/game/states/burning', id = 'condition_burning' }
Icons[PlayerStates.Energy] = { tooltip = tr('You are electrified'), path = '/images/game/states/electrified', id = 'condition_electrified' }
Icons[PlayerStates.Drunk] = { tooltip = tr('You are drunk'), path = '/images/game/states/drunk', id = 'condition_drunk' }
Icons[PlayerStates.ManaShield] = { tooltip = tr('You are protected by a magic shield'), path = '/images/game/states/magic_shield', id = 'condition_magic_shield' }
Icons[PlayerStates.Paralyze] = { tooltip = tr('You are paralysed'), path = '/images/game/states/slowed', id = 'condition_slowed' }
Icons[PlayerStates.Haste] = { tooltip = tr('You are hasted'), path = '/images/game/states/haste', id = 'condition_haste' }
Icons[PlayerStates.Swords] = { tooltip = tr('You may not logout during a fight'), path = '/images/game/states/logout_block', id = 'condition_logout_block' }
Icons[PlayerStates.Drowning] = { tooltip = tr('You are drowning'), path = '/images/game/states/drowning', id = 'condition_drowning' }
Icons[PlayerStates.Freezing] = { tooltip = tr('You are freezing'), path = '/images/game/states/freezing', id = 'condition_freezing' }
Icons[PlayerStates.Dazzled] = { tooltip = tr('You are dazzled'), path = '/images/game/states/dazzled', id = 'condition_dazzled' }
Icons[PlayerStates.Cursed] = { tooltip = tr('You are cursed'), path = '/images/game/states/cursed', id = 'condition_cursed' }
Icons[PlayerStates.PartyBuff] = { tooltip = tr('You are strengthened'), path = '/images/game/states/strengthened', id = 'condition_strengthened' }
Icons[PlayerStates.PzBlock] = { tooltip = tr('You may not logout or enter a protection zone'), path = '/images/game/states/protection_zone_block', id = 'condition_protection_zone_block' }
Icons[PlayerStates.Pz] = { tooltip = tr('You are within a protection zone'), path = '/images/game/states/protection_zone', id = 'condition_protection_zone' }
Icons[PlayerStates.Bleeding] = { tooltip = tr('You are bleeding'), path = '/images/game/states/bleeding', id = 'condition_bleeding' }
Icons[PlayerStates.Hungry] = { tooltip = tr('You are hungry'), path = '/images/game/states/hungry', id = 'condition_hungry' }

InventorySlotStyles = {
  [InventorySlotHead] = "HeadSlot",
  [InventorySlotNeck] = "NeckSlot",
  [InventorySlotBack] = "BackSlot",
  [InventorySlotBody] = "BodySlot",
  [InventorySlotRight] = "RightSlot",
  [InventorySlotLeft] = "LeftSlot",
  [InventorySlotLeg] = "LegSlot",
  [InventorySlotFeet] = "FeetSlot",
  [InventorySlotFinger] = "FingerSlot",
  [InventorySlotAmmo] = "AmmoSlot"
}

inventoryWindow = nil
inventoryPanel = nil
inventoryButton = nil
purseButton = nil
OtherButton = nil
healthInfoWindow = nil
healthBar = nil
manaBar = nil
experienceBar = nil
soulLabel = nil
capLabel = nil
healthTooltip = 'Your character health is %d out of %d.'
manaTooltip = 'Your character mana is %d out of %d.'
experienceTooltip = 'You have %d%% to advance to level %d.'

function init()
  connect(LocalPlayer, {
    onInventoryChange = onInventoryChange,
	onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onLevelChange = onLevelChange,
    onStatesChange = onStatesChange,
    onSoulChange = onSoulChange,
	onFreeCapacityChange = onFreeCapacityChange,
    onBlessingsChange = onBlessingsChange
  })
  connect(g_game, { onGameStart = refresh })
  connect(g_game, 'onTextMessage', getParams)
  connect(g_game, { onGameEnd = offline })

  g_keyboard.bindKeyDown('Ctrl+I', toggle)

  inventoryButton = modules.client_topmenu.addRightGameToggleButton('inventoryButton', tr('Inventory') .. ' (Ctrl+I)', '/images/topbuttons/inventory', toggle)
  inventoryButton:setOn(true)
  inventoryButton:setIcon('/images/topbuttons/inventory_on')

  inventoryWindow = g_ui.loadUI('inventory', modules.game_interface.getRightPanel())
  inventoryWindow:disableResize()
  healthBar = inventoryWindow:recursiveGetChildById('healthBar')
  manaBar = inventoryWindow:recursiveGetChildById('manaBar')
  experienceBar = inventoryWindow:recursiveGetChildById('experienceBar')
  soulLabel = inventoryWindow:recursiveGetChildById('soulLabel')
  OtherButton = inventoryWindow:recursiveGetChildById('OtherButton')
  capLabel = inventoryWindow:recursiveGetChildById('capLabel')
  inventoryPanel = inventoryWindow:getChildById('contentsPanel')

  -- load condition icons
  for k,v in pairs(Icons) do
    g_textures.preload(v.path)
  end

  if g_game.isOnline() then
    local localPlayer = g_game.getLocalPlayer()
    onHealthChange(localPlayer, localPlayer:getHealth(), localPlayer:getMaxHealth())
    onManaChange(localPlayer, localPlayer:getMana(), localPlayer:getMaxMana())
    onLevelChange(localPlayer, localPlayer:getLevel(), localPlayer:getLevelPercent())
    onStatesChange(localPlayer, localPlayer:getStates(), 0)
    onSoulChange(localPlayer, localPlayer:getSoul())
    onFreeCapacityChange(localPlayer, localPlayer:getFreeCapacity())
  end

  purseButton = inventoryPanel:getChildById('purseButton')
  local function purseFunction()
    local purse = g_game.getLocalPlayer():getInventoryItem(InventorySlotPurse)
    if purse then
      g_game.use(purse)
    end
  end
  purseButton.onClick = purseFunction

  refresh()
  inventoryWindow:setup()
end

function getParams(mode, text)
	SlotUm = inventoryWindow:recursiveGetChildById('slotum')
	SlotDois = inventoryWindow:recursiveGetChildById('slotdois')
	Damage = inventoryWindow:recursiveGetChildById('damage')
	Exp = inventoryWindow:recursiveGetChildById('exp')
	
	Helmet = inventoryWindow:recursiveGetChildById('slot1')
	Armor = inventoryWindow:recursiveGetChildById('slot4')
	Legs = inventoryWindow:recursiveGetChildById('slot7')
	Boots = inventoryWindow:recursiveGetChildById('slot8')
	Gun = inventoryWindow:recursiveGetChildById('slot6')
	
	HelmetSlotUm = inventoryWindow:recursiveGetChildById('hsum')
	HelmetSlotDois = inventoryWindow:recursiveGetChildById('hsdois')
	ArmorSlotUm = inventoryWindow:recursiveGetChildById('asum')
	ArmorSlotDois = inventoryWindow:recursiveGetChildById('asdois')
	LegsSlotUm = inventoryWindow:recursiveGetChildById('lsum')
	LegsSlotDois = inventoryWindow:recursiveGetChildById('lsdois')
	BootsSlotUm = inventoryWindow:recursiveGetChildById('bsum')
	BootsSlotDois = inventoryWindow:recursiveGetChildById('bsdois')
	
	Encantado = inventoryWindow:recursiveGetChildById('enchanted')
	if not g_game.isOnline() then
		return
	end
	
	if mode == MessageModes.Failure then
		if string.find(text, "!HelmetSlots") then
		local h = string.explode(text, " ")
			if h[2] == "0" or h[2] == "1" or h[2] == "2" or h[2] == "3" or h[2] == "4" then
				HelmetSlotUm:setImageSource('/images/game/other/equipslot')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('')
			elseif h[2] == "5" then
				HelmetSlotUm:setImageSource('/images/game/states/sp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif h[2] == "6" then
				HelmetSlotUm:setImageSource('/images/game/states/hp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif h[2] == "7" then
				HelmetSlotUm:setImageSource('/images/game/states/mp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif h[2] == "8" then
				HelmetSlotUm:setImageSource('/images/game/states/reflect')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif h[2] == "9" then
				HelmetSlotUm:setImageSource('/images/game/states/magic_shield')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif h[2] == "10" then
				HelmetSlotUm:setImageSource('/images/game/states/burning')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif h[2] == "11" then
				HelmetSlotUm:setImageSource('/images/game/states/electrified')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif h[2] == "12" then
				HelmetSlotUm:setImageSource('/images/game/states/freezing')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif h[2] == "13" then
				HelmetSlotUm:setImageSource('/images/game/states/dazzled')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif h[2] == "14" then
				HelmetSlotUm:setImageSource('/images/game/states/cursed')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif h[2] == "15" then
				HelmetSlotUm:setImageSource('/images/game/states/poisoned')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif h[2] == "16" then
				HelmetSlotUm:setImageSource('/images/game/states/sp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif h[2] == "17" then
				HelmetSlotUm:setImageSource('/images/game/states/hp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif h[2] == "18" then
				HelmetSlotUm:setImageSource('/images/game/states/mp')
				HelmetSlotUm:setImageSize('13 13')
				HelmetSlotUm:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
			if h[3] == "0" or h[3] == "1" or h[3] == "2" or h[3] == "3" or h[3] == "4" then
				HelmetSlotDois:setImageSource('/images/game/other/equipslot')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('')
			elseif h[3] == "5" then
				HelmetSlotDois:setImageSource('/images/game/states/sp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif h[3] == "6" then
				HelmetSlotDois:setImageSource('/images/game/states/hp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif h[3] == "7" then
				HelmetSlotDois:setImageSource('/images/game/states/mp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif h[3] == "8" then
				HelmetSlotDois:setImageSource('/images/game/states/reflect')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif h[3] == "9" then
				HelmetSlotDois:setImageSource('/images/game/states/magic_shield')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif h[3] == "10" then
				HelmetSlotDois:setImageSource('/images/game/states/burning')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif h[3] == "11" then
				HelmetSlotDois:setImageSource('/images/game/states/electrified')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif h[3] == "12" then
				HelmetSlotDois:setImageSource('/images/game/states/freezing')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif h[3] == "13" then
				HelmetSlotDois:setImageSource('/images/game/states/dazzled')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif h[3] == "14" then
				HelmetSlotDois:setImageSource('/images/game/states/cursed')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif h[3] == "15" then
				HelmetSlotDois:setImageSource('/images/game/states/poisoned')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif h[3] == "16" then
				HelmetSlotDois:setImageSource('/images/game/states/sp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif h[3] == "17" then
				HelmetSlotDois:setImageSource('/images/game/states/hp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif h[3] == "18" then
				HelmetSlotDois:setImageSource('/images/game/states/mp')
				HelmetSlotDois:setImageSize('13 13')
				HelmetSlotDois:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
		end
		if string.find(text, "@ArmorSlots") then
		local A = string.explode(text, " ")
			if A[2] == "0" or A[2] == "1" or A[2] == "2" or A[2] == "3" or A[2] == "4" then
				ArmorSlotUm:setImageSource('/images/game/other/equipslot')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('')
			elseif A[2] == "5" then
				ArmorSlotUm:setImageSource('/images/game/states/sp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif A[2] == "6" then
				ArmorSlotUm:setImageSource('/images/game/states/hp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif A[2] == "7" then
				ArmorSlotUm:setImageSource('/images/game/states/mp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif A[2] == "8" then
				ArmorSlotUm:setImageSource('/images/game/states/reflect')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif A[2] == "9" then
				ArmorSlotUm:setImageSource('/images/game/states/magic_shield')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif A[2] == "10" then
				ArmorSlotUm:setImageSource('/images/game/states/burning')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif A[2] == "11" then
				ArmorSlotUm:setImageSource('/images/game/states/electrified')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif A[2] == "12" then
				ArmorSlotUm:setImageSource('/images/game/states/freezing')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif A[2] == "13" then
				ArmorSlotUm:setImageSource('/images/game/states/dazzled')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif A[2] == "14" then
				ArmorSlotUm:setImageSource('/images/game/states/cursed')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif A[2] == "15" then
				ArmorSlotUm:setImageSource('/images/game/states/poisoned')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif A[2] == "16" then
				ArmorSlotUm:setImageSource('/images/game/states/sp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif A[2] == "17" then
				ArmorSlotUm:setImageSource('/images/game/states/hp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif A[2] == "18" then
				ArmorSlotUm:setImageSource('/images/game/states/mp')
				ArmorSlotUm:setImageSize('13 13')
				ArmorSlotUm:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
			if A[3] == "0" or A[3] == "1" or A[3] == "2" or A[3] == "3" or A[3] == "4" then
				ArmorSlotDois:setImageSource('/images/game/other/equipslot')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('')
			elseif A[3] == "5" then
				ArmorSlotDois:setImageSource('/images/game/states/sp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif A[3] == "6" then
				ArmorSlotDois:setImageSource('/images/game/states/hp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif A[3] == "7" then
				ArmorSlotDois:setImageSource('/images/game/states/mp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif A[3] == "8" then
				ArmorSlotDois:setImageSource('/images/game/states/reflect')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif A[3] == "9" then
				ArmorSlotDois:setImageSource('/images/game/states/magic_shield')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif A[3] == "10" then
				ArmorSlotDois:setImageSource('/images/game/states/burning')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif A[3] == "11" then
				ArmorSlotDois:setImageSource('/images/game/states/electrified')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif A[3] == "12" then
				ArmorSlotDois:setImageSource('/images/game/states/freezing')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif A[3] == "13" then
				ArmorSlotDois:setImageSource('/images/game/states/dazzled')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif A[3] == "14" then
				ArmorSlotDois:setImageSource('/images/game/states/cursed')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif A[3] == "15" then
				ArmorSlotDois:setImageSource('/images/game/states/poisoned')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif A[3] == "16" then
				ArmorSlotDois:setImageSource('/images/game/states/sp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif A[3] == "17" then
				ArmorSlotDois:setImageSource('/images/game/states/hp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif A[3] == "18" then
				ArmorSlotDois:setImageSource('/images/game/states/mp')
				ArmorSlotDois:setImageSize('13 13')
				ArmorSlotDois:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
		end
		if string.find(text, "#LegsSlots") then
		local l = string.explode(text, " ")
			if l[2] == "0" or l[2] == "1" or l[2] == "2" or l[2] == "3" or l[2] == "4" then
				LegsSlotUm:setImageSource('/images/game/other/equipslot')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('')
			elseif l[2] == "5" then
				LegsSlotUm:setImageSource('/images/game/states/sp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif l[2] == "6" then
				LegsSlotUm:setImageSource('/images/game/states/hp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif l[2] == "7" then
				LegsSlotUm:setImageSource('/images/game/states/mp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif l[2] == "8" then
				LegsSlotUm:setImageSource('/images/game/states/reflect')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif l[2] == "9" then
				LegsSlotUm:setImageSource('/images/game/states/magic_shield')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif l[2] == "10" then
				LegsSlotUm:setImageSource('/images/game/states/burning')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif l[2] == "11" then
				LegsSlotUm:setImageSource('/images/game/states/electrified')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif l[2] == "12" then
				LegsSlotUm:setImageSource('/images/game/states/freezing')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif l[2] == "13" then
				LegsSlotUm:setImageSource('/images/game/states/dazzled')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif l[2] == "14" then
				LegsSlotUm:setImageSource('/images/game/states/cursed')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif l[2] == "15" then
				LegsSlotUm:setImageSource('/images/game/states/poisoned')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif l[2] == "16" then
				LegsSlotUm:setImageSource('/images/game/states/sp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif l[2] == "17" then
				LegsSlotUm:setImageSource('/images/game/states/hp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif l[2] == "18" then
				LegsSlotUm:setImageSource('/images/game/states/mp')
				LegsSlotUm:setImageSize('13 13')
				LegsSlotUm:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
			if l[3] == "0" or l[3] == "1" or l[3] == "2" or l[3] == "3" or l[3] == "4" then
				LegsSlotDois:setImageSource('/images/game/other/equipslot')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('')
			elseif l[3] == "5" then
				LegsSlotDois:setImageSource('/images/game/states/sp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif l[3] == "6" then
				LegsSlotDois:setImageSource('/images/game/states/hp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif l[3] == "7" then
				LegsSlotDois:setImageSource('/images/game/states/mp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif l[3] == "8" then
				LegsSlotDois:setImageSource('/images/game/states/reflect')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif l[3] == "9" then
				LegsSlotDois:setImageSource('/images/game/states/magic_shield')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif l[3] == "10" then
				LegsSlotDois:setImageSource('/images/game/states/burning')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif l[3] == "11" then
				LegsSlotDois:setImageSource('/images/game/states/electrified')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif l[3] == "12" then
				LegsSlotDois:setImageSource('/images/game/states/freezing')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif l[3] == "13" then
				LegsSlotDois:setImageSource('/images/game/states/dazzled')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif l[3] == "14" then
				LegsSlotDois:setImageSource('/images/game/states/cursed')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif l[3] == "15" then
				LegsSlotDois:setImageSource('/images/game/states/poisoned')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif l[3] == "16" then
				LegsSlotDois:setImageSource('/images/game/states/sp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif l[3] == "17" then
				LegsSlotDois:setImageSource('/images/game/states/hp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif l[3] == "18" then
				LegsSlotDois:setImageSource('/images/game/states/mp')
				LegsSlotDois:setImageSize('13 13')
				LegsSlotDois:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
		end
		if string.find(text, "$BootsSlots") then
		local b = string.explode(text, " ")
			if b[2] == "0" or b[2] == "1" or b[2] == "2" or b[2] == "3" or b[2] == "4" then
				BootsSlotUm:setImageSource('/images/game/other/equipslot')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('')
			elseif b[2] == "5" then
				BootsSlotUm:setImageSource('/images/game/states/sp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif b[2] == "6" then
				BootsSlotUm:setImageSource('/images/game/states/hp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif b[2] == "7" then
				BootsSlotUm:setImageSource('/images/game/states/mp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif b[2] == "8" then
				BootsSlotUm:setImageSource('/images/game/states/reflect')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif b[2] == "9" then
				BootsSlotUm:setImageSource('/images/game/states/magic_shield')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif b[2] == "10" then
				BootsSlotUm:setImageSource('/images/game/states/burning')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif b[2] == "11" then
				BootsSlotUm:setImageSource('/images/game/states/electrified')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif b[2] == "12" then
				BootsSlotUm:setImageSource('/images/game/states/freezing')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif b[2] == "13" then
				BootsSlotUm:setImageSource('/images/game/states/dazzled')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif b[2] == "14" then
				BootsSlotUm:setImageSource('/images/game/states/cursed')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif b[2] == "15" then
				BootsSlotUm:setImageSource('/images/game/states/poisoned')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif b[2] == "16" then
				BootsSlotUm:setImageSource('/images/game/states/sp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif b[2] == "17" then
				BootsSlotUm:setImageSource('/images/game/states/hp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif b[2] == "18" then
				BootsSlotUm:setImageSource('/images/game/states/mp')
				BootsSlotUm:setImageSize('13 13')
				BootsSlotUm:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
			if b[3] == "0" or b[3] == "1" or b[3] == "2" or b[3] == "3" or b[3] == "4" then
				BootsSlotDois:setImageSource('/images/game/other/equipslot')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('')
			elseif b[3] == "5" then
				BootsSlotDois:setImageSource('/images/game/states/sp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('SP\n7% de chance de ganhar SP\nao receber um ataque.')
			elseif b[3] == "6" then
				BootsSlotDois:setImageSource('/images/game/states/hp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('HP\n7% de chance de ganhar HP\nao receber um ataque.')
			elseif b[3] == "7" then
				BootsSlotDois:setImageSource('/images/game/states/mp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('MP\n7% de chance de ganhar MP\nao receber um ataque.')
			elseif b[3] == "8" then
				BootsSlotDois:setImageSource('/images/game/states/reflect')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('REFLECT\n7% de chance de Refletir\num ataque do inimigo.')
			elseif b[3] == "9" then
				BootsSlotDois:setImageSource('/images/game/states/magic_shield')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('ABSORVER\n7% de chance de Absorver\nmetade do ataque inimigo.')				
			elseif b[3] == "10" then
				BootsSlotDois:setImageSource('/images/game/states/burning')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA FIRE\n7% de chance provocar um ataque em area do tipo FIRE.')
			elseif b[3] == "11" then
				BootsSlotDois:setImageSource('/images/game/states/electrified')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA ENERGY\n7% de chance provocar um ataque em area do tipo ENERGY.')
			elseif b[3] == "12" then
				BootsSlotDois:setImageSource('/images/game/states/freezing')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA ICE\n7% de chance provocar um ataque em area do tipo ICE.')
			elseif b[3] == "13" then
				BootsSlotDois:setImageSource('/images/game/states/dazzled')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA HOLY\n7% de chance provocar um ataque em area do tipo HOLY.')
			elseif b[3] == "14" then
				BootsSlotDois:setImageSource('/images/game/states/cursed')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA DEATH\n7% de chance provocar um ataque em area do tipo DEATH.')			
			elseif b[3] == "15" then
				BootsSlotDois:setImageSource('/images/game/states/poisoned')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('BOMBA POISON\n7% de chance provocar um ataque em area do tipo POISON.')
			elseif b[3] == "16" then
				BootsSlotDois:setImageSource('/images/game/states/sp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('REGENERAR SP\n7% de chance de ativar regeneração de SP.')
			elseif b[3] == "17" then
				BootsSlotDois:setImageSource('/images/game/states/hp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('REGENERAR HP\n7% de chance de ativar regeneração de HP.')
			elseif b[3] == "18" then
				BootsSlotDois:setImageSource('/images/game/states/mp')
				BootsSlotDois:setImageSize('13 13')
				BootsSlotDois:setTooltip('REGENERAR MP\n7% de chance de ativar regeneração de MP.')
			end
		end
		
		if string.find(text, "##BlessCheck") then
		local b = string.explode(text, " ")
		Blessing = inventoryWindow:recursiveGetChildById('blessButton')
			if b[2] == "0" then
				Blessing:setIconColor('#515151')
				Blessing:setTooltip('Blessing\nVocê não possui nenhuma Blessing ativa.\nVisite algum monge no templo para comprar uma.')
			else
				Blessing:setIconColor('white')
				Blessing:setTooltip('Blessing\nSeu personagem está abençoado!')
			end
		end
		if string.find(text, "@@BussulaCheck") then
		local bb = string.explode(text, " ")
		Bussula = inventoryWindow:recursiveGetChildById('bussulaButton')
			if bb[2] == "1" then
				Bussula:setIconColor('#515151')
				Bussula:setTooltip('Exiva [OFF]\nSeu personagem não pode ser\nrastreado pela habilidade "Exiva".\nClique para ativar.')
			else
				Bussula:setIconColor('white')
				Bussula:setTooltip('Exiva [ON]\nSeu personagem pode ser encontrado\natravés da habilidade "Exiva".\nClique para desativar.')
			end
		end
		if string.find(text, "!!PVPCheck") then
		local p = string.explode(text, " ")
		PVP = inventoryWindow:recursiveGetChildById('pvpButton')
			if p[2] == "0" then
				PVP:setIconColor('white')
				PVP:setTooltip('PVP [ON]\nSeu personagem pode atacar qualquer jogador e ser atacado.\nClique para desativar.')
			else
				PVP:setIconColor('#515151')
				PVP:setTooltip('PVP [OFF]\nVocê não pode atacar nem receber dano de nenhum jogador.\nClique para ativar.')
			end
		end
		--== SUMMONS ==--
		if string.find(text, "@#ZeSumonSlot") then
			local sss = string.explode(text, " ")
			SummonLevel = inventoryWindow:recursiveGetChildById('SummonLevel')
			SummonE = inventoryWindow:recursiveGetChildById('SummonEXP')
			SummonLevel:setText('Lv. -')
			SummonE:setText('0')
			SummonButton = inventoryWindow:recursiveGetChildById('SummonButton')
			SummonButton:setIcon('/images/ui/item')
		end
		if string.find(text, "$SumSlotEgg") then
			local sb = string.explode(text, " ")
			SummonButton = inventoryWindow:recursiveGetChildById('SummonButton')
			SummonButton:setIcon('/images/ui/Summon/'..sb[2]..'')
		end
		if string.find(text, "!!SUMLevel") then
			local sss = string.explode(text, " ")
			SummonLevel = inventoryWindow:recursiveGetChildById('SummonLevel')
			SummonLevel:setText('Lv. '..(sss[2]).. '')
		end
		if string.find(text, "SEContInv") then
			local ss = string.explode(text, " ")
			SummonE = inventoryWindow:recursiveGetChildById('SummonEXP')
			SummonE:setText((ss[2]).. '')
		end
		
		--== RARIDADE BORDERS ==--
		--== Comum | Melhorada | Perfeita | Rara | Lendaria ==--	
		if text:find("!ZH") then
			Helmet:setImageSource('/images/game/slots/head')
			HelmetSlotUm:setImageSource('/images/game/other/equipslot')
			HelmetSlotDois:setImageSource('/images/game/other/equipslot')
			HelmetSlotUm:setImageSize('13 13')
			HelmetSlotDois:setImageSize('13 13')
		end
		if text:find("#00Armor") then
			Armor:setImageSource('/images/game/slots/body')
			ArmorSlotUm:setImageSource('/images/game/other/equipslot')
			ArmorSlotDois:setImageSource('/images/game/other/equipslot')
			ArmorSlotUm:setImageSize('13 13')
			ArmorSlotDois:setImageSize('13 13')
		end
		if text:find("!!99Legs") then
			Legs:setImageSource('/images/game/slots/legs')
			LegsSlotUm:setImageSource('/images/game/other/equipslot')
			LegsSlotDois:setImageSource('/images/game/other/equipslot')
			LegsSlotUm:setImageSize('13 13')
			LegsSlotDois:setImageSize('13 13')
		end
		if text:find("$55Boots") then
			Boots:setImageSource('/images/game/slots/feet')
			BootsSlotUm:setImageSource('/images/game/other/equipslot')
			BootsSlotDois:setImageSource('/images/game/other/equipslot')
			BootsSlotUm:setImageSize('13 13')
			BootsSlotDois:setImageSize('13 13')
		end
		if text:find("$#@ZerandoASlot") then
			Gun:setImageSource('/images/game/slots/left-hand')
		end
		
		if string.find(text, "EnchantedGun") then
			local t = string.explode(text, " ")
			if t[2] == "0" then
				Encantado:setImageSource('/images/game/other/slotgun')
				Encantado:setImageSize('13 13')
				Encantado:setTooltip('')
			elseif t[2] == "1" then
				Encantado:setImageSource('/images/game/states/burning')
				Encantado:setImageSize('13 13')
				Encantado:setTooltip('Arma encantada com [FIRE]\nDisparos restantes\n['..t[3]..']')
			elseif t[2] == "2" then
				Encantado:setImageSource('/images/game/states/freezing')
				Encantado:setImageSize('13 13')
				Encantado:setTooltip('Arma encantada com [ICE]\nDisparos restantes\n['..t[3]..']')
			elseif t[2] == "3" then
				Encantado:setImageSource('/images/game/states/electrified')
				Encantado:setImageSize('13 13')
				Encantado:setTooltip('Arma encantada com [ENERGY]\nDisparos restantes\n['..t[3]..']')
			elseif t[2] == "4" then
				Encantado:setImageSource('/images/game/states/poisoned')
				Encantado:setImageSize('13 13')
				Encantado:setTooltip('Arma encantada com [EARTH]\nDisparos restantes\n['..t[3]..']')
			end
		end
		-- 10
		if text:find("&GunMelhorado") then
			Gun:setImageSource('/images/ui/melhorado')
		end
		-- 20
		if text:find("&!!GunPerfeito") then
			Gun:setImageSource('/images/ui/perfeito')
		end
		-- 30
		if text:find("&@@GunRaro") then
			Gun:setImageSource('/images/ui/raro')
		end
		-- 40
		if text:find("&##GunLendario") then
			Gun:setImageSource('/images/ui/lendario')
		end
		
		-- 10
		if text:find("@HM") then
			Helmet:setImageSource('/images/ui/melhorado')
		end
		-- 20
		if text:find("#HP") then
			Helmet:setImageSource('/images/ui/perfeito')
		end
		-- 30
		if text:find("$HR") then
			Helmet:setImageSource('/images/ui/raro')
		end
		-- 40
		if text:find("%HL") then
			Helmet:setImageSource('/images/ui/lendario')
		end
		
		-- 10
		if text:find("@@ArmorMelhorado") then
			Armor:setImageSource('/images/ui/melhorado')
		end
		-- 20
		if text:find("##ArmorPerfeito") then
			Armor:setImageSource('/images/ui/perfeito')
		end
		-- 30
		if text:find("$$ArmorRaro") then
			Armor:setImageSource('/images/ui/raro')
		end
		-- 40
		if text:find("%%ArmorLendario") then
			Armor:setImageSource('/images/ui/lendario')
		end
		
		-- 10
		if text:find("@@@MelhoradoLegs") then
			Legs:setImageSource('/images/ui/melhorado')
		end
		-- 20
		if text:find("###PerfeitoLegs") then
			Legs:setImageSource('/images/ui/perfeito')
		end
		-- 30
		if text:find("$$$RaroLegs") then
			Legs:setImageSource('/images/ui/raro')
		end
		-- 40
		if text:find("%%%LendarioLegs") then
			Legs:setImageSource('/images/ui/lendario')
		end
		
		-- 10
		if text:find("!@#$BootsM") then
			Boots:setImageSource('/images/ui/melhorado')
		end
		-- 20
		if text:find("%$#@PBoots") then
			Boots:setImageSource('/images/ui/perfeito')
		end
		-- 30
		if text:find("$#RaroBootsRaro") then
			Boots:setImageSource('/images/ui/raro')
		end
		-- 40
		if text:find("%!LenBoots") then
			Boots:setImageSource('/images/ui/lendario')
		end
		
			
		--== SLOT UM ICON ==--
		if text:find("ConverteDanoHP") then
			SlotUm:setTooltip('Converte HP\nChance de ganhar HP ao atacar um inimigo.')
			SlotUm:setIcon('/images/game/icon/Max_HP_Absorb_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("ConverteDanoMP") then
			SlotUm:setTooltip('Converte MP\nChance de ganhar MP ao atacar um inimigo.')
			SlotUm:setIcon('/images/game/icon/Max_MP_Absorb_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("StatusPoison") then
			SlotUm:setTooltip('Status Poison\nChance de causar status Poison ao oponente.')
			SlotUm:setIcon('/images/game/icon/Poison_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("StatusEnergy") then
			SlotUm:setTooltip('Status Energy\nChance de causar status Energy ao oponente.')
			SlotUm:setIcon('/images/game/icon/Energy_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("StatusFire") then
			SlotUm:setTooltip('Status Fire\nChance de causar status Fire ao oponente.')
			SlotUm:setIcon('/images/game/icon/Fire_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("StatusCursed") then
			SlotUm:setTooltip('Status Cursed\nChance de causar status Cursed ao oponente.')
			SlotUm:setIcon('/images/game/icon/Cursed_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("CriticalDamage") then
			SlotUm:setTooltip('Critical Damage\nChance de causar Dano Critical ao oponente.')
			SlotUm:setIcon('/images/game/icon/Critical_Damage_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("ParalisarAlvo") then
			SlotUm:setTooltip('Paralisar Alvo\nChance de paralisar o alvo.')
			SlotUm:setIcon('/images/game/icon/Paralise_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("AmpSkill") then
			SlotUm:setTooltip('Ampliador de Skill\nChance de aumenta sua skill de combate em +10 por 10 segundos.')
			SlotUm:setIcon('/images/game/icon/Sword_Skill_Amp_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("AmpML") then
			SlotUm:setTooltip('Ampliador de Potência\nChance de aumenta sua skill de potência em +10 por 10 segundos.')
			SlotUm:setIcon('/images/game/icon/Magic_Skill_Amp_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("HPUp") then
			SlotUm:setTooltip('Taxa de Aumento de HP\nAumenta a cura de HP ao usar poções.')
			SlotUm:setIcon('/images/game/icon/HP_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("MPUp") then
			SlotUm:setTooltip('Taxa de Aumento de MP\nAumenta a cura de MP ao usar poções.')
			SlotUm:setIcon('/images/game/icon/MP_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("DefesaUp") then
			SlotUm:setTooltip('Defesa Aprimorada\nChance de aumenta sua skill de destreza em +40 por 10 segundos.')
			SlotUm:setIcon('/images/game/icon/Defense_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("DanoMaximo") then
			SlotUm:setTooltip('Dano Maximo\nAumenta o seu Dano Maximo em +30')
			SlotUm:setIcon('/images/game/icon/Dano_Maximo_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("DanoMinimo") then
			SlotUm:setTooltip('Dano Minimo\nAumenta o seu Dano Minimo em +20')
			SlotUm:setIcon('/images/game/icon/Dano_Minimo_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("RegenerarHP") then
			SlotUm:setTooltip('Regenerar HP\nChance de ativar a rapida Regeneração de HP.')
			SlotUm:setIcon('/images/game/icon/HP_Regeneration_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("RegenerarMP") then
			SlotUm:setTooltip('Regenerar MP\nChance de ativar a rapida Regeneração de MP.')
			SlotUm:setIcon('/images/game/icon/MP_Regeneration_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("UpSkill") then
			SlotUm:setTooltip('Treinamento\nAumenta sua taxa de avanço de skill.')
			SlotUm:setIcon('/images/game/icon/Up_Skill_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("DropChance") then
			SlotUm:setTooltip('Drop Chance\nAumenta sua chance de Drop Itens.')
			SlotUm:setIcon('/images/game/icon/Drop_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Explosion") then
			SlotUm:setTooltip('Explosão Concentrada\nChance de causar uma explosão ao redor do inimigo.')
			SlotUm:setIcon('/images/game/icon/Explosion_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		
		--== SLOT DOIS ICON ==--
		if text:find("Slotconvertedanohp") then
			SlotDois:setTooltip('Converte HP\nChance de ganhar HP ao atacar um inimigo.')
			SlotDois:setIcon('/images/game/icon/Max_HP_Absorb_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotconvertedanomp") then
			SlotDois:setTooltip('Converte MP\nChance de ganhar MP ao atacar um inimigo.')
			SlotDois:setIcon('/images/game/icon/Max_MP_Absorb_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotstatuspoison") then
			SlotDois:setTooltip('Status Poison\nChance de causar status Poison ao oponente.')
			SlotDois:setIcon('/images/game/icon/Poison_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotstatusenergy") then
			SlotDois:setTooltip('Status Energy\nChance de causar status Energy ao oponente.')
			SlotDois:setIcon('/images/game/icon/Energy_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotstatusfire") then
			SlotDois:setTooltip('Status Fire\nChance de causar status Fire ao oponente.')
			SlotDois:setIcon('/images/game/icon/Fire_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotstatuscursed") then
			SlotDois:setTooltip('Status Cursed\nChance de causar status Cursed ao oponente.')
			SlotDois:setIcon('/images/game/icon/Cursed_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotcriticaldamage") then
			SlotDois:setTooltip('Critical Damage\nChance de causar Dano Critical ao oponente.')
			SlotDois:setIcon('/images/game/icon/Critical_Damage_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotparalisaralvo") then
			SlotDois:setTooltip('Paralisar Alvo\nChance de paralisar o alvo.')
			SlotDois:setIcon('/images/game/icon/Paralise_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("ASlotampskill") then
			SlotDois:setTooltip('Ampliador de Skill\nChance de aumenta sua skill de combate em +10 por 10 segundos.')
			SlotDois:setIcon('/images/game/icon/Sword_Skill_Amp_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotampml") then
			SlotDois:setTooltip('Ampliador de Potência\nChance de aumenta sua skill de potência em +10 por 10 segundos.')
			SlotDois:setIcon('/images/game/icon/Magic_Skill_Amp_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slothpup") then
			SlotDois:setTooltip('Taxa de Aumento de HP\nAumenta a cura de HP ao usar poções.')
			SlotDois:setIcon('/images/game/icon/HP_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotmpup") then
			SlotDois:setTooltip('Taxa de Aumento de MP\nAumenta a cura de MP ao usar poções.')
			SlotDois:setIcon('/images/game/icon/MP_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotdefesaup") then
			SlotDois:setTooltip('Defesa Aprimorada\nChance de aumenta sua skill de destreza em +40 por 10 segundos.')
			SlotDois:setIcon('/images/game/icon/Defense_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotdanomaximo") then
			SlotDois:setTooltip('Dano Maximo\nAumenta o seu Dano Maximo em +30')
			SlotDois:setIcon('/images/game/icon/Dano_Maximo_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotdanominimo") then
			SlotDois:setTooltip('Dano Minimo\nAumenta o seu Dano Minimo em +20')
			SlotDois:setIcon('/images/game/icon/Dano_Minimo_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotregenerarhp") then
			SlotDois:setTooltip('Regenerar HP\nChance de ativar a rapida Regeneração de HP.')
			SlotDois:setIcon('/images/game/icon/HP_Regeneration_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotregenerarmp") then
			SlotDois:setTooltip('Regenerar MP\nChance de ativar a rapida Regeneração de MP.')
			SlotDois:setIcon('/images/game/icon/MP_Regeneration_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotupskill") then
			SlotDois:setTooltip('Treinamento\nAumenta sua taxa de avanço de skill.')
			SlotDois:setIcon('/images/game/icon/Up_Skill_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotdropchance") then
			SlotDois:setTooltip('Drop Chance\nAumenta sua chance de Drop Itens.')
			SlotDois:setIcon('/images/game/icon/Drop_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotexplosion") then
			SlotDois:setTooltip('Explosão Concentrada\nChance de causar uma explosão ao redor do inimigo.')
			SlotDois:setIcon('/images/game/icon/Explosion_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		
		--== SISTEMAS ==--
		if text:find("RandomIcon") then
			SlotUm:setIcon('/images/game/icon/Random_icon')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
		end
		if text:find("Slotrandomicon") then
			SlotDois:setIcon('/images/game/icon/Random_icon')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
		end
		
		if text:find("ResetPainel") then
			SlotUm:setIcon('/images/game/icon/Vazio')
			SlotUm:setTooltip('Armas de nível 3 liberam esse slot.')
			SlotUm.onClick = function() g_game.talk("##puff$##") end
			SlotDois:setIcon('/images/game/icon/Vazio')
			SlotDois:setTooltip('Armas de nível 5 liberam esse slot.')
			Encantado:setImageSource('/images/game/other/slotgun')
			SlotDois.onClick = function() g_game.talk("##puff$##") end
			Damage:setText(' ')
			Exp:setText(' ')
		end
		
		if text:find("ResetSlot") then
			SlotUm:setIcon('/images/game/icon/Vazio')
			SlotUm:setTooltip('Armas de nível 3 liberam esse slot.')
			SlotDois:setIcon('/images/game/icon/Vazio')
			SlotDois:setTooltip('Armas de nível 5 liberam esse slot.')
		end
		if text:find("FIMSLOTUM") then
			SlotUm:setIcon('/images/game/icon/Vazio')
			SlotUm:setTooltip('Armas de nível 3 liberam esse slot.')
		end
		if text:find("ICONSLOTDOISFIM") then
			SlotDois:setIcon('/images/game/icon/Vazio')
			SlotDois:setTooltip('Armas de nível 5 liberam esse slot.')
		end
		
		--== SLOTS ==--
		if text:find("Upgrade Um") then
			SlotUm:setIcon('/images/game/icon/Clique_icon')
			SlotUm:setTooltip('Clique aqui para receber um aprimoramento de forma aleatória.')
			SlotUm.onClick = function() g_game.talk("##$randomum$##") end
		end
		if text:find("Upgrade Dois") then
			SlotDois:setIcon('/images/game/icon/Clique_icon')
			SlotDois:setTooltip('Clique aqui para receber um aprimoramento de forma aleatória.')
			SlotDois.onClick = function() g_game.talk("##$randomdois$##") end
		end
		
		--== PADRÃO ==--
		if string.find(text, "Damage") then
			local t = string.explode(text, " ")
			Damage:setText((t[2]).. '')
		end
		if string.find(text, "Exp") then
			local tt = string.explode(text, " ")
			Exp:setText((tt[2]).. '')
		end
	end
end

function terminate()
  disconnect(LocalPlayer, {
    onInventoryChange = onInventoryChange,
	onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onLevelChange = onLevelChange,
    onStatesChange = onStatesChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onBlessingsChange = onBlessingsChange
  })
  disconnect(g_game, { onGameStart = refresh })

  g_keyboard.unbindKeyDown('Ctrl+I')

  inventoryWindow:destroy()
  inventoryButton:destroy()
end

function toggleAdventurerStyle(hasBlessing)
  for slot = InventorySlotFirst, InventorySlotLast do
    local itemWidget = inventoryPanel:getChildById('slot' .. slot)
    if itemWidget then
      if hasBlessing then
        itemWidget:setBorderWidth(1)
        itemWidget:setBorderColor('#F7C80C')
      else
        itemWidget:setBorderWidth(0)
        itemWidget:setBorderColor('white')
      end
    end
  end
end

function refresh()
  local player = g_game.getLocalPlayer()
  for i = InventorySlotFirst, InventorySlotPurse do
    if g_game.isOnline() then
      onInventoryChange(player, i, player:getInventoryItem(i))
    else
      onInventoryChange(player, i, nil)
    end
    toggleAdventurerStyle(player and Bit.hasBit(player:getBlessings(), Blessings.Adventurer) or false)
  end

  purseButton:setVisible(g_game.getFeature(GamePurseSlot))
end

function toggleIcon(bitChanged)
  local content = inventoryPanel:recursiveGetChildById('conditionPanel')

  local icon = content:getChildById(Icons[bitChanged].id)
  if icon then
    icon:destroy()
  else
    icon = loadIcon(bitChanged)
    icon:setParent(content)
  end
end

function loadIcon(bitChanged)
  local icon = g_ui.createWidget('ConditionWidget', content)
  icon:setId(Icons[bitChanged].id)
  icon:setImageSource(Icons[bitChanged].path)
  icon:setTooltip(Icons[bitChanged].tooltip)
  return icon
end

function offline()
  inventoryPanel:recursiveGetChildById('conditionPanel'):destroyChildren()
end

function onHealthChange(localPlayer, health, maxHealth)
  healthBar:setText(health .. ' / ' .. maxHealth)
  healthBar:setTooltip(tr(healthTooltip, health, maxHealth))
  healthBar:setValue(health, 0, maxHealth)
end

function onManaChange(localPlayer, mana, maxMana)
  manaBar:setText(mana .. ' / ' .. maxMana)
  manaBar:setTooltip('Essa é sua barra de fome. Se ela zerar, você começará a perder HP.')
  manaBar:setValue(mana, 0, maxMana)
end

function onLevelChange(localPlayer, value, percent)
  experienceBar:setText(percent .. '%')
  experienceBar:setTooltip('Seu nivel atual: Lv. ' .. value)
  experienceBar:setPercent(percent)
end

function onSoulChange(localPlayer, soul)
		soulLabel:setText(tr('SP') .. ': ' .. soul)
end

function onFreeCapacityChange(player, freeCapacity)
  capLabel:setText(tr('Cap') .. ': ' .. freeCapacity)
end

function onStatesChange(localPlayer, now, old)
  if now == old then return end

  local bitsChanged = bit32.bxor(now, old)
  for i = 1, 32 do
    local pow = math.pow(2, i-1)
    if pow > bitsChanged then break end
    local bitChanged = bit32.band(bitsChanged, pow)
    if bitChanged ~= 0 then
      toggleIcon(bitChanged)
    end
  end
end

function toggle()
  if inventoryButton:isOn() then
    g_sounds.getChannel(1):play("/sounds/CloseWindows")
    inventoryWindow:close()
	inventoryButton:setIcon('/images/topbuttons/inventory')
    inventoryButton:setOn(false)
  else
	g_sounds.getChannel(1):play("/sounds/OpenWindows")
    inventoryWindow:open()
	inventoryButton:setIcon('/images/topbuttons/inventory_on')
    inventoryButton:setOn(true)
  end
end

function onMiniWindowClose()
  inventoryButton:setOn(false)
end

-- hooked events
function onInventoryChange(player, slot, item, oldItem)
  if slot > InventorySlotPurse then return end

  if slot == InventorySlotPurse then
    if g_game.getFeature(GamePurseSlot) then
      purseButton:setEnabled(item and true or false)
    end
    return
  end

  local itemWidget = inventoryPanel:getChildById('slot' .. slot)
  if item then
    itemWidget:setStyle('Item')
    itemWidget:setItem(item)
  else
    itemWidget:setStyle(InventorySlotStyles[slot])
    itemWidget:setItem(nil)
  end
end

function onBlessingsChange(player, blessings, oldBlessings)
  local hasAdventurerBlessing = Bit.hasBit(blessings, Blessings.Adventurer)
  if hasAdventurerBlessing ~= Bit.hasBit(oldBlessings, Blessings.Adventurer) then
    toggleAdventurerStyle(hasAdventurerBlessing)
  end
end