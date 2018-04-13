skillsWindow = nil
skillsButton = nil

function init()
  connect(LocalPlayer, {
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onTotalCapacityChange = onTotalCapacityChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onRegenerationChange = onRegenerationChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange
  })
  connect(g_game, {
	connect(g_game, 'onTextMessage', onAtributos),
    onGameStart = refresh,
    onGameEnd = offline
  })

  skillsButton = modules.client_topmenu.addRightGameToggleButton('skillsButton', tr('Skills') .. ' (Ctrl+S)', '/images/topbuttons/skills', toggle)
  skillsButton:setOn(true)
  skillsWindow = g_ui.loadUI('skills', modules.game_interface.getRightPanel())

  g_keyboard.bindKeyDown('Ctrl+S', toggle)

  refresh()
  skillsWindow:setup()
end

function onAtributos(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "NoVocationAtributos") then
			local t = string.explode(text, " ")
			local skillVita = skillsWindow:recursiveGetChildById('Vitalidade')
			local skillEsp = skillsWindow:recursiveGetChildById('Espiritualidade')
			local EXPoints = skillsWindow:recursiveGetChildById('Experiencia')
			local PPoints = skillsWindow:recursiveGetChildById('baseTitulo')
			local widget = skillVita:getChildById('value')
			local widgetUm = skillEsp:getChildById('value')
			local widgetDois = EXPoints:getChildById('value')
			widget:setText(''..t[2])
			widgetUm:setText(''..t[3])
			widgetDois:setText(''..t[4])
			if t[5] == "0" then PPoints:setText('Pontos de Atributo: 0') PPoints:setColor('red') else PPoints:setText('Pontos de Atributo: '..t[5]) PPoints:setColor('green') end
			local VitaPoints = skillsWindow:recursiveGetChildById('acampUm')
			local EspPoints = skillsWindow:recursiveGetChildById('acampDois')
			local CapPoints = skillsWindow:recursiveGetChildById('acampTres')
			local PotPoints = skillsWindow:recursiveGetChildById('acampQuatro')
			local EXPoints = skillsWindow:recursiveGetChildById('acampCinco')
			local DesPoints = skillsWindow:recursiveGetChildById('acampSeis')
			VitaPoints:setTooltip(tr('Vitalidade\nPontos de Atributos: --\n\nDescrição:\nAumenta seu HP Máximo'))
			VitaPoints:setIconColor('#5c5c5c')
			EspPoints:setTooltip(tr('Espiritualidade\nPontos de Atributos: --\n\nDescrição:\nAumenta seu MP Máximo'))
			EspPoints:setIconColor('#5c5c5c')
			CapPoints:setTooltip(tr('Capacidade\nPontos de Atributos: --\n\nDescrição:\nAumenta sua Capacidade Máxima'))
			CapPoints:setIconColor('#5c5c5c')
			PotPoints:setTooltip(tr('Potência\nPontos de Atributos: --\n\nDescrição:\nMelhorada o dano com granadas, habilidades de ataque\ne habilidades de cura adquiridos na\nárvore de habilidades.'))
			PotPoints:setIconColor('#5c5c5c')
			EXPoints:setTooltip(tr('Experiência\nPontos necessários: --\n\nDescrição:\nA quantidade de pontos que você\nadicionar aqui será convertido em EXP EXTRA\nao desferir dano a um monstro.'))
			EXPoints:setIconColor('#5c5c5c')
			DesPoints:setTooltip(tr('Destreza\nPontos de Atributos: --\n\nDescrição:\nDestreza é a capacidade de desviar de\nataques inimigos e não receber dano.\nAparecerá um "MISS" sobre o seu personagem\nindicando que você usou destreza.\nA destreza máxima é 150.'))
			DesPoints:setIconColor('#5c5c5c')
		end
		if string.find(text, "TankerAtributos") then
			local t = string.explode(text, " ")
			local skillVita = skillsWindow:recursiveGetChildById('Vitalidade')
			local skillEsp = skillsWindow:recursiveGetChildById('Espiritualidade')
			local EXPoints = skillsWindow:recursiveGetChildById('Experiencia')
			local PPoints = skillsWindow:recursiveGetChildById('baseTitulo')
			local widget = skillVita:getChildById('value')
			local widgetUm = skillEsp:getChildById('value')
			local widgetDois = EXPoints:getChildById('value')
			widget:setText(''..t[2])
			widgetUm:setText(''..t[3])
			widgetDois:setText(''..t[4])
			if t[5] == "0" then PPoints:setText('Pontos de Atributo: 0') PPoints:setColor('red') else PPoints:setText('Pontos de Atributo: '..t[5]) PPoints:setColor('green') end
			local VitaPoints = skillsWindow:recursiveGetChildById('acampUm')
			local EspPoints = skillsWindow:recursiveGetChildById('acampDois')
			local CapPoints = skillsWindow:recursiveGetChildById('acampTres')
			local PotPoints = skillsWindow:recursiveGetChildById('acampQuatro')
			local EXPoints = skillsWindow:recursiveGetChildById('acampCinco')
			local DesPoints = skillsWindow:recursiveGetChildById('acampSeis')
			if t[6] == "150" then DesPoints:setIconColor('#5c5c5c') DesPoints:disable() else DesPoints:setIconColor('white') DesPoints:enable() end
			VitaPoints:setTooltip(tr('Vitalidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu HP Máximo em +25'))
			VitaPoints:setIconColor('white')
			EspPoints:setTooltip(tr('Espiritualidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu MP Máximo em +10'))
			EspPoints:setIconColor('white')
			CapPoints:setTooltip(tr('Capacidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta sua Capacidade Máxima em +15'))
			CapPoints:setIconColor('white')
			PotPoints:setTooltip(tr('Potência\nPontos de Atributos: 01\n\nDescrição:\nMelhorada o dano com granadas, habilidades de ataque\ne habilidades de cura adquiridos na\nárvore de habilidades.'))
			PotPoints:setIconColor('white')
			EXPoints:setTooltip(tr('Experiência\nPontos necessários: 01\n\nDescrição:\nA quantidade de pontos que você\nadicionar aqui será convertido em EXP EXTRA\nao desferir dano a um monstro.'))
			EXPoints:setIconColor('white')
			DesPoints:setTooltip(tr('Destreza\nPontos de Atributos: 01\n\nDescrição:\nDestreza é a capacidade de desviar de\nataques inimigos e não receber dano.\nAparecerá um "MISS" sobre o seu personagem\nindicando que você usou destreza.\nA destreza máxima é 150.'))
			DesPoints:setIconColor('white')
		end
		if string.find(text, "CurandeiroAtributos") then
			local t = string.explode(text, " ")
			local skillVita = skillsWindow:recursiveGetChildById('Vitalidade')
			local skillEsp = skillsWindow:recursiveGetChildById('Espiritualidade')
			local EXPoints = skillsWindow:recursiveGetChildById('Experiencia')
			local PPoints = skillsWindow:recursiveGetChildById('baseTitulo')
			local widget = skillVita:getChildById('value')
			local widgetUm = skillEsp:getChildById('value')
			local widgetDois = EXPoints:getChildById('value')
			widget:setText(''..t[2])
			widgetUm:setText(''..t[3])
			widgetDois:setText(''..t[4])
			if t[5] == "0" then PPoints:setText('Pontos de Atributo: 0') PPoints:setColor('red') else PPoints:setText('Pontos de Atributo: '..t[5]) PPoints:setColor('green') end
			local VitaPoints = skillsWindow:recursiveGetChildById('acampUm')
			local EspPoints = skillsWindow:recursiveGetChildById('acampDois')
			local CapPoints = skillsWindow:recursiveGetChildById('acampTres')
			local PotPoints = skillsWindow:recursiveGetChildById('acampQuatro')
			local EXPoints = skillsWindow:recursiveGetChildById('acampCinco')
			local DesPoints = skillsWindow:recursiveGetChildById('acampSeis')
			if t[6] == "150" then DesPoints:setIconColor('#5c5c5c') DesPoints:disable() else DesPoints:setIconColor('white') DesPoints:enable() end
			VitaPoints:setTooltip(tr('Vitalidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu HP Máximo em +10'))
			VitaPoints:setIconColor('white')
			EspPoints:setTooltip(tr('Espiritualidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu MP Máximo em +25'))
			EspPoints:setIconColor('white')
			CapPoints:setTooltip(tr('Capacidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta sua Capacidade Máxima em +10'))
			CapPoints:setIconColor('white')
			PotPoints:setTooltip(tr('Potência\nPontos de Atributos: 01\n\nDescrição:\nMelhorada o dano com granadas, habilidades de ataque\ne habilidades de cura adquiridos na\nárvore de habilidades.'))
			PotPoints:setIconColor('white')
			EXPoints:setTooltip(tr('Experiência\nPontos necessários: 01\n\nDescrição:\nA quantidade de pontos que você\nadicionar aqui será convertido em EXP EXTRA\nao desferir dano a um monstro.'))
			EXPoints:setIconColor('white')
			DesPoints:setTooltip(tr('Destreza\nPontos de Atributos: 01\n\nDescrição:\nDestreza é a capacidade de desviar de\nataques inimigos e não receber dano.\nAparecerá um "MISS" sobre o seu personagem\nindicando que você usou destreza.\nA destreza máxima é 150.'))
			DesPoints:setIconColor('white')
		end
		if string.find(text, "EspecialistaAtributos") then
			local t = string.explode(text, " ")
			local skillVita = skillsWindow:recursiveGetChildById('Vitalidade')
			local skillEsp = skillsWindow:recursiveGetChildById('Espiritualidade')
			local EXPoints = skillsWindow:recursiveGetChildById('Experiencia')
			local PPoints = skillsWindow:recursiveGetChildById('baseTitulo')
			local widget = skillVita:getChildById('value')
			local widgetUm = skillEsp:getChildById('value')
			local widgetDois = EXPoints:getChildById('value')
			widget:setText(''..t[2])
			widgetUm:setText(''..t[3])
			widgetDois:setText(''..t[4])
			if t[5] == "0" then PPoints:setText('Pontos de Atributo: 0') PPoints:setColor('red') else PPoints:setText('Pontos de Atributo: '..t[5]) PPoints:setColor('green') end
			local VitaPoints = skillsWindow:recursiveGetChildById('acampUm')
			local EspPoints = skillsWindow:recursiveGetChildById('acampDois')
			local CapPoints = skillsWindow:recursiveGetChildById('acampTres')
			local PotPoints = skillsWindow:recursiveGetChildById('acampQuatro')
			local EXPoints = skillsWindow:recursiveGetChildById('acampCinco')
			local DesPoints = skillsWindow:recursiveGetChildById('acampSeis')
			if t[6] == "150" then DesPoints:setIconColor('#5c5c5c') DesPoints:disable() else DesPoints:setIconColor('white') DesPoints:enable() end
			VitaPoints:setTooltip(tr('Vitalidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu HP Máximo em +15'))
			VitaPoints:setIconColor('white')
			EspPoints:setTooltip(tr('Espiritualidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta seu MP Máximo em +15'))
			EspPoints:setIconColor('white')
			CapPoints:setTooltip(tr('Capacidade\nPontos de Atributos: 01\n\nDescrição:\nAumenta sua Capacidade Máxima em +20'))
			CapPoints:setIconColor('white')
			PotPoints:setTooltip(tr('Potência\nPontos de Atributos: 01\n\nDescrição:\nMelhorada o dano com granadas, habilidades de ataque\ne habilidades de cura adquiridos na\nárvore de habilidades.'))
			PotPoints:setIconColor('white')
			EXPoints:setTooltip(tr('Experiência\nPontos necessários: 01\n\nDescrição:\nA quantidade de pontos que você\nadicionar aqui será convertido em EXP EXTRA\nao desferir dano a um monstro.'))
			EXPoints:setIconColor('white')
			DesPoints:setTooltip(tr('Destreza\nPontos de Atributos: 01\n\nDescrição:\nDestreza é a capacidade de desviar de\nataques inimigos e não receber dano.\nAparecerá um "MISS" sobre o seu personagem\nindicando que você usou destreza.\nA destreza máxima é 150.'))
			DesPoints:setIconColor('white')
		end
		if string.find(text, "KinaIcon") then
			local Nation = skillsWindow:recursiveGetChildById('nation')
			Nation:setImageSource('img/Knightmare')
		elseif string.find(text, "BroodIcon") then
			local Nation = skillsWindow:recursiveGetChildById('nation')
			Nation:setImageSource('img/Brotherhood')
		elseif string.find(text, "NoneIcon") then
			local Nation = skillsWindow:recursiveGetChildById('nation')
			Nation:setImageSource('img/None')
		end
		if string.find(text, "#HonraPoints") then
			local t = string.explode(text, " ")
			local Honra = skillsWindow:recursiveGetChildById('honra')
			local widgetH = Honra:getChildById('value')
			widgetH:setText(''..t[2])
		end
	end
