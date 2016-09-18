obj
	Alchemy_Pot
		Action
			proc
				OpenAction()
			Expansia
				icon_state = null
				OpenAction()
					range() << "<font color=blue><b>Suddenly, \icon[usr][usr.name]'s Alchemy pot begins to rattle uncontrollably.</font></b>"
					range() << "<font color=blue><b>Without warning, it suddenly expands in size!  It can now hold 8 items!</font></b>"
					for (var/obj/attainable/bags/Alchemy_Pot/AP in usr.contents)
						if (AP.bagsize<8)
							AP.bagsize = 8


datum
	Alchemy_Recipe
		var/name
		var/final_result
		var/list/ingredients = newlist()
		var/steps
		var/mustknow = 0
		var/doesaction = 0
//Rings
		Ring_of_the_Blood_God
			name = "Ring of the Blood God"
			final_result =/obj/attainable/equipment/rings/Ring_of_the_Blood_God
			steps = 300
			ingredients =list("Ring of Shiva: Balance"=/obj/attainable/equipment/rings/Ring_of_Shiva:_Balance,"Ring of Baal: Chaos"=/obj/attainable/equipment/rings/Ring_of_Baal:_Chaos,"Ring of Metatron: Law"=/obj/attainable/equipment/rings/Ring_of_Metatron:_Law)
//Plate
		Demonium_Plate_Cloak
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Plate_Cloak
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Plate Armor Kit" = /obj/attainable/Ore_and_Plans/Plate_Armor_Kit, "Cape Plans" = /obj/attainable/Ore_and_Plans/Cape_Plans)
		Demonium_Plate_Armor
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Plate_Armor
			steps = 500
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Plate Armor Kit" = /obj/attainable/Ore_and_Plans/Plate_Armor_Kit, "Armor Plans" = /obj/attainable/Ore_and_Plans/Armor_Plans)
		Demonium_Plate_Helm
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Plate_Helm
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Plate Armor Kit" = /obj/attainable/Ore_and_Plans/Plate_Armor_Kit, "Helmet Plans" = /obj/attainable/Ore_and_Plans/Helmet_Plans)
		Demonium_Shield
			name = ""
			final_result = /obj/attainable/equipment/shields/Demonium_Shield
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Plate Armor Kit" = /obj/attainable/Ore_and_Plans/Plate_Armor_Kit, "Shield Plans" = /obj/attainable/Ore_and_Plans/Shield_Plans)
//Cloth
		Demonium_Cloth_Cloak
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Cloth_Cloak
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Cloth Armor Kit" = /obj/attainable/Ore_and_Plans/Cloth_Armor_Kit, "Cape Plans" = /obj/attainable/Ore_and_Plans/Cape_Plans)
		Demonium_Cloth_Armor
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Cloth_Armor
			steps = 350
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Cloth Armor Kit" = /obj/attainable/Ore_and_Plans/Cloth_Armor_Kit, "Armor Plans" = /obj/attainable/Ore_and_Plans/Armor_Plans)
		Demonium_Cloth_Hat
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Cloth_Hat
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Cloth Armor Kit" = /obj/attainable/Ore_and_Plans/Cloth_Armor_Kit, "Helmet Plans" = /obj/attainable/Ore_and_Plans/Helmet_Plans)
		Demonium_Headband
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Headband
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Cloth Armor Kit" = /obj/attainable/Ore_and_Plans/Cloth_Armor_Kit, "Champions Emblem" = /obj/attainable/Ore_and_Plans/Champions_Emblem)
//Leather
		Demonium_Leather_Cloak
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Leather_Cloak
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Leather Armor Kit" = /obj/attainable/Ore_and_Plans/Leather_Armor_Kit, "Cape Plans" = /obj/attainable/Ore_and_Plans/Cape_Plans)
		Demonium_Leather_Hat
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Leather_Hat
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Leather Armor Kit" = /obj/attainable/Ore_and_Plans/Leather_Armor_Kit, "Helmet Plans" = /obj/attainable/Ore_and_Plans/Helmet_Plans)
		Demonium_Leather_Armor
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Leather_Armor
			steps = 350
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Leather Armor Kit" = /obj/attainable/Ore_and_Plans/Leather_Armor_Kit, "Armor Plans" = /obj/attainable/Ore_and_Plans/Armor_Plans)
//Chain
		Demonium_Chain_Cloak
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Chain_Cloak
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Chain Armor Kit" = /obj/attainable/Ore_and_Plans/Chain_Armor_Kit, "Cape Plans" = /obj/attainable/Ore_and_Plans/Cape_Plans)
		Demonium_Chain_Helm
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Chain_Helm
			steps = 300
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Chain Armor Kit" = /obj/attainable/Ore_and_Plans/Chain_Armor_Kit, "Helmet Plans" = /obj/attainable/Ore_and_Plans/Helmet_Plans)
		Demonium_Chain_Armor
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Chain_Armor
			steps = 350
			ingredients = list("Demonium" = /obj/attainable/Ore_and_Plans/Demonium, "Chain Armor Kit" = /obj/attainable/Ore_and_Plans/Chain_Armor_Kit, "Armor Plans" = /obj/attainable/Ore_and_Plans/Armor_Plans)

