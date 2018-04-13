local audioChannel = g_sounds.getChannel(1)
local musicChannel = g_sounds.getChannel(2)

function init()
   connect(g_game, 'onTextMessage', getParams)
   connect(g_game, { onGameEnd = terminate} )
end

function getParams(mode, text)
if not g_game.isOnline() then return end

	if mode == MessageModes.Failure then
		if text:find("AtributosSounds") then
			g_sounds.getChannel(1):play("som/CraftCreat")
		end
		if text:find("LearnSSounds") then
			g_sounds.getChannel(2):play("som/skillLeaner")
		end
		if text:find("LevelUPSounds") then
			g_sounds.getChannel(2):play("som/levelup")
		end
		if text:find("AlertaSound") then
			g_sounds.getChannel(1):play("som/Alerta")
		end
		if text:find("CraftCreatSound") then
			g_sounds.getChannel(1):play("som/CraftCreat")
		end
		if text:find("SkillUPSound") then
			g_sounds.getChannel(2):play("som/skillUP")
		end
		if text:find("LoginSound") then
			g_sounds.getChannel(2):play("som/login")
		end
		if text:find("OkUpgradeSound") then
			g_sounds.getChannel(1):play("som/Upgrade_ok")
		end
		if text:find("UpgradeFailSound") then
			g_sounds.getChannel(1):play("som/Upgrade_fail")
		end
		if text:find("SellLootSound") then
			g_sounds.getChannel(1):play("som/SellLoot")
		end
		if text:find("QuestStartSound") then
			g_sounds.getChannel(1):play("som/Quest_Start")
		end
		if text:find("QuestEndSound") then
			g_sounds.getChannel(1):play("som/Quest_End")
		end
		if text:find("CancelSound") then
			g_sounds.getChannel(1):play("som/Cancel")
		end
	end
end

