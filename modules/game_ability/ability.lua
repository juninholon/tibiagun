function init()
  connect(g_game, { onGameEnd = onGameEnd })
  connect(g_game, 'onTextMessage', onArena)
  
  kardWindow = g_ui.displayUI('ability')
  kardButton = modules.client_topmenu.addRightGameButton('kardButton', tr('Árvore de Habilidades'), '/images/topbuttons/ability', toggle)
  kardButton.onClick = function() g_game.talk("!SkillAdd Refresh") end
  kardButton:setOn(true)
  kardWindow:hide()
  
  Skill1 = kardWindow:recursiveGetChildById('skill1')
  Skill1.onClick = function() g_game.talk("!SkillAdd Um") end
  Skill2 = kardWindow:recursiveGetChildById('skill2')
  Skill2.onClick = function() g_game.talk("!SkillAdd Dois") end
  Skill3 = kardWindow:recursiveGetChildById('skill3')
  Skill3.onClick = function() g_game.talk("!SkillAdd Tres") end
  Skill4 = kardWindow:recursiveGetChildById('skill4')
  Skill4.onClick = function() g_game.talk("!SkillAdd Quatro") end
  Skill5 = kardWindow:recursiveGetChildById('skill5')
  Skill5.onClick = function() g_game.talk("!SkillAdd Cinco") end
  Skill6 = kardWindow:recursiveGetChildById('skill6')
  Skill6.onClick = function() g_game.talk("!SkillAdd Seis") end
  Skill7 = kardWindow:recursiveGetChildById('skill7')
  Skill7.onClick = function() g_game.talk("!SkillAdd Sete") end
  Skill8 = kardWindow:recursiveGetChildById('skill8')
  Skill8.onClick = function() g_game.talk("!SkillAdd Oito") end
  Skill9 = kardWindow:recursiveGetChildById('skill9')
  Skill9.onClick = function() g_game.talk("!SkillAdd Nove") end
  Skill10 = kardWindow:recursiveGetChildById('skill10')
  Skill10.onClick = function() g_game.talk("!SkillAdd Dez") end
  Skill11 = kardWindow:recursiveGetChildById('skill11')
  Skill11.onClick = function() g_game.talk("!SkillAdd Onze") end
  Skill12 = kardWindow:recursiveGetChildById('skill12')
  Skill12.onClick = function() g_game.talk("!SkillAdd Doze") end
  Skill13 = kardWindow:recursiveGetChildById('skill13')
  Skill13.onClick = function() g_game.talk("!SkillAdd Treze") end
  Skill14 = kardWindow:recursiveGetChildById('skill14')
  Skill14.onClick = function() g_game.talk("!SkillAdd Quatorze") end
  Skill15 = kardWindow:recursiveGetChildById('skill15')
  Skill15.onClick = function() g_game.talk("!SkillAdd Quinze") end
  Skill16 = kardWindow:recursiveGetChildById('skill16')
  Skill16.onClick = function() g_game.talk("!SkillAdd Dezesseis") end
  Skill17 = kardWindow:recursiveGetChildById('skill17')
  Skill17.onClick = function() g_game.talk("!SkillAdd Dezessete") end
  Skill18 = kardWindow:recursiveGetChildById('skill18')
  Skill18.onClick = function() g_game.talk("!SkillAdd Dezoito") end
  Skill19 = kardWindow:recursiveGetChildById('skill19')
  Skill19.onClick = function() g_game.talk("!SkillAdd Dezenove") end
  Skill20 = kardWindow:recursiveGetChildById('skill20')
  Skill20.onClick = function() g_game.talk("!SkillAdd Vinte") end
  
  umPARAdois = kardWindow:recursiveGetChildById('umPARAdois')
  umPARAcinco = kardWindow:recursiveGetChildById('umPARAcinco')
  doisPARAtres = kardWindow:recursiveGetChildById('doisPARAtres')
  doisPARAseis = kardWindow:recursiveGetChildById('doisPARAseis')
  tresPARAquatro = kardWindow:recursiveGetChildById('tresPARAquatro')
  tresPARAsete = kardWindow:recursiveGetChildById('tresPARAsete')
  quatroPARAoito = kardWindow:recursiveGetChildById('quatroPARAoito')
  cincoPARAseis = kardWindow:recursiveGetChildById('cincoPARAseis')
  cincoPARAnove = kardWindow:recursiveGetChildById('cincoPARAnove')
  seisPARAsete = kardWindow:recursiveGetChildById('seisPARAsete')
  seisPARAdez = kardWindow:recursiveGetChildById('seisPARAdez')
  setePARAoito = kardWindow:recursiveGetChildById('setePARAoito')
  setePARAonze = kardWindow:recursiveGetChildById('setePARAonze')
  oitoPARAdoze = kardWindow:recursiveGetChildById('oitoPARAdoze')
  novePARAtreze = kardWindow:recursiveGetChildById('novePARAtreze')
  novePARAdez = kardWindow:recursiveGetChildById('novePARAdez')
  dezPARAonze = kardWindow:recursiveGetChildById('dezPARAonze')
  dezPARAquatorze = kardWindow:recursiveGetChildById('dezPARAquatorze')
  onzePARAdoze = kardWindow:recursiveGetChildById('onzePARAdoze')
  onzePARAquinze = kardWindow:recursiveGetChildById('onzePARAquinze')
  dozePARAdezesseis = kardWindow:recursiveGetChildById('dozePARAdezesseis')
  trezePARAquatorze = kardWindow:recursiveGetChildById('trezePARAquatorze')
  trezePARAdezessete = kardWindow:recursiveGetChildById('trezePARAdezessete')
  quatorzePARAquinze = kardWindow:recursiveGetChildById('quatorzePARAquinze')
  quatorzePARAdezoito = kardWindow:recursiveGetChildById('quatorzePARAdezoito')
  quinzePARAdezesseis = kardWindow:recursiveGetChildById('quinzePARAdezesseis')
  quinzePARAdezenove = kardWindow:recursiveGetChildById('quinzePARAdezenove')
  dezesseisPARAvinte = kardWindow:recursiveGetChildById('dezesseisPARAvinte')
  dezessetePARAdezoito = kardWindow:recursiveGetChildById('dezessetePARAdezoito')
  dezoitoPARAdezenove = kardWindow:recursiveGetChildById('dezoitoPARAdezenove')
  dezenovePARAvinte = kardWindow:recursiveGetChildById('dezenovePARAvinte')
  Points = kardWindow:recursiveGetChildById('points')
end

