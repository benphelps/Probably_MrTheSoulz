--[[ ///---INFO---////
// Druid Guard //
Thank You For Using My ProFiles
I Hope Your Enjoy Them
MTS
]]

local exeOnLoad = function()

	mtsAlert:message("\124cff9482C9*MrTheSoulz - \124cffFF7D0ADruid/Feral \124cff9482C9Loaded*")

end

local Buffs = {

	--	Buffs
		{ "1126", { "!player.buff(20217).any", "!player.buff(115921).any", "!player.buff(1126).any", "!player.buff(90363).any", "!player.buff(69378).any", "player.form = 0" }}, -- Mark of the Wild

}

local inCombat = {
  
  -- Survival
	  { "Renewal", "player.health <= 30" },
	  { "Cenarion Ward", "player.health <75" },
	  { "Survival Instincts", "player.health <75" },
	  { "Cenarion Ward", "player.health <75" },
	  { "Might of Ursoc", "player.health <= 45" },
  
  -- Cat
  	{ "Cat Form", "!player.buff(Cat Form)" },

  --Cooldowns
	  { "106737", { "player.spell(106737).charges > 2", "!modifier.last(106737)", "player.spell(106737).exists" }}, --Force of Nature
	  { "106951", "modifier.cooldowns" }, -- Beserk
	  { "124974", "modifier.cooldowns" }, -- Nature's Vigil
	  { "102543", "modifier.cooldowns" }, -- incarnation

  --Keybinds
	  { "Ursol's Vortex", "modifier.shift", "ground" },
	  { "Disorienting Roar", "modifier.shift" },
	  { "Mighty Bash", "modifier.shift" },
	  { "Typhoon", "modifier.alt" },
	  { "Mass Entanglement", "modifier.shift" },

  --Interrupts
	  { "Skull Bash", { "target.casting", "modifier.interrupt" }},	
	  { "Disorienting Roar", "modifier.interrupt" },
	  { "Mighty Bash", "modifier.interrupt" },

  -- Self Heals
  	{ "Healing Touch", { "player.buff(Predatory Swiftness)", "player.health <= 70" }},
  	{ "Regrowth", { "player.buff(Predatory Swiftness)", "player.health <= 90" }},

  -- AoE
	  { "Swipe", "modifier.multitarget" },
	  { "106830", { "modifier.multitarget", "target.debuff(Thrash).duration <= 1.5" }},
	  --{ "102355", { "!target.debuff(102355)", "player.spell(106707).exists" }, "target" },

  -- Buffs
	  { "Savage Roar", { "!player.buff(Savage Roar)", "player.combopoints = 0", "!player.combat", "target.enemy" }},
	  { "Savage Roar", { "player.buff(Savage Roar).duration < 5", "player.combopoints = 5" }},
	  { "Savage Roar", { "player.buff(Savage Roar).duration < 3", "player.combopoints >= 2" }},

  -- Free Thrash
  	{ "Thrash", "player.buff(Omen of Clarity)" },
  
  -- Tiger's Fury // Spend Combo
  	{ "Tiger's Fury", "player.energy <= 35"},

  -- Rake
  	{ "Rake", "target.debuff(Rake).duration <= 4" },

  -- Rip
  	{ "Rip", { "!target.debuff(Rip)", "player.combopoints = 5" }},
  	{ "Rip", { "target.health > 25", "target.debuff(Rip).duration < 5", "player.combopoints = 5" }},

  -- Ferocious Bite // Target Health is less then 25%
  	{ "Ferocious Bite", { "target.debuff(Rip)", "target.health < 30", "player.combopoints = 5" }},

  -- Max Combo and Rip or Savage do not need refreshed
  	{ "Ferocious Bite", { "player.combopoints = 5", "target.debuff(Rip).duration > 5", "player.buff(Savage Roar).duration > 5" }},
  
  -- Shred // Combo Point Building Rotation
	  {{
	  	{ "Shred", "player.buff(Clearcasting)" },
	  	{ "Shred", "player.buff(Berserk)" },
	  	{ "Shred", "player.combopoints < 5" },
	  }, "player.behind" },
  
}

local outCombat = {

	--	keybinds
		{ "Ursol's Vortex", "modifier.shift", "ground" },
	  	{ "Disorienting Roar", "modifier.shift" },
	 	{ "Mighty Bash", "modifier.shift" },
	  	{ "Typhoon", "modifier.alt" },
	  	{ "Mass Entanglement", "modifier.shift" },
	{ "Cat Form", { "player.buff(Mark of the Wild).any", "!player.buff(Cat Form)" }},
	{ "/cancelaura Cat Form", { "player.buff(Cat Form)", "!player.buff(Mark of the Wild)" }},

}

for _, Buffs in pairs(Buffs) do
  inCombat[#inCombat + 1] = Buffs
  outCombat[#outCombat + 1] = Buffs
end

ProbablyEngine.rotation.register_custom(103, "|r[|cff9482C9MTS|r][|cffFF7D0ADruid-Feral|r]", inCombat, outCombat, exeOnLoad)


