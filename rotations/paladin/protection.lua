-- //////////////////////-----------------------------------------INFO-----------------------------------//////////////////////////////
--													   	//Paladin Protection//
--													Thank Your For Your My ProFiles
--														I Hope Your Enjoy Them
--																  MTS


local lib = function()

	mtsAlert:message("\124cff9482C9*MrTheSoulz - \124cffF58CBAPaladin/Protection \124cff9482C9Loaded*")

end
-- //////////////////////-----------------------------------------END LIB-----------------------------------//////////////////////////////


local Buffs = {

	-- Buffs
		{ "19740", { -- Blessing of Might
			"!player.buff(19740).any",
			"!player.buff(116956).any",
			"!player.buff(93435).any",
			"!player.buff(128997).any",
			"@mts.getConfig('PalaProtBuffs')",
			"@mts.getSetting('toUsePalaProtBuff', 'MIGHT')"
		}, nil },
		
		{ "20217", { -- Blessing of Kings
			"!player.buff(20217).any", 
			"!player.buff(115921).any", 
			"!player.buff(1126).any", 
			"!player.buff(90363).any", 
			"!player.buff(69378).any",
			"@mts.getConfig('PalaProtBuffs')",
			"@mts.getSetting('toUsePalaProtBuff', 'KINGS')" 
		}, nil },
		
		{ "25780", { "!player.buff(25780)","@mts.getConfig('PalaProtBuffs')" }, nil }, -- Fury
		
}

-- ////////////////////////-----------------------------------------END BUFFS-----------------------------------//////////////////////////////