function onArena(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if string.find(text, "CurSkills") then
		local t = string.explode(text, " ")
			  umPARAdois:show()
			  umPARAdois:setImageColor('white')
			  umPARAcinco:show()
			  umPARAcinco:setImageColor('white')
			  doisPARAtres:show()
			  doisPARAtres:setImageColor('white')
			  doisPARAseis:show()
			  doisPARAseis:setImageColor('white')
			  tresPARAquatro:show()
			  tresPARAquatro:setImageColor('white')
			  tresPARAsete:show()
			  tresPARAsete:setImageColor('white')
			  quatroPARAoito:show()
			  quatroPARAoito:setImageColor('white')
			  cincoPARAseis:show()
			  cincoPARAseis:setImageColor('white')
			  cincoPARAnove:show()
			  cincoPARAnove:setImageColor('white')
			  seisPARAsete:show()
			  seisPARAsete:setImageColor('white')
			  seisPARAdez:show()
			  seisPARAdez:setImageColor('white')
			  setePARAoito:show()
			  setePARAoito:setImageColor('white')
			  setePARAonze:show()
			  setePARAonze:setImageColor('white')
			  oitoPARAdoze:show()
			  oitoPARAdoze:setImageColor('white')
			  novePARAtreze:show()
			  novePARAtreze:setImageColor('white')
			  novePARAdez:show()
			  novePARAdez:setImageColor('white')
			  dezPARAonze:show()
			  dezPARAonze:setImageColor('white')
			  dezPARAquatorze:show()
			  dezPARAquatorze:setImageColor('white')
			  onzePARAdoze:show()
			  onzePARAdoze:setImageColor('white')
			  onzePARAquinze:show()
			  onzePARAquinze:setImageColor('white')
			  dozePARAdezesseis:show()
			  dozePARAdezesseis:setImageColor('white')
			  trezePARAquatorze:show()
			  trezePARAquatorze:setImageColor('white')
			  trezePARAdezessete:show()
			  trezePARAdezessete:setImageColor('white')
			  quatorzePARAquinze:show()
			  quatorzePARAquinze:setImageColor('white')
			  quatorzePARAdezoito:show()
			  quatorzePARAdezoito:setImageColor('white')
			  quinzePARAdezesseis:show()
			  quinzePARAdezesseis:setImageColor('white')
			  quinzePARAdezenove:show()
			  quinzePARAdezenove:setImageColor('white')
			  dezesseisPARAvinte:show()
			  dezesseisPARAvinte:setImageColor('white')
			  dezessetePARAdezoito:show()
			  dezessetePARAdezoito:setImageColor('white')
			  dezoitoPARAdezenove:show()
			  dezoitoPARAdezenove:setImageColor('white')
			  dezenovePARAvinte:show()
			  dezenovePARAvinte:setImageColor('white')
			  Skill8:setImageColor('white')
			  Skill8:setImageSource('img/0')
			  Skill8:setImageSize('38 38')
			  Skill8:setImageOffset('0 0')
			  Skill1:setTooltip(tr('Palavra Mágica: Exura\nMana: 15\nStatus: Free\nPontos Necessários: 0\n\nCura uma pequena quantidade de HP.'))
			  Skill2:setTooltip(tr('Palavra Mágica: Utani Hur\nMana: 30\nStatus: Free\nPontos Necessários: 0\n\nAumenta sua velocidade.'))
			  Skill3:setTooltip(tr('Palavra Mágica: Utevo Lux\nMana: 10\nStatus: Free\nPontos Necessários: 0\n\nIlumina uma pequena área ao redor do personagem.'))
			  Skill4:setTooltip(tr('Palavra Mágica: Exani Tera\nMana: 25\nStatus: Free\nPontos Necessários: 0\n\nTeleporta você para cima do buraco quando você está\nem cima de um rope spot.'))
			  Skill5:setTooltip(tr('Palavra Mágica: Exiva\nMana: 55\nStatus: Free\nPontos Necessários: 1\n\nDiz a direção em que certo jogador está, em relação a\nvocê, e dá uma ideia de distância.'))
			  Skill6:setTooltip(tr('Palavra Mágica: Utana Vid\nMana: 150\nStatus: Free\nPontos Necessários: 2\n\nDeixa você invisível por 200 segundos (3 min, 20 seg).'))
			  Skill7:setTooltip(tr('Palavra Mágica: Exani Hur\nMana: 60\nStatus: Free\nPontos Necessários: 1\n\nPermite escalar para um andar acima ou abaixo.\nDiga: "exani hur up" ou "exani hur down".'))
			  Skill8:setTooltip(tr('Palavra Mágica: Exana Ina\nMana: 150\nStatus: Free\nPontos Necessários: 1\n\nFazem as criaturas/jogadores invisíveis se tornarem visíveis novamente.'))
			  Skill9:setTooltip(tr(''))
			  Skill10:setTooltip(tr('Palavra Mágica: Utamo Vita\nMana: 65\nStatus: Free\nPontos Necessários: 2\n\nTodo dano sofrido durante o efeito desta magia\nserá reduzido de sua Mana ao invés de seu HP.'))
			  Skill11:setTooltip(tr('Palavra Mágica: Utevo Gran Lux\nMana: 50\nStatus: Free\nPontos Necessários: 2\n\nIlumina uma grande área ao redor do personagem.'))
			  Skill12:setTooltip(tr('Palavra Mágica: Exevo Ammo\nMana: 250\nStatus: Free\nPontos Necessários: 2\n\nPermite criar munição. A munição criada dependerá\nde que arma você tiver equipada.'))
			  Skill13:setTooltip(tr('Palavra Mágica: Utani Gran Hur\nMana: 60\nStatus: Free\nPontos Necessários: 2\n\nAumenta sua velocidade durante 22 segundos.'))
			  Skill14:setTooltip(tr('Palavra Mágica: Exura Gran\nMana: 100\nStatus: Free\nPontos Necessários: 2\n\nCura uma grande quantidade de HP.'))
			  Skill15:setTooltip(tr('Palavra Mágica: Exana Kor\nMana: 40\nStatus: Free\nPontos Necessários: 2\n\nRemove qualquer status negativo ativo no personagem.'))
			  Skill16:setTooltip(tr('Palavra Mágica: Exura Gran Mas Res\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nCura quem estiver em uma grande área ao redor do jogador.'))
			  Skill17:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Vis\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de ENERGY em uma grande área\nao redor do jogador.'))
			  Skill18:setTooltip(tr('Palavra Mágica: Utura\nMana: 170\nStatus: Premium\nPontos Necessários: 3\n\nAumenta a taxa de regeneração de HP por 30 segundos.'))
			  Skill19:setTooltip(tr('Palavra Mágica: Exura Sio\nMana: 100\nStatus: Free\nPontos Necessários: 3\n\nCura um jogador. Pode ser usada em você mesmo também.'))
			  Skill20:setTooltip(tr('Palavra Mágica: Utura SP\nMana: 300\nStatus: Premium\nPontos Necessários: 3\n\nAumenta a taxa de regeneração de SP por 30 segundos.'))
			  Points:setTooltip(tr('A cada nível você ganha 1 ponto de habilidade.'))
  
			if t[2] == "-1" then
				Skill1:setImageSource('img/1')
				Skill1:setImageColor('#5c5c5c')
			elseif t[2] == "1" then
				Skill1:setImageSource('img/1-1')
				Skill1:setImageColor('#909fb9')
			elseif t[2] == "2" then
				Skill1:setImageSource('img/1-1-1')
				Skill1:setImageColor('white')
				umPARAcinco:setImageColor('#38eeff')
			end
			if t[3] == "-1" then
				Skill2:setImageSource('img/2')
				Skill2:setImageColor('#5c5c5c')
			elseif t[3] == "1" then
				Skill2:setImageSource('img/2-2')
				Skill2:setImageColor('#909fb9')
			elseif t[3] == "2" then
				Skill2:setImageSource('img/2-2-2')
				Skill2:setImageColor('white')
			end
			if t[4] == "-1" then
				Skill3:setImageSource('img/8')
				Skill3:setImageColor('#5c5c5c')
			elseif t[4] == "1" then
				Skill3:setImageSource('img/8-8')
				Skill3:setImageColor('#909fb9')
			elseif t[4] == "2" then
				Skill3:setImageSource('img/8-8-8')
				Skill3:setImageColor('white')
				tresPARAsete:setImageColor('#38eeff')
			end
			if t[5] == "-1" then
				Skill4:setImageSource('img/11')
				Skill4:setImageColor('#5c5c5c')
			elseif t[5] == "1" then
				Skill4:setImageSource('img/11-11')
				Skill4:setImageColor('#909fb9')
			elseif t[5] == "2" then
				Skill4:setImageSource('img/11-11-11')
				Skill4:setImageColor('white')
				quatroPARAoito:setImageColor('#38eeff')
			end
			if t[6] == "-1" then
				Skill5:setImageSource('img/12')
				Skill5:setImageColor('#5c5c5c')
			elseif t[6] == "1" then
				Skill5:setImageSource('img/12-12')
				Skill5:setImageColor('#909fb9')
			elseif t[6] == "2" then
				Skill5:setImageSource('img/12-12-12')
				Skill5:setImageColor('white')
				cincoPARAseis:setImageColor('#38eeff')
			end
			if t[7] == "-1" then
				Skill6:setImageSource('img/25')
				Skill6:setImageColor('#5c5c5c')
			elseif t[7] == "1" then
				Skill6:setImageSource('img/25-25')
				Skill6:setImageColor('#909fb9')
			elseif t[7] == "2" then
				Skill6:setImageSource('img/25-25-25')
				Skill6:setImageColor('white')
				seisPARAdez:setImageColor('#38eeff')
			end
			if t[8] == "-1" then
				Skill7:setImageSource('img/10')
				Skill7:setImageColor('#5c5c5c')
			elseif t[8] == "1" then
				Skill7:setImageSource('img/10-10')
				Skill7:setImageColor('#909fb9')
			elseif t[8] == "2" then
				Skill7:setImageSource('img/10-10-10')
				Skill7:setImageColor('white')
				setePARAonze:setImageColor('#38eeff')
			end
			if t[9] == "-1" then
				Skill8:setImageSource('img/24')
				Skill8:setImageColor('#5c5c5c')
				Skill8:setImageSize('38 38')
				Skill8:setImageOffset('0 0')
			elseif t[9] == "1" then
				Skill8:setImageSource('img/24-24')
				Skill8:setImageColor('#909fb9')
				Skill8:setImageSize('38 38')
				Skill8:setImageOffset('0 0')
			elseif t[9] == "2" then
				Skill8:setImageSource('img/24-24-24')
				Skill8:setImageColor('white')
				Skill8:setImageSize('38 38')
				Skill8:setImageOffset('0 0')
			end
				Skill9:setImageSource('img/'..t[10])
			if t[11] == "-1" then
				Skill10:setImageSource('img/19')
				Skill10:setImageColor('#5c5c5c')
			elseif t[11] == "1" then
				Skill10:setImageSource('img/19-19')
				Skill10:setImageColor('#909fb9')
			elseif t[11] == "2" then
				Skill10:setImageSource('img/19-19-19')
				Skill10:setImageColor('white')
				dezPARAonze:setImageColor('#38eeff')
				dezPARAquatorze:setImageColor('#38eeff')
			end
			if t[12] == "-1" then
				Skill11:setImageSource('img/9')
				Skill11:setImageColor('#5c5c5c')
			elseif t[12] == "1" then
				Skill11:setImageSource('img/9-9')
				Skill11:setImageColor('#909fb9')
			elseif t[12] == "2" then
				Skill11:setImageSource('img/9-9-9')
				Skill11:setImageColor('white')
				dezPARAonze:setImageColor('#38eeff')
				onzePARAdoze:setImageColor('#38eeff')
				onzePARAquinze:setImageColor('#38eeff')
			end
			if t[13] == "-1" then
				Skill12:setImageSource('img/6')
				Skill12:setImageColor('#5c5c5c')
			elseif t[13] == "1" then
				Skill12:setImageSource('img/6-6')
				Skill12:setImageColor('#909fb9')
			elseif t[13] == "2" then
				Skill12:setImageSource('img/6-6-6')
				Skill12:setImageColor('white')
			end
			if t[14] == "-1" then
				Skill13:setImageSource('img/13')
				Skill13:setImageColor('#5c5c5c')
			elseif t[14] == "1" then
				Skill13:setImageSource('img/13-13')
				Skill13:setImageColor('#909fb9')
			elseif t[14] == "2" then
				Skill13:setImageSource('img/13-13-13')
				Skill13:setImageColor('white')
				trezePARAdezessete:setImageColor('#38eeff')
			end
			if t[15] == "-1" then
				Skill14:setImageSource('img/20')
				Skill14:setImageColor('#5c5c5c')
			elseif t[15] == "1" then
				Skill14:setImageSource('img/20-20')
				Skill14:setImageColor('#909fb9')
			elseif t[15] == "2" then
				Skill14:setImageSource('img/20-20-20')
				Skill14:setImageColor('white')
				trezePARAquatorze:setImageColor('#38eeff')
			end
			if t[16] == "-1" then
				Skill15:setImageSource('img/7')
				Skill15:setImageColor('#5c5c5c')
			elseif t[16] == "1" then
				Skill15:setImageSource('img/7-7')
				Skill15:setImageColor('#909fb9')
			elseif t[16] == "2" then
				Skill15:setImageSource('img/7-7-7')
				Skill15:setImageColor('white')
				quinzePARAdezesseis:setImageColor('#38eeff')
				quinzePARAdezenove:setImageColor('#38eeff')
			end
			if t[17] == "-1" then
				Skill16:setImageSource('img/22')
				Skill16:setImageColor('#5c5c5c')
			elseif t[17] == "1" then
				Skill16:setImageSource('img/22-22')
				Skill16:setImageColor('#909fb9')
			elseif t[17] == "2" then
				Skill16:setImageSource('img/22-22-22')
				Skill16:setImageColor('white')
				dezesseisPARAvinte:setImageColor('#38eeff')
			end
			if t[18] == "-1" then
				Skill17:setImageSource('img/26')
				Skill17:setImageColor('#5c5c5c')
			elseif t[18] == "1" then
				Skill17:setImageSource('img/26-26')
				Skill17:setImageColor('#909fb9')
			elseif t[18] == "2" then
				Skill17:setImageSource('img/26-26-26')
				Skill17:setImageColor('white')
				dezessetePARAdezoito:setImageColor('#38eeff')
			end
			if t[19] == "-1" then
				Skill18:setImageSource('img/23')
				Skill18:setImageColor('#5c5c5c')
			elseif t[19] == "1" then
				Skill18:setImageSource('img/23-23')
				Skill18:setImageColor('#909fb9')
			elseif t[19] == "2" then
				Skill18:setImageSource('img/23-23-23')
				Skill18:setImageColor('white')
			end
			if t[20] == "-1" then
				Skill19:setImageSource('img/21')
				Skill19:setImageColor('#5c5c5c')
			elseif t[20] == "1" then
				Skill19:setImageSource('img/21-21')
				Skill19:setImageColor('#909fb9')
			elseif t[20] == "2" then
				Skill19:setImageSource('img/21-21-21')
				Skill19:setImageColor('white')
			end
			if t[21] == "-1" then
				Skill20:setImageSource('img/27')
				Skill20:setImageColor('#5c5c5c')
			elseif t[21] == "1" then
				Skill20:setImageSource('img/27-27')
				Skill20:setImageColor('#909fb9')
			elseif t[21] == "2" then
				Skill20:setImageSource('img/27-27-27')
				Skill20:setImageColor('white')
			end
			if t[22] == "-1" or t[22] == "0" then
				Points:setText('Pontos de Habilidade: 0')
				Points:setColor('red')
			else
				Points:setText('Pontos de Habilidade: '..t[22])
				Points:setColor('green')
			end
			
			umPARAdois:hide()
			doisPARAtres:hide()
			doisPARAseis:hide()
			tresPARAquatro:hide()
			cincoPARAnove:hide()
			seisPARAsete:hide()
			setePARAoito:hide()
			oitoPARAdoze:hide()
			novePARAdez:hide()
			novePARAtreze:hide()
			dozePARAdezesseis:hide()
			quatorzePARAquinze:hide()
			quatorzePARAdezoito:hide()
			dezoitoPARAdezenove:hide()
			dezenovePARAvinte:hide()
		end
		if string.find(text, "EspSkills") then
		local t = string.explode(text, " ")
			  umPARAdois:show()
			  umPARAdois:setImageColor('white')
			  umPARAcinco:show()
			  umPARAcinco:setImageColor('white')
			  doisPARAtres:show()
			  doisPARAtres:setImageColor('white')
			  doisPARAseis:show()
			  doisPARAseis:setImageColor('white')
			  tresPARAquatro:show()
			  tresPARAquatro:setImageColor('white')
			  tresPARAsete:show()
			  tresPARAsete:setImageColor('white')
			  quatroPARAoito:show()
			  quatroPARAoito:setImageColor('white')
			  cincoPARAseis:show()
			  cincoPARAseis:setImageColor('white')
			  cincoPARAnove:show()
			  cincoPARAnove:setImageColor('white')
			  seisPARAsete:show()
			  seisPARAsete:setImageColor('white')
			  seisPARAdez:show()
			  seisPARAdez:setImageColor('white')
			  setePARAoito:show()
			  setePARAoito:setImageColor('white')
			  setePARAonze:show()
			  setePARAonze:setImageColor('white')
			  oitoPARAdoze:show()
			  oitoPARAdoze:setImageColor('white')
			  novePARAtreze:show()
			  novePARAtreze:setImageColor('white')
			  novePARAdez:show()
			  novePARAdez:setImageColor('white')
			  dezPARAonze:show()
			  dezPARAonze:setImageColor('white')
			  dezPARAquatorze:show()
			  dezPARAquatorze:setImageColor('white')
			  onzePARAdoze:show()
			  onzePARAdoze:setImageColor('white')
			  onzePARAquinze:show()
			  onzePARAquinze:setImageColor('white')
			  dozePARAdezesseis:show()
			  dozePARAdezesseis:setImageColor('white')
			  trezePARAquatorze:show()
			  trezePARAquatorze:setImageColor('white')
			  trezePARAdezessete:show()
			  trezePARAdezessete:setImageColor('white')
			  quatorzePARAquinze:show()
			  quatorzePARAquinze:setImageColor('white')
			  quatorzePARAdezoito:show()
			  quatorzePARAdezoito:setImageColor('white')
			  quinzePARAdezesseis:show()
			  quinzePARAdezesseis:setImageColor('white')
			  quinzePARAdezenove:show()
			  quinzePARAdezenove:setImageColor('white')
			  dezesseisPARAvinte:show()
			  dezesseisPARAvinte:setImageColor('white')
			  dezessetePARAdezoito:show()
			  dezessetePARAdezoito:setImageColor('white')
			  dezoitoPARAdezenove:show()
			  dezoitoPARAdezenove:setImageColor('white')
			  dezenovePARAvinte:show()
			  dezenovePARAvinte:setImageColor('white')
			  Skill8:setImageColor('white')
			  Skill8:setImageSource('img/0')
			  Skill8:setImageSize('38 38')
			  Skill8:setImageOffset('0 0')
			  Skill1:setTooltip(tr('Palavra Mágica: Exura\nMana: 15\nStatus: Free\nPontos Necessários: 0\n\nCura uma pequena quantidade de HP.'))
			  Skill2:setTooltip(tr(''))
			  Skill3:setTooltip(tr(''))
			  Skill4:setTooltip(tr('Palavra Mágica: Utevo Lux\nMana: 10\nStatus: Free\nPontos Necessários: 0\n\nIlumina uma pequena área ao redor do personagem.'))
			  Skill5:setTooltip(tr('Palavra Mágica: Exana Kor\nMana: 40\nStatus: Free\nPontos Necessários: 1\n\nRemove qualquer status negativo ativo no personagem.'))
			  Skill6:setTooltip(tr('Palavra Mágica: Exani Tera\nMana: 25\nStatus: Free\nPontos Necessários: 2\n\nTeleporta você para cima do buraco quando você está\nem cima de um rope spot.'))
			  Skill7:setTooltip(tr('Palavra Mágica: Utani Hur\nMana: 30\nStatus: Free\nPontos Necessários: 2\n\nAumenta sua velocidade.'))
			  Skill8:setTooltip(tr('Palavra Mágica: Exiva\nMana: 55\nStatus: Free\nPontos Necessários: 1\n\nDiz a direção em que certo jogador está, em relação a\nvocê, e dá uma ideia de distância.'))
			  Skill9:setTooltip(tr('Palavra Mágica: : Exori Con Drunk\nMana: 85\nStatus: Free\nPontos Necessários: 1\n\nDeixa o alvo bêbado por alguns segundos.'))
			  Skill10:setTooltip(tr('Palavra Mágica: Utamo Vita\nMana: 65\nStatus: Free\nPontos Necessários: 2\n\nTodo dano sofrido durante o efeito desta magia será reduzido de sua Mana ao invés de seu HP.'))
			  Skill11:setTooltip(tr('Palavra Mágica: Exani Hur\nMana: 60\nStatus: Free\nPontos Necessários: 2\n\nPermite escalar para um andar acima ou abaixo.\nDiga: "exani hur up" ou "exani hur down".'))
			  Skill12:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Tera\nMana: 200\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de POISON em uma área\nao redor do jogador.'))
			  Skill13:setTooltip(tr('Palavra Mágica: Exevo Ammo\nMana: 250\nStatus: Free\nPontos Necessários: 2\n\nPermite criar munição. A munição criada dependerá\nde que arma você tiver equipada.'))
			  Skill14:setTooltip(tr('Palavra Mágica: Utevo Gran Lux\nMana: 50\nStatus: Free\nPontos Necessários: 1\n\nIlumina uma grande área ao redor do personagem.'))
			  Skill15:setTooltip(tr('Palavra Mágica: Utani Con\nMana: 130\nStatus: Free\nPontos Necessários: 2\n\nEmpurra os inimigos ao seu redor para longe de você.'))
			  Skill16:setTooltip(tr(''))
			  Skill17:setTooltip(tr(''))
			  Skill18:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Mort\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de DEATH em uma área\nao redor do jogador.'))
			  Skill19:setTooltip(tr('Palavra Mágica: Exori Con Param\nMana: 200\nStatus: Premium\nPontos Necessários: 2\n\nParaliza vários inimigos ao redor do alvo por alguns segundos.'))
			  Skill20:setTooltip(tr('Palavra Mágica: Utamo Res Vita\nMana: 100\nStatus: Premium\nPontos Necessários: 3\n\nRefleti uma parte do dano e devolve para o inimigo.'))
			  Points:setTooltip(tr('A cada nível você ganha 1 ponto de habilidade.'))
				
			if t[2] == "-1" then
				Skill1:setImageSource('img/1')
				Skill1:setImageColor('#5c5c5c')
			elseif t[2] == "1" then
				Skill1:setImageSource('img/1-1')
				Skill1:setImageColor('#909fb9')
			elseif t[2] == "2" then
				Skill1:setImageSource('img/1-1-1')
				Skill1:setImageColor('white')
				umPARAcinco:setImageColor('#38eeff')
			end
			Skill2:setImageSource('img/'..t[3])
			Skill3:setImageSource('img/'..t[4])
			if t[5] == "-1" then
				Skill4:setImageSource('img/8')
				Skill4:setImageColor('#5c5c5c')
			elseif t[5] == "1" then
				Skill4:setImageSource('img/8-8')
				Skill4:setImageColor('#909fb9')
			elseif t[5] == "2" then
				Skill4:setImageSource('img/8-8-8')
				Skill4:setImageColor('white')
				quatroPARAoito:setImageColor('#38eeff')
			end
			if t[6] == "-1" then
				Skill5:setImageSource('img/7')
				Skill5:setImageColor('#5c5c5c')
			elseif t[6] == "1" then
				Skill5:setImageSource('img/7-7')
				Skill5:setImageColor('#909fb9')
			elseif t[6] == "2" then
				Skill5:setImageSource('img/7-7-7')
				Skill5:setImageColor('white')
				cincoPARAseis:setImageColor('#38eeff')
			end
			if t[7] == "-1" then
				Skill6:setImageSource('img/11')
				Skill6:setImageColor('#5c5c5c')
			elseif t[7] == "1" then
				Skill6:setImageSource('img/11-11')
				Skill6:setImageColor('#909fb9')
			elseif t[7] == "2" then
				Skill6:setImageSource('img/11-11-11')
				Skill6:setImageColor('white')
				seisPARAsete:setImageColor('#38eeff')
				seisPARAdez:setImageColor('#38eeff')
			end
			if t[8] == "-1" then
				Skill7:setImageSource('img/2')
				Skill7:setImageColor('#5c5c5c')
			elseif t[8] == "1" then
				Skill7:setImageSource('img/2-2')
				Skill7:setImageColor('#909fb9')
			elseif t[8] == "2" then
				Skill7:setImageSource('img/2-2-2')
				Skill7:setImageColor('white')
				setePARAoito:setImageColor('#38eeff')
			end
			if t[9] == "-1" then
				Skill8:setImageSource('img/12')
				Skill8:setImageColor('#5c5c5c')
			elseif t[9] == "1" then
				Skill8:setImageSource('img/12-12')
				Skill8:setImageColor('#909fb9')
			elseif t[9] == "2" then
				Skill8:setImageSource('img/12-12-12')
				Skill8:setImageColor('white')
				setePARAoito:setImageColor('#38eeff')
			end
			if t[10] == "-1" then
				Skill9:setImageSource('img/18')
				Skill9:setImageColor('#5c5c5c')
			elseif t[10] == "1" then
				Skill9:setImageSource('img/18-18')
				Skill9:setImageColor('#909fb9')
			elseif t[10] == "2" then
				Skill9:setImageSource('img/18-18-18')
				Skill9:setImageColor('white')
				novePARAdez:setImageColor('#38eeff')
				novePARAtreze:setImageColor('#38eeff')
			end
			if t[11] == "-1" then
				Skill10:setImageSource('img/19')
				Skill10:setImageColor('#5c5c5c')
			elseif t[11] == "1" then
				Skill10:setImageSource('img/19-19')
				Skill10:setImageColor('#909fb9')
			elseif t[11] == "2" then
				Skill10:setImageSource('img/19-19-19')
				Skill10:setImageColor('white')
				novePARAdez:setImageColor('#38eeff')
				dezPARAquatorze:setImageColor('#38eeff')
			end
			if t[12] == "-1" then
				Skill11:setImageSource('img/10')
				Skill11:setImageColor('#5c5c5c')
			elseif t[12] == "1" then
				Skill11:setImageSource('img/10-10')
				Skill11:setImageColor('#909fb9')
			elseif t[12] == "2" then
				Skill11:setImageSource('img/10-10-10')
				Skill11:setImageColor('white')
				onzePARAdoze:setImageColor('#38eeff')
				onzePARAquinze:setImageColor('#38eeff')
			end
			if t[13] == "-1" then
				Skill12:setImageSource('img/17')
				Skill12:setImageColor('#5c5c5c')
			elseif t[13] == "1" then
				Skill12:setImageSource('img/17-17')
				Skill12:setImageColor('#909fb9')
			elseif t[13] == "2" then
				Skill12:setImageSource('img/17-17-17')
				Skill12:setImageColor('white')
			end
			if t[14] == "-1" then
				Skill13:setImageSource('img/6')
				Skill13:setImageColor('#5c5c5c')
			elseif t[14] == "1" then
				Skill13:setImageSource('img/6-6')
				Skill13:setImageColor('#909fb9')
			elseif t[14] == "2" then
				Skill13:setImageSource('img/6-6-6')
				Skill13:setImageColor('white')
			end
			if t[15] == "-1" then
				Skill14:setImageSource('img/9')
				Skill14:setImageColor('#5c5c5c')
			elseif t[15] == "1" then
				Skill14:setImageSource('img/9-9')
				Skill14:setImageColor('#909fb9')
			elseif t[15] == "2" then
				Skill14:setImageSource('img/9-9-9')
				Skill14:setImageColor('white')
				quatorzePARAquinze:setImageColor('#38eeff')
			end
			if t[16] == "-1" then
				Skill15:setImageSource('img/28')
				Skill15:setImageColor('#5c5c5c')
			elseif t[16] == "1" then
				Skill15:setImageSource('img/28-28')
				Skill15:setImageColor('#909fb9')
			elseif t[16] == "2" then
				Skill15:setImageSource('img/28-28-28')
				Skill15:setImageColor('white')
				quinzePARAdezenove:setImageColor('#38eeff')
				onzePARAquinze:setImageColor('#38eeff')
			end
			Skill16:setImageSource('img/'..t[17])
			Skill17:setImageSource('img/'..t[18])
			if t[19] == "-1" then
				Skill18:setImageSource('img/16')
				Skill18:setImageColor('#5c5c5c')
			elseif t[19] == "1" then
				Skill18:setImageSource('img/16-16')
				Skill18:setImageColor('#909fb9')
			elseif t[19] == "2" then
				Skill18:setImageSource('img/16-16-16')
				Skill18:setImageColor('white')
			end
			if t[20] == "-1" then
				Skill19:setImageSource('img/29')
				Skill19:setImageColor('#5c5c5c')
			elseif t[20] == "1" then
				Skill19:setImageSource('img/29-29')
				Skill19:setImageColor('#909fb9')
			elseif t[20] == "2" then
				Skill19:setImageSource('img/29-29-29')
				Skill19:setImageColor('white')
				dezoitoPARAdezenove:setImageColor('#38eeff')
				dezenovePARAvinte:setImageColor('#38eeff')
			end
			if t[21] == "-1" then
				Skill20:setImageSource('img/30')
				Skill20:setImageColor('#5c5c5c')
			elseif t[21] == "1" then
				Skill20:setImageSource('img/30-30')
				Skill20:setImageColor('#909fb9')
			elseif t[21] == "2" then
				Skill20:setImageSource('img/30-30-30')
				Skill20:setImageColor('white')
			end
			if t[22] == "-1" or t[22] == "0" then
				Points:setText('Pontos de Habilidade: 0')
				Points:setColor('red')
			else
				Points:setText('Pontos de Habilidade: '..t[22])
				Points:setColor('green')
			end
			
			umPARAdois:hide()
			doisPARAtres:hide()
			doisPARAseis:hide()
			tresPARAquatro:hide()
			tresPARAsete:hide()
			cincoPARAnove:hide()
			setePARAonze:hide()
			oitoPARAdoze:hide()
			dezPARAonze:hide()
			dozePARAdezesseis:hide()
			trezePARAquatorze:hide()
			trezePARAdezessete:hide()
			quatorzePARAdezoito:hide()
			quinzePARAdezesseis:hide()
			dezesseisPARAvinte:hide()
			dezessetePARAdezoito:hide()
		end
		if string.find(text, "TanSkills") then
		local t = string.explode(text, " ")
			  umPARAdois:show()
			  umPARAdois:setImageColor('white')
			  umPARAcinco:show()
			  umPARAcinco:setImageColor('white')
			  doisPARAtres:show()
			  doisPARAtres:setImageColor('white')
			  doisPARAseis:show()
			  doisPARAseis:setImageColor('white')
			  tresPARAquatro:show()
			  tresPARAquatro:setImageColor('white')
			  tresPARAsete:show()
			  tresPARAsete:setImageColor('white')
			  quatroPARAoito:show()
			  quatroPARAoito:setImageColor('white')
			  cincoPARAseis:show()
			  cincoPARAseis:setImageColor('white')
			  cincoPARAnove:show()
			  cincoPARAnove:setImageColor('white')
			  seisPARAsete:show()
			  seisPARAsete:setImageColor('white')
			  seisPARAdez:show()
			  seisPARAdez:setImageColor('white')
			  setePARAoito:show()
			  setePARAoito:setImageColor('white')
			  setePARAonze:show()
			  setePARAonze:setImageColor('white')
			  oitoPARAdoze:show()
			  oitoPARAdoze:setImageColor('white')
			  novePARAtreze:show()
			  novePARAtreze:setImageColor('white')
			  novePARAdez:show()
			  novePARAdez:setImageColor('white')
			  dezPARAonze:show()
			  dezPARAonze:setImageColor('white')
			  dezPARAquatorze:show()
			  dezPARAquatorze:setImageColor('white')
			  onzePARAdoze:show()
			  onzePARAdoze:setImageColor('white')
			  onzePARAquinze:show()
			  onzePARAquinze:setImageColor('white')
			  dozePARAdezesseis:show()
			  dozePARAdezesseis:setImageColor('white')
			  trezePARAquatorze:show()
			  trezePARAquatorze:setImageColor('white')
			  trezePARAdezessete:show()
			  trezePARAdezessete:setImageColor('white')
			  quatorzePARAquinze:show()
			  quatorzePARAquinze:setImageColor('white')
			  quatorzePARAdezoito:show()
			  quatorzePARAdezoito:setImageColor('white')
			  quinzePARAdezesseis:show()
			  quinzePARAdezesseis:setImageColor('white')
			  quinzePARAdezenove:show()
			  quinzePARAdezenove:setImageColor('white')
			  dezesseisPARAvinte:show()
			  dezesseisPARAvinte:setImageColor('white')
			  dezessetePARAdezoito:show()
			  dezessetePARAdezoito:setImageColor('white')
			  dezoitoPARAdezenove:show()
			  dezoitoPARAdezenove:setImageColor('white')
			  dezenovePARAvinte:show()
			  dezenovePARAvinte:setImageColor('white')
			  Skill8:setImageColor('white')
			  Skill1:setTooltip(tr('Palavra Mágica: Utani Hur\nMana: 30\nStatus: Free\nPontos Necessários: 0\n\nAumenta sua velocidade.'))
			  Skill2:setTooltip(tr('Palavra Mágica: Exura\nMana: 15\nStatus: Free\nPontos Necessários: 1\n\nCura uma pequena quantidade de HP.'))
			  Skill3:setTooltip(tr('Palavra Mágica: Exani Tera\nMana: 25\nStatus: Free\nPontos Necessários: 0\n\nTeleporta você para cima do buraco quando você está\nem cima de um rope spot.'))
			  Skill4:setTooltip(tr('Palavra Mágica: Utevo Lux\nMana: 10\nStatus: Free\nPontos Necessários: 1\n\nIlumina uma pequena área ao redor do personagem.'))
			  Skill5:setTooltip(tr('Palavra Mágica: Exani Hur\nMana: 60\nStatus: Free\nPontos Necessários: 1\n\nPermite escalar para um andar acima ou abaixo.\nDiga: "escalar up" ou "escalar down".'))
			  Skill6:setTooltip(tr('Palavra Mágica: Exana Kor\nMana: 40\nStatus: Free\nPontos Necessários: 2\n\nRemove qualquer status negativo ativo no personagem.'))
			  Skill7:setTooltip(tr('Palavra Mágica: Exiva\nMana: 55\nStatus: Free\nPontos Necessários: 1\n\nDiz a direção em que certo jogador está, em relação a\nvocê, e dá uma ideia de distância.'))
			  Skill8:setTooltip(tr(''))
			  Skill9:setTooltip(tr('Palavra Mágica: Utevo Gran Lux\nMana: 50\nStatus: Free\nPontos Necessários: 1\n\nIlumina uma grande área ao redor do personagem.'))
			  Skill10:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Flam\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de FIRE em uma área\nao redor do jogador.'))
			  Skill11:setTooltip(tr(''))
			  Skill12:setTooltip(tr('Palavra Mágica: Exevo Ammo\nMana: 250\nStatus: Free\nPontos Necessários: 2\n\nPermite criar munição. A munição criada dependerá\nde que arma você tiver equipada.'))
			  Skill13:setTooltip(tr('Palavra Mágica: Exeta Res\nMana: 60\nStatus: Free\nPontos Necessários: 2\n\nChama a atenção das criaturas ao seu redor\nfazendo com que passem a te atacar.'))
			  Skill14:setTooltip(tr('Palavra Mágica: Utani Gran Hur\nMana: 60\nStatus: Free\nPontos Necessários: 2\n\nAumenta sua velocidade durante 22 segundos.'))
			  Skill15:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Holy\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de HOLY em uma área\nao redor do jogador.'))
			  Skill16:setTooltip(tr('Palavra Mágica: Exevo Gran Mas Frigo\nMana: 250\nStatus: Premium\nPontos Necessários: 3\n\nAtaque de ICE em uma área\nao redor do jogador.'))
			  Skill17:setTooltip(tr(''))
			  Skill18:setTooltip(tr(''))
			  Skill19:setTooltip(tr('Palavra Mágica: Utamo Tempo\nMana: 300\nStatus: Premium\nPontos Necessários: 3\n\nTe torna invencível a qualquer tipo de dano por 10 segundos, porém\nfica imóvel durante esse tempo.'))
			  Skill20:setTooltip(tr(''))
			  Points:setTooltip(tr('A cada nível você ganha 1 ponto de habilidade.'))
				
			if t[2] == "-1" then
				Skill1:setImageSource('img/2')
				Skill1:setImageColor('#5c5c5c')
			elseif t[2] == "1" then
				Skill1:setImageSource('img/2-2')
				Skill1:setImageColor('#909fb9')
			elseif t[2] == "2" then
				Skill1:setImageSource('img/2-2-2')
				Skill1:setImageColor('white')
				umPARAcinco:setImageColor('#38eeff')
				umPARAdois:setImageColor('#38eeff')
			end
			if t[3] == "-1" then
				Skill2:setImageSource('img/1')
				Skill2:setImageColor('#5c5c5c')
			elseif t[3] == "1" then
				Skill2:setImageSource('img/1-1')
				Skill2:setImageColor('#909fb9')
			elseif t[3] == "2" then
				Skill2:setImageSource('img/1-1-1')
				Skill2:setImageColor('white')
			end
			if t[4] == "-1" then
				Skill3:setImageSource('img/11')
				Skill3:setImageColor('#5c5c5c')
			elseif t[4] == "1" then
				Skill3:setImageSource('img/11-11')
				Skill3:setImageColor('#909fb9')
			elseif t[4] == "2" then
				Skill3:setImageSource('img/11-11-11')
				Skill3:setImageColor('white')
				tresPARAquatro:setImageColor('#38eeff')
				tresPARAsete:setImageColor('#38eeff')
			end
			if t[5] == "-1" then
				Skill4:setImageSource('img/8')
				Skill4:setImageColor('#5c5c5c')
				Skill8:setImageColor('white')
			elseif t[5] == "1" then
				Skill4:setImageSource('img/8-8')
				Skill4:setImageColor('#909fb9')
				Skill8:setImageColor('white')
			elseif t[5] == "2" then
				Skill4:setImageSource('img/8-8-8')
				Skill4:setImageColor('white')
				tresPARAquatro:setImageColor('#38eeff')
				Skill8:setImageColor('#38eeff')
			end
			if t[6] == "-1" then
				Skill5:setImageSource('img/10')
				Skill5:setImageColor('#5c5c5c')
			elseif t[6] == "1" then
				Skill5:setImageSource('img/10-10')
				Skill5:setImageColor('#909fb9')
			elseif t[6] == "2" then
				Skill5:setImageSource('img/10-10-10')
				Skill5:setImageColor('white')
				cincoPARAseis:setImageColor('#38eeff')
				cincoPARAnove:setImageColor('#38eeff')
			end
			if t[7] == "-1" then
				Skill6:setImageSource('img/7')
				Skill6:setImageColor('#5c5c5c')
			elseif t[7] == "1" then
				Skill6:setImageSource('img/7-7')
				Skill6:setImageColor('#909fb9')
			elseif t[7] == "2" then
				Skill6:setImageSource('img/7-7-7')
				Skill6:setImageColor('white')
				seisPARAsete:setImageColor('#38eeff')
				seisPARAdez:setImageColor('#38eeff')
			end
			if t[8] == "-1" then
				Skill7:setImageSource('img/12')
				Skill7:setImageColor('#5c5c5c')
			elseif t[8] == "1" then
				Skill7:setImageSource('img/12-12')
				Skill7:setImageColor('#909fb9')
			elseif t[8] == "2" then
				Skill7:setImageSource('img/12-12-12')
				Skill7:setImageColor('white')
				seisPARAsete:setImageColor('#38eeff')
			end
			if t[9] == "s" then
				Skill8:setImageSource('img/'..t[9])
				Skill8:setImageSize('3 150')
				Skill8:setImageOffset('17 -41')
			end
			if t[10] == "-1" then
				Skill9:setImageSource('img/9')
				Skill9:setImageColor('#5c5c5c')
			elseif t[10] == "1" then
				Skill9:setImageSource('img/9-9')
				Skill9:setImageColor('#909fb9')
			elseif t[10] == "2" then
				Skill9:setImageSource('img/9-9-9')
				Skill9:setImageColor('white')
				novePARAdez:setImageColor('#38eeff')
				novePARAtreze:setImageColor('#38eeff')
			end
			if t[11] == "-1" then
				Skill10:setImageSource('img/3')
				Skill10:setImageColor('#5c5c5c')
			elseif t[11] == "1" then
				Skill10:setImageSource('img/3-3')
				Skill10:setImageColor('#909fb9')
			elseif t[11] == "2" then
				Skill10:setImageSource('img/3-3-3')
				Skill10:setImageColor('white')
				dezPARAquatorze:setImageColor('#38eeff')
			end
			Skill11:setImageSource('img/'..t[12])
			if t[13] == "-1" then
				Skill12:setImageSource('img/6')
				Skill12:setImageColor('#5c5c5c')
			elseif t[13] == "1" then
				Skill12:setImageSource('img/6-6')
				Skill12:setImageColor('#909fb9')
			elseif t[13] == "2" then
				Skill12:setImageSource('img/6-6-6')
				Skill12:setImageColor('white')
				dozePARAdezesseis:setImageColor('#38eeff')
			end
			if t[14] == "-1" then
				Skill13:setImageSource('img/14')
				Skill13:setImageColor('#5c5c5c')
			elseif t[14] == "1" then
				Skill13:setImageSource('img/14-14')
				Skill13:setImageColor('#909fb9')
			elseif t[14] == "2" then
				Skill13:setImageSource('img/14-14-14')
				Skill13:setImageColor('white')
				trezePARAquatorze:setImageColor('#38eeff')
			end
			if t[15] == "-1" then
				Skill14:setImageSource('img/13')
				Skill14:setImageColor('#5c5c5c')
			elseif t[15] == "1" then
				Skill14:setImageSource('img/13-13')
				Skill14:setImageColor('#909fb9')
			elseif t[15] == "2" then
				Skill14:setImageSource('img/13-13-13')
				Skill14:setImageColor('white')
				quatorzePARAquinze:setImageColor('#38eeff')
				trezePARAquatorze:setImageColor('#38eeff')
			end
			if t[16] == "-1" then
				Skill15:setImageSource('img/4')
				Skill15:setImageColor('#5c5c5c')
			elseif t[16] == "1" then
				Skill15:setImageSource('img/4-4')
				Skill15:setImageColor('#909fb9')
			elseif t[16] == "2" then
				Skill15:setImageSource('img/4-4-4')
				Skill15:setImageColor('white')
				quinzePARAdezenove:setImageColor('#38eeff')
			end
			if t[17] == "-1" then
				Skill16:setImageSource('img/5')
				Skill16:setImageColor('#5c5c5c')
			elseif t[17] == "1" then
				Skill16:setImageSource('img/5-5')
				Skill16:setImageColor('#909fb9')
			elseif t[17] == "2" then
				Skill16:setImageSource('img/5-5-5')
				Skill16:setImageColor('white')
			end
				Skill17:setImageSource('img/'..t[18])
				Skill18:setImageSource('img/'..t[19])
			if t[20] == "-1" then
				Skill19:setImageSource('img/15')
				Skill19:setImageColor('#5c5c5c')
			elseif t[20] == "1" then
				Skill19:setImageSource('img/15-15')
				Skill19:setImageColor('#909fb9')
			elseif t[20] == "2" then
				Skill19:setImageSource('img/15-15-15')
				Skill19:setImageColor('white')
			end
				Skill20:setImageSource('img/'..t[21])
			if t[22] == "-1" or t[22] == "0" then
				Points:setText('Pontos de Habilidade: 0')
				Points:setColor('red')
			else
				Points:setText('Pontos de Habilidade: '..t[22])
				Points:setColor('green')
			end
			
			doisPARAtres:hide()
			doisPARAseis:hide()
			quatroPARAoito:hide()
			setePARAoito:hide()
			setePARAonze:hide()
			oitoPARAdoze:hide()
			dezPARAonze:hide()
			onzePARAdoze:hide()
			onzePARAquinze:hide()
			trezePARAdezessete:hide()
			quatorzePARAdezoito:hide()
			quinzePARAdezesseis:hide()
			dezesseisPARAvinte:hide()
			dezessetePARAdezoito:hide()
			dezoitoPARAdezenove:hide()
			dezenovePARAvinte:hide()
		end
		if string.find(text, "NoVocSkills") then
		local t = string.explode(text, " ")
			  Points:setText('Pontos de Habilidade: -')
			  Points:setColor('red')
			  umPARAdois:show()
			  umPARAdois:setImageColor('white')
			  umPARAcinco:show()
			  umPARAcinco:setImageColor('white')
			  doisPARAtres:show()
			  doisPARAtres:setImageColor('white')
			  doisPARAseis:show()
			  doisPARAseis:setImageColor('white')
			  tresPARAquatro:show()
			  tresPARAquatro:setImageColor('white')
			  tresPARAsete:show()
			  tresPARAsete:setImageColor('white')
			  quatroPARAoito:show()
			  quatroPARAoito:setImageColor('white')
			  cincoPARAseis:show()
			  cincoPARAseis:setImageColor('white')
			  cincoPARAnove:show()
			  cincoPARAnove:setImageColor('white')
			  seisPARAsete:show()
			  seisPARAsete:setImageColor('white')
			  seisPARAdez:show()
			  seisPARAdez:setImageColor('white')
			  setePARAoito:show()
			  setePARAoito:setImageColor('white')
			  setePARAonze:show()
			  setePARAonze:setImageColor('white')
			  oitoPARAdoze:show()
			  oitoPARAdoze:setImageColor('white')
			  novePARAtreze:show()
			  novePARAtreze:setImageColor('white')
			  novePARAdez:show()
			  novePARAdez:setImageColor('white')
			  dezPARAonze:show()
			  dezPARAonze:setImageColor('white')
			  dezPARAquatorze:show()
			  dezPARAquatorze:setImageColor('white')
			  onzePARAdoze:show()
			  onzePARAdoze:setImageColor('white')
			  onzePARAquinze:show()
			  onzePARAquinze:setImageColor('white')
			  dozePARAdezesseis:show()
			  dozePARAdezesseis:setImageColor('white')
			  trezePARAquatorze:show()
			  trezePARAquatorze:setImageColor('white')
			  trezePARAdezessete:show()
			  trezePARAdezessete:setImageColor('white')
			  quatorzePARAquinze:show()
			  quatorzePARAquinze:setImageColor('white')
			  quatorzePARAdezoito:show()
			  quatorzePARAdezoito:setImageColor('white')
			  quinzePARAdezesseis:show()
			  quinzePARAdezesseis:setImageColor('white')
			  quinzePARAdezenove:show()
			  quinzePARAdezenove:setImageColor('white')
			  dezesseisPARAvinte:show()
			  dezesseisPARAvinte:setImageColor('white')
			  dezessetePARAdezoito:show()
			  dezessetePARAdezoito:setImageColor('white')
			  dezoitoPARAdezenove:show()
			  dezoitoPARAdezenove:setImageColor('white')
			  dezenovePARAvinte:show()
			  dezenovePARAvinte:setImageColor('white')
			  Skill8:setImageSource('img/0')
			  Skill8:setImageSize('38 38')
			  Skill8:setImageOffset('0 0')
			  Skill1:setTooltip(tr(''))
			  Skill2:setTooltip(tr(''))
			  Skill3:setTooltip(tr(''))
			  Skill4:setTooltip(tr(''))
			  Skill5:setTooltip(tr(''))
			  Skill6:setTooltip(tr(''))
			  Skill7:setTooltip(tr(''))
			  Skill8:setTooltip(tr(''))
			  Skill9:setTooltip(tr(''))
			  Skill10:setTooltip(tr(''))
			  Skill11:setTooltip(tr(''))
			  Skill12:setTooltip(tr(''))
			  Skill13:setTooltip(tr(''))
			  Skill14:setTooltip(tr(''))
			  Skill15:setTooltip(tr(''))
			  Skill16:setTooltip(tr(''))
			  Skill17:setTooltip(tr(''))
			  Skill18:setTooltip(tr(''))
			  Skill19:setTooltip(tr(''))
			  Skill20:setTooltip(tr(''))
			  Points:setTooltip(tr('A cada nível você ganha 1 ponto de habilidade.\nVocê passa a receber pontos de habilidade a partir do lv. 30'))
			  Skill8:setImageColor('white')
			  Skill1:setImageSource('img/0')
			  Skill2:setImageSource('img/0')
			  Skill3:setImageSource('img/0')
			  Skill4:setImageSource('img/0')
			  Skill5:setImageSource('img/0')
			  Skill6:setImageSource('img/0')
			  Skill7:setImageSource('img/0')
			  Skill8:setImageSource('img/0')
			  Skill9:setImageSource('img/0')
			  Skill10:setImageSource('img/0')
			  Skill11:setImageSource('img/0')
			  Skill12:setImageSource('img/0')
			  Skill13:setImageSource('img/0')
			  Skill14:setImageSource('img/0')
			  Skill15:setImageSource('img/0')
			  Skill16:setImageSource('img/0')
			  Skill17:setImageSource('img/0')
			  Skill18:setImageSource('img/0')
			  Skill19:setImageSource('img/0')
			  Skill20:setImageSource('img/0')
		end
	end
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })
  disconnect(g_game, 'onTextMessage', onArena)

  kardWindow:destroy()
  kardButton:destroy()
end

function onGameEnd()
  if kardWindow:isVisible() then
    kardWindow:hide()
  end
end

function show()
  kardWindow:show()
  kardWindow:raise()
  kardWindow:focus()
  g_sounds.getChannel(1):play("/sounds/OpenWindows")
  addEvent(function() kardButton:setIcon('/images/topbuttons/ability_on') g_effects.fadeIn(kardWindow, 250) end)
end

function hide()
  g_sounds.getChannel(1):play("/sounds/CloseWindows")
  addEvent(function() kardButton:setIcon('/images/topbuttons/ability') g_effects.fadeOut(kardWindow, 250) end)
  scheduleEvent(function() kardWindow:hide() end, 250)
end

function toggle()
  if kardWindow:isVisible() then
	kardButton:setIcon('/images/topbuttons/ability')
    hide()
  else
	kardButton:setIcon('/images/topbuttons/ability_on')
    show()
  end
end