end

function Vitalidade()
	g_game.talk("!SkillAdd AddVitalidade")
end
function Espiritualidade()
	g_game.talk("!SkillAdd AddEspiritualidade")
end
function Capacidade()
	g_game.talk("!SkillAdd AddCapacidade")
end
function Potencia()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("!SkillAdd AddPotencia")
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Aviso'), tr("Você será deslogado do jogo para poder aplicar o efeito. Tudo bem?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function Experiencia()
	g_game.talk("!SkillAdd AddExperiencia")
end
function Destreza()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("!SkillAdd AddDestreza")
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Aviso'), tr("Você será deslogado do jogo para poder aplicar o efeito. Tudo bem?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function terminate()
  disconnect(LocalPlayer, {
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onTotalCapacityChange = onTotalCapacityChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onRegenerationChange = onRegenerationChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange
  })
  disconnect(g_game, {
	disconnect(g_game, 'onTextMessage', onAtributos),
    onGameStart = refresh,
    onGameEnd = offline
  })

  g_keyboard.unbindKeyDown('Ctrl+S')
  skillsWindow:destroy()
  skillsButton:destroy()
end

function expForLevel(level)
  return math.floor((50*level*level*level)/3 - 100*level*level + (850*level)/3 - 200)
end

function expToAdvance(currentLevel, currentExp)
  return expForLevel(currentLevel+1) - currentExp
end

function resetSkillColor(id)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor('#bbbbbb')
end

function setSkillBase(id, value, baseValue)
  if baseValue <= 0 or value < 0 then
    return
  end
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')

  if value > baseValue then
    widget:setColor('#008b00') -- green
    skill:setTooltip(baseValue .. ' +' .. (value - baseValue))
  elseif value < baseValue then
    widget:setColor('#b22222') -- red
    skill:setTooltip(baseValue .. ' ' .. (value - baseValue))
  else
    widget:setColor('#bbbbbb') -- default
    skill:removeTooltip()
  end
end

function setSkillValue(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setText(value)
end

function setSkillColor(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor(value)
end

function setSkillTooltip(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setTooltip(value)
end

function setSkillPercent(id, percent, tooltip)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('percent')
  widget:setPercent(math.floor(percent))

  if tooltip then
    widget:setTooltip(tooltip)
  end
end

function checkAlert(id, value, maxValue, threshold, greaterThan)
  if greaterThan == nil then greaterThan = false end
  local alert = false

  -- maxValue can be set to false to check value and threshold
  -- used for regeneration checking
  if type(maxValue) == 'boolean' then
    if maxValue then
      return
    end

    if greaterThan then
      if value > threshold then
        alert = true
      end
    else
      if value < threshold then
        alert = true
      end
    end
  elseif type(maxValue) == 'number' then
    if maxValue < 0 then
      return
    end

    local percent = math.floor((value / maxValue) * 100)
    if greaterThan then
      if percent > threshold then
        alert = true
      end
    else
      if percent < threshold then
        alert = true
      end
    end
  end

  if alert then
    setSkillColor(id, '#b22222') -- red
  else
    resetSkillColor(id)
  end
end

function update()
  local offlineTraining = skillsWindow:recursiveGetChildById('offlineTraining')
  if not g_game.getFeature(GameOfflineTrainingTime) then
    offlineTraining:hide()
  else
    offlineTraining:show()
  end

  local regenerationTime = skillsWindow:recursiveGetChildById('regenerationTime')
  if not g_game.getFeature(GamePlayerRegenerationTime) then
    regenerationTime:hide()
  else
    regenerationTime:show()
  end
end

function refresh()
  local player = g_game.getLocalPlayer()
  if not player then return end

  if expSpeedEvent then expSpeedEvent:cancel() end
  expSpeedEvent = cycleEvent(checkExpSpeed, 30*1000)

  onExperienceChange(player, player:getExperience())
  onLevelChange(player, player:getLevel(), player:getLevelPercent())
  onHealthChange(player, player:getHealth(), player:getMaxHealth())
  onManaChange(player, player:getMana(), player:getMaxMana())
  onSoulChange(player, player:getSoul())
  onFreeCapacityChange(player, player:getFreeCapacity())
  onStaminaChange(player, player:getStamina())
  onOfflineTrainingChange(player, player:getOfflineTrainingTime())
  onRegenerationChange(player, player:getRegenerationTime())
  onSpeedChange(player, player:getSpeed())

  for i=0,6 do
    onSkillChange(player, i, player:getSkillLevel(i), player:getSkillLevelPercent(i))
    onBaseSkillChange(player, i, player:getSkillBaseLevel(i))
  end

  update()

  local contentsPanel = skillsWindow:getChildById('contentsPanel')
  skillsWindow:setContentMinimumHeight(44)
  skillsWindow:setContentMaximumHeight(455)
end

function offline()
  if expSpeedEvent then expSpeedEvent:cancel() expSpeedEvent = nil end
end

function toggle()
  if skillsButton:isOn() then	
	g_sounds.getChannel(1):play("/sounds/CloseWindows")
    skillsWindow:close()
	skillsButton:setIcon('/images/topbuttons/skills')
    skillsButton:setOn(false)
  else
    g_sounds.getChannel(1):play("/sounds/OpenWindows")
    skillsWindow:open()
	skillsButton:setIcon('/images/topbuttons/skills_on')
    skillsButton:setOn(true)
  end
end

function checkExpSpeed()
  local player = g_game.getLocalPlayer()
  if not player then return end

  local currentExp = player:getExperience()
  local currentTime = g_clock.seconds()
  if player.lastExps ~= nil then
    player.expSpeed = (currentExp - player.lastExps[1][1])/(currentTime - player.lastExps[1][2])
    onLevelChange(player, player:getLevel(), player:getLevelPercent())
  else
    player.lastExps = {}
  end
  table.insert(player.lastExps, {currentExp, currentTime})
  if #player.lastExps > 30 then
    table.remove(player.lastExps, 1)
  end
end

function onMiniWindowClose()
  skillsButton:setOn(false)
end

function onSkillButtonClick(button)
  local percentBar = button:getChildById('percent')
  if percentBar then
    percentBar:setVisible(not percentBar:isVisible())
    if percentBar:isVisible() then
      button:setHeight(21)
    else
      button:setHeight(21 - 6)
    end
  end
end

function onExperienceChange(localPlayer, value)
  setSkillValue('experience', value)
end

function onLevelChange(localPlayer, value, percent)
  setSkillValue('level', value)
  local text = tr('You have %s percent to go', 100 - percent) .. '\n' ..
               tr('%s of experience left', expToAdvance(localPlayer:getLevel(), localPlayer:getExperience()))

  if localPlayer.expSpeed ~= nil then
     local expPerHour = math.floor(localPlayer.expSpeed * 3600)
     if expPerHour > 0 then
        local nextLevelExp = expForLevel(localPlayer:getLevel()+1)
        local hoursLeft = (nextLevelExp - localPlayer:getExperience()) / expPerHour
        local minutesLeft = math.floor((hoursLeft - math.floor(hoursLeft))*60)
        hoursLeft = math.floor(hoursLeft)
        text = text .. '\n' .. tr('%d of experience per hour', expPerHour)
        text = text .. '\n' .. tr('Next level in %d hours and %d minutes', hoursLeft, minutesLeft)
     end
  end

  setSkillPercent('level', percent, text)
end

function onHealthChange(localPlayer, health, maxHealth)
end

function onManaChange(localPlayer, mana, maxMana)
end

function onSoulChange(localPlayer, soul)
end

function onFreeCapacityChange(localPlayer, freeCapacity)
  setSkillValue('capacity', freeCapacity)
  checkAlert('capacity', freeCapacity, localPlayer:getTotalCapacity(), 20)
end

function onTotalCapacityChange(localPlayer, totalCapacity)
  checkAlert('capacity', localPlayer:getFreeCapacity(), totalCapacity, 20)
end

function onStaminaChange(localPlayer, stamina)
  local hours = math.floor(stamina / 60)
  local minutes = stamina % 60
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = math.floor(100 * stamina / (42 * 60)) -- max is 42 hours

  setSkillValue('stamina', hours .. ":" .. minutes)
  setSkillPercent('stamina', percent, tr('You have %s percent', percent))
end

function onOfflineTrainingChange(localPlayer, offlineTrainingTime)
  if not g_game.getFeature(GameOfflineTrainingTime) then
    return
  end
  local hours = math.floor(offlineTrainingTime / 60)
  local minutes = offlineTrainingTime % 60
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = 100 * offlineTrainingTime / (12 * 60) -- max is 12 hours

  setSkillValue('offlineTraining', hours .. ":" .. minutes)
  setSkillPercent('offlineTraining', percent, tr('You have %s percent', percent))
end

function onRegenerationChange(localPlayer, regenerationTime)
  if not g_game.getFeature(GamePlayerRegenerationTime) or regenerationTime < 0 then
    return
  end
  local minutes = math.floor(regenerationTime / 60)
  local seconds = regenerationTime % 60
  if seconds < 10 then
    seconds = '0' .. seconds
  end

  setSkillValue('regenerationTime', minutes .. ":" .. seconds)
  checkAlert('regenerationTime', regenerationTime, false, 300)
end

function onSpeedChange(localPlayer, speed)
  setSkillValue('speed', speed)

  onBaseSpeedChange(localPlayer, localPlayer:getBaseSpeed())
end

function onBaseSpeedChange(localPlayer, baseSpeed)
  setSkillBase('speed', localPlayer:getSpeed(), baseSpeed)
end

function onSkillChange(localPlayer, id, level, percent)
  setSkillValue('skillId' .. id, level)
  setSkillPercent('skillId' .. id, percent, tr('You have %s percent to go', 100 - percent))

  onBaseSkillChange(localPlayer, id, localPlayer:getSkillBaseLevel(id))
end

function onBaseSkillChange(localPlayer, id, baseLevel)
  setSkillBase('skillId'..id, localPlayer:getSkillLevel(id), baseLevel)
end