local inCombat = {
			
	-- keybinds
		{ "105593", "modifier.control", "target"}, -- Fist of Justice
		{ "853", "modifier.control", "target"}, -- Hammer of Justice
		{ "114158", "modifier.shift", "ground"}, -- Light´s Hammer
		{ "26573", { "player.glyph(54928)", "modifier.alt" }, "ground"}, -- consecration glyphed

	{{-- Seals
		{ "20165", "player.seal != 3", "!modifier.multitarget", nil }, -- seal of Insight
		{ "20154", "player.seal != 2", "modifier.multitarget", nil }, -- seal of righteousness
	}, "@mts.getConfig('PalaProtChangeSeals')" },

	-- Hands
		{ "6940", { "lowest.health <= 80", "!player.health <= 40", "!lowest.player" }, "lowest" }, -- Hand of Sacrifice
		{ "1044", "player.state.root" }, -- Hand of Freedom
		{ "1022", { "!lowest.role(tank)", "!lowest.immune.melee", "lowest.health < 25" }, "lowest" }, -- Hand of Protection
		
	-- Interrupt
		{ "96231", "target.interruptsAt(50)" }, -- Rebuke

	-- Defensive Cooldowns
		{ "20925", { "!player.buff(20925)", "@mts.getConfig('PalaProtDefCd')" }, "player" }, -- Sacred Shield 		
		{ "31850", { "player.health < 30", "@mts.getConfig('PalaProtDefCd')" }, nil }, --Ardent Defender
		{ "498", { "player.health <= 99", "@mts.getConfig('PalaProtDefCd')" }, nil }, -- Divine Protection
		{ "86659", { "player.health <= 50", "@mts.getConfig('PalaProtDefCd')" }, nil }, -- Guardian of Ancient Kings
		{ "#gloves", "@mts.getConfig('PalaProtDefCd')", nil },
	
	-- Cooldowns
		{ "31884", "modifier.cooldowns" }, -- Avenging Wrath
		{ "105809", "modifier.cooldowns" }, --Holy Avenger
	
	-- Items
		{ "#5512", "@mts.ConfigUnitHp('PalaHolyHs', 'player')" }, --Healthstone
		{ "#76097", { "@mts.getConfig('PalaProtItems')", "player.health < 30", "@mts.HealthPot" }}, -- Master Health Potion
		--{ "#86125", { "@mts.getConfig('PalaProtItems')","@mts.KafaPress" }}, -- Kafa Press

	-- Self Heal
		{ "633", "player.health < 20", "player"}, -- Lay on Hands
		{ "114163", { "!player.buff(114163)", "player.buff(114637).count = 5", "player.holypower >= 3", "player.health < 60" }, "player"}, -- Eternal Flame
		{ "114163", { "player.holypower >= 1", "player.health < 30" }, "player"}, -- Eternal Flame / Low
		{ "85673", { "player.buff(114637).count = 5", "player.holypower >= 3", "player.health < 60" }, "player" }, -- Word of Glory
		{ "85673", { "player.holypower >= 1", "player.health < 30" }, "player" }, -- Word of Glory / Low
		{ "19750", { "player.health < 70", "player.buff(114250).count > 2", "player.buff(114637" }, "player" }, -- Flash of Light 

	-- Raid Heal
		{ "19750", { "lowest.health < 50", "player.buff(114250).count > 2" }, "lowest" }, -- Flash of Light
        { "114163", { "player.holypower >= 1", "player.health < 30" }, "Lowest"}, -- Eternal Flame
        { "85673", { "player.holypower >= 1", "player.health < 30" }, "lowest" }, -- Word of Glory

    -- Auto Target
    	--{ "/TargetNearestEnemy", "!target.exists", nil },
        --{ "/TargetNearestEnemy", { "target.exists", "target.dead" }, nil },

    -- Taunts
		{ "62124", { "@mts.ShouldTaunt('PalaProtTaunts')", "@mts.bossTaunt" }, "target" }, -- Boss // Reckoning
		{ "62124", { "@mts.ShouldTaunt('PalaProtTaunts')", "target.threat < 100", "@mts.StopIfBoss" }, "target" }, -- Aggro Control // Reckoning
		{ "62124", { "@mts.ShouldTaunt('PalaProtTaunts')", "mouseover.threat < 100", "@mts.StopIfBoss" }, "mouseover" }, -- Aggro Control // Reckoning

	-- Rotation
		{ "24275", { "target.health <= 20", "target.spell(24275).range" }, "target" }, -- Hammer of Wrath
		{ "31935", { "player.buff(98057)", "target.spell(31935).range" }, "target" }, -- Avenger´s Shield Proc
		{ "53600", { "player.holypower >= 3", "target.spell(53600).range" }, "target" }, -- Shield of the Righteous
		{ "35395", { "!modifier.multitarget", "target.spell(35395).range" }, "target" }, -- Crusader Strike
		{ "53595", { "modifier.multitarget", "target.spell(53595).range" }, "target" }, -- Hammer of the Righteous
		{ "20271", "target.spell(20271).range", "target" }, -- Judgment
		{ "114165", "target.spell(114165).range", "target" }, -- Holy Prism
		{ "31935", "target.spell(31935).range", "target" },-- Avenger´s Shield Normal
		{ "26573", { "!player.glyph(54928)", "target.range <= 5", "@mts.getConfig('PalaProtConsecration')" }, nil }, -- consecration
		{ "114157", "target.spell(114157).range", "target" }, -- Execution Sentense
		{ "119072" }, -- Holy Wrath
  
}

-- //////////////////////-----------------------------------------END IN-COMBAT-----------------------------------//////////////////////////////

local outCombat = {

-- keybinds
		{ "105593", "modifier.control", "target"}, -- Fist of Justice
		{ "853", "modifier.control", "target"}, -- Hammer of Justice
		{ "114158", "modifier.shift", "ground"}, -- Light´s Hammer
		{ "26573", { "player.glyph(54928)", "modifier.alt" }, "ground"}, -- consecration glyphed

	{{-- Seals
		{ "20165", "player.seal != 3", "!modifier.multitarget", nil }, -- seal of Insight
		{ "20154", "player.seal != 2", "modifier.multitarget", nil }, -- seal of righteousness
	}, "@mts.getConfig('PalaProtChangeSeals')" },

	-- Hands
		{ "1044", "player.state.root" }, -- Hand of Freedom

}

-- //////////////////////-----------------------------------------END OUT-OF-COMBAT-----------------------------------//////////////////////////////

for _, Buffs in pairs(Buffs) do
  inCombat[#inCombat + 1] = Buffs
  outCombat[#outCombat + 1] = Buffs
end

ProbablyEngine.rotation.register_custom(66, "|r[|cff9482C9MTS|r][|cffF58CBAPaladin-Protection|r]", inCombat, outCombat, lib)