//Herbs
		Potion_of_Spell_Binding
			name = "Pot of Spell Binding"
			final_result = /obj/attainable/potions/Potion_of_Spell_Binding
			steps = 250
			ingredients = list("Mummy Heart" = /obj/attainable/organs/Mummy_Heart,"Shadow Mist" = /obj/attainable/organs/Shadow_Mist,"Impure Silver Ore" = /obj/attainable/minerals/Impure_Silver_Ore)
		Hi_Quality_Herb
			name = "Hi Quality Herb"
			final_result = /obj/attainable/herbs/Hi_Quality_Herb
			steps = 50
			ingredients = list("Herb" = /obj/attainable/herbs/Herb,"Herb " = /obj/attainable/herbs/Herb)
		Royalty_Herb
			name = "Royalty Herb"
			final_result = /obj/attainable/herbs/Royalty_Herb
			steps = 100
			ingredients = list("Hi Quality Herb" = /obj/attainable/herbs/Hi_Quality_Herb, "Hi Quality Herb " = /obj/attainable/herbs/Hi_Quality_Herb, "Hi Quality Herb  " = /obj/attainable/herbs/Hi_Quality_Herb)
		Superb_Herb
			name = "Superb Herb"
			final_result = /obj/attainable/herbs/Superb_Herb
			steps = 150
			ingredients = list("Royalty Herb" = /obj/attainable/herbs/Royalty_Herb,"Royalty Herb " = /obj/attainable/herbs/Royalty_Herb,"Royalty Herb  " = /obj/attainable/herbs/Royalty_Herb,"Royalty Herb   " = /obj/attainable/herbs/Royalty_Herb)
		Hi_Quality_Magic_Herb
			name = "Hi Qual Magic Herb"
			final_result = /obj/attainable/herbs/Hi_Quality_Magic_Herb
			steps = 75
			ingredients = list("Magic Herb" = /obj/attainable/herbs/Magic_Herb,"Magic Herb " = /obj/attainable/herbs/Magic_Herb)
		Royalty_Magic_Herb
			name = "Royalty Magic Herb"
			final_result = /obj/attainable/herbs/Royalty_Magic_Herb
			steps = 150
			ingredients = list("Hi Quality Magic Herb" = /obj/attainable/herbs/Hi_Quality_Magic_Herb, "Hi Quality Magic Herb " = /obj/attainable/herbs/Hi_Quality_Magic_Herb, "Hi Quality Magic Herb  " = /obj/attainable/herbs/Hi_Quality_Magic_Herb)
		Superb_Magic_Herb
			name = "Superb Magic Herb"
			final_result = /obj/attainable/herbs/Superb_Magic_Herb
			steps = 175
			ingredients = list("Royalty Magic Herb" = /obj/attainable/herbs/Royalty_Magic_Herb,"Royalty Magic Herb "  = /obj/attainable/herbs/Royalty_Magic_Herb,"Royalty Magic Herb  " = /obj/attainable/herbs/Royalty_Magic_Herb,"Royalty Magic Herb   " = /obj/attainable/herbs/Royalty_Magic_Herb)
		Elfin_Elixir
			name = "Elfin_Elixir"
			final_result = /obj/attainable/herbs/Elfin_Elixir
			steps = 175
			ingredients = list("Royalty Magic Herb" = /obj/attainable/herbs/Royalty_Magic_Herb,"Magic Dew"=/obj/attainable/Materials/Magic_Dew)
		Strange_Magi_Babble_Brew
			name = "Strange Magi Babble Brew"
			final_result = /obj/attainable/drinks/Strange_Magi_Babble_Brew
			steps = 250
			mustknow = 1
			ingredients = list("Magi Babble Brew" = /obj/attainable/drinks/Magi_Babble_Brew,"Superb Magic Herb" = /obj/attainable/herbs/Superb_Magic_Herb)
		Strange_Babble_Brew
			name = "Strange Babble Brew"
			final_result = /obj/attainable/drinks/Strange_Babble_Brew
			steps = 250
			mustknow = 1
			ingredients = list("Babble Brew" = /obj/attainable/drinks/Babble_Brew,"Superb Herb" = /obj/attainable/herbs/Superb_Herb)

		Alchemy_Pot_Enlarger
			name = "Alchemy Pot Enlarger"
			final_result = /obj/Alchemy_Pot/Action/Expansia
			steps = 3000
			ingredients = list("Expansia" = /obj/attainable/potions/Expansia,"Shadow Mist" = /obj/attainable/organs/Shadow_Mist,"Shadow Mist " = /obj/attainable/organs/Shadow_Mist,"Shadow Mist  " = /obj/attainable/organs/Shadow_Mist)
			doesaction = 1

		Bolt_of_Dark_Cloth
			name = "Bolt of Dark Cloth"
			final_result = /obj/attainable/cloths/Bolt_of_Dark_Cloth
			steps = 250
			ingredients = list("Dark Cloth" = /obj/attainable/cloths/Dark_Cloth,"Dark Cloth " = /obj/attainable/cloths/Dark_Cloth,"Dark Cloth  " = /obj/attainable/cloths/Dark_Cloth,"Dark Cloth   " = /obj/attainable/cloths/Dark_Cloth,"Dark Cloth    " = /obj/attainable/cloths/Dark_Cloth)
		Bolt_of_Demon_Cloth
			name = "Bolt of Demon Cloth"
			final_result = /obj/attainable/cloths/Bolt_of_Demon_Cloth
			steps = 400
			ingredients = list("Demon Cloth" = /obj/attainable/cloths/Demon_Cloth,"Demon Cloth " = /obj/attainable/cloths/Demon_Cloth,"Demon Cloth  " = /obj/attainable/cloths/Demon_Cloth,"Demon Cloth   " = /obj/attainable/cloths/Demon_Cloth,"Demon Cloth    " = /obj/attainable/cloths/Demon_Cloth,"Demon Cloth     " = /obj/attainable/cloths/Demon_Cloth)

		Metal_Cloth
			name = "Metal Cloth"
			final_result = /obj/attainable/cloths/Metal_Cloth
			steps = 250
			//mustknow = 1
			ingredients = list("Metal Slime Skin" = /obj/attainable/hides/Metal_Slime_Skin,"Metal Slime Skin " = /obj/attainable/hides/Metal_Slime_Skin,"Metal Slime Skin  " = /obj/attainable/hides/Metal_Slime_Skin,"Mage Cloth" = /obj/attainable/cloths/Mage_Cloth,"Dark Cloth" = /obj/attainable/cloths/Dark_Cloth)
		Bolt_of_Metal_Cloth
			name = "Metal Cloth"
			final_result = /obj/attainable/cloths/Bolt_of_Metal_Cloth
			steps = 500
			ingredients = list("Metal Cloth" = /obj/attainable/cloths/Metal_Cloth,"Metal Cloth " = /obj/attainable/cloths/Metal_Cloth,"Metal Cloth  " = /obj/attainable/cloths/Metal_Cloth,"Metal Cloth   " = /obj/attainable/cloths/Metal_Cloth,"Metal Cloth    " = /obj/attainable/cloths/Metal_Cloth)
		Pristine_Valrog_Scale
			name = "Pristine Valrog Scale"
			final_result = /obj/attainable/scales/Pristine_Valrog_Scale
			//mustknow = 1
			steps = 400
			ingredients = list("Cracked Valrog Scale" = /obj/attainable/scales/Cracked_Valrog_Scale,"Cracked Valrog Scale " = /obj/attainable/scales/Cracked_Valrog_Scale,"Cracked Valrog Scale  " = /obj/attainable/scales/Cracked_Valrog_Scale,"Cracked Valrog Scale   " = /obj/attainable/scales/Cracked_Valrog_Scale)

		Valrog_Sack
			name = "Valrog's Sack"
			final_result = /obj/attainable/bags/Valrog_Sack
			steps = 7500
			//mustknow = 1
			ingredients = list("Bolt of Dark Cloth" = /obj/attainable/cloths/Bolt_of_Dark_Cloth,"Bolt of Dark Cloth " = /obj/attainable/cloths/Bolt_of_Dark_Cloth,"Bolt of Dark Cloth  " = /obj/attainable/cloths/Bolt_of_Dark_Cloth,"Bolt of Dark Cloth   " = /obj/attainable/cloths/Bolt_of_Dark_Cloth,"Bolt of Dark Cloth    " = /obj/attainable/cloths/Bolt_of_Dark_Cloth,"Cracked Valrog Scale" = /obj/attainable/scales/Cracked_Valrog_Scale,"Cracked Valrog Scale " = /obj/attainable/scales/Cracked_Valrog_Scale,"Cracked Valrog Scale  " = /obj/attainable/scales/Cracked_Valrog_Scale)
		Demonhide_Sack
			name = "Demonhide Sack"
			final_result = /obj/attainable/bags/Demonhide_Sack
			steps = 10000
			//mustknow = 1
			ingredients = list("Bolt of Demon Cloth" = /obj/attainable/cloths/Bolt_of_Demon_Cloth,"Bolt of Demon Cloth " = /obj/attainable/cloths/Bolt_of_Demon_Cloth,"Bolt of Demon Cloth  " = /obj/attainable/cloths/Bolt_of_Demon_Cloth,"Bolt of Metal Cloth" = /obj/attainable/cloths/Bolt_of_Metal_Cloth,"Pristine Valrog Scale" = /obj/attainable/scales/Pristine_Valrog_Scale,"Pristine Valrog Scale" = /obj/attainable/scales/Pristine_Valrog_Scale)


		Herb_of_Awesomeness
			name = "Herb of Awesomeness"
			final_result = /obj/attainable/herbs/Herb_of_Awesomeness
			steps = 20
			//mustknow = 1
			ingredients = list("Herb" = /obj/attainable/herbs/Herb, "Magic Herb" = /obj/attainable/herbs/Magic_Herb)

//Imbues
	//Strength
		Prismatic_Ruby
			name = "Prismatic Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Prismatic_Ruby
			steps = 125
		//	ingredients = list("Slime Ruby"=/obj/attainable/augments/Gems/Strength/Slime_Ruby,"Wyvern Ruby"=/obj/attainable/augments/Gems/Strength/Wyvern_Ruby,"Dragon Ruby"=/obj/attainable/augments/Gems/Strength/Dragon_Ruby,"Valrogs Ruby"=/obj/attainable/augments/Gems/Strength/Valrogs_Ruby,"Eternal Ruby"=/obj/attainable/augments/Gems/Strength/Eternal_Ruby)
		Slime_Ruby
			name = "Slime Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Slime_Ruby
			steps = 25
			ingredients = list("Regular Strength Seed" = /obj/attainable/NormalSeeds/Regular_Strength, "Tarnished Slime Ruby" = /obj/attainable/Imbues/Tarnished_Slime_Ruby)
		Wyvern_Ruby
			name = "Wyvern Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Wyvern_Ruby
			steps = 25
			ingredients = list("Regular Strength Seed" = /obj/attainable/NormalSeeds/Regular_Strength, "Tarnished Wyvern Ruby" = /obj/attainable/Imbues/Tarnished_Wyvern_Ruby)
		Dragon_Ruby
			name = "Dragon Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Dragon_Ruby
			steps = 25
			ingredients = list("Regular Strength Seed" = /obj/attainable/NormalSeeds/Regular_Strength, "Tarnished Dragon Ruby" = /obj/attainable/Imbues/Tarnished_Dragon_Ruby)
		Valrog_Ruby
			name = "Valrog Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Valrogs_Ruby
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Valrog Ruby" = /obj/attainable/Imbues/Tarnished_Valrog_Ruby)
		Eternal_Ruby
			name = "Eternal Ruby"
			final_result = /obj/attainable/augments/Gems/Strength/Eternal_Ruby
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Eternal Ruby" = /obj/attainable/Imbues/Tarnished_Eternal_Ruby)
	//Damage %

		Slime_Deathstone
			name = "Slime Deathstone"
			final_result = /obj/attainable/augments/Gems/Damage/Slime_Deathstone
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Slime Deathstone" = /obj/attainable/Imbues/Tarnished_Slime_Deathstone)
		Wyvern_Deathstone
			name = "Wyvern Deathstone"
			final_result = /obj/attainable/augments/Gems/Damage/Wyvern_Deathstone
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Wyvern Deathstone" = /obj/attainable/Imbues/Tarnished_Wyvern_Deathstone)
		Dragon_Deathstone
			name = "Dragon Deathstone"
			final_result = /obj/attainable/augments/Gems/Damage/Dragon_Deathstone
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Dragon Deathstone" = /obj/attainable/Imbues/Tarnished_Dragon_Deathstone)
		Valrog_Deathstone
			name = "Valrog Deathstone"
			final_result = /obj/attainable/augments/Gems/Damage/Valrogs_Deathstone
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength,"Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Valrog Deathstone" = /obj/attainable/Imbues/Tarnished_Valrog_Deathstone)
		Eternal_Deathstone
			name = "Eternal Deathstone"
			final_result = /obj/attainable/augments/Gems/Damage/Eternal_Deathstone
			steps = 25
			ingredients = list("Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength,"Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength,"Quality Strength Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Strength, "Tarnished Eternal Deathstone" = /obj/attainable/Imbues/Tarnished_Eternal_Deathstone)

	//Crit
		Prismatic_Pearl
			name = "Prismatic Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Prismatic_Pearl
			steps = 125
		//	ingredients = list("Slime Pearl"=/obj/attainable/augments/Gems/Crit/Slime_Pearl,"Wyvern Pearl"=/obj/attainable/augments/Gems/Crit/Wyvern_Pearl,"Dragon Pearl"=/obj/attainable/augments/Gems/Crit/Dragon_Pearl,"Valrogs_Pearl"=/obj/attainable/augments/Gems/Crit/Valrogs_Pearl,"Eternal Pearl"=/obj/attainable/augments/Gems/Crit/Eternal_Pearl)
		Slime_Pearl
			name = "Slime Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Slime_Pearl
			steps = 25
			ingredients = list("Regular Luck Seed" = /obj/attainable/NormalSeeds/Regular_Luck, "Tarnished Slime Pearl" = /obj/attainable/Imbues/Tarnished_Slime_Pearl)
		Wyvern_Pearl
			name = "Wyvern Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Wyvern_Pearl
			steps = 25
			ingredients = list("Regular Luck Seed" = /obj/attainable/NormalSeeds/Regular_Luck, "Tarnished Wyvern Pearl" = /obj/attainable/Imbues/Tarnished_Wyvern_Pearl)
		Dragon_Pearl
			name = "Dragon Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Dragon_Pearl
			steps = 25
			ingredients = list("Regular Luck Seed" = /obj/attainable/NormalSeeds/Regular_Luck, "Tarnished Dragon Pearl" = /obj/attainable/Imbues/Tarnished_Dragon_Pearl)
		Valrog_Pearl
			name = "Valrog Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Valrogs_Pearl
			steps = 25
			ingredients = list("Quality Luck Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Luck, "Tarnished Valrog Pearl" = /obj/attainable/Imbues/Tarnished_Valrog_Pearl)
		Eternal_Pearl
			name = "Eternal Pearl"
			final_result = /obj/attainable/augments/Gems/Crit/Eternal_Pearl
			steps = 25
			ingredients = list("Quality Luck Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Luck, "Tarnished Eternal Pearl" = /obj/attainable/Imbues/Tarnished_Eternal_Pearl)



			//Quartz
		Prismatic_Quartz
			name = "Prismatic_Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Prismatic_Quartz
			steps = 100
		//	ingredients = list("Slime Quartz"=/obj/attainable/augments/Gems/Agility/Slime_Quartz,"Wyvern Quartz"=/obj/attainable/augments/Gems/Agility/Wyvern_Quartz,"Dragon Quartz"=/obj/attainable/augments/Gems/Agility/Dragon_Quartz,"Valrogs Quartz"=/obj/attainable/augments/Gems/Agility/Valrogs_Quartz,"Eternal Quartz"=/obj/attainable/augments/Gems/Agility/Eternal_Quartz)
		Slime_Quartz
			name = "Slime Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Slime_Quartz
			steps = 25
			ingredients = list("Regular Agility Seed" = /obj/attainable/NormalSeeds/Regular_Agility, "Tarnished Slime Quartz" = /obj/attainable/Imbues/Tarnished_Slime_Quartz)
		Wyvern_Quartz
			name = "Wyvern Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Wyvern_Quartz
			steps = 25
			ingredients = list("Regular Agility Seed" = /obj/attainable/NormalSeeds/Regular_Agility, "Tarnished Wyvern Quartz" = /obj/attainable/Imbues/Tarnished_Wyvern_Quartz)
		Dragon_Quartz
			name = "Dragon Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Dragon_Quartz
			steps = 25
			ingredients = list("Regular Agility Seed" = /obj/attainable/NormalSeeds/Regular_Agility, "Tarnished Dragon Quartz" = /obj/attainable/Imbues/Tarnished_Dragon_Quartz)
		Valrog_Quartz
			name = "Valrog Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Valrogs_Quartz
			steps = 25
			ingredients = list("Quality Agility Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Agility, "Tarnished Valrog Quartz" = /obj/attainable/Imbues/Tarnished_Valrog_Quartz)
		Eternal_Quartz
			name = "Eternal Quartz"
			final_result = /obj/attainable/augments/Gems/Agility/Eternal_Quartz
			steps = 25
			ingredients = list("Quality Agility Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Agility, "Tarnished Eternal Quartz" = /obj/attainable/Imbues/Tarnished_Eternal_Quartz)

			//Sapphire
		Prismatic_Sapphire
			name = "Prismatic Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Prismatic_Sapphire
			steps = 100
		//	ingredients = list("Slime Sapphire"=/obj/attainable/augments/Gems/Health/Slime_Sapphire,"Wyvern Sapphire"=/obj/attainable/augments/Gems/Health/Wyvern_Sapphire,"Dragon Sapphire"=/obj/attainable/augments/Gems/Health/Dragon_Sapphire,"Valrogs Sapphire"=/obj/attainable/augments/Gems/Health/Valrogs_Sapphire,"Eternal Sapphire"=/obj/attainable/augments/Gems/Health/Eternal_Sapphire)

		Slime_Sapphire
			name = "Slime Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Slime_Sapphire
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health, "Tarnished Slime Sapphire" = /obj/attainable/Imbues/Tarnished_Slime_Sapphire)
		Wyvern_Sapphire
			name = "Wyvern Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Wyvern_Sapphire
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health, "Tarnished Wyvern Sapphire" = /obj/attainable/Imbues/Tarnished_Wyvern_Sapphire)
		Dragon_Sapphire
			name = "Dragon Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Dragon_Sapphire
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health, "Tarnished Dragon Sapphire" = /obj/attainable/Imbues/Tarnished_Dragon_Sapphire)
		Valrog_Sapphire
			name = "Valrog Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Valrogs_Sapphire
			steps = 25
			ingredients = list("Quality Health Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Health, "Tarnished Valrog Sapphire" = /obj/attainable/Imbues/Tarnished_Valrog_Sapphire)
		Eternal_Sapphire
			name = "Eternal Sapphire"
			final_result = /obj/attainable/augments/Gems/Health/Eternal_Sapphire
			steps = 25
			ingredients = list("Quality Health Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Health, "Tarnished Eternal Sapphire" = /obj/attainable/Imbues/Tarnished_Eternal_Sapphire)

			//Diamond
		Prismatic_Diamond
			name = "Prismatic Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Prismatic_Diamond
			steps = 100
		//	ingredients = list("Slime Diamond"=/obj/attainable/augments/Gems/Defense/Slime_Diamond,"Wyvern Diamond"=/obj/attainable/augments/Gems/Defense/Wyvern_Diamond,"Dragon Diamond"=/obj/attainable/augments/Gems/Defense/Dragon_Diamond,"Valrogs Diamond"=/obj/attainable/augments/Gems/Defense/Valrogs_Diamond,"Eternal Diamond"=/obj/attainable/augments/Gems/Defense/Eternal_Diamond)

		Slime_Diamond
			name = "Slime Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Slime_Diamond
			steps = 25
			ingredients = list("Regular Defense Seed" = /obj/attainable/NormalSeeds/Regular_Defense, "Tarnished Slime Diamond" = /obj/attainable/Imbues/Tarnished_Slime_Diamond)
		Wyvern_Diamond
			name = "Wyvern Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Wyvern_Diamond
			steps = 25
			ingredients = list("Regular Defense Seed" = /obj/attainable/NormalSeeds/Regular_Defense, "Tarnished Wyvern Diamond" = /obj/attainable/Imbues/Tarnished_Wyvern_Diamond)
		Dragon_Diamond
			name = "Dragon Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Dragon_Diamond
			steps = 25
			ingredients = list("Regular Defense Seed" = /obj/attainable/NormalSeeds/Regular_Defense, "Tarnished Dragon Diamond" = /obj/attainable/Imbues/Tarnished_Dragon_Diamond)
		Valrog_Diamond
			name = "Valrog Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Valrogs_Diamond
			steps = 25
			ingredients = list("Quality Defense Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Defense, "Tarnished Valrog Diamond" = /obj/attainable/Imbues/Tarnished_Valrog_Diamond)
		Eternal_Diamond
			name = "Eternal Diamond"
			final_result = /obj/attainable/augments/Gems/Defense/Eternal_Diamond
			steps = 25
			ingredients = list("Quality Defense Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Defense, "Tarnished Eternal Diamond" = /obj/attainable/Imbues/Tarnished_Eternal_Diamond)

			//Emerald
		Prismatic_Emerald
			name = "Prismatic Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Prismatic_Emerald
			steps = 100
		//	ingredients = list("Slime Emerald"=/obj/attainable/augments/Gems/Magic/Slime_Emerald,"Wyvern Emerald"=/obj/attainable/augments/Gems/Magic/Wyvern_Emerald,"Dragon Emerald"=/obj/attainable/augments/Gems/Magic/Dragon_Emerald,"Valrogs Emerald"=/obj/attainable/augments/Gems/Magic/Valrogs_Emerald,"Eternal Emerald"=/obj/attainable/augments/Gems/Magic/Eternal_Emerald)

		Slime_Emerald
			name = "Slime Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Slime_Emerald
			steps = 25
			ingredients = list("Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Slime Emerald" = /obj/attainable/Imbues/Tarnished_Slime_Emerald)
		Wyvern_Emerald
			name = "Wyvern Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Wyvern_Emerald
			steps = 25
			ingredients = list("Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Wyvern Emerald" = /obj/attainable/Imbues/Tarnished_Wyvern_Emerald)
		Dragon_Emerald
			name = "Dragon Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Dragon_Emerald
			steps = 25
			ingredients = list("Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Dragon Emerald" = /obj/attainable/Imbues/Tarnished_Dragon_Emerald)
		Valrog_Emerald
			name = "Valrog Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Valrogs_Emerald
			steps = 25
			ingredients = list("Quality Magic Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Magic, "Tarnished Valrog Emerald" = /obj/attainable/Imbues/Tarnished_Valrog_Emerald)
		Eternal_Emerald
			name = "Eternal Emerald"
			final_result = /obj/attainable/augments/Gems/Magic/Eternal_Emerald
			steps = 25
			ingredients = list("Quality Magic Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Magic, "Tarnished Eternal Emerald" = /obj/attainable/Imbues/Tarnished_Eternal_Emerald)

		//Heartstone
		Prismatic_Heartstone
			name = "Prismatic Heartstone"
			final_result = /obj/attainable/augments/Gems/Combo/Prismatic_Heartstone
			steps = 100
		//	ingredients = list("Slime Heartstone"=/obj/attainable/augments/Gems/Combo/Slime_Heartstone,"Wyvern Heartstone"=/obj/attainable/augments/Gems/Combo/Wyvern_Heartstone,"Dragon Heartstone"=/obj/attainable/augments/Gems/Combo/Dragon_Heartstone,"Valrogs Hearstone"=/obj/attainable/augments/Gems/Combo/Valrogs_Heartstone,"Eternal Hearstone"=/obj/attainable/augments/Gems/Combo/Eternal_Heartstone)
		Slime_Heartstone
			name = "Slime Heartstone"
			final_result = /obj/attainable/augments/Gems/Combo/Slime_Heartstone
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health,"Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Slime Heartstone" = /obj/attainable/Imbues/Tarnished_Slime_Heartstone)
		Wyvern_Heartstone
			name = "Wyvern Emerald"
			final_result = /obj/attainable/augments/Gems/Combo/Wyvern_Heartstone
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health,"Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Wyvern Heartstone" = /obj/attainable/Imbues/Tarnished_Wyvern_Heartstone)
		Dragon_Heartstone
			name = "Dragon Heartstone"
			final_result = /obj/attainable/augments/Gems/Combo/Dragon_Heartstone
			steps = 25
			ingredients = list("Regular Health Seed" = /obj/attainable/NormalSeeds/Regular_Health,"Regular Magic Seed" = /obj/attainable/NormalSeeds/Regular_Magic, "Tarnished Dragon Heartstone" = /obj/attainable/Imbues/Tarnished_Dragon_Heartstone)
		Valrog_Heartstone
			name = "Valrog Heartstone"
			final_result = /obj/attainable/augments/Gems/Combo/Valrogs_Heartstone
			steps = 25
			ingredients = list("Quality Health Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Health,"Quality Magic Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Magic, "Tarnished Valrog Heartstone" = /obj/attainable/Imbues/Tarnished_Valrog_Heartstone)
		Eternal_Heartstone
			name = "Eternal Heartstone"
			final_result = /obj/attainable/augments/Gems/Combo/Eternal_Heartstone
			steps = 25
			ingredients = list("Quality Health Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Health,"Quality Magic Seed" = /obj/attainable/Upgrades/Seeds/QualitySeeds/Quality_Magic, "Tarnished Eternal Heartstone" = /obj/attainable/Imbues/Tarnished_Eternal_Heartstone)
//Charms & Scales

		Prismatic_Charm
			name = "Prismatic Charm"
			final_result = /obj/attainable/equipment/charm/dragon_scales/Prismatic_Charm
			steps = 100
			ingredients = list("Lightning Charm"=/obj/attainable/equipment/charm/dragon_scales/Lightning_Charm,"Fire Charm"=/obj/attainable/equipment/charm/dragon_scales/Fire_Charm,"Wind Charm" =/obj/attainable/equipment/charm/dragon_scales/Wind_Charm,"Ice Charm"=/obj/attainable/equipment/charm/dragon_scales/Ice_Charm)
		Divinegon_Scale
			name = "Divinegon Scale"
			final_result = /obj/attainable/equipment/charm/dragon_scales/Divinegon_Scale
			steps = 100
			ingredients = list("Prismatic Charm"=/obj/attainable/equipment/charm/dragon_scales/Prismatic_Charm,"Crystal Dragon Scale" =/obj/attainable/equipment/charm/dragon_scales/Crystal_Dragon_Scale,"Arcane Dragon Scale"=/obj/attainable/equipment/charm/dragon_scales/Arcane_Dragon_Scale,"Sky Dragon Scale"=/obj/attainable/equipment/charm/dragon_scales/Sky_Dragon_Scale,"Dragon Lord Scale"=/obj/attainable/equipment/charm/dragon_scales/Dragon_Lord_Scale)

//Demonium Upgrades
	/*	Weapon
			name=""
			final_result = /obj/attainable/equipment/Class/
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,""=/obj/attainable/equipment/Class/)	*/

		Talwar
			name="Talwar"
			final_result = /obj/attainable/equipment/Thief/Talwar
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Shamshir"=/obj/attainable/equipment/Thief/Cursed_Shamshir)
		Sudarshana_Chakra
			name="Sudarshana Chakra"
			final_result = /obj/attainable/equipment/Thief/Sudarshana_Chakra
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Chakram"=/obj/attainable/equipment/Thief/Cursed_Chakram)
		Runesword
			name="Runesword"
			final_result = /obj/attainable/equipment/Sage/Runesword
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Longsword"=/obj/attainable/equipment/Sage/Cursed_Longsword)
		Emerald_Blade
			name="Emerald Blade"
			final_result = /obj/attainable/equipment/Sage/Emerald_Blade
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Sword"=/obj/attainable/equipment/Sage/Cursed_Sword)
		Demonium_Bow
			name="Demonium Bow"
			final_result = /obj/attainable/equipment/Ranger/Demonium_Bow
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Bow"=/obj/attainable/equipment/Ranger/Cursed_Bow)
		Thunderbolt
			name="Thunderbolt"
			final_result = /obj/attainable/equipment/Ranger/Thunderbolt
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Arrow"=/obj/attainable/equipment/Ranger/Cursed_Arrow)
		Bonecleaver
			name="Bonecleaver"
			final_result = /obj/attainable/equipment/Soldier/Bonecleaver
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Battleaxe"=/obj/attainable/equipment/Soldier/Cursed_Battleaxe)
		Orichalcum_Shield
			name="Orichalcum Shield"
			final_result = /obj/attainable/equipment/Soldier/Orichalcum_Shield
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Shield"=/obj/attainable/equipment/Soldier/Cursed_Shield)
		Typhoon
			name="Typhoon"
			final_result = /obj/attainable/equipment/Assassin/Typhoon
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Katana"=/obj/attainable/equipment/Assassin/Cursed_Katana)
		Dark_Genesis
			name="Dark Genesis"
			final_result = /obj/attainable/equipment/Chaosmage/Dark_Genesis
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Book"=/obj/attainable/equipment/Chaosmage/Cursed_Book)
		Ceremonial_Dagger
			name="Ceremonial Dagger"
			final_result = /obj/attainable/equipment/Chaosmage/Ceremonial_Dagger
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Dagger"=/obj/attainable/equipment/Chaosmage/Cursed_Dagger)
		Blessed_Staff
			name="Blessed Staff"
			final_result = /obj/attainable/equipment/WizardPilgrim/Blessed_Staff
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Staff"=/obj/attainable/equipment/WizardPilgrim/Cursed_Staff)
		Book_of_Light
			name="Book of Light"
			final_result = /obj/attainable/equipment/WizardPilgrim/Book_of_Light
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Spellbook"=/obj/attainable/equipment/WizardPilgrim/Cursed_Spellbook)
		Lilith_Tail
			name="Lilith Tail"
			final_result = /obj/attainable/equipment/PilgrimWizard/Lilith_Tail
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Whip"=/obj/attainable/equipment/PilgrimWizard/Cursed_Whip)
		Devil_Gauntlets
			name="Devil Gauntlets"
			final_result = /obj/attainable/equipment/Monk/Devil_Gauntlets
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Claws"=/obj/attainable/equipment/Monk/Cursed_Claws)
		Ragnarok
			name="Ragnarok"
			final_result = /obj/attainable/equipment/HolyKnight/Ragnarok
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Rusted Longsword"=/obj/attainable/equipment/HolyKnight/Rusted_Longsword)
		Dragontooth
			name=""
			final_result = /obj/attainable/equipment/HolyKnight/Dragontooth
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Rusted Shortsword"=/obj/attainable/equipment/HolyKnight/Rusted_Shortsword)
		Staff_of_Divinegon
			name="Staff of Divinegon"
			final_result = /obj/attainable/equipment/Dragovian/Staff_of_Divinegon
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Bo"=/obj/attainable/equipment/Dragovian/Cursed_Bo)
		Divine_Pearl
			name="Divine Pearl"
			final_result = /obj/attainable/equipment/Dragovian/Divine_Pearl
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Orb"=/obj/attainable/equipment/Dragovian/Cursed_Orb)
		Fool_Wand
			name="Fool Wand"
			final_result = /obj/attainable/equipment/GoofOff/Fool_Wand
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Wand"=/obj/attainable/equipment/GoofOff/Cursed_Wand)
		Deck_of_Jokers
			name="Deck of Jokers"
			final_result = /obj/attainable/equipment/GoofOff/Deck_of_Jokers
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Deck"=/obj/attainable/equipment/GoofOff/Cursed_Deck)
		Soothsayer_Sword
			name="Soothsayer Sword"
			final_result = /obj/attainable/equipment/BardEnt/Soothsayer_Sword
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Rapier"=/obj/attainable/equipment/BardEnt/Cursed_Rapier)
		Orichalcum_Harp
			name="Orichalcum Harp"
			final_result = /obj/attainable/equipment/BardEnt/Orichalcum_Harp
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Cursed Harp"=/obj/attainable/equipment/BardEnt/Cursed_Harp)
	//Upgrades
		TalwarONE
			name="Talwar +1"
			final_result = /obj/attainable/equipment/Upgraded/TalwarONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Talwar"=/obj/attainable/equipment/Thief/Talwar)
		TalwarTWO
			name="Talwar +2"
			final_result = /obj/attainable/equipment/Upgraded/TalwarTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Talwar +1"=/obj/attainable/equipment/Upgraded/TalwarONE)
		TalwarTHREE
			name="Talwar +3"
			final_result = /obj/attainable/equipment/Upgraded/TalwarTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Talwar +2"=/obj/attainable/equipment/Upgraded/TalwarTWO)
		TalwarFOUR
			name="Talwar +4"
			final_result = /obj/attainable/equipment/Upgraded/TalwarFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Talwar +3"=/obj/attainable/equipment/Upgraded/TalwarTHREE)


		TalwarFIVE
			name="Talwar +5"
			final_result = /obj/attainable/equipment/Upgraded/TalwarFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Talwar +4"=/obj/attainable/equipment/Upgraded/TalwarFOUR)

		Sudarshana_ChakraONE
			name="Talwar +1"
			final_result = /obj/attainable/equipment/Upgraded/Sudarshana_ChakraONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Sudarshana Chakra"=/obj/attainable/equipment/Thief/Sudarshana_Chakra)
		Sudarshana_ChakraTWO
			name="Talwar +2"
			final_result = /obj/attainable/equipment/Upgraded/Sudarshana_ChakraTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Sudarshana Chakra +1"=/obj/attainable/equipment/Upgraded/Sudarshana_ChakraONE)
		Sudarshana_ChakraTHREE
			name="Talwar +3"
			final_result = /obj/attainable/equipment/Upgraded/Sudarshana_ChakraTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Sudarshana Chakra +2"=/obj/attainable/equipment/Upgraded/Sudarshana_ChakraTWO)
		Sudarshana_ChakraFOUR
			name="Talwar +4"
			final_result = /obj/attainable/equipment/Upgraded/Sudarshana_ChakraFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Sudarshana Chakra +3"=/obj/attainable/equipment/Upgraded/Sudarshana_ChakraTHREE)



		Sudarshana_ChakraFIVE
			name="Talwar +5"
			final_result = /obj/attainable/equipment/Upgraded/Sudarshana_ChakraFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Sudarshana Chakra +4"=/obj/attainable/equipment/Upgraded/Sudarshana_ChakraFOUR)


		RuneswordONE
			name="Runesword +1"
			final_result = /obj/attainable/equipment/Upgraded/RuneswordONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Runesword"=/obj/attainable/equipment/Sage/Runesword)
		RuneswordTWO
			name="Runesword +2"
			final_result = /obj/attainable/equipment/Upgraded/RuneswordTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Runesword +1"=/obj/attainable/equipment/Upgraded/RuneswordONE)
		RuneswordTHREE
			name="Runesword +3"
			final_result = /obj/attainable/equipment/Upgraded/RuneswordTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Runesword +2"=/obj/attainable/equipment/Upgraded/RuneswordTWO)
		RuneswordFOUR
			name="Runesword +4"
			final_result = /obj/attainable/equipment/Upgraded/RuneswordFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Runesword +3"=/obj/attainable/equipment/Upgraded/RuneswordTHREE)


		RuneswordFIVE
			name="Runesword +5"
			final_result = /obj/attainable/equipment/Upgraded/RuneswordFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Runesword +4"=/obj/attainable/equipment/Upgraded/RuneswordFOUR)


		Emerald_BladeONE
			name="Runesword +1"
			final_result = /obj/attainable/equipment/Upgraded/Emerald_BladeONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Emerald Blade"=/obj/attainable/equipment/Sage/Emerald_Blade)
		Emerald_BladeTWO
			name="Runesword +2"
			final_result = /obj/attainable/equipment/Upgraded/Emerald_BladeTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Emerald Blade +1"=/obj/attainable/equipment/Upgraded/Emerald_BladeONE)
		Emerald_BladeTHREE
			name="Runesword +3"
			final_result = /obj/attainable/equipment/Upgraded/Emerald_BladeTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Emerald Blade +2"=/obj/attainable/equipment/Upgraded/Emerald_BladeTWO)
		Emerald_BladeFOUR
			name="Runesword +4"
			final_result = /obj/attainable/equipment/Upgraded/Emerald_BladeFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Emerald Blade +3"=/obj/attainable/equipment/Upgraded/Emerald_BladeTHREE)


		Emerald_BladeFIVE
			name="Runesword +5"
			final_result = /obj/attainable/equipment/Upgraded/Emerald_BladeFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Emerald Blade +4"=/obj/attainable/equipment/Upgraded/Emerald_BladeFOUR)


		Demonium_BowONE
			name="Demonium Bow +1"
			final_result = /obj/attainable/equipment/Upgraded/Demonium_BowONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow"=/obj/attainable/equipment/Ranger/Demonium_Bow)
		Demonium_BowTWO
			name="Demonium Bow +1"
			final_result = /obj/attainable/equipment/Upgraded/Demonium_BowTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +1"=/obj/attainable/equipment/Upgraded/Demonium_BowONE)
		Demonium_BowTHREE
			name="Demonium Bow +1"
			final_result = /obj/attainable/equipment/Upgraded/Demonium_BowTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +2"=/obj/attainable/equipment/Upgraded/Demonium_BowTWO)
		Demonium_BowFOUR
			name="Demonium Bow +1"
			final_result = /obj/attainable/equipment/Upgraded/Demonium_BowFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +3"=/obj/attainable/equipment/Upgraded/Demonium_BowTHREE)


		Demonium_BowFIVE
			name="Demonium Bow +1"
			final_result = /obj/attainable/equipment/Upgraded/Demonium_BowFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Demonium Bow +4"=/obj/attainable/equipment/Upgraded/Demonium_BowFOUR)


		ThunderboltONE
			name="Thunderbolt +1"
			final_result = /obj/attainable/equipment/Upgraded/ThunderboltONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow"=/obj/attainable/equipment/Ranger/Thunderbolt)
		ThunderboltTWO
			name="Thunderbolt +2"
			final_result = /obj/attainable/equipment/Upgraded/ThunderboltTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +1"=/obj/attainable/equipment/Upgraded/ThunderboltONE)
		ThunderboltTHREE
			name="Thunderbolt +3"
			final_result = /obj/attainable/equipment/Upgraded/ThunderboltTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +2"=/obj/attainable/equipment/Upgraded/ThunderboltTWO)
		ThunderboltFOUR
			name="Thunderbolt +4"
			final_result = /obj/attainable/equipment/Upgraded/ThunderboltFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Demonium Bow +3"=/obj/attainable/equipment/Upgraded/ThunderboltTHREE)


		ThunderboltFIVE
			name="Thunderbolt +5"
			final_result = /obj/attainable/equipment/Upgraded/ThunderboltFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Demonium Bow +4"=/obj/attainable/equipment/Upgraded/ThunderboltFOUR)


		BonecleaverONE
			name="Bonecleaver +1"
			final_result = /obj/attainable/equipment/Upgraded/BonecleaverONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Bonecleaver"=/obj/attainable/equipment/Soldier/Bonecleaver)
		BonecleaverTWO
			name="Bonecleaver +2"
			final_result = /obj/attainable/equipment/Upgraded/BonecleaverTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Bonecleaver +1"=/obj/attainable/equipment/Upgraded/BonecleaverONE)
		BonecleaverTHREE
			name="Bonecleaver +3"
			final_result = /obj/attainable/equipment/Upgraded/BonecleaverTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Bonecleaver +2"=/obj/attainable/equipment/Upgraded/BonecleaverTWO)
		BonecleaverFOUR
			name="Bonecleaver +4"
			final_result = /obj/attainable/equipment/Upgraded/BonecleaverFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Bonecleaver +3"=/obj/attainable/equipment/Upgraded/BonecleaverTHREE)


		BonecleaverFIVE
			name="Bonecleaver +5"
			final_result = /obj/attainable/equipment/Upgraded/BonecleaverFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Bonecleaver +4"=/obj/attainable/equipment/Upgraded/BonecleaverFOUR)


		Orichalcum_ShieldONE
			name="Orichalcum Shield +1"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_ShieldONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Shield"=/obj/attainable/equipment/Soldier/Orichalcum_Shield)
		Orichalcum_ShieldTWO
			name="Orichalcum Shield +2"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_ShieldTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Shield +1"=/obj/attainable/equipment/Upgraded/Orichalcum_ShieldONE)
		Orichalcum_ShieldTHREE
			name="Orichalcum Shield +3"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_ShieldTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Shield +2"=/obj/attainable/equipment/Upgraded/Orichalcum_ShieldTWO)
		Orichalcum_ShieldFOUR
			name="Orichalcum Shield +4"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_ShieldFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Shield +3"=/obj/attainable/equipment/Upgraded/Orichalcum_ShieldTHREE)


		Orichalcum_ShieldFIVE
			name="Orichalcum Shield +5"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_ShieldFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Orichalcum Shield +3"=/obj/attainable/equipment/Upgraded/Orichalcum_ShieldFOUR)



		TyphoonONE
			name="Typhoon +1"
			final_result = /obj/attainable/equipment/Upgraded/TyphoonONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Typhoon"=/obj/attainable/equipment/Assassin/Typhoon)
		TyphoonTWO
			name="Typhoon +2"
			final_result = /obj/attainable/equipment/Upgraded/TyphoonTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Typhoon +1"=/obj/attainable/equipment/Upgraded/TyphoonONE)
		TyphoonTHREE
			name="Typhoon +3"
			final_result = /obj/attainable/equipment/Upgraded/TyphoonTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Typhoon +2"=/obj/attainable/equipment/Upgraded/TyphoonTWO)
		TyphoonFOUR
			name="Typhoon +4"
			final_result = /obj/attainable/equipment/Upgraded/TyphoonFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Typhoon +3"=/obj/attainable/equipment/Upgraded/TyphoonTHREE)


		TyphoonFIVE
			name="Typhoon +4"
			final_result = /obj/attainable/equipment/Upgraded/TyphoonFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Typhoon +3"=/obj/attainable/equipment/Upgraded/TyphoonFOUR)


		Devil_GauntletsONE
			name="Devil Gauntlets +1"
			final_result = /obj/attainable/equipment/Upgraded/Devil_GauntletsONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Devil Gauntlets"=/obj/attainable/equipment/Monk/Devil_Gauntlets)
		Devil_GauntletsTWO
			name="Devil Gauntlets +2"
			final_result = /obj/attainable/equipment/Upgraded/Devil_GauntletsTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Devil Gauntlets +1"=/obj/attainable/equipment/Upgraded/Devil_GauntletsONE)
		Devil_GauntletsTHREE
			name="Devil Gauntlets +3"
			final_result = /obj/attainable/equipment/Upgraded/Devil_GauntletsTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Devil Gauntlets +2"=/obj/attainable/equipment/Upgraded/Devil_GauntletsTWO)
		Devil_GauntletsFOUR
			name="Devil Gauntlets +4"
			final_result = /obj/attainable/equipment/Upgraded/Devil_GauntletsFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Devil Gauntlets +3"=/obj/attainable/equipment/Upgraded/Devil_GauntletsTHREE)


		Devil_GauntletsFIVE
			name="Devil Gauntlets +4"
			final_result = /obj/attainable/equipment/Upgraded/Devil_GauntletsFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Devil Gauntlets +3"=/obj/attainable/equipment/Upgraded/Devil_GauntletsFOUR)


		Dark_GenesisONE
			name="Dark Genesis +1"
			final_result = /obj/attainable/equipment/Upgraded/Dark_GenesisONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dark Genesis"=/obj/attainable/equipment/Chaosmage/Dark_Genesis)
		Dark_GenesisTWO
			name="Dark Genesis +2"
			final_result = /obj/attainable/equipment/Upgraded/Dark_GenesisTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dark Genesis +1"=/obj/attainable/equipment/Upgraded/Dark_GenesisONE)
		Dark_GenesisTHREE
			name="Dark Genesis +3"
			final_result = /obj/attainable/equipment/Upgraded/Dark_GenesisTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dark Genesis +2"=/obj/attainable/equipment/Upgraded/Dark_GenesisTWO)
		Dark_GenesisFOUR
			name="Dark Genesis +4"
			final_result = /obj/attainable/equipment/Upgraded/Dark_GenesisFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dark Genesis +3"=/obj/attainable/equipment/Upgraded/Dark_GenesisTHREE)


		Dark_GenesisFIVE
			name="Dark Genesis +4"
			final_result = /obj/attainable/equipment/Upgraded/Dark_GenesisFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Dark Genesis +3"=/obj/attainable/equipment/Upgraded/Dark_GenesisFOUR)


		Ceremonial_DaggerONE
			name="Ceremonial Dagger +1"
			final_result = /obj/attainable/equipment/Upgraded/Ceremonial_DaggerONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ceremonial Dagger"=/obj/attainable/equipment/Chaosmage/Ceremonial_Dagger)
		Ceremonial_DaggerTWO
			name="Ceremonial Dagger +2"
			final_result = /obj/attainable/equipment/Upgraded/Ceremonial_DaggerTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ceremonial Dagger +1"=/obj/attainable/equipment/Upgraded/Ceremonial_DaggerONE)
		Ceremonial_DaggerTHREE
			name="Ceremonial Dagger +3"
			final_result = /obj/attainable/equipment/Upgraded/Ceremonial_DaggerTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ceremonial Dagger +2"=/obj/attainable/equipment/Upgraded/Ceremonial_DaggerTWO)
		Ceremonial_DaggerFOUR
			name="Ceremonial Dagger +4"
			final_result = /obj/attainable/equipment/Upgraded/Ceremonial_DaggerFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ceremonial Dagger +3"=/obj/attainable/equipment/Upgraded/Ceremonial_DaggerTHREE)


		Ceremonial_DaggerFIVE
			name="Ceremonial Dagger +4"
			final_result = /obj/attainable/equipment/Upgraded/Ceremonial_DaggerFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Ceremonial Dagger +3"=/obj/attainable/equipment/Upgraded/Ceremonial_DaggerFOUR)


		Blessed_StaffONE
			name="Blessed Staff +1"
			final_result = /obj/attainable/equipment/Upgraded/Blessed_StaffONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Blessed Staff"=/obj/attainable/equipment/WizardPilgrim/Blessed_Staff)
		Blessed_StaffTWO
			name="Blessed Staff +2"
			final_result = /obj/attainable/equipment/Upgraded/Blessed_StaffTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Blessed Staff +1"=/obj/attainable/equipment/Upgraded/Blessed_StaffONE)
		Blessed_StaffTHREE
			name="Blessed Staff +3"
			final_result = /obj/attainable/equipment/Upgraded/Blessed_StaffTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Blessed Staff +2"=/obj/attainable/equipment/Upgraded/Blessed_StaffTWO)
		Blessed_StaffFOUR
			name="Blessed Staff +4"
			final_result = /obj/attainable/equipment/Upgraded/Blessed_StaffFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Blessed Staff +3"=/obj/attainable/equipment/Upgraded/Blessed_StaffTHREE)



		Blessed_StaffFIVE
			name="Blessed Staff +4"
			final_result = /obj/attainable/equipment/Upgraded/Blessed_StaffFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Blessed Staff +3"=/obj/attainable/equipment/Upgraded/Blessed_StaffFOUR)


		Book_of_LightONE
			name="Book of Light +1"
			final_result = /obj/attainable/equipment/Upgraded/Book_of_LightONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Book of Light"=/obj/attainable/equipment/WizardPilgrim/Book_of_Light)
		Book_of_LightTWO
			name="Book of Light +2"
			final_result = /obj/attainable/equipment/Upgraded/Book_of_LightTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Book of Light +1"=/obj/attainable/equipment/Upgraded/Book_of_LightONE)
		Book_of_LightTHREE
			name="Book of Light +3"
			final_result = /obj/attainable/equipment/Upgraded/Book_of_LightTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Book of Light +2"=/obj/attainable/equipment/Upgraded/Book_of_LightTWO)
		Book_of_LightFOUR
			name="Book of Light +4"
			final_result = /obj/attainable/equipment/Upgraded/Book_of_LightFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Book of Light +3"=/obj/attainable/equipment/Upgraded/Book_of_LightTHREE)



		Book_of_LightFIVE
			name="Book of Light +4"
			final_result = /obj/attainable/equipment/Upgraded/Book_of_LightFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Book of Light +3"=/obj/attainable/equipment/Upgraded/Book_of_LightFOUR)


		Lilith_TailONE
			name="Lilith Tail +1"
			final_result = /obj/attainable/equipment/Upgraded/Lilith_TailONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Lilith Tail"=/obj/attainable/equipment/PilgrimWizard/Lilith_Tail)
		Lilith_TailTWO
			name="Lilith Tail +2"
			final_result = /obj/attainable/equipment/Upgraded/Lilith_TailTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Lilith Tail +1"=/obj/attainable/equipment/Upgraded/Lilith_TailONE)
		Lilith_TailTHREE
			name="Lilith Tail +3"
			final_result = /obj/attainable/equipment/Upgraded/Lilith_TailTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Lilith Tail +2"=/obj/attainable/equipment/Upgraded/Lilith_TailTWO)
		Lilith_TailFOUR
			name="Lilith Tail +4"
			final_result = /obj/attainable/equipment/Upgraded/Lilith_TailFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Lilith Tail +3"=/obj/attainable/equipment/Upgraded/Lilith_TailTHREE)


		Lilith_TailFIVE
			name="Lilith Tail +4"
			final_result = /obj/attainable/equipment/Upgraded/Lilith_TailFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Lilith Tail +3"=/obj/attainable/equipment/Upgraded/Lilith_TailFOUR)


		RagnarokONE
			name="Ragnarok +1"
			final_result = /obj/attainable/equipment/Upgraded/RagnarokONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ragnarok"=/obj/attainable/equipment/HolyKnight/Ragnarok)
		RagnarokTWO
			name="Ragnarok +2"
			final_result = /obj/attainable/equipment/Upgraded/RagnarokTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ragnarok +1"=/obj/attainable/equipment/Upgraded/RagnarokONE)
		RagnarokTHREE
			name="Ragnarok +3"
			final_result = /obj/attainable/equipment/Upgraded/RagnarokTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ragnarok +2"=/obj/attainable/equipment/Upgraded/RagnarokTWO)
		RagnarokFOUR
			name="Ragnarok +4"
			final_result = /obj/attainable/equipment/Upgraded/RagnarokFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Ragnarok +3"=/obj/attainable/equipment/Upgraded/RagnarokTHREE)


		RagnarokFIVE
			name="Ragnarok +4"
			final_result = /obj/attainable/equipment/Upgraded/RagnarokFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Ragnarok +3"=/obj/attainable/equipment/Upgraded/RagnarokFOUR)


		DragontoothONE
			name="Dragontooth +1"
			final_result = /obj/attainable/equipment/Upgraded/DragontoothONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dragontooth"=/obj/attainable/equipment/HolyKnight/Dragontooth)
		DragontoothTWO
			name="Dragontooth +2"
			final_result = /obj/attainable/equipment/Upgraded/DragontoothTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dragontooth +1"=/obj/attainable/equipment/Upgraded/DragontoothONE)
		DragontoothTHREE
			name="Dragontooth +3"
			final_result = /obj/attainable/equipment/Upgraded/DragontoothTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dragontooth +2"=/obj/attainable/equipment/Upgraded/DragontoothTWO)
		DragontoothFOUR
			name="Dragontooth +4"
			final_result = /obj/attainable/equipment/Upgraded/DragontoothFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Dragontooth +3"=/obj/attainable/equipment/Upgraded/DragontoothTHREE)

		DragontoothFIVE
			name="Dragontooth +4"
			final_result = /obj/attainable/equipment/Upgraded/DragontoothFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Dragontooth +3"=/obj/attainable/equipment/Upgraded/DragontoothFOUR)


		Staff_of_DivinegonONE
			name="Staff of Divinegon +1"
			final_result = /obj/attainable/equipment/Upgraded/Staff_of_DivinegonONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Staff of Divinegon"=/obj/attainable/equipment/Dragovian/Staff_of_Divinegon)
		Staff_of_DivinegonTWO
			name="Staff of Divinegon +2"
			final_result = /obj/attainable/equipment/Upgraded/Staff_of_DivinegonTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Staff of Divinegon +1"=/obj/attainable/equipment/Upgraded/Staff_of_DivinegonONE)
		Staff_of_DivinegonTHREE
			name="Staff of Divinegon +3"
			final_result = /obj/attainable/equipment/Upgraded/Staff_of_DivinegonTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Staff of Divinegon +2"=/obj/attainable/equipment/Upgraded/Staff_of_DivinegonTWO)
		Staff_of_DivinegonFOUR
			name="Staff of Divinegon +4"
			final_result = /obj/attainable/equipment/Upgraded/Staff_of_DivinegonFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Staff of Divinegon +3"=/obj/attainable/equipment/Upgraded/Staff_of_DivinegonTHREE)


		Staff_of_DivinegonFIVE
			name="Staff of Divinegon +4"
			final_result = /obj/attainable/equipment/Upgraded/Staff_of_DivinegonFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Staff of Divinegon +3"=/obj/attainable/equipment/Upgraded/Staff_of_DivinegonFOUR)


		Divine_PearlONE
			name="Divine Pearl +1"
			final_result = /obj/attainable/equipment/Upgraded/Divine_PearlONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Divine Pearl"=/obj/attainable/equipment/Dragovian/Divine_Pearl)
		Divine_PearlTWO
			name="Divine Pearl +2"
			final_result = /obj/attainable/equipment/Upgraded/Divine_PearlTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Divine Pearl +1"=/obj/attainable/equipment/Upgraded/Divine_PearlONE)
		Divine_PearlTHREE
			name="Divine Pearl +3"
			final_result = /obj/attainable/equipment/Upgraded/Divine_PearlTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Divine Pearl +2"=/obj/attainable/equipment/Upgraded/Divine_PearlTWO)
		Divine_PearlFOUR
			name="Divine Pearl +4"
			final_result = /obj/attainable/equipment/Upgraded/Divine_PearlFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Divine Pearl +3"=/obj/attainable/equipment/Upgraded/Divine_PearlTHREE)



		Divine_PearlFIVE
			name="Divine Pearl +4"
			final_result = /obj/attainable/equipment/Upgraded/Divine_PearlFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Divine Pearl +3"=/obj/attainable/equipment/Upgraded/Divine_PearlFOUR)


		Fool_WandONE
			name="Fool Wand +1"
			final_result = /obj/attainable/equipment/Upgraded/Fool_WandONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Fool Wand"=/obj/attainable/equipment/GoofOff/Fool_Wand)
		Fool_WandTWO
			name="Fool Wand +2"
			final_result = /obj/attainable/equipment/Upgraded/Fool_WandTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Fool Wand +1"=/obj/attainable/equipment/Upgraded/Fool_WandONE)
		Fool_WandTHREE
			name="Fool Wand +3"
			final_result = /obj/attainable/equipment/Upgraded/Fool_WandTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Fool Wand +2"=/obj/attainable/equipment/Upgraded/Fool_WandTWO)
		Fool_WandFOUR
			name="Fool Wand +4"
			final_result = /obj/attainable/equipment/Upgraded/Fool_WandFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Fool Wand +3"=/obj/attainable/equipment/Upgraded/Fool_WandTHREE)


		Fool_WandFIVE
			name="Fool Wand +4"
			final_result = /obj/attainable/equipment/Upgraded/Fool_WandFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Fool Wand +3"=/obj/attainable/equipment/Upgraded/Fool_WandFOUR)


		Deck_of_JokersONE
			name="Deck of Jokers +1"
			final_result = /obj/attainable/equipment/Upgraded/Deck_of_JokersONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Deck of Jokers"=/obj/attainable/equipment/GoofOff/Deck_of_Jokers)
		Deck_of_JokersTWO
			name="Deck of Jokers +2"
			final_result = /obj/attainable/equipment/Upgraded/Deck_of_JokersTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Deck of Jokers +1"=/obj/attainable/equipment/Upgraded/Deck_of_JokersONE)
		Deck_of_JokersTHREE
			name="Deck of Jokers +3"
			final_result = /obj/attainable/equipment/Upgraded/Deck_of_JokersTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Deck of Jokers +2"=/obj/attainable/equipment/Upgraded/Deck_of_JokersTWO)
		Deck_of_JokersFOUR
			name="Deck of Jokers +4"
			final_result = /obj/attainable/equipment/Upgraded/Deck_of_JokersFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Deck of Jokers +3"=/obj/attainable/equipment/Upgraded/Deck_of_JokersTHREE)

		Deck_of_JokersFIVE
			name="Deck of Jokers +4"
			final_result = /obj/attainable/equipment/Upgraded/Deck_of_JokersFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Deck of Jokers +3"=/obj/attainable/equipment/Upgraded/Deck_of_JokersFOUR)


		Soothsayer_SwordONE
			name="Soothsayer Sword +1"
			final_result = /obj/attainable/equipment/Upgraded/Soothsayer_SwordONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Soothsayer Sword"=/obj/attainable/equipment/BardEnt/Soothsayer_Sword)
		Soothsayer_SwordTWO
			name="Soothsayer Sword +2"
			final_result = /obj/attainable/equipment/Upgraded/Soothsayer_SwordTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Soothsayer Sword +1"=/obj/attainable/equipment/Upgraded/Soothsayer_SwordONE)
		Soothsayer_SwordTHREE
			name="Soothsayer Sword +3"
			final_result = /obj/attainable/equipment/Upgraded/Soothsayer_SwordTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Soothsayer Sword +2"=/obj/attainable/equipment/Upgraded/Soothsayer_SwordTWO)
		Soothsayer_SwordFOUR
			name="Soothsayer Sword +4"
			final_result = /obj/attainable/equipment/Upgraded/Soothsayer_SwordFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Soothsayer Sword +3"=/obj/attainable/equipment/Upgraded/Soothsayer_SwordTHREE)

		Soothsayer_SwordFIVE
			name="Soothsayer Sword +4"
			final_result = /obj/attainable/equipment/Upgraded/Soothsayer_SwordFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Soothsayer Sword +3"=/obj/attainable/equipment/Upgraded/Soothsayer_SwordFOUR)

		Orichalcum_HarpONE
			name="Orichalcum Harp +1"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_HarpONE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Harp"=/obj/attainable/equipment/BardEnt/Orichalcum_Harp)
		Orichalcum_HarpTWO
			name="Orichalcum Harp +2"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_HarpTWO
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Harp +1"=/obj/attainable/equipment/Upgraded/Orichalcum_HarpONE)
		Orichalcum_HarpTHREE
			name="Orichalcum Harp +3"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_HarpTHREE
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Harp +2"=/obj/attainable/equipment/Upgraded/Orichalcum_HarpTWO)
		Orichalcum_HarpFOUR
			name="Orichalcum Harp +4"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_HarpFOUR
			steps = 300
			ingredients = list("Pure Demonium"=/obj/attainable/Ore_and_Plans/Pure_Demonium,"Orichalcum Harp +3"=/obj/attainable/equipment/Upgraded/Orichalcum_HarpTHREE)


		Orichalcum_HarpFIVE
			name="Orichalcum Harp +4"
			final_result = /obj/attainable/equipment/Upgraded/Orichalcum_HarpFIVE
			steps = 300
			ingredients = list("Demonium Orb"=/obj/attainable/Ore_and_Plans/Demonium_Orb,"Orichalcum Harp +3"=/obj/attainable/equipment/Upgraded/Orichalcum_HarpFOUR)

//Upgraded Armor
	//Plate
		Demonium_Plate_Cloak2
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Plate_Cloak2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Plate Cloak" =/obj/attainable/equipment/cloak/Demonium_Plate_Cloak)
		Demonium_Plate_Armor2
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Plate_Armor2
			steps = 500
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Plate Armor" =/obj/attainable/equipment/armor/Demonium_Plate_Armor)
		Demonium_Plate_Helm2
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Plate_Helm2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Plate Helm" =/obj/attainable/equipment/helmets/Demonium_Plate_Helm)

	//Cloth
		Demonium_Cloth_Cloak2
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Cloth_Cloak2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Cloth Cloak" = /obj/attainable/equipment/cloak/Demonium_Cloth_Cloak)
		Demonium_Cloth_Armor2
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Cloth_Armor2
			steps = 350
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Cloth Armor" = /obj/attainable/equipment/armor/Demonium_Cloth_Armor)
		Demonium_Cloth_Hat2
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Cloth_Hat2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Cloth Hat" = /obj/attainable/equipment/helmets/Demonium_Cloth_Hat)
		Demonium_Headband2
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Headband2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Cloth Headband" = /obj/attainable/equipment/helmets/Demonium_Headband)
	//Leather
		Demonium_Leather_Cloak2
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Leather_Cloak2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Leather Cloak"= /obj/attainable/equipment/cloak/Demonium_Leather_Cloak)
		Demonium_Leather_Hat2
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Leather_Hat2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Leather Hat" = /obj/attainable/equipment/helmets/Demonium_Leather_Hat)
		Demonium_Leather_Armor2
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Leather_Armor2
			steps = 350
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Leather Armor"= /obj/attainable/equipment/armor/Demonium_Leather_Armor)
	//Chain
		Demonium_Chain_Cloak2
			name = ""
			final_result = /obj/attainable/equipment/cloak/Demonium_Chain_Cloak2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Chain Cloak"=/obj/attainable/equipment/cloak/Demonium_Chain_Cloak)
		Demonium_Chain_Helm2
			name = ""
			final_result = /obj/attainable/equipment/helmets/Demonium_Chain_Helm2
			steps = 300
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Chain Helm"=/obj/attainable/equipment/helmets/Demonium_Chain_Helm)
		Demonium_Chain_Armor2
			name = ""
			final_result = /obj/attainable/equipment/armor/Demonium_Chain_Armor2
			steps = 350
			ingredients = list("Demonium Chunk" = /obj/attainable/Ore_and_Plans/Demonium_Chunk, "Chain Armor"=/obj/attainable/equipment/armor/Demonium_Chain_Armor)

