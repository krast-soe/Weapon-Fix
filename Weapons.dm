obj
	attainable
		Click()
			if (!usr.linkto)
				usr.linkto = "say"
			if (usr.linkto == "say")
				usr.say("<a href=?ClickEquipment=\ref[src]>\icon[src][src]</a>")
			else if (usr.linkto == "worldsay")
				usr.worldsay("<a href=?ClickEquipment=\ref[src]>\icon[src][src]</a>")
			else if (findtext(usr.linkto,"tell "))
				var/tname = copytext(usr.linkto,findtext(usr.linkto,"repname"))
				tname = copytext(tname,findtext(tname,"=")+1,findtext(tname,"&"))

				var/tkey = copytext(usr.linkto,findtext(usr.linkto,"repkey"))
				tkey = copytext(tkey,findtext(tkey,"=")+1,findtext(tkey,">"))

				var/texttt = copytext(usr.linkto,findtext(usr.linkto,"tell ") + 5)
				texttt +=  " <a href=?ClickEquipment=\ref[src]>\icon[src][src]</a>"
				var/mob/PC/P
				P = null
				//usr << "=[tkey]=   -[tname]-"
				for (var/mob/PC/P2 in world)
					if (P2.key == tkey && P2.name == tname)
						P = P2
				if (!P)
					usr << "That player is no longer found in the world."
					return
				//var/t =input("What to tell [P]?") as null|text
				usr.tell(P,texttt)

				/*
				var/mob/PC/P = href_list["replyref"]
				var/pkey = href_list["repkey"]
				var/pname = href_list["repname"]

				P = null
				for (var/mob/PC/P2 in world)
					if (P2.key == pkey && P2.name == pname)
						P = P2
				if (!P)
					usr << "That player is no longer found in the world."
					return
				var/t =input("What to tell [P]?") as null|text
				usr.tell(P,t)

				usr.tell(texttt)
				*/
/*
			if (!usr.linkto)
				usr.linkto = "say"
			if (usr.linkto == "say")
				usr.say("<a href=?ClickEquipment=[cKey(src.name)]>\icon[src][src]</a>")
			else if (usr.linkto == "worldsay")
				usr.worldsay("<a href=?ClickEquipment=[cKey(src.name)]>\icon[src][src]</a>")
			else if (findtext(usr.linkto,"tell "))
				var/texttt = copytext(usr.linkto,findtext(usr.linkto,"tell ") + 5)
				texttt +=  " <a href=?ClickEquipment=[cKey(src.name)]>\icon[src][src]</a>"
				usr.tell(texttt)
*/


var/const/COMMON = 1
var/const/UNCOMMON = 2
var/const/RARE = 3
var/const/LEGENDARY = 4
var/const/EPIC = 5
var/const/max_text_len=400

obj
	attainable
		equipment
			var/list/classuse = list("soldier","monk","ranger","thief","bard","wizard","pilgrim","goof off","sage","blood mage","assassin","chaos mage","holy knight","entertainer")
			var/list/augments = newlist()
			var/equippable = 1
			var/equipslot = "other"
			var/shopitem = 0
			var/attackprob = 30
			var/list/procage = newlist()
			var/fire_resist = 0
			var/fire2_resist = 0
			var/light_resist = 0
			var/ice_resist = 0
			var/wind_resist = 0
			var/buff_resist = 0
			var/melee_resist = 0
			var/multiattack = 0
			var/minlvl = 0
			var/cursed = 0
			var/rarity = COMMON
			var/list/attributes = newlist()
			var/rand_attack = 0
			var/amp_attack = 0
			var/spec_attack = 0
			var/damagealter = 0
			var/beatresist = 0
			var/fire_damage = 0
			var/healing_bonus = 0
			var/lightning_damage = 0
			var/ice_damage = 0
			var/wind_damage = 0
			var/melee_damage = 0
			var/list/move_effect = newlist()
			var/obj/spells/Attached_Spell = null
			var/used_attached_spell = 0
			var/ampdmg = 1
			var/list/questlistflags = newlist()



			var
				AGI = 0
				STR = 0
				DblAtk = 0
				CRIT = 0
				HP = 0
				MP = 0
				DEF = 0
				INT = 0
			icon = 'weapons.dmi'
			proc
				AfterProc()
			//usr << "Click <a href=?src=\ref[src];action=start>here</a>!"
				AlterHit(var/dmg,var/target)
					return dmg
				Select_Targets(var/mob/m)
					return m:target_mob
				Do_Amp_Attack(var/mob/M)
				Do_Spec_Attack(var/mob/M)



			custom
				isdrop = 0
			shovels
				equipslot = "right hand"
				isdrop = 0
				Battle_Select_Target()
					usr << "You cannot use that item in combat!"
				Stats()
					usr << "This is a shovel for digging things up.  You just never know what you might find!"

				Select_Target()
					if (!usr.leader)
						Use(usr)
					else
						usr << "You must be the leader of the party to dig with a shovel."

				Use(var/mob/M)
					M:close_menu()
					if (!src.equipped)
						M << "You must equip the shovel first before digging."
						return 0
					if (!M.loc)
						M << "You try to dig, but you don't find diggable ground!"
						return 0
					var/turf/T = M.loc
					if (T.density)
						M << "You try to dig, but find that ground too tough."
						return 0
					T.Dig()
					for (var/obj/nonattainable/Digable/D in T.contents)
						D.Dig()

				Basic_Shovel
					icon_state = "shovel"
					cost = 100
					sell = 50
					isdrop=0
					issell = 1
					STR = 10
					classuse = list("invoker","dragovian","soldier","monk","ranger","thief","bard","wizard","pilgrim","goof off","sage","assassin","blood mage","chaos mage","holy knight","entertainer")
				Steel_Shovel
					icon_state = "steel shovel"
					cost = 1000
					sell = 500
					isdrop= 0
					issell = 1
					STR = 20
					classuse = list("invoker","dragovian","soldier","monk","ranger","thief","bard","wizard","pilgrim","goof off","sage","assassin","blood mage","chaos mage","holy knight","entertainer")
				Mithril_Shovel
					icon_state = "mithril shovel"
					STR = 80
					sell = 5000
					issell = 1
					isdrop = 0
					classuse = list("invoker","dragovian","soldier","monk","ranger","thief","bard","wizard","pilgrim","goof off","sage","assassin","blood mage","chaos mage","holy knight","entertainer")
				DTakan_Shovel
					name = "D'Takan Shovel"
					icon_state = "mithril shovel"
					STR = 100
					sell = 15000
					issell = 0
					isdrop = 0
					lore = 1
					classuse = list("invoker","dragovian","soldier","monk","ranger","thief","bard","wizard","pilgrim","goof off","sage","assassin","blood mage","chaos mage","holy knight","entertainer")
			bows
				equipslot = "right hand"
				Sacred_Bow

					icon_state = "bow"
					isdrop = 0
					classuse = list("pilgrim","bard","ranger")
					STR = 150
					sell = 100000
			slaying_rings
				equipslot="finger"

			//Early
				Nature_Slayer_Ring
					isdrop = 0
					classuse = list("bard","ranger","soldier","monk","dragovian","assassin","thief","holy knight")
					name="Nature Slayer1"
					icon_state = "magic ring"
					AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsBug"&&"IsSlime"&&"IsBeast"))
								dmg = dmg*1.5
							return dmg

				Monster_Slayer_Ring
					isdrop = 0
					classuse = list("bard","ranger","soldier","monk","dragovian","assassin","thief","holy knight")
					name="Creature Slayer"
					icon_state = "crit ring"
					icon = 'items.dmi'
					STR = 25
				/*	AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsDragon"&&"IsDemon"&&"IsMaterial"&&"IsZombie"))
								dmg = dmg*1.5
						return dmg*/
			//Mid
				Nature_Slayer_Ring2
					isdrop = 0
					classuse = list("bard","ranger","soldier","monk","dragovian","assassin","thief","holy knight")
					name="Nature Slayer2"
					icon_state = "HP ring"
				/*	AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsBug"&&"IsSlime"&&"IsBeast"))
								dmg = dmg*2
							return dmg*/

				Monster_Slayer_Ring2
					isdrop = 0
					classuse = list("bard","ranger","soldier","monk","dragovian","assassin","thief","holy knight")
					name="Monster Destroyer"
					icon_state = "AGI ring"
					icon = 'items.dmi'
					STR = 60
					HP = 25
					/*AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsDragon"&&"IsDemon"&&"IsMaterial"&&"IsZombie"))
								dmg = dmg*2
						return dmg*/

				Combat_Ring
					isdrop = 0
					classuse = list("bard","ranger","soldier","monk","dragovian","assassin","thief","holy knight")
					name="Warmonger"
					icon_state = "XP ring"
					icon = 'items.dmi'
					STR = 200
					HP = 120
					Stats()
						usr << "The ultimate ring."
					/*AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							//if (target:attributes.Find("IsBug"&&"IsSlime"&&"IsBeast"&&"IsDragon"&&"IsDemon"&&"IsMaterial"&&"IsZombie"))
							dmg = dmg*2.5
						return dmg*/
				Thief_Gloves
					isdrop = 0
					classuse = list("thief")
					icon_state = "thiefglove"
					STR = 275
					AGI = 300
					CRIT = 4
					/*AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							//if (target:attributes.Find("IsBug"&&"IsSlime"&&"IsBeast"&&"IsDragon"&&"IsDemon"&&"IsMaterial"&&"IsZombie"))
							dmg = dmg*4
						return dmg*/
//MAGIC RINGS
				Ring_of_Purity
					isdrop = 0
					classuse = list("pilgrim")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 8
					healing_bonus = 10
					Stats()
						usr << "A ring worn by the devout. Increases INT by 8 and gives a nominal bonus to healing."
				Blessed_Ring
					isdrop = 0
					classuse = list("pilgrim")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 30
					wind_damage = 25
					healing_bonus = 25
					Stats()
						usr << "Bishops commonly wear this ring. Increases INT by 30, grants a fair bonus to wind damage, and increases the effectiveness of healing. "
				Saint_Ring
					isdrop = 0
					classuse = list("pilgrim")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 92
					wind_damage = 75
					healing_bonus = 50
					Stats()
						usr << "A ring blessed by the Pope. Increases INT by 92, grants a significant bonus to wind damage, and increases the effectiveness of healing. "
				Apprentice_Wizard_Ring
					isdrop = 0
					classuse = list("wizard")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 10
					fire_damage = 12
					Stats()
						usr << "Often worn by wizards just beginning learning magic. Increases INT by 10 and gives a small bonus to fire spells."
				Ring_of_Wisdom
					isdrop = 0
					classuse = list("wizard")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 48
					fire_damage = 35
					ice_damage = 20
					Stats()
						usr << "This ring was forged with magic. Boosts INT by 48, increases fire and ice damage by a decent amount."
				Ring_of_the_Elders
					isdrop = 0
					classuse = list("wizard")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 135
					ice_damage = 90
					fire_damage = 90
					Stats()
						usr << "A ring worn by high wizards that reside in the Sky Tower. Increases INT by 135 and grants a significant boost to fire and ice magic."
				Prism_Ring
					isdrop = 0
					classuse = list("pilgrim","sage","wizard","chaos mage")
					icon_state = "magic ring"
					icon = 'items.dmi'
					ice_damage = 75
					fire_damage = 75
					wind_damage = 75
					lightning_damage = 75
					Stats()
						usr << "This ring emits energy from all elements. Gives a fair bonus to all elements."
				Scholar_Ring
					isdrop = 0
					classuse = list("sage")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 85
					fire_damage= 120
					Stats()
						usr << "A ring given to Sages who surpass their teachers. Increases INT by 85 and gives a fair bonus to fire spells."
				Fools_Gold_Ring
					name="Fool's Gold Ring"
					isdrop = 0
					classuse = list("goof off")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 60
					ice_damage = 105
					Stats()
						usr << "This fake ring was foolishly forged with fool's gold. For some reason, it makes the owner feel smarter. Gives a 60 INT bonus and increases ice damage by a fair amount."
				Cultist_Ring
					isdrop = 0
					classuse = list("chaos mage")
					icon_state = "magic ring"
					icon = 'items.dmi'
					INT = 25
					fire_damage = 50
					Stats()
						usr << "A ring given to high ranking cult members. Strange symbols are carved into it. Increases INT by 25 and gives a fair bonus to fire spells."
				Burning_Chaos
					isdrop = 0
					classuse = list("chaos mage")
					icon_state = "magic ring"
					icon = 'items.dmi'
					lightning_damage=70
					fire_damage= 130
					INT = 77
					Stats()
						usr << "The perfect ring for those who practice the dark arts. Increases INT by 77 and gives a significant bonus to fire and lightning spells."

			vangor
				Vangor_Sabre
					name = "Vangor's Sabre"
					equipslot = list("left hand", "right hand")
					classuse = list("bard","soldier","ranger","pilgrim","wizard","monk","sage","goof off")
					icon_state = "soul stealer"
					STR = 300
					INT = 150
					issell = 0
					DblAtk = 1
					attackprob = 35
					HP = 150
					MP = 100
					rarity = RARE
			christmas
				Coal
			//		icon_state = ""
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("goof off")
					STR = 35
					DblAtk = 2
					attackprob = 10
					ice_damage = 20

				Venomous_Katar
					icon_state = "katar"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("assassin")
					STR = 40
					DblAtk = 1
					attackprob = 50
					New()
						var/obj/S = new /obj/spells/Procs/Poison
						procage += S
				Boxing_Gloves
				//	icon_state = "katar"
					isdrop = 0
					issell = 0
					equipslot = "right hand"
					classuse = list("monk")
					STR = 50
					DblAtk = 1
					attackprob = 35
				The_Grinch
					icon_state = "book3"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("chaos mage")
					STR = 25
					HP = 100
					MP = 10
					fire_damage = 10
				Lighting_Blade
					icon_state = "light blade"
					isdrop = 0
					issell = 0
					equipslot = "right hand"
					classuse = list("holy knight","sage")
					STR = 50
					MP = 72
					lightning_damage = 10
					ice_damage = 10
				Clerics_Staff
					name="Cleric's Staff"
					isdrop = 0
					issell = 0
					equipslot = "right hand"
					classuse = list("pilgrim")
					STR = 35
					MP = 100
					healing_bonus = 12
					wind_damage = 9
				Star_Wand
					isdrop = 0
					issell = 0
					equipslot = "right hand"
					classuse = list("wizard")
					STR = 10
					MP = 125
					fire_damage = 15
					ice_damage = 10
				Captains_Sabre
					name="Captain's Sabre"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("thief")
					STR = 30
					AGI = 25
					CRIT = 2.5
				Crossbow
					isdrop = 0
					issell = 0
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 30
					AGI = 30
					attackprob = 45
					DblAtk = 2
					wind_damage = 9
					healing_bonus = 9
				Maestros_Baton
					name="Maestro's Baton"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 25
					MP = 25
					HP = 25
					AGI = 25
					DEF = 5
					New()
						..()
						var/obj/spells/Procs/Rej/S = new
						procage += S
			test
				eh
					icon_state = "katar"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("assassin")
					STR = 40
					DblAtk = 1
					attackprob = 50
					New()
						var/obj/S = new /obj/spells/Procs/Toxic
						procage += S
				meh
					icon_state = "katar"
					isdrop = 0
					issell = 0
					equipslot = "left hand"
					classuse = list("assassin")
					STR = 40
					DblAtk = 1
					attackprob = 50
					New()
						var/obj/S = new /obj/spells/Procs/Toxic
						procage += S
			Ceremonial_Daggar
				Blood_Soaked_Daggar
				//	name="Devil's Knife"
					classuse = list("invoker")
					icon_state = "copper daggar"
					equipslot = "right hand"
					sell = 150
					cost = 500
					HP = 50
				Devil_Knife
					classuse = list("invoker")
					name="Devil's Knife"
					icon_state = "crystaline daggar"
					equipslot = "right hand"
					sell = 1500
					cost = 4000
					HP = 170
				Demons_Tribute
					classuse = list("invoker")
					name="Demon's Tribute"
					icon_state = "assassination"
					equipslot = "right hand"
					sell = 12000
					cost = 40000
					HP = 435
			control
				Monster_Stone
					name = "Monster Control Stone"
					icon_state = "rock"
					//equipslot = "right hand"
					classuse = list("invoker")
					equipslot = "left hand"
					//cost = 100000
					HP = 250
					DEF = 250
					isdrop = 0
					Stats()
						usr << "It appears as if Invokers can control monsters with this stone. Offers a fair boost to Health and Defense."
					Battle_Select_Target()
						Battle_Group_List()
					Select_Target()
						usr << "You cannot use this item out of combat!"
					Use(mob/m)
						if (!m)
							m = usr
						//range() << "\icon[m][m] use the \icon[src][src] on \icon[target][target]."
						src.gender = m.gender
						range() << "\icon[m][m] takes command through \icon[src][src]."
						sleep(10)
						if ((target:isboss || target.key || prob(70)) && !isStaff(m))
							range() << "But \icon[target][target]'s constitution is too strong!"
							return
						var/obj/spells/Procs/One_Ring/I = new
						for (var/obj/o in target:effects)
							if (o.name == "One Ring")
								del o
						I.steps =rand(1,4)
						target:effects += I
						range() << "\icon[target][target] begins to serve \icon[m][m]'s will."
			Whips
				Leather_Whip
					rarity = COMMON
					//multiattack = 1
					name = "Leather Whip"
					icon_state = "leatherwhip"
					equipslot = "right hand"
					cost = 5000
					sell = 999
					classuse = list("wizard","pilgrim","goof off")
					STR = 11

					rand_attack = 1

					Select_Targets(var/mob/m)
						range() <<  output("<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 3
						else if (prob(15))
							numattacks = 2
						else if (prob(25))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
				Thorn_Whip
					rarity = COMMON
					//multiattack = 1
					name = "Thorn Whip"
					icon_state = "thornwhip"
					equipslot = "right hand"
					cost = 25000
					sell = 3500
					classuse = list("wizard","pilgrim","goof off")
					STR = 35

					rand_attack = 1

					Select_Targets(var/mob/m)
						range() <<  output("<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 3
						else if (prob(18))
							numattacks = 3
						else if (prob(35))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
					New()
						var/obj/S = new /obj/spells/Procs/Double_Edge1
						S:probamt = 20
						S:rlow = 2
						S:rhi = 20
						S:icon = src.icon
						S:icon_state = src.icon_state
						S:srcname = src.name
						procage += S

				Gringham_Whip
					minlvl = 40
					rarity = COMMON
					//multiattack = 1
					name = "Gringham Whip"
					icon_state = "gringhamwhip"
					equipslot = "right hand"
					cost = 138000
					sell = 35600
					classuse = list("wizard","pilgrim","goof off")
					STR = 70

					rand_attack = 1

					Select_Targets(var/mob/m)
						range() <<  output("<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 3
						else if (prob(25))
							numattacks = 3
						else if (prob(50))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
			Explosives

				Bomb
					minlvl = 15
					classuse = list("thief")
					equipslot = "left hand"
					STR = 5
					icon_state = "bomba"
					cost = 6500
					sell = 1200
					//minlevel = 30
					rarity = RARE
					//target = newlist()
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Bomb/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()

				Magical_Bomb
					minlvl = 26
					classuse = list("thief")
					equipslot = "left hand"
					STR = 10
					icon_state = "bombb"
					cost = 25000
					sell = 1200
					//minlevel = 30
					rarity = RARE
					//target = newlist()
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Magical_Bomb/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()


				Thunder_Bomb
					minlvl = 44
					classuse = list("thief")
					equipslot = "left hand"
					STR = 20
					icon_state = "bombc"
					cost = 75000
					sell = 5000
					//minlevel = 30
					rarity = RARE
					//target = newlist()
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Thunder_Bomb/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()

				Dark_Fire_Bomb
					minlvl = 60
					classuse = list("thief")
					equipslot = "left hand"
					STR = 35
					icon_state = "bombd"
					cost = 199999
					sell = 5000
					//minlevel = 30
					rarity = RARE
					//target = newlist()
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Dark_Fire/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()
			katana
				classuse = list("assassin")
				equipslot = list("right hand")
				Imitation_Katana
					icon_state = "karmic katana"
					STR = 34
					cost = 17500
					sell = 1000
				/*	New()
						..()
						var/obj/spells/Procs/Guard_Break/S = new
						procage += S*/
				Katana
					icon_state = "karmic katana"
					STR = 99
					cost = 99999
					sell = 30000
				/*	New()
						..()
						var/obj/spells/Procs/Guard_Break/S = new
						procage += S*/

			shuriken
				classuse = list("assassin")
				equipslot = list("right hand","left hand")
				wooden_shuriken
					icon_state = "woodshuriken"
				//	minlvl = 15
					STR = 17
				//	multiattack = 1
					DblAtk = 1
					cost = 2500
					sell = 900
				shuriken
				//	minlvl = 25
					icon_state = "shuriken1"
					STR = 35
					DblAtk = 2
					cost = 10000
					sell = 5000
				//	multiattack = 1
					attackprob = 50
				fuuma_shuriken
					minlvl = 40
					icon_state = "shuriken2"
					AGI = 120
					STR = 90
					DblAtk = 2
					//multiattack = 1
					cost = 200000
					sell = 75000
					attackprob = 50
			/*Cursed_Shuriken
				cursed_shuriken
					equipslot = list("left hand")
					classuse = list("assassin")
						minlvl = 40
						AGI = -500
						STR = 1
						CRIT = -5
						DEF = -20
						DblAtk = 3
						attackprob = 50
						sell = 50000*/

			Tourney
				Lefthanded_Hitall_Stick
					classuse = list("thief")
					equipslot = "left hand"
					issell = 0
					isdrop = 0
					STR = 1


			boomerang

				classuse = list("thief")
				equipslot = "right hand"
			//	DblAtk = 1
				multiattack = 1
				Boomerang
					icon_state = "boomerang"
					attackprob = 40
					STR = 5
					MP = 15
					//attackprob = 30
					cost = 5000
					sell = 1000

					//minlvl = 65

				Silver_Boomerang
					classuse = list("thief")
					icon_state = "silver boomerang"
					attackprob = 40
					STR = 15
					MP = 20
					cost = 11500
					sell = 10000

					minlvl = 18

				Dark_Boomerang
					classuse = list("thief")
					icon_state = "dark boomerang"
					attackprob = 100
					STR = 25
					MP = 40
					cost = 25000
					sell = 15000
					multiattack = 1
					minlvl = 26


				Razor_Boomerang
					classuse = list("thief")
					icon_state = "razor boomerang"
					attackprob = 50
					STR = 30
					MP = 20
					//DblAtk = 2
					cost = 45000
					sell = 25000
					minlvl = 23

					New()
						var/obj/S = new /obj/spells/Procs/Double_Edge1
						S:probamt = 20
						S:rlow = 2
						S:rhi = 20
						S:icon = src.icon
						S:icon_state = src.icon_state
						S:srcname = src.name
						procage += S
				Devorang
					icon_state = "devorang"
					//attackprob = 50
					STR = 55
					MP = 50
					//DblAtk = 3
					sell = 35000
					New()
						var/obj/S = new /obj/spells/Procs/Double_Edge1
						S:probamt = 30
						S:rlow = 4
						S:rhi = 30
						S:icon = src.icon
						S:icon_state = src.icon_state
						S:srcname = src.name
						procage += S
				Firang
					minlvl = 45
					classuse = list("thief")
					icon_state = "firang"
					rarity = RARE
					STR = 60
					MP = 75
					AGI = 220
					CRIT = 5
					DblAtk = 1
					cost = 120000
					sell = 50000
					attackprob = 60
					//minlvl = 150



			bo
				classuse = list("dragovian")
				equipslot = "right hand"
				Oaken_Staff
					icon_state = "oaken"
					STR = 6
					cost = 250
					sell = 100

				Quarter_Staff
					icon_state = "quarter"
					STR = 15
					cost = 1000
					sell = 500
				Bamboo_Staff
					icon_state = "bamboo"
					STR = 24
					cost = 6500
					sell = 2000
				Bo
					icon_state = "bo"
					STR = 40
					MP = 20
					HP = 25
					cost = 25000
					sell = 10000
				Khakkhara
					minlvl = 44
					icon_state = "khakkhara"
					STR = 165
					MP = 75
					AGI = 65
					DblAtk = 1
					cost = 150000
					sell = 75000




			scrolls
				Falcon_Claw
					classuse = list("monk")
					equipslot = list("left hand")
					icon_state = "falcon claw"
					cost = 14000
					sell = 2000
					STR = 5
					DblAtk = 1
					attackprob = 95
					Stats()
						usr << "This scroll will enable the user to attack an additional time."
				Scroll_of_Quadhits
					equipslot = list("left hand")
					minlvl=34
					classuse = list("monk")
					icon_state = "quadscroll"
					cost = 55000
					sell = 15000
					STR = 25
					DblAtk = 3
					attackprob = 95
					Stats()
						usr << "This scroll will enable the user to attack an additional three times. Level requirement of 34"


			handtohand
				classuse = list("monk")
				equipslot = list("right hand")

				Equip()
					if (..())
						if (src.equipped == "right hand")
							DblAtk = 0
						else
							DblAtk = 0



				Brass_Knuckles
					icon_state = "brass knuckles"
					STR = 3
					cost = 200
					sell = 140
				Heavy_Iron_Ulak
					icon_state = "heavy iron ulak"
					STR = 7
					cost = 800
					sell = 400
				Steel_Ulak
				//	minlvl = 17
					icon_state = "steel ulak"
					STR = 15
					cost = 5500
					sell = 1800
				Polished_Steel_Ulak
					minlvl = 25
					icon_state = "polished steel ulak"
					STR = 25
					cost = 10000
					sell = 4000
				Demon_Ulak
				//	minlvl = 26
					icon_state = "demon ulak"
					STR = 45
					//cost = 65000
					//sell = 35000
					cost = 35000
					sell = 15000

				Demon_Claw
					minlvl = 50
					icon_state = "demon claw"
					STR = 160
				//	cost = 260000
				//	sell = 100000
					cost = 260000
					sell = 100000
					AGI = 100
					//minlvl = 85
					rarity = RARE



			daggars
				classuse = list("soldier","ranger","bard","thief","pilgrim","goof off","sage","assassin")
				equipslot = "right hand"
				Copper_Daggar
					name = "Copper Dagger"
					STR = 2
					cost = 60
					sell = 40
					icon_state = "copper daggar"
				Bronze_Daggar
					name = "Bronze Dagger"
					STR = 4
					cost = 160
					sell = 120
					icon_state = "bronze daggar"
				Iron_Daggar
					name = "Iron Dagger"
					STR = 7
					cost = 320
					sell = 240
					icon_state = "iron daggar"
				Steel_Daggar

					name = "Steel Dagger"
					STR = 11
					cost = 700
					sell = 400
					icon_state = "steel daggar"
				Dirk
					icon_state = "dirk"
					sell = 100
					equipslot = "left hand"
					STR = 10
				Ginsu_Knives
					classuse = list("soldier","ranger","bard","thief","pilgrim","goof off","sage","wizard")
					STR = 13
					isdrop = 0
					icon_state = "ginsu knives"
					Select_Target()
						target = usr
						usr:close_menu()
						Use()
					Battle_Select_Target()
						target = usr
						usr:battle_move = "Item"
						usr:itemtouse = src
						usr:movechosen = 1
						usr:close_menu()
					Stats()
					Use(var/mob/M)
						if (!M)
							M = usr
						if (M.pet)
							view() << "<b><font color = \"#FF8000\">\icon[M][M] points \his \icon[src][src] at \icon[M.pet][M.pet], \icon[M.pet][M.pet] smiles."
							M.magic -= 5
							if (M.magic < 0)
								M.magic = 0
							else
								M.pet.health += round(M.pet.maxhealth/4)
								if (M.pet.health > M.pet.maxhealth)
									M.pet.health = M.pet.maxhealth
								M.pet.magic += round(M.pet.maxmagic/4)
								if (M.pet.magic > M.pet.maxmagic)
									M.pet.magic = M.pet.maxmagic



				Magic_Daggar
					minlvl = 15
					name = "Magic Dagger"
					classuse = list("bard","thief","goof off","sage","wizard","pilgrim")
					STR = 15
					MP = 10
					cost = 2500
					sell = 1800
					icon_state = "magic daggar"
				Crystaline_Daggar
					minlvl = 18
					name = "Crystaline Dagger"
					classuse = list("bard","thief","goof off","sage","pilgrim")
					STR = 21
					MP = 18
					cost = 7500
					sell = 5000
					icon_state = "crystaline daggar"

				Poison_Dagger
					classuse = list("bard","thief","goof off","sage")
					STR = 1
					cost = 2500
					sell = 1800
					icon_state = "magic daggar"
					New()
						var/obj/S = new /obj/spells/Procs/Poison
						procage += S
				Dagger_of_Zombie_Slaying
				//	minlvl = 26
					classuse = list("goof off","sage","pilgrim")
					icon_state = "dagger of zombie slaying"
					rarity = UNCOMMON
					STR = 50
					MP = 25
					cost = 50000
					sell = 20000
					attributes = list("zombie")
					AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsUndead"))
								dmg = round(dmg + rand(0,dmg))
								return dmg
						return dmg

			archery
				classuse = list("ranger","holy knight")
				equipslot = "right hand"
				Bow
					icon_state = "NBow"
					rarity = COMMON
					STR = 3
					DblAtk = 1
					attackprob = 80
					cost = 100
					sell = 80
				Inferior_Recurve_Bow
					icon_state = "Old Recurve Bow"
					rarity = COMMON
					STR = 5
					DblAtk = 1
					attackprob = 60
					cost = 180
					sell = 100
				Recurve_Bow

					icon_state = "Recurve Bow"
					rarity = COMMON
					STR = 7
					DblAtk = 1
					attackprob = 70
					cost = 250
					sell = 120
				Inferior_Self_Bow
					icon_state = "Old Self Bow"
					rarity = COMMON
					STR = 12
					DblAtk = 1
					attackprob = 60
					cost = 600
					sell = 120
				Self_Bow
				//	minlvl = 9
					icon_state = "Self Bow"
					rarity = COMMON
					STR = 13
					DblAtk = 1
					attackprob = 70
					cost = 950
					sell = 120
				Reflex_Bow
				//	minlvl = 13
					icon_state = "Reflex Bow"
					rarity = COMMON
					STR = 15
					DblAtk = 1
					attackprob = 70
					cost = 1025
					sell = 120
				Inferior_Long_Bow
				//	minlvl = 13
					icon_state = "Inferior Long Bow"
					rarity = COMMON
					STR = 18
					DblAtk = 1
					attackprob = 60
					cost = 2100
					sell = 125
				Long_Bow
				//	minlvl = 13
					icon_state = "Long Bow"
					rarity = COMMON
					STR = 21
					DblAtk = 1
					attackprob = 75
					cost = 2700
					sell = 140
				Inferior_Composite_Bow
				//	minlvl = 17
					icon_state = "Inferior Composite Bow"
					rarity = COMMON
					STR = 23
					DblAtk = 1
					attackprob = 60
					cost = 3200
					sell = 165
				Composite_Bow
				//	minlvl = 17
					icon_state = "Composite Bow"
					rarity = COMMON
					STR = 25
					DblAtk = 1
					attackprob = 75
					cost = 4700
					sell = 170
				Inferior_Compound_Bow
				//	minlvl = 21
					icon_state = "Inferior Compound Bow"
					rarity = COMMON
					STR = 29
					DblAtk = 1
					attackprob = 60
					cost = 6300
					sell = 185
				Compound_Bow
				//	minlvl = 21
					icon_state = "Compound Bow"
					rarity = COMMON
					STR = 32
					DblAtk = 1
					attackprob = 75
					cost = 10000
					sell = 750
				Steel_Bow
				//	minlvl = 28
					icon_state = "Steel Bow"
					rarity = COMMON
					STR = 39
					DblAtk = 1
					attackprob = 80
					cost = 25000
					sell = 1000
				Demon_Bow
				//	minlvl = 28
					icon_state = "Demon Bow"
					rarity = UNCOMMON
					STR = 51
					DblAtk = 1
					attackprob = 90
					cost = 60000
					sell = 7500
				Bow_of_Lightning
					minlvl = 40
					icon_state = "Bow of Lightning"
					rarity = RARE
					STR = 140
					MP = 30
					DEF = 50
					DblAtk = 2
					attackprob = 50
					cost = 240000
					sell = 100000
					/*New()
						..()
						var/obj/spells/Procs/Taunt1/T = new
						procage += T*/
			cursed_tombs
				classuse = list("chaos mage")
				equipslot = "right hand"
				Book_of_Berith
					icon_state = "book1"
					HP = 9
					DEF = 4
					cost = 160
					sell = 80
				Book_of_Eligor
					icon_state = "book2"
					HP = 20
					DEF = 10
					cost = 240
					sell = 140
				Book_of_Balam
				//	minlvl = 13
					icon_state = "book3"
					HP = 43
					DEF = 14
					cost = 700
					sell = 240
				Book_of_Shax
				//	minlvl = 16
					icon_state = "book4"
					HP = 60
					DEF = 20
					cost = 950
					sell = 400
				Book_of_Valefar
				//	minlvl = 20
					icon_state = "book5"
					HP = 85
					DEF = 24
					cost = 1600
					sell = 800
				Book_of_Orias
				//	minlvl = 22
					icon_state = "book6"
					HP = 170
					DEF = 26
					cost = 3600
					sell = 1600
				Book_of_Decarabia
				//	minlvl = 22
					icon_state = "book7"
					HP = 209
					DEF = 30
					cost = 5100
					sell = 3200
					var/damagebonus = 0.10
					Equip()
						if (..())
							usr.damagealter = usr.damagealter + damagebonus
					Unequip()
						if (..())
							usr.damagealter = usr.damagealter - damagebonus
				Book_of_Orobas
				//	minlvl = 32
					icon_state = "book8"
					HP = 250
					DEF = 36
					cost = 10000
					sell = 5000
					var/damagebonus = 0.15
					Equip()
						if (..())
							usr.damagealter = usr.damagealter + damagebonus
					Unequip()
						if (..())
							usr.damagealter = usr.damagealter - damagebonus
				Book_of_Morax
				//	minlvl = 32
					icon_state = "book9"
					STR = 370
					DEF = 54
					cost = 120000
					sell = 8000
					var/damagebonus = 0.20
					Equip()
						if (..())
							usr.damagealter = usr.damagealter + damagebonus
					Unequip()
						if (..())
							usr.damagealter = usr.damagealter - damagebonus
				Book_of_Zaebos
					minlvl = 40
					icon_state = "book9"
					HP = 370
					DEF = 54
					cost = 60000
					sell = 8000
					var/damagebonus = 0.20
					Equip()
						if (..())
							usr.damagealter = usr.damagealter + damagebonus
					Unequip()
						if (..())
							usr.damagealter = usr.damagealter - damagebonus
				Book_of_Ose
					minlvl = 66
					icon_state = "book10"
					HP = 666
					DEF = 66
					cost = 200000
					sell = 75000
					var/damagebonus = 0.25
					Equip()
						if (..())
							usr.damagealter = usr.damagealter + damagebonus
					Unequip()
						if (..())
							usr.damagealter = usr.damagealter - damagebonus
				//***Fixed Books***//
				BookofBerith
					name="Book of Berith"
					icon_state = "book1"
					HP = 9
					DEF = 4
					INT = 4
					cost = 160
					sell = 80
				BookofEligor
					name="Book of Eligor"
					icon_state = "book2"
					HP = 20
					DEF = 10
					INT = 10
					cost = 240
					sell = 140
				BookofBalam
					name = "Book of Balam"
					icon_state = "book3"
					HP = 43
					DEF = 14
					INT = 14
					cost = 700
					sell = 240
				BookofShax
					name = "Book of Shax"
					icon_state = "book4"
					HP = 60
					DEF = 20
					INT = 20
					cost = 950
					sell = 400
				BookofValefar
					name ="Book of Valefar"
					icon_state = "book5"
					HP = 85
					DEF = 24
					cost = 1600
					sell = 800
				BookofOrias
					name = "Book of Orias"
					icon_state = "book6"
					HP = 170
					DEF = 26
					INT = 26
					cost = 3600
					sell = 1600
				BookofDecarabia
					name = "Book of Decarabia"
					icon_state = "book7"
					HP = 209
					DEF = 30
					INT = 30
					cost = 5100
					sell = 3200
				BookofOrobas
					name = "Book of Orobas"
					icon_state = "book8"
					HP = 250
					DEF = 36
					INT = 36
					cost = 10000
					sell = 5000

				BookofZaebos
					name = "Book of Zaebos"
					minlvl = 40
					icon_state = "book9"
					HP = 370
					DEF = 54
					INT = 54
					cost = 60000
					sell = 8000

				BookofOse
					name = "Book of Ose"
					minlvl = 66
					icon_state = "book10"
					HP = 666
					DEF = 66
					INT = 66
					cost = 200000
					sell = 75000

			swords
				classuse = list("soldier","bard","sage","pilgrim","thief","holy knight","entertainer")
				equipslot = "right hand"
				Zenithian_Sword
					icon_state = "zenithiasword"
					equipslot = "right hand"
					classuse = list("holy knight")
					rarity = RARE
				//	issell = 1
					DblAtk = 1
					attackprob = 50
				//	sell = 1000
					issell = 0
					isdrop = 0
					STR = 325
					MP = 20

					Battle_Select_Target()
						var/obj/spells/Buff_Killer/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()

				Copper_Sword
					icon_state = "copper sword"
					STR = 7
					cost = 120
					sell = 80
				Bronze_Sword
					icon_state = "bronze sword"
					STR = 10
					cost = 200
					sell = 140
				Iron_Short_Sword
					icon_state = "iron short sword"
					STR = 13
					cost = 350
					sell = 240
				Copper_Long_Sword
				//	minlvl = 7
					icon_state = "copper long sword"
					STR = 16
					cost = 700
					sell = 400
				Bronze_Long_Sword
				//	minlvl = 7
					icon_state = "bronze long sword"
					STR = 16
					cost = 1200
					sell = 800
				Iron_Long_Sword
				//	minlvl = 12
					icon_state = "iron long sword"
					STR = 19
					cost = 2500
					sell = 1600
				Steel_Short_Sword
				//	minlvl = 16
					icon_state = "steel short sword"
					STR = 20
					cost = 5000
					sell = 3200
				Steel_Long_Sword
				//	minlvl = 16
					icon_state = "steel long sword"
					STR = 31
					cost = 8000
					sell = 5000
				Magic_Bastard_Sword
				//	minlvl = 18
					icon_state = "magic bastard sword"
					STR = 35
					cost = 12000
					sell = 8000
					classuse = list("soldier","bard","sage","holy knight","entertainer")
				Crystaline_Blade
				//	minlvl = 22
					icon_state = "crystaline sword"
					STR = 40
					cost = 20000
					sell = 12000
					classuse = list("soldier","bard","holy knight","entertainer")
				Pirate_Cutlass
				//	minlvl = 17
					icon_state = "sabre1"
					STR = 35
					CRIT = 5
					attackprob = 60
					DblAtk = 1
					cost = 100000
					sell = 12000
					classuse = list("thief")
				Brigand_Sabre
					minlvl = 40
					icon_state = "sabre2"
					STR = 65
					CRIT = 5
					attackprob = 85
					DblAtk = 1
					cost = 250000
					sell = 100000
					classuse = list("thief")
				Zombie_Slasher
					minlvl = 35
					icon_state = "zombie slasher"
					STR = 42
					cost = 28000
					sell = 15000
					attributes = list("zombie")
					classuse = list("soldier","bard","sage","pilgrim","holy knight","entertainer")
					AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsUndead"))
								dmg = round(dmg + rand(0,dmg))
								return dmg
						return dmg

				Sword_of_Metal_Slaying
					minlvl = 45
					icon_state = "metaly sword"
					STR = 45
					sell = 50000
					rarity = UNCOMMON
					classuse = list("soldier","ranger","bard","holy knight","entertainer","pilgrim")

					AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsMetal"))
								if (dmg<1)
									if (prob(70))
										dmg = 1
								else
									if (prob(2))
										dmg = dmg * 40
									else if (prob(50))
										dmg = dmg *2 + rand(0,1)
									else
										dmg = round(dmg*1.5)
								return dmg
						return dmg


				Broad_Sword
				//	minlvl = 22
					icon_state = "broad sword"
					STR = 45
					cost = 35000
					sell = 15000
					classuse = list("soldier","bard","sage","holy knight","pilgrim")
				Light_Blade
					minlvl = 35
					icon_state = "light blade"
					STR = 51
					cost = 50000
					sell = 20000
					classuse = list("soldier","pilgrim","holy knight","sage")
					var/range
					var/steps
					Stats()
						..()
						usr << "It also appears like you might be able to use this item."
					Select_Target()
						if (!usr.leader)
							Use(usr)
						else
							Use (usr.leader)
					Use(var/mob/m)
						range() << "\icon[usr][usr] raises the \icon[src][src] overhead."
						sleep(10)
						range() << "A portion of \icon[usr][usr]'s life flows through the blade."
						sleep(10)
						range() << "\icon[m][m] is surrounded in a beautful glow."
						for (var/obj/spells/Radiant/R in m.effects)
							R.steps = 0
							R.range = 1
							R.Do_Move_Effect(m)
						for (var/obj/spells/Blazing_Radiance/R in m.effects)
							R.steps = 0
							R.range = 1
							R.Do_Move_Effect(m)
						for (var/obj/attainable/Torch/T in m.effects)
							T.steps = 0
							T.range = 1
							T.Do_Move_Effect(m)
						for (var/obj/attainable/Lantern/T in m.effects)
							T.steps = 0
							T.range = 1
							T.Do_Move_Effect(m)
						for (var/obj/attainable/equipment/swords/Light_Blade/T in m.effects)
							T.steps = 0
							T.range = 1
							T.Do_Move_Effect(m)
						usr.health -= 50
						usr:CheckHP(usr)
						var/obj/attainable/equipment/swords/Light_Blade/o = new src.type
						o.range = 8
						o.steps = 175
						m.effects += o
						if (m.cavesee<8)
							m.cavesee = 8
						m:CheckCave(m,m.leader)
						for (var/mob/m2 in m.group)
							m2:CheckCave(m2,m2.leader)

					Do_Move_Effect(var/mob/m)
						steps --

						if (steps <= 0)
							steps = 175
							range --
							m.cavesee=range
							if (m.cavesee <1)
								m.cavesee = 1

							//m.see_in_dark --
						if (range <= 1)
							m.effects -= src
							m.cavesee = 1



				Sword_of_Darkness
					minlvl = 36
					classuse = list("thief","assassin")
					icon_state = "dark blade"
					STR = 60
					cost = 80000
					sell = 30000
					//classuse = list("soldier","ranger","bard")
				Demon_Sword
					classuse = list("soldier","ranger","bard")
					icon_state = "demon sword"
					STR = 67
					cost = 100000
					sell = 60000
					classuse = list("soldier","ranger","bard")

				Sword_of_Malice
				//	minlvl = 35
					classuse = list("soldier","bard","holy knight","entertainer")
					icon_state = "demon sword"
					STR = 67
					cost = 75000
					sell = 15000
				//	classuse = list("soldier","bard")
				Lunar_Sword
					minlvl = 35
					classuse = list("soldier","bard","holy knight","entertainer","thief")
					icon_state = "lunar sword"
					STR = 72
					cost = 120000
					sell = 0
					isdrop = 0
					rarity = UNCOMMON
					Stats()
						..()
						usr << "Lunar light gleams off the blade even during the day.  You can sense deep magic at work inside this blade."
					Select_Target()
						Use(usr)
					Battle_Select_Target()
						usr << "You cannot use that item during combat!"
					Use(var/mob/m)
						if (!m)
							m = usr
						if (m.leader)
							usr << "You must be the leader to use this item!"
							return
						if (m.OutsidePort==null)
							usr:itemtouse = src
							usr.townlist -= ""
							//usr.Create_Menu("Port",usr.townlist,2,15-usr.townlist.len,,,,"Port Menu")
							usr:Cast_Return()

						else
							if (!m.stopped && m.OutsidePort != "Kyamites Jail" && m.OutsidePort != "Yaston Jail Cell")
								var/oboat = 0
								if (usr.onaboat)
									oboat = 1
								var/toport = usr.OutsidePort
								usr.OutsidePort=null
								Port(usr, toport)

								for (var/mob/mtmp in usr.group)
									mtmp.OutsidePort = null
								if (oboat)
									usr.boat:loc = usr.loc
									usr.boat:PlayerEnter(usr)
					proc
						Port(var/mob/m,var/whereto)


							if (!m.OutsidePort)
								range() << "\icon[m][m] raises the \icon[src][src] high overhead!"
								sleep(10)
								range() << "Beams of intense lunar light shoot from the blade into the heavens."
								sleep(10)
								for (var/mob/PC/mmmm in m.group)
									if (!mmmm.townlist.Find(whereto))
										range() << "But the \icon[src][src] fails!"
										return
								var/turf/Tt = m.loc
								if (Tt)
									var/area/aa = Tt.loc
									if (aa)
										if (istype(aa,/area/teleport/Jailor_Fix/Grave/Inside) || istype(aa,/area/teleport/Shrine_Fix/Assassin/Inside) || istype(aa,/area/teleport/Shrine_Fix/CM/Inside) || istype(aa,/area/teleport/Shrine_Fix/HK/Inside) || istype(aa,/area/teleport/Shrine_Fix/Drago/Inside))
											for (var/obj/o in m.contents)
												for (var/obj/o2 in o.contents)
													if (istype(o2,/obj/attainable/equipment/swords/Lunar_Sword))
														m << "But the \icon[src][src] fails!"
														return
												if (istype(o,/obj/attainable/equipment/swords/Lunar_Sword))
													m << "But the \icon[src][src] fails!"
													return

								m.portto(whereto)
								if (m.boat)
									m.invisibility = 0
									m.onaboat = 0
									for (var/mob/mmmm in m.group)
										mmmm.invisibility = 0
										mmmm.onaboat = 0
									var/area/teleport/T
									T = locate("Boat [whereto]")
									if (T)
										if (T.x > 0 && T.y > 0 && m.boat)
											m.boat:loc = locate(T.x,T.y,T.z)
											m.boat:Port_CMD(m)

								m.counter = -1
								m << "\icon[m][m.name] is wisked away to [whereto]."
								m << 'wyvern.wav'
								for (var/mob/mm in m.group)
									mm.counter = -1
									mm.curr_area = null
									mm.portto(m.last_town)
									if (mm.boat)
										var/area/teleport/T
										T = locate("Boat [whereto]")
										if (T)
											if (T.x > 0 && T.y > 0 && mm.boat)
												mm.boat:loc = locate(T.x,T.y,T.z)
												mm.boat:Port_CMD(m)
									mm << "\icon[mm][mm.name] is wisked away to [whereto]."
									mm << 'wyvern.wav'
							else
								usr << "You hit your head on the ceiling!"

				Blade_of_Reckoning
					classuse = list("soldier","holy knight")
					STR = 170
					HP = 50
					minlvl = 45
					DblAtk = 1
					attackprob = 80
					rarity = RARE
					cost = 255000
					sell = 175000
					icon_state = "reckoning"
					New()
						..()
						var/obj/spells/Procs/Taunt1/T = new
						procage += T
				Soul_Stealer
					classuse = list("invoker","dragovian","soldier","ranger","bard","sage","monk","wizard","pilgrim","goof off","thief","chaos mage","assassin","holy knight","entertainer")
					icon_state = "soul stealer"
					STR = 250
					MP = 180
					isdrop = 0
					issell = 1
					lore = 1
					sell = 500000
					//minlvl = 120
					DblAtk = 1
					attackprob = 50
					cursed = 1
					var/hploss
					rarity = RARE
					Equip()
						if (..())
							usr << "The instant you equip the [src], you feel a great sickness envelope you!  The [src] is cursed!"
							hploss = round(usr.maxhealth/2)
							usr.maxhealth-=hploss
							usr.health = min(usr.maxhealth,usr.health)
							var/cc

							cc = 0
							for (var/obj/attainable/equipment/armor/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									cc=1
							if (!cc)
								return

							cc = 0
							for (var/obj/attainable/equipment/shields/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									cc=1
							if (!cc)
								return

							cc = 0
							for (var/obj/attainable/equipment/swords/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									cc=1
							if (!cc)
								return
							usr << "When you equip the [src], the other Soul Stealer equipment you are wearing begins to hum.  You feel a harmony flowing between the equipment, and energy begins to flow from item to item in a circle.  Suddenly, the cursed equipment is cursed no more!"

							for (var/obj/attainable/equipment/armor/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.cursed = 0
									usr.maxmagic += SS.mploss
									SS.mploss = 0
							for (var/obj/attainable/equipment/shields/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.cursed = 0
									usr.totstr += SS.strloss
									SS.strloss = 0
							for (var/obj/attainable/equipment/swords/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.cursed = 0
									usr.maxhealth += SS.hploss
									SS.hploss = 0
							usr.effects += src
							return 1
						return 0
					Unequip(var/mob/m)
						if(m==null)
							m=usr
						if (..(m))
							m.maxhealth += hploss
							m.effects -= src
							for (var/obj/attainable/equipment/armor/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.Unequip(m)
									SS.cursed = 1

							for (var/obj/attainable/equipment/shields/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.Unequip(m)
									SS.cursed = 1

							for (var/obj/attainable/equipment/swords/Soul_Stealer/SS in usr.contents)
								if (SS.equipped)
									SS.Unequip(m)
									SS.cursed = 1
							return 1
						return 0

					Do_Move_Effect(var/mob/m)
						if (m.health>0)
							m.health += 5
							m.health = min(m.health,m.maxhealth)
						if (prob(2))
							if (istype(m.loc.loc,/area/battle) && m.density)
								m.xp += 5
								m:Level_Check(m,0)

				Sword_of_Rej
					minlvl = 50
					STR = 130
					classuse = list("bard","entertainer")
					//minlvl = 85
					cost = 200000
					sell = 200000
					DblAtk = 1
					attackprob = 75
					icon_state = "rej"
					rarity = RARE
					New()
						..()
						var/obj/spells/Procs/Rej/S = new
						procage += S
				Sword_of_RejNEW
					name = "Sword of Rej"
					minlvl = 45
					STR = 155
					classuse = list("bard")
					//minlvl = 85
					cost = 200000
					sell = 70000
					DblAtk = 1
					attackprob = 48
					icon_state = "rej"
					rarity = RARE
					New()
						..()
						var/obj/spells/Procs/Rej/S = new
						procage += S
				Sword_of_Miracles

					classuse = list("soldier","holy knight","sage","pilgrim")
					icon_state = "sword of miracles"
					isdrop = 0
					issell = 1
					STR = 35
				//	DblAtk = 1
				//	attackprob = 10
					cost = 100000
					sell = 9999
					rarity = UNCOMMON
					New()
						..()
						var/obj/spells/Procs/Heal/S = new
						procage += S
				Ancient_Cutlass
					classuse = list("soldier","ranger","bard","sage","pilgrim","holy knight","entertainer","thief")
					STR = 60
					isdrop = 0
					lore = 1
					icon_state = "ancient cutlass"
					Battle_Select_Target()
						usr << "You cannot use this item during combat."
					Select_Target()
						Use(usr)
					Stats()
						usr << "This is the weapon the undead sailor bestowed to you.  It has mystical properties, and certainly could be of use to you in your quest.'"
						..()
					Use(var/mob/M)
						if (!M)
							M = usr
						range() << "\icon[M][M] closes his eyes and lets the \icon[src][src] guide them."
						sleep(10)
						var/mob/NPC/special/Old_World_Shrines/Shrine1/Moving_Island/MI = FindMob(/mob/NPC/special/Old_World_Shrines/Shrine1/Moving_Island)
						if (MI.z == M.z)
							range() << "The \icon[src][src] spins \icon[M][M] around freely, pointing \him in the direction of the shrouded island."
							sleep(10)
							var/dirx = MI.x-M.x
							var/diry = MI.y-M.y
							var/noso = "north"
							var/eawe = "east"
							if (dirx<0)
								eawe = "west"
							if (diry<0)
								noso = "south"
							dirx = abs(dirx)
							diry = abs(diry)
							var/simpledir
							if (dirx<diry/3)
								simpledir = noso
								if (noso == "north")
									M.dir = NORTH
									if (M.onaboat)
										M.onaboat:dir = NORTH
								else
									M.dir = SOUTH
									if (M.onaboat)
										M.onaboat:dir = SOUTH
							else if (diry<dirx/3)
								simpledir = eawe
								if (eawe == "east")
									M.dir = EAST
									if (M.onaboat)
										M.onaboat:dir = EAST
								else
									M.dir = WEST
									if (M.onaboat)
										M.onaboat:dir = WEST

							else
								simpledir = "[noso][eawe]"
								if (dirx>diry)
									if (eawe == "east")
										M.dir = EAST
										if (M.onaboat)
											M.onaboat:dir = EAST
									else
										M.dir = WEST
										if (M.onaboat)
											M.onaboat:dir = WEST
								else if (noso == "north")
									M.dir = NORTH
									if (M.onaboat)
										M.onaboat:dir = NORTH
								else
									M.dir = SOUTH
									if (M.onaboat)
										M.onaboat:dir = SOUTH


							var/dist = sqrt((dirx*dirx)+(diry*diry))
							if (dist<30)
								dist = " very strongly"
							else if (dist < 60)
								dist = " strongly"
							else if (dist < 100)
								dist = " "
							else if (dist < 140)
								dist = " weakly"
							else
								dist = " very weakly"
							range() << "The \icon[src][src] pulls \icon[M][M][dist] to the [simpledir]."

							//M << "For your ears only, the blade also hums.  `[dirx] to the [eawe], [diry] to the [noso].'"

						else
							range() << "But the sword doesn't pull in any relative direction."
							return




				Sword_of_Xiong
					classuse = list("ranger")
					icon_state = "sword of xiong"
					STR = 5
					isdrop = 0
					DblAtk = 1
					attackprob = 60
					equipslot = "left hand"
				Negative_Creep
					classuse = list("ranger")
					icon_state = "Negative Creep"
					STR = 5
					isdrop = 0
					DblAtk = 1
					attackprob = 40
					equipslot = "left hand"
					New()
						var/obj/spells/Procs/Lich_Poison/S = new /obj/spells/Procs/Lich_Poison
						S.steps = -69
						S.tprob = 50
						procage += S
				Radditz_Bane
					classuse = list("soldier","ranger","sage")
					icon_state = "SSJ Raditz"
					STR = 20
					equipslot = "left hand"
					attackprob = 80
					isdrop = 0
					DblAtk = 1
					New()
						var/obj/spells/Procs/Blazez/S = new /obj/spells/Procs/Blazez
						procage += S

				Falcon_Sword
					isdrop = 0
					classuse = list("pilgrim","holy knight","entertainer","sage")
					icon_state = "falcon sword"
					AGI = 30
					STR = 15
					CRIT = 3
					MP = 50
					DblAtk = 1
					equipslot = "left hand"

				Uber_Falcon_Sword
					minlvl = 60
					isdrop = 0
					classuse = list("pilgrim","holy knight","entertainer","sage")
					icon_state = "falcon sword"
					AGI = 40
					STR = 35
					CRIT = 5
					MP = 50
					DblAtk = 1
					equipslot = "left hand"



				Eponicks_Staff
					classuse = list("sage")
					icon_state = "dragon staff"
					AGI = 20
					STR = 20
					CRIT = 1
					HP = 20
					MP = 20
					DEF = 20
					equipslot = "right hand"
					//attackprob = 100
					isdrop = 0
					//DblAtk = 1
					//New()
					//	var/obj/spells/Procs/Blazez/S = new /obj/spells/Procs/Blazez
					//	procage += S


				Cursed_Blade_of_D66
					classuse = list("ranger")
					icon_state = "cursed blade"
					STR = 20
					isdrop = 0
					equipslot = "right hand"
					New()
						var/obj/spells/Procs/Lifedraw_Poison/S = new /obj/spells/Procs/Lifedraw_Poison
						S.steps = -69
						S.tprob = 45
						procage += S
						var/obj/spells/Procs/Weapon_Scale/Ss = new /obj/spells/Procs/Weapon_Scale
						Ss.currdam = 20
						Ss.perlvl = 0.5
						Ss.base = 20
						procage += Ss
					AfterProc()
						for (var/obj/spells/Procs/Weapon_Scale/Ss in src.procage)
							STR = Ss.currdam



			Thief //BASE
				Talwar
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("thief")
					STR = 600
					AGI = 800
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 80
					issell = 1
					isdrop = 0
					sell = 3000000
					crystals = 200
				Sudarshana_Chakra
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					equipslot = "left hand"
					classuse = list("thief")
					STR = 500
					AGI = 800
					CRIT = 25
					rarity=LEGENDARY
					multiattack = 1
					DblAtk = 1
					attackprob = 50
					issell = 1
					isdrop = 0
					sell = 3000000
					crystals = 220
			Sage
				Runesword
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("sage")
					STR = 700
					INT = 700
					DblAtk = 1
					attackprob = 75
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 200
				Emerald_Blade
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("sage")
					STR = 700
					INT = 700
					DblAtk = 1
					attackprob = 75
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			Ranger
				Demonium_Bow
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 700
					AGI = 500
					HP = 250
					DblAtk = 2
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 200
				Thunderbolt
					icon_state = "darrow"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 500
					HP = 500
					MP = 500
					AGI = 350
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			Soldier
				Bonecleaver
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 800
					HP = 400
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					rarity=LEGENDARY
					sell = 100000
					crystals = 200
				Orichalcum_Shield
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 1250
					DEF = 1000
					rarity=LEGENDARY
					attackprob = 75
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 200
			Assassin
				Typhoon
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 800
					AGI = 500
					CRIT = 35
					DblAtk = 1
					attackprob = 75
					rarity=LEGENDARY

					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			Chaosmage
				Dark_Genesis
					icon_state = "BoL"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 999
					INT = 666
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 200
				Ceremonial_Dagger
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 666
					HP = 666
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			Invoker
				Shadow_Kukri
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 1700
					DEF = 333
					issell = 1
					isdrop = 0
					sell = 100000
			WizardPilgrim
				Blessed_Staff
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 620
					HP = 500
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals =180
				Book_of_Light
					icon_state = "book1"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 580
					HP = 350
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 180
			PilgrimWizard
				Lilith_Tail
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 800
					HP = 500
					MP = 350
					CRIT = 10
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 180
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 4
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
			Monk
				Devil_Gauntlets
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 850
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			HolyKnight
				Ragnarok
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("holy knight")
				//	name="Cursed Longsword"
					STR = 800
					HP = 250
					MP = 250
					AGI = 250
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 200
				Dragontooth
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 800
					HP = 250
					MP = 250
					AGI = 250
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			Dragovian
				Staff_of_Divinegon
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 750
					AGI = 500
					HP = 500
					DblAtk = 1
					rarity=LEGENDARY
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals =200
				Divine_Pearl
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 700
					HP = 500
					rarity=LEGENDARY
					attackprob = 75
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
			GoofOff
				Fool_Wand
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 600
					MP = 500
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals = 220
				Deck_of_Jokers
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 600
					MP = 500
					rarity=LEGENDARY
					issell = 1
					isdrop = 0
					sell = 100000
					crystals =240
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T
			BardEnt
				Soothsayer_Sword
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					equipslot = "right hand"
					classuse = list("bard","entertainer")
					STR = 700
					INT = 500
					rarity=LEGENDARY
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals =200
				Orichalcum_Harp
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 600
					INT = 400
					rarity=LEGENDARY
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
					crystals =220
			Upgraded
			//Thief
				TalwarONE
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					name="+1 Talwar"
					equipslot = "right hand"
					classuse = list("thief")
					STR = 750
					AGI = 900
					DblAtk = 1
					attackprob = 80
					issell = 1
					isdrop = 0
					sell = 3000000
				Sudarshana_ChakraONE
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					name="+1 Sudarshana Chakra"
					equipslot = "left hand"
					classuse = list("thief")
					STR = 550
					AGI = 900
					CRIT = 25
					multiattack = 1
					DblAtk = 1
					attackprob = 50
					issell = 1
					isdrop = 0
					sell = 3000000
				TalwarTWO
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					name = "+2 Talwar"
					equipslot = "right hand"
					classuse = list("thief")
					STR = 900
					AGI = 999
					DblAtk = 1
					attackprob = 80
					issell = 1
					isdrop = 0
					sell = 3000000
				Sudarshana_ChakraTWO
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					name= "+2 Sudarshana Chakra"
					equipslot = "left hand"
					classuse = list("thief")
					STR = 600
					AGI = 999
					CRIT = 25
					multiattack = 1
					DblAtk = 1
					attackprob = 50
					issell = 1
					isdrop = 0
					sell = 3000000
				TalwarTHREE
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					name = "+3 Talwar"
					equipslot = "right hand"
					classuse = list("thief")
					STR = 1050
					AGI = 1250
					DblAtk = 1
					attackprob = 80
					issell = 1
					isdrop = 0
					sell = 3000000
				Sudarshana_ChakraTHREE
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					name="+3 Sudarshana Chakra"
					equipslot = "left hand"
					classuse = list("thief")
					STR = 650
					AGI = 1100
					CRIT = 25
					multiattack = 1
					DblAtk = 1
					attackprob = 50
					issell = 1
					isdrop = 0
					sell = 3000000
				TalwarFOUR
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					name= "+4 Talwar"
					equipslot = "right hand"
					classuse = list("thief")
					STR = 1200
					AGI = 1500
					DblAtk = 1
					attackprob = 90
					issell = 1

				Sudarshana_ChakraFOUR
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					name= "+4 Sudarshana Chakra"
					equipslot = "left hand"
					classuse = list("thief")
					STR = 700
					AGI = 1250
					CRIT = 25
					multiattack = 1
					DblAtk = 1
					attackprob = 50
					issell = 1
					isdrop = 0
					sell = 3000000

				TalwarFIVE
					icon_state = "shamshir"
					icon = 'weapons.dmi'
					name= "+5 Talwar"
					equipslot = "right hand"
					classuse = list("thief")
					STR = 4200
					AGI = 5250
					DblAtk = 1
					attackprob = 90
					issell = 0
					isdrop = 0
				Sudarshana_ChakraFIVE
					icon_state = "Metal Blade"
					icon = 'specialequip.dmi'
					name= "+5 Sudarshana Chakra"
					equipslot = "left hand"
					classuse = list("thief")
					STR = 2450
					AGI = 4375
					CRIT = 25
					multiattack = 1
					DblAtk = 1
					attackprob = 60
					issell = 1
					isdrop = 0
			//SAGE
				RuneswordONE
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					name="+1 Runesword"
					equipslot = "right hand"
					classuse = list("sage")
					STR = 850
					INT = 700
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Emerald_BladeONE
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					name="+1 Emerald Blade"
					equipslot = "left hand"
					classuse = list("sage")
					STR = 700
					INT = 850
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				RuneswordTWO
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					name = "+2 Runesword"
					equipslot = "right hand"
					classuse = list("sage")
					STR = 850
					INT = 850
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Emerald_BladeTWO
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					name = "+2 Emerald Blade"
					equipslot = "left hand"
					classuse = list("sage")
					STR = 850
					INT = 850
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				RuneswordTHREE
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					name = "+3 Runesword"
					equipslot = "right hand"
					classuse = list("sage")
					STR = 1000
					INT = 850
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Emerald_BladeTHREE
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					name = "+3 Emerald Blade"
					equipslot = "left hand"
					classuse = list("sage")
					STR = 850
					INT = 1000
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				RuneswordFOUR
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					name= "+4 Runesword"
					equipslot = "right hand"
					classuse = list("sage")
					STR = 1000
					INT = 1000
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				Emerald_BladeFOUR
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					name="+4 Emerald Blade"
					equipslot = "left hand"
					classuse = list("sage")
					STR = 1000
					INT = 1000
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000

				RuneswordFIVE
					icon_state = "Negative Creep"
					icon = 'weapons.dmi'
					name= "+5 Runesword"
					equipslot = "right hand"
					classuse = list("sage")
					STR = 3500
					INT = 3500
					DblAtk = 1
					attackprob = 95
					issell = 0
					isdrop = 0
				//	sell = 100000
				Emerald_BladeFIVE
					icon_state = "sword of xiong"
					icon = 'weapons.dmi'
					name="+5 Emerald Blade"
					equipslot = "left hand"
					classuse = list("sage")
					STR = 3500
					INT = 3500
					DblAtk = 1
					attackprob = 95
					issell = 0
					isdrop = 0
				//	sell = 100000
			//RANGER
				Demonium_BowONE
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					name="+1 Demonium Bow"
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 800
					AGI = 600
					HP = 300
					DblAtk = 2
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				ThunderboltONE
					icon_state = "darrow"
					icon = 'weapons.dmi'
					name = "+1 Thunderbolt"
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 600
					HP = 600
					MP = 600
					AGI = 400
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Demonium_BowTWO
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					name="+2 Demonium Bow"
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 900
					AGI = 700
					HP = 400
					DblAtk = 2
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				ThunderboltTWO
					icon_state = "darrow"
					icon = 'weapons.dmi'
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 700
					HP = 700
					MP = 700
					AGI = 500
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				Demonium_BowTHREE
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					name="+3 Demonium Bow"
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 1000
					AGI = 800
					HP = 600
					DblAtk = 2
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				ThunderboltTHREE
					icon_state = "darrow"
					icon = 'weapons.dmi'
					name="+3 Thunderbolt"
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 800
					HP = 800
					MP = 800
					AGI = 600
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				Demonium_BowFOUR
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					name= "+4 Demonium Bow"
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 1100
					AGI = 900
					HP = 700
					DblAtk = 2
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				ThunderboltFOUR
					icon_state = "darrow"
					icon = 'weapons.dmi'
					name = "+4 Thunderbolt"
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 900
					HP = 900
					MP = 900
					AGI = 700
					DblAtk = 1
					attackprob = 85
					issell = 1
					isdrop = 0
					sell = 100000


				Demonium_BowFIVE
					icon_state = "hunterbow"
					icon = 'weapons.dmi'
					name= "+5 Demonium Bow"
					equipslot = "right hand"
					classuse = list("ranger")
					STR = 3850
					AGI = 3150
					HP = 1750
					DblAtk = 2
					attackprob = 88
					issell = 0
					isdrop = 0
				//	sell = 100000
				ThunderboltFIVE
					icon_state = "darrow"
					icon = 'weapons.dmi'
					name = "+5 Thunderbolt"
					equipslot = "left hand"
					classuse = list("ranger")
					STR = 3150
					HP = 1750
					MP = 3150
					AGI = 2450
					DblAtk = 1
					attackprob = 95
					issell = 0
					isdrop = 0
				//	sell = 100000


			//SOLDIER
				BonecleaverONE
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					name= "+1 Bonecleaver"
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 850
					HP = 500
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_ShieldONE
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					name="+1 Orichalcum Shield"
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 1250
					DEF = 1250
					attackprob = 95
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000
				BonecleaverTWO
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					name = "+2 Bonecleaver"
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 950
					HP = 650
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_ShieldTWO
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					name="+2 Orichalcum Shield"
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 1250
					DEF = 1500
					attackprob = 95
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000
				BonecleaverTHREE
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					name="+3 Bonecleaver"
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 1000
					HP = 750
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_ShieldTHREE
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					name= "+3 Orichalcum Shield"
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 1250
					DEF = 1750
					attackprob = 95
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000
				BonecleaverFOUR
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					name="+4 Bonecleaver"
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 1350
					HP = 900
					attackprob = 95
					DblAtk = 1

					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_ShieldFOUR
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					name= "+4 Orichalcum Shield"
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 1250
					DEF = 2000
					HP = 850
					attackprob = 95
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000


				BonecleaverFIVE
					icon_state = "Moon Axe"
					icon = 'specialequip.dmi'
					name="+5 Bonecleaver"
					equipslot = "right hand"
					classuse = list("soldier")
					STR = 4735
					HP = 3150
					attackprob = 95
					DblAtk = 1

					issell = 0
					isdrop = 0
				//	sell = 100000
				Orichalcum_ShieldFIVE
					icon_state = "soul stealer"
					icon = 'shields.dmi'
					name= "+5 Orichalcum Shield"
					equipslot = "left hand"
					classuse = list("soldier")
					STR = 4375
					DEF = 6000
					HP = 2975
					attackprob = 95
					DblAtk = 1
					issell = 0
					isdrop = 0
				//	sell = 100000
			//Assassin
				TyphoonONE
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					name="+1 Typhoon"
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 800
					AGI = 600
					CRIT = 40
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
					/*New()
						..()
						var/obj/spells/Procs/Guard_Break/S = new
						procage += S*/

				TyphoonTWO
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					name="+2 Typhoon"
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 900
					AGI = 600
					CRIT = 40
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
					/*New()
						..()
						var/obj/spells/Procs/Guard_Break/S = new
						procage += S*/
				TyphoonTHREE
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					name="+3 Typhoon"
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 900
					AGI = 700
					CRIT = 45
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
					/*New()
						..()
						var/obj/spells/Procs/Guard_Break/S = new
						procage += S*/
				TyphoonFOUR
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					name="+4 Typhoon"
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 1000
					AGI = 800
					CRIT = 50
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
				TyphoonFIVE
					icon_state = "galekatana"
					icon = 'weapons.dmi'
					name="+5 Typhoon"
					equipslot = list("right hand","left hand")
					classuse = list("assassin")
					STR = 3500
					AGI = 2800
					HP = 1250
					CRIT = 50
					DblAtk = 1
					attackprob = 95
					issell = 0
					isdrop = 0
				//	sell = 100000

			//CHAOS MAGE
				Dark_GenesisONE
					icon_state = "BoL"
					icon = 'weapons.dmi'
					name="+1 Dark Genesis"
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 1200
					INT = 777
					issell = 1
					isdrop = 0
					sell = 100000
				Ceremonial_DaggerONE
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					name= "+1 Ceremonial Dagger"
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 750
					HP = 750
					issell = 1
					isdrop = 0
					sell = 100000

				Dark_GenesisTWO
					icon_state = "BoL"
					icon = 'weapons.dmi'
					name="+2 Dark Genesis"
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 1400
					INT = 888
					issell = 1
					isdrop = 0
					sell = 100000
				Ceremonial_DaggerTWO
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					name= "+2 Ceremonial Dagger"
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 800
					HP = 800
					issell = 1
					isdrop = 0
					sell = 100000

				Dark_GenesisTHREE
					icon_state = "BoL"
					icon = 'weapons.dmi'
					name="+3 Dark Genesis"
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 1600
					INT = 999
					issell = 1
					isdrop = 0
					sell = 100000
				Ceremonial_DaggerTHREE
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					name= "+3 Ceremonial Dagger"
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 850
					HP = 850
					issell = 1
					isdrop = 0
					sell = 100000

				Dark_GenesisFOUR
					icon_state = "BoL"
					icon = 'weapons.dmi'
					name="+4 Dark Genesis"
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 1800
					INT = 1200
					issell = 1
					isdrop = 0
					sell = 100000
				Ceremonial_DaggerFOUR
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					name= "+4 Ceremonial Dagger"
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 999
					HP = 999
					issell = 1
					isdrop = 0
					sell = 100000

				Dark_GenesisFIVE
					icon_state = "BoL"
					icon = 'weapons.dmi'
					name="+5 Dark Genesis"
					equipslot = "right hand"
					classuse = list("chaos mage")
					HP = 4000
					INT = 3000
					issell = 0
					isdrop = 0
					sell = 100000
				Ceremonial_DaggerFIVE
					icon_state = "blooddagger"
					icon = 'weapons.dmi'
					name= "+5 Ceremonial Dagger"
					equipslot = "left hand"
					classuse = list("chaos mage")
					INT = 3496
					HP = 2494
					issell = 0
					isdrop = 0
					sell = 100000
			//Invoker
				Shadow_KukriONE
					name= "+1 Shadow Kukri"
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 1700
					DEF = 500
					issell = 1
					isdrop = 0
					sell = 100000
				Shadow_KukriTWO
					name= "+2 Shadow Kukri"
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 1900
					DEF = 500
					issell = 1
					isdrop = 0
					sell = 100000
				Shadow_KukriTHREE
					name= "+3 Shadow Kukri"
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 1900
					DEF = 888
					issell = 1
					isdrop = 0
					sell = 100000
				Shadow_KukriFOUR
					name= "+4 Shadow Kukri"
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 2640
					DEF = 888
					AGI = 1099
					issell = 1
					isdrop = 0
					sell = 100000

				Shadow_KukriNEIN
					name= "+999 Shadow Kukri"
					equipslot = "right hand"
					classuse = list("invoker")
					HP = 99999
					DEF = 99999
					AGI = 99999
					STR = 99999
					issell = 1
					isdrop = 0
					sell = 100000

			//Pilgrim & Wizard
				Blessed_StaffONE
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					name="+1 Blessed Staff"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 750
					HP = 600
					issell = 1
					isdrop = 0
					sell = 100000
				Book_of_LightONE
					icon_state = "book1"
					icon = 'weapons.dmi'
					name="+1 Book of Light"
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 650
					HP = 400
					issell = 1
					isdrop = 0
					sell = 100000

				Blessed_StaffTWO
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					name="+2 Blessed Staff"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 840
					HP = 700
					issell = 1
					isdrop = 0
					sell = 100000
				Book_of_LightTWO
					icon_state = "book1"
					icon = 'weapons.dmi'
					name="+2 Book of Light"
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 760
					HP = 450
					issell = 1
					isdrop = 0
					sell = 100000

				Blessed_StaffTHREE
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					name="+3 Blessed Staff"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 950
					HP = 700
					issell = 1
					isdrop = 0
					sell = 100000
				Book_of_LightTHREE
					icon_state = "book1"
					icon = 'weapons.dmi'
					name= "+3 Book of Light"
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 825
					HP = 500
					DEF = 150
					issell = 1
					isdrop = 0
					sell = 100000

				Blessed_StaffFOUR
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					name="+4 Blessed Staff"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 1050
					HP = 500
					DEF = 250
					issell = 1
					isdrop = 0
					sell = 100000
				Book_of_LightFOUR
					icon_state = "book1"
					icon = 'weapons.dmi'
					name="+4 Book of Light"
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 999
					HP = 500
					issell = 1
					isdrop = 0
					sell = 100000

				Blessed_StaffFIVE
					icon_state = "staff of arcanity"
					icon = 'weapons.dmi'
					name="+5 Blessed Staff"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					INT = 3675
					HP = 1750
					DEF = 875
					issell = 0
					isdrop = 0
					sell = 100000
				Book_of_LightFIVE
					icon_state = "book1"
					icon = 'weapons.dmi'
					name="+5 Book of Light"
					equipslot = "left hand"
					classuse = list("wizard","pilgrim")
					INT = 3495
					HP = 1750
					issell = 0
					isdrop = 0
					sell = 100000



			//WHIPS
				Lilith_TailONE
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="+1 Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 900
					HP = 500
					MP = 350
					CRIT = 10
					issell = 1
					isdrop = 0
					sell = 100000
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 4
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob

				Lilith_TailTWO
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="+2 Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 925
					HP = 500
					MP = 350
					CRIT = 15
					issell = 1
					isdrop = 0
					sell = 100000
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 4
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob

				Lilith_TailTHREE
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="+3 Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 950
					HP = 600
					MP = 350
					CRIT = 15
					issell = 1
					isdrop = 0
					sell = 100000
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 4
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
				Lilith_TailFOUR
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="+4 Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 975
					HP = 650
					MP = 400
					CRIT = 20
					issell = 1
					isdrop = 0
					sell = 100000
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 5
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob

				Lilith_TailFIVE
					icon_state = "gringhamwhip"
					icon = 'weapons.dmi'
					name="+5 Lilith's Tail"
					equipslot = "right hand"
					classuse = list("wizard","pilgrim")
					STR = 3412
					HP = 2270
					MP = 1400
					CRIT = 20
					issell = 0
					isdrop = 0
					sell = 100000
					rand_attack = 1
					Select_Targets(var/mob/m)
						range() <<output( "<font color = green>\icon[m][m] begins whipping madly!</font>","CombatLog")
						sleep(5)
						var/mob/al
						if (m.leader)
							al = m.leader.attackleader
						else
							al = m.attackleader
						var/numattacks
						if (prob(5))
							numattacks = 5
						else if (prob(25))
							numattacks = 3
						else if (prob(40))
							numattacks = 2
						else
							numattacks = 1
						m:target_mob = newlist()
						var/list/L = newlist()
						L += al
						if (al.pet)
							L += al.pet
						for (var/mob/mtmp in al.group)
							L += mtmp
							if (mtmp.pet)
								L += mtmp.pet

						for (var/i = 0,i<numattacks,i++)
							var/r = rand(1,L.len)
							m:target_mob += L[r]
						return m:target_mob
			//MONK
				Devil_GauntletsONE
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					name="+1 Devil Gauntlets"
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 900
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Devil_GauntletsTWO
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					name = "+2 Devil Gauntlets"
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 950
					AGI = 100
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Devil_GauntletsTHREE
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					name = "+3 Devil Gauntlets"
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 1000
					CRIT = 15
					AGI = 500
					DblAtk = 1
					attackprob = 85
					issell = 1
					isdrop = 0
					sell = 100000
				Devil_GauntletsFOUR
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					name = "+4 Devil Gauntlets"
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 1200
					AGI = 600
					CRIT = 35
					DblAtk = 2
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000

				Devil_GauntletsFIVE
					icon_state = "falcon claw"
					icon = 'weapons.dmi'
					name = "+5 Devil Gauntlets"
					equipslot = list("right","left hand")
					classuse = list("monk")
					STR = 4800
					AGI = 2100
					CRIT = 35
					DblAtk = 2
					attackprob = 95
					issell = 0
					isdrop = 0
					sell = 100000


			//HOLYKNIGHT
				RagnarokONE
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					name = "+1 Ragnarok"
					equipslot = "right hand"
					classuse = list("holy knight")
					//name="Cursed Longsword"
					STR = 900
					HP = 300
					MP = 300
					AGI = 300
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				DragontoothONE
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					name = "+1 Dragontooth"
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 900
					HP = 300
					MP = 300
					AGI = 300
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				RagnarokTWO
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					name="+2 Ragnarok"
					equipslot = "right hand"
					classuse = list("holy knight")
				//	name="Cursed Longsword"
					STR = 999
					HP = 350
					MP = 350
					AGI = 350
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				DragontoothTWO
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					name = "+2 Dragontooth"
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 999
					HP = 350
					MP = 350
					AGI = 350
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				RagnarokTHREE
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					name = "+3 Ragnarok"
					equipslot = "right hand"
					classuse = list("holy knight")
				//	name="Cursed Longsword"
					STR = 1250
					HP = 400
					MP = 400
					AGI = 400
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				DragontoothTHREE
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					name = "+3 Dragontooth"
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 1250
					HP = 400
					MP = 400
					AGI = 400
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				RagnarokFOUR
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					name = "+4 Ragnarok"
					equipslot = "right hand"
					classuse = list("holy knight")
			//		name="Cursed Longsword"
					STR = 1500
					HP = 500
					MP = 500
					AGI = 500
					DblAtk = 2
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				DragontoothFOUR
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					name = "+4 Dragontooth"
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 1500
					HP = 500
					MP = 500
					AGI = 500
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000

				RagnarokFIVE
					icon_state = "SSJ Raditz"
					icon = 'weapons.dmi'
					name = "+5 Ragnarok"
					equipslot = "right hand"
					classuse = list("holy knight")
			//		name="Cursed Longsword"
					STR = 3650
					HP = 1750
					MP = 1750
					AGI = 1750
					DblAtk = 2
					attackprob = 95
					issell = 0
					isdrop = 0
					sell = 100000
				DragontoothFIVE
					icon_state = "cursed blade"
					icon = 'weapons.dmi'
					name = "+5 Dragontooth"
					equipslot = "left hand"
					classuse = list("holy knight")
				//	name="Cursed Shortsword"
					STR = 4180
					HP = 1750
					MP = 1750
					AGI = 1750
					DblAtk = 1
					attackprob = 95
					issell = 0
					isdrop = 0
					sell = 100000

			//Dragovian
				Staff_of_DivinegonONE
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					name = "+1 Staff of Divinegon"
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 800
					AGI = 500
					HP = 600
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Divine_PearlONE
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					name = "+1 Divine Pearl"
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 750
					HP = 500
					DEF = 50
					attackprob = 75
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000

				Staff_of_DivinegonTWO
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					name = "+2 Staff of Divinegon"
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 850
					AGI = 500
					HP = 600
					DEF = 50
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Divine_PearlTWO
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					name = "+2 Divine Pearl"
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 800
					HP = 600
					DEF = 100
					attackprob = 75
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000

				Staff_of_DivinegonTHREE
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					name = "+3 Staff of Divinegon"
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 900
					AGI = 500
					HP = 700
					DEF = 100
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Divine_PearlTHREE
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					name = "+3 Divine Pearl"
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 900
					HP = 500
					DEF = 200
					attackprob = 75
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000

				Staff_of_DivinegonFOUR
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					name = "+4 Staff of Divinegon"
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 999
					AGI = 500
					HP = 999
					DEF = 300
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				Divine_PearlFOUR
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					name = "+4 Divine Pearl"
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 900
					HP = 500
					DEF = 300
					attackprob = 90
					DblAtk = 1
					issell = 1
					isdrop = 0
					sell = 100000


				Staff_of_DivinegonFIVE
					icon_state = "divinegon"
					icon = 'weapons.dmi'
					name = "+5 Staff of Divinegon"
					equipslot = "right hand"
					classuse = list("dragovian")
					STR = 3496
					AGI = 1750
					HP = 3000
					DEF = 999
					DblAtk = 1
					attackprob = 92
					issell = 0
					isdrop = 0
					sell = 100000
				Divine_PearlFIVE
					icon_state = "mastergem"
					icon = 'weapons.dmi'
					name = "+5 Divine Pearl"
					equipslot = "left hand"
					classuse = list("dragovian")
					STR = 3450
					HP = 1750
					DEF = 999
					attackprob = 92
					DblAtk = 0
					issell = 1
					isdrop = 0
					sell = 100000



			//Goof is dead to me
				Fool_WandONE
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="+1 Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 600
					MP = 600
					issell = 1
					isdrop = 0
					sell = 100000
				Deck_of_JokersONE
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					name = "+1 Deck of Jokers"
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 650
					MP = 500
					issell = 1
					isdrop = 0
					sell = 100000
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T

				Fool_WandTWO
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="+2 Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 650
					MP = 600
					issell = 1
					isdrop = 0
					sell = 100000
				Deck_of_JokersTWO
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					name = "+2 Deck of Jokers"
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 700
					MP = 550
					issell = 1
					isdrop = 0
					sell = 100000
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T

				Fool_WandTHREE
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="+3 Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 650
					MP = 650
					issell = 1
					isdrop = 0
					sell = 100000
				Deck_of_JokersTHREE
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					name = "+3 Deck of Jokers"
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 700
					MP = 600
					issell = 1
					isdrop = 0
					sell = 100000
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T

				Fool_WandFOUR
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="+4 Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 800
					MP = 800
					issell = 1
					isdrop = 0
					sell = 100000
				Deck_of_JokersFOUR
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					name = "+4 Deck of Jokers"
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 800
					MP = 800
					issell = 1
					isdrop = 0
					sell = 100000
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T



				Fool_WandFIVE
					icon_state = "laughing staff"
					icon = 'weapons.dmi'
					name="+5 Fool's Wand"
					equipslot = "right hand"
					classuse = list("goof off")
					INT = 2469
					MP = 3469
					issell = 1
					isdrop = 0
					sell = 100000
				Deck_of_JokersFIVE
					icon_state = "light blue deck"
					icon = 'cards.dmi'
					name = "+5 Deck of Jokers"
					equipslot = "left hand"
					classuse = list("goof off")
					INT = 2569
					MP = 1869
					issell = 1
					isdrop = 0
					sell = 100000
					New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T
			//BARD ENT
				Soothsayer_SwordONE
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					name = "+1 Soothsayer Sword"
					equipslot = "right hand"
					classuse = list("bard","entertainer")
					STR = 750
					INT = 500
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_HarpONE

					name="+1 Orichalcum Harp"
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 600
					INT = 500
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				Soothsayer_SwordTWO
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					name="+2 Soothsayer Sword"
					equipslot = "right hand"
					classuse = list("bard","entertainer")
					STR = 800
					INT = 500
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_HarpTWO

					name="+2 Orichalcum Harp"
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 600
					INT = 550
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				Soothsayer_SwordTHREE
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					name = "+3 Soothsayer Sword"
					equipslot = "right hand"
					classuse = list("bard","entertainer")
					STR = 850
					INT = 500
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_HarpTHREE

					name = "+3 Orichalcum Harp"
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 600
					INT = 600
					DblAtk = 1
					attackprob = 75
					issell = 1
					isdrop = 0
					sell = 100000

				Soothsayer_SwordFOUR
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					name = "+4 Soothsayer Sword"
					equipslot = "right hand"
					classuse = list("bard","entertainer")
					STR = 900
					INT = 500
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_HarpFOUR

					name="+4 Orichalcum Harp"
					equipslot = "left hand"
					classuse = list("bard","entertainer")
					STR = 600
					INT = 700
					DblAtk = 1
					attackprob = 90
					issell = 1
					isdrop = 0
					sell = 100000



				Soothsayer_SwordFIVE
					icon_state = "Zenithian Sword"
					icon = 'specialequip.dmi'
					name = "+5 Soothsayer Sword"
					equipslot = "right hand"
					classuse = list("bard")
					STR = 3750
					INT = 500
					MP = 1850
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000
				Orichalcum_HarpFIVE
					name="+5 Orichalcum Harp"
					equipslot = "left hand"
					classuse = list("bard")
					STR = 3654
					INT = 700
					MP = 1890
					DblAtk = 1
					attackprob = 95
					issell = 1
					isdrop = 0
					sell = 100000

//***END UPGRADES***//
			staffs
				classuse = list("wizard","pilgrim","goof off","sage")
				equipslot = "right hand"
				Staff_of_Eternal_Earth
					STR = 200
					icon_state = "earth staff"
					isdrop = 0
					equipslot = "left hand"
					attackprob = 99
					classuse = list("soldier","ranger","thief","bard","wizard","pilgrim","goof off","sage","monk")
					var/turf/lastTurf = /turf
					Equip()
						if (isStaff(usr))
							..()
					Select_Target()
						target = usr
						Use()
					Battle_Select_Target()
						usr << "<b><font color = red>This item cannot be used during combat!"
					Stats()
					Use()
//						var/turf/T = locate(usr.x,usr.y,usr.z)
//						var/image/I = image(T.icon,T.icon_state)
//						var/turf/T2 = new/turf/floor/stool(locate(usr.x,usr.y,usr.z))
//						T2.underlays += I

						usr.busy = 1
						var/whattodo = input("What do you want to do to this area o master?") in list("Assign Owner","Add Turf","Delete Turf")

						switch(whattodo)
							if ("Assign Owner")
								var/owner = input("What is the owner's name?") as text
								var/keyy = input("What is the owner's key?") as text
								var/turf/T = locate(usr.x,usr.y,usr.z)
								if (istype(T.loc,/area/housing))
									T.loc:owner = owner
									T.loc:ownerkey = keyy
									usr << "Done"
								else
									usr << "You are not in a housing type area!"
							if ("Add Turf")
								var/list/L = newlist()
								for (var/o in typesof(/turf/wall/housing))
									var/turf/T2 = new o(locate(1,1,1))
									L += list(T2.name = T2.type)
								for (var/o in typesof(/turf/floor/housing))
									var/turf/T2 = new o(locate(1,1,1))
									L += list(T2.name = T2.type)

								L += "Cancel"

								var/list/L2 = newlist()
								var/turf/T3 = get_step(usr,usr.dir)
								for (var/Ii in T3.underlays)
									L2 += Ii
								var/t = input("What turf?") in L
								if (t != "Cancel")
									var/turf/T = get_step(usr,usr.dir)
									var/image/I = image(T.icon,T.icon_state)
									var/T2 = L[t]
									new T2(get_step(usr,usr.dir))
									var/turf/Tt = get_step(usr,usr.dir)
									Tt:underlays += I
									for (var/Ii in L2)
										Tt:underlays += Ii




						usr.busy = 0


						/*
						var/list/L = newlist()
						L += "Repeat Last"
						for (var/o in typesof(/turf))
							var/turf/T
							T = new o(locate(1,1,1))
							L += list(T.name = T.type)
						L += "Cancel"
						var/obj/whichobject = input("What turf?") in L
						if (whichobject != "Cancel" && whichobject != "Repeat Last")

							lastTurf = L[whichobject]
						*/
							//var/turf/T = new(lastTurf)
							//var/turf/T = locate(usr.loc.x,usr.loc.y,usr.loc.z)
							//for (var/turf/T in locate(usr.loc.x,usr.loc.y,usr.loc.z))
							//for (var/turf/T in view(0))
							//	T.layer = -1
							//	break
						//else if (whichobject == "Repeat Last")
							//var/turf/T = new lastTurf(usr.loc)
							//var/turf/T = new(lastTurf)




						usr:close_menu()

				GM_Staff
					STR = 10
					icon_state = "GM Staff"
					isdrop = 0
					equipslot = "left hand"
					attackprob = 90
					classuse = list("soldier","ranger","thief","bard","wizard","pilgrim","goof off","sage","monk")



				Cypress_Stick
					STR = 2
					icon_state = "cypress stick"
					cost = 10
					sell = 7
					classuse = list("soldier","ranger","thief","bard","wizard","pilgrim","goof off","sage")
				Club
					STR = 5
					icon_state = "club"
					cost = 60
					sell = 40
					classuse = list("soldier","ranger","thief","bard","wizard","pilgrim","goof off","sage")
				Oak_Staff
					INT = 3
					MP = 8
					icon_state = "oak staff"
					cost = 180
					sell = 120


				Magic_Staff
					INT = 4
					MP = 12
					icon_state = "magic staff"
					cost = 350
					sell = 200

				Smooth_Staff
					INT = 6
					MP = 16
					icon_state = "smooth staff"
					cost = 1000
					sell = 600

				Steel_Staff
					INT = 10
					MP = 25
					icon_state = "steel staff"
					cost = 5000
					sell = 3500

				Light_Staff
					INT = 10
					MP = 36
					icon_state = "light staff"
					cost = 12000
					sell = 8000



				Lunar_Staff
					INT = 12
					MP = 42
					icon_state = "lunar staff"
					cost = 35000
					sell = 20000

				Crystal_Staff
					INT = 14
					MP = 50
					icon_state = "crystal staff"
					cost = 75000
					sell = 40000


				Fire_Staff
				//	minlvl = 25
					INT = 20
					MP = 68
					icon_state = "fire staff"
					cost = 150000
					sell = 80000


				Staff_of_Zombie_Slaying
					INT = 35
					MP = 100
					attributes = list("zombie")
					classuse = list("soldier","ranger","thief","bard","wizard","pilgrim","goof off","sage","monk")
					icon_state = "staff of zombie slaying"
					cost = 180000
					sell = 125000
					rarity = UNCOMMON
					AlterHit(var/dmg,var/target)
						if (istype(target,/mob/NPC/enemys))
							if (target:attributes.Find("IsUndead"))
								dmg = round(dmg + rand(0,dmg))
								return dmg
						return dmg
				Demon_Staff
				//	minlvl = 46
					INT = 50
					MP = 120
					icon_state = "demon staff"
					cost = 60000
					sell = 15000


				Fire_Callers_Staff
					minlvl = 52
					classuse = list("sage")
					INT = 88
					MP = 200
					//minlvl = 85
					icon_state = "fire caller"
					cost = 150000
					sell = 50000
					rarity = RARE
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Fire_Call/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()


				Jesters_Staff
				//	minlvl = 50
					classuse = list("goof off")
					INT = 76
					MP = 250
					//minlvl = 85
					CRIT = 15
					icon_state = "jesters staff"
					cost = 75000
					sell = 10000
					rarity = RARE
					/*New()
						..()
						var/obj/spells/Procs/Focus/T = new
						procage += T*/

				Storm_Callers_Staff
					minlvl = 50
					classuse = list("pilgrim")
					INT = 68
					MP = 200
					//minlvl = 85
					icon_state = "wind caller"
					cost = 220000
					sell = 100000
					rarity = RARE
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Wind_Call/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()


				Thunder_Callers_Staff
					minlvl = 50
					classuse = list("wizard")
					INT = 80
					MP = 200
					icon_state = "thunder caller"
					cost = 220000
					sell = 100000
					//minlvl = 150
					rarity = RARE
					//target = newlist()
					Select_Target()
						usr << "You cannot use this item outside of combat."
					Battle_Select_Target()
						var/obj/spells/Thunder_Call/TC = new
						usr:itemtouse = TC
						TC.stafflink = src
						TC.Battle_Select_Target()



				legendarys
					bagtype = list("Legendary Satchel")
					baggable = 1
					rarity = UNCOMMON
					Dagger_of_Slaying
					Death_Spiral
						icon = 'weapons.dmi'
						icon_state = "death spiral"
						classuse = list("thief")
						var/i_state = "Mimic"
						equipslot = "right hand"
						AGI = 90
						STR = 44
						multiattack = 1
						CRIT = 5
						lore = 1
						isdrop = 0
						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)


							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()


					Claw_of_the_Great_Bear
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "claws of the great bear"
						var/i_state = "black bear"
						classuse = list("monk")
						equipslot = "right hand"
						AGI = 40
						STR = 130
						DblAtk = 1
						//attackprob
						CRIT = 8
						HP = 20
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Sacrificial_Dagger
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "blooddaggar"
						var/i_state = "Watabou"
						classuse = list("invoker")
						equipslot = "right hand"
						AGI = 30
						HP = 115
						DEF = 22
						//attackprob
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Book_of_Lucifer
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "BoL"
						var/i_state = "VileShadow"
						classuse = list("chaos mage")
						equipslot = "right hand"
						CRIT = 5
						HP = 400
						AGI = 25
						DEF = 40
						INT = 40
						lore = 1
						isdrop = 0
						var/damagebonus = 0.25
						Equip()
							if (..())
								usr.damagealter = usr.damagealter + damagebonus
						Unequip()
							if (..())
								usr.damagealter = usr.damagealter - damagebonus

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()

					Flail_of_Healing
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "flail of healing"
						var/i_state = "healer"
						var/charge_up = 0
						var/last_time = 0
						var/damagebonus = 0.12
						options = list("Transform")
						classuse = list("pilgrim")
						equipslot = "right hand"
						AGI = 35
						STR = 50
						DblAtk = 0
						HP = 50
						INT = 35
						MP =  80
						lore = 1
						isdrop = 0
					//	Equip()
						Equip()
							if (..())
								usr.damagealter = usr.damagealter + damagebonus
						Unequip()
							if (..())
								usr.damagealter = usr.damagealter - damagebonus
							if (..())
								var/icon/i = new('monsters.dmi')
								i = icon(i,i_state)
								usr.icon = i
								usr.stated = i_state
						Unequip()
							if (..())
								usr.icon = usr.saved_icon
						Select_Target()
							Group_List()
						Battle_Select_Target()
							Group_List()
						Process_Options(var/v)
							if (v=="Transform")
								var/icon/i = new('monsters.dmi')
								i = icon(i,i_state)

								if (!usr.stated || usr.stated != i_state)
									usr.icon = i
									usr.stated = i_state
								else
									usr.icon = usr.saved_icon
									usr.stated = null
							else
								..(v)
						Stats()
							..()
							usr << "Used as an item to heal an ally by 90%.  As you use it, it will grow warmer.  When the \icon[src][src.name] gets too hot, it will deal it's owner damage when used. It cools down over time."
							var/decrease = round((world.time - last_time)/600)
							if (decrease <0)
								decrease = 0
							charge_up -= decrease

							usr << "You touch your \icon[src][src.name], it feels <b><font color = [charge_up<=2? "green" : charge_up==3? "blue" : charge_up<5?"yellow":charge_up<10?"red":"black"]>[charge_up<=2? "cool" : charge_up==3? "warm" : charge_up<5?"hot":charge_up<10?"blistering":"like the inside of a volcano"]</font></b> to the touch."
							charge_up += decrease

						proc/Heal()
							var/maxhp = round((target.maxhealth-target.health)*0.90)
							if (usr.class != "pilgrim")
								maxhp = round((target.maxhealth-target.health)*0.40)
							target.health += maxhp

						Use(mob/m)
							if (!m)
								m = usr
							if(!m.inbattle)
								GSay("<b><font color = \"#FF8000\">\icon[m][m.name] raises the \icon[src][src] overhead.")
							else
								GSay("<b><font color = \"#FF8000\">\icon[m][m.name] raises the \icon[src][src] overhead.")
							if (target.health<1)
								range() << "But \icon[target][target] is dead!"
								return
							Noise()
							charge_up ++
							if (m.class != "pilgrim")
								charge_up+=3
							var/decrease = round((world.time - last_time)/600)
							if (decrease <0)
								decrease = 0
							charge_up -= decrease
							if (charge_up < 0)
								charge_up = 0
							if (charge_up < 10)
								if(!m.inbattle)
									GSay("<b><font color = blue>\icon[target][target.name] feels a healing aura encompass them.")
									Heal()
									switch(charge_up)
										if (0)
											GSay("<font color = green>\icon[src][src.name] feels cool in \icon[m][m.name]'s hands.")
										if (1)
											GSay("<font color = green>\icon[src][src.name] feels cool in \icon[m][m.name]'s hands.")
										if (2)
											GSay("<font color = blue>\icon[src][src.name] feels warm in \icon[m][m.name]'s hands.")
										if (3)
											GSay("<font color = yellow>\icon[src][src.name] feels hot in \icon[m][m.name]'s hands.")
										if (4)
											GSay("<font color = yellow>\icon[src][src.name] feels near blistering in \icon[m][m.name]'s hands.")
										if (5)
											GSay("<font color = red>\icon[src][src.name] is unbearably hot in \icon[m][m.name]'s hands.")
										if (6)
											GSay("<font color = red>\icon[src][src.name] blister's \icon[m][m.name]'s hands.")
											m.health -= round(m.maxhealth*0.2)
										if (7)
											GSay("<font color = red>\icon[src][src.name] char's \icon[m][m.name]'s hands.")
											m.health -= round(m.maxhealth *0.5)
										if (8)
											GSay("<font color = red>\icon[src][src.name] begins to reduce \icon[m][m.name] to cinders.")
											m.health -= round(m.maxhealth *0.8)
										if (9)
											GSay("<font color = red>\icon[src][src.name] radiate's \icon[m][m.name]'s body, cooking it to the bone.")
											m.health -= round(m.maxhealth *0.95)

								else
									GSay("<b><font color = blue>\icon[target][target.name] feels a healing aura encompass them.")
									Heal()
									switch(charge_up)
										if (0)
											GSay("<font color = green>\icon[src][src.name] feels cool in \icon[m][m.name]'s hands.")
										if (1)
											GSay("<font color = green>\icon[src][src.name] feels cool in \icon[m][m.name]'s hands.")
										if (2)
											GSay("<font color = blue>\icon[src][src.name] feels warm in \icon[m][m.name]'s hands.")
										if (3)
											GSay("<font color = yellow>\icon[src][src.name] feels hot in \icon[m][m.name]'s hands.")
										if (4)
											GSay("<font color = yellow>\icon[src][src.name] feels near blistering in \icon[m][m.name]'s hands.")
										if (5)
											GSay("<font color = red>\icon[src][src.name] is unbearably hot in \icon[m][m.name]'s hands.")
										if (6)
											GSay("<font color = red>\icon[src][src.name] blister's \icon[m][m.name]'s hands.")
											m.health -= round(m.maxhealth*0.2)
										if (7)
											GSay("<font color = red>\icon[src][src.name] char's \icon[m][m.name]'s hands.")
											m.health -= round(m.maxhealth *0.5)
										if (8)
											GSay("<font color = red>\icon[src][src.name] begins to reduce \icon[m][m.name] to cinders.")
											m.health -= round(m.maxhealth *0.8)
										if (9)
											GSay("<font color = red>\icon[src][src.name] radiate's \icon[m][m.name]'s body, cooking it to the bone.")
											m.health -= round(m.maxhealth *0.95)





							else
								if(m.inbattle)
									GSay("<b><font color = red>\icon[src][src.name] melts into \icon[m][m.name]'s soul.")
									Heal()
									m.health = 0
								else
									GSay("<b><font color = red>\icon[src][src.name] melts into \icon[m][m.name]'s soul.")
									Heal()
									m.health = 0






							last_time = world.time

							usr:close_menu()
					StaffofRain
						icon = 'weapons.dmi'
						icon_state = "sword of the slime knight"
						var/i_state = "icon_state"
					//	classuse = list("holy knight")
					//	equipslot = "right hand"
					//	AGI = 20
					//	STR = 110
					//	DblAtk = 1
					//	CRIT = 4
					//	HP = 50
					//	MP = 20
					//	fire_damage = 15
					//	lore = 1
					//	isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">fuckshitfuck"
							var/icon/i = icon_state//new('player2.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Hunter_Bow
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "hunterbow"
						var/i_state = "cat"
						classuse = list("ranger")
						equipslot = "right hand"
						AGI = 20
						STR = 98
						DblAtk = 1
						CRIT = 4
						HP = 50
						MP = 20
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Shuriken_of_Goemon
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "shuriken3"
						classuse = list("assassin")
						var/i_state = "rogue scorpion"
						equipslot = "right hand"
						AGI = 120
						STR = 70
					//	multiattack = 1
						DblAtk = 2
						attackprob = 50
						CRIT = 6
						lore = 1
						isdrop = 0
						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)


							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()

					Wyrm_Staff
						icon = 'weapons.dmi'
						icon_state = "wyrm"
						var/i_state = "SkyDragon"
						classuse = list("dragovian")
						equipslot = "right hand"
						AGI = 72
						STR = 99
						DblAtk = 1
						attackprob = 40
						HP = 33
						MP = 50
						fire_damage = 5
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()

					Slime_Knight_Sword
						icon = 'weapons.dmi'
						icon_state = "sword of the slime knight"
						var/i_state = "slime knight"
						classuse = list("holy knight")
						equipslot = "right hand"
						AGI = 20
						STR = 110
						DblAtk = 1
						CRIT = 4
						HP = 50
						MP = 20
						fire_damage = 15
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Pixie_Flute
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "pixie flute"
						var/i_state = "pixie"
						classuse = list("bard","entertainer")
						equipslot = "right hand"
						AGI = 30
						STR = 70
						CRIT = 1
						HP = 20
						MP = 20
						lore = 1
						isdrop = 0
						var/damagebonus = 0.14
						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
						Equip()
							if (..())
								usr.damagealter = usr.damagealter + damagebonus
						Unequip()
							if (..())
								usr.damagealter = usr.damagealter - damagebonus
					Shiny_Trinket
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "shiny trinket"
						var/i_state = "trick bag"
						classuse = list("goof off")
						equipslot = "right hand"
						AGI = 100
						STR = 40
						CRIT = 10
						HP = 20
						MP = 70
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Golem_Gloves
						minlvl = 24
						icon = 'weapons.dmi'
						icon_state = "golem gloves"
						var/i_state = "golem"
						classuse = list("soldier")
						equipslot = "right hand"
						STR = 110
						HP = 100
						DEF = 30
						CRIT = 2
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()

//ok because you probably need to go, what you need to do is. Go in game, create a blood staff, save, close game. Come here add int to the staff, load game check stats on staff and see if there is int
					Staff_of_Blood
						icon = 'weapons.dmi'
						icon_state = "staff of arcanity"
						var/i_state = "ozwarg"
						classuse = list("wizard")
						equipslot = "right hand"
						INT = 40
						HP = 20
						MP = 100
					//	lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()
					Dragon_Staff
						icon = 'weapons.dmi'
						icon_state = "dragon staff"
						var/i_state = "green dragon"
						classuse = list("sage")
						equipslot = "right hand"
						STR = 90
						INT= 44
						HP = 20
						MP = 130
						lore = 1
						isdrop = 0

						Select_Target()
							target = usr
							Use()
						Battle_Select_Target()
							usr << "<b><font color = red>This item cannot be used during combat!"
						Stats()
						Use()
							view() << "<b><font color = \"#FF8000\">\icon[usr][usr] let's the spirit of the \icon[src][src] envelope \him."
							var/icon/i = new('monsters.dmi')
							i = icon(i,i_state)

							if (!usr.stated || usr.stated != i_state)
								usr.icon = i
								usr.stated = i_state
							else
								usr.icon = usr.saved_icon
								usr.stated = null

							usr:close_menu()



			Stats2()	//This is for stats at a merchant only
				var/ew = "<html><title>[src.name]</title><body bgcolor = \"#CCCCCC\" text = \"#000000\">"
				// = "<html><body bgcolor = \"#000000\" text = \"#FFFFFF\">A hello!</body></html>"
				//usr << browse(ew,"window=ew")
				//var/icon/I
				//usr << "[src.icon]"
				//I = icon(src.icon,src.icon_state)
				//world << nextname
				//usr << browse_rsc(I,nextname)

				/*
				var/nextname
				nextname = "[cKey(src.name)].dmi"

				ew += "<center><img src = [nextname]>[src.name] is used by:"
				*/
				var/icon/I = icon(src.icon,src.icon_state)


				usr << browse_rsc(I,"[ckeyEx(src.name)].dmi")
				//sleep(30)
				ew += "<center><img src =[ckeyEx(src.name)].dmi width = 32 height = 32>[src.name] is used by:"
				var/output = ""
				for (var/t in classuse)
					output += "[t] - "

				output = copytext(output,1,length(output)-1)

				ew += "<center>[output]"
				if (genderequip)
					ew += "<br><center>[genderequip] only"

				if (istype(src.equipslot,/list))
					var/tew = ""
					for (var/o in src.equipslot)
						tew += "[o], "
					tew = copytext(tew,1,length(tew)-1)
					ew += "<center> Equipped: [tew]"
				else
					ew += "<center> Equipped: [src.equipslot]"
				ew += "<br><center>Stats:"
				if (src.minlvl) ew += "<center>Level requirement of [src.minlvl]"
				if (src.DblAtk) ew += "<center>[src.attackprob]% chance of an additional attack"
				if (src.HP) ew += "<center>[src.HP] HP"
				if (src.MP) ew += "<center>[src.MP] MP"
				if (src.STR) ew += "<center>[src.STR] Atk"
				if (src.AGI) ew += "<center>[src.AGI] Agi"
				if (src.CRIT) ew += "<center>[src.CRIT] Crit"
				if (src.DEF) ew += "<center>[src.DEF] Def"
				if (src.INT) ew += "<center>[src.INT] Int"
				if (src.healing_bonus) ew += "<center>[src.healing_bonus] Healing Bonus"
				if (src.fire_damage) ew += "<center>[src.fire_damage] Fire Damage"
				if (src.ice_damage) ew += "<center>[src.ice_damage] Ice Damage"
				if (src.wind_damage) ew += "<center>[src.wind_damage] Wind Damage"
				if (src.lightning_damage) ew += "<center>[src.lightning_damage] Lightning Damage"



				if (procage.len)
					ew += "<br><center>Procs"
				for (var/obj/spells/o in procage)
					//I = icon(o.icon,o.icon_state)
					//nextname = "[cKey(o.name)].dmi"   ///removed 8-14-5
					//usr << browse_rsc(I,nextname)

					//ew += "<center><image src = [nextname]>[o.name]"  ///changed on 8-14-5
					ew += "<center>[o.name]"
				ew +="<br><br>"
				for (var/obj/o in move_effect)
					ew += "<center>[o.name]"

				switch(rarity)
					if (COMMON)
						I = icon('rare.dmi',"common")
						usr << browse_rsc(I,"common.dmi")
						ew += "<right><img src = common.dmi width = 16 height = 16><br>"
					if (UNCOMMON)
						I = icon('rare.dmi',"uncommon")
						usr << browse_rsc(I,"uncommon.dmi")
						ew += "<right><img src = uncommon.dmi width = 16 height = 16><br>"
					if (RARE)
						I = icon('rare.dmi',"rare")
						usr << browse_rsc(I,"rare.dmi")
						ew += "<right><img src = rare.dmi width = 16 height = 16><br>"
					if (LEGENDARY)
						I = icon('rare.dmi',"legendary")
						usr << browse_rsc(I,"weapons.dmi")
						ew += "<right><img src = weapons.dmi width = 16 height = 16><br>"
					if (EPIC)
						I = icon('rare.dmi',"epic")
						usr << browse_rsc(I,"epic.dmi")
						ew += "<right><img src = epic.dmi width = 16 height = 16><br>"


				usr << browse(ew,"window=tew")

			Stats()

				var/ew = "<html><title>[src.name]</title><body bgcolor = \"#CCCCCC\" text = \"#000000\">"
				// = "<html><body bgcolor = \"#000000\" text = \"#FFFFFF\">A hello!</body></html>"
				//usr << browse(ew,"window=ew")
				//var/icon/I
				//usr << "[src.icon]"
				//I = icon(src.icon,src.icon_state)
				//world << nextname
				//usr << browse_rsc(I,nextname)

				/*
				var/nextname
				nextname = "[cKey(src.name)].dmi"

				ew += "<center><img src = [nextname]>[src.name] is used by:"
				*/
				var/icon/I = icon(src.icon,src.icon_state)


				usr << browse_rsc(I,"[ckeyEx(src.name)].dmi")
				//sleep(30)
				ew += "<center><img src =[ckeyEx(src.name)].dmi width = 32 height = 32>[src.name] is used by:"
				var/output = ""
				for (var/t in classuse)
					output += "[t] - "
				output = copytext(output,1,length(output)-1)
				ew += "<center>[output]"
				if (genderequip)
					ew += "<br><center>[genderequip] only"
				if (istype(src.equipslot,/list))
					var/tew = ""
					for (var/o in src.equipslot)
						tew += "[o], "
					tew = copytext(tew,1,length(tew)-1)
					ew += "<center> Equipped: [tew]"
				else
					ew += "<center> Equipped: [src.equipslot]"
				ew += "<br><center>Stats:"
				if (src.DblAtk) ew += "<center>[src.attackprob]% chance of an additional attack"
				if (src.minlvl) ew += "<center>Level requirement of [src.minlvl]"
				if (src.HP) ew += "<center>[src.HP] HP"
				if (src.MP) ew += "<center>[src.MP] MP"
				if (src.STR) ew += "<center>[src.STR] Atk"
				if (src.AGI) ew += "<center>[src.AGI] Agi"
				if (src.CRIT) ew += "<center>[src.CRIT] Crit"
				if (src.DEF) ew += "<center>[src.DEF] Def"
				if (src.INT) ew += "<center>[src.INT] Int"

				if (procage.len)
					ew += "<br><center>Procs"
				for (var/obj/spells/o in procage)
					//I = icon(o.icon,o.icon_state)
					//nextname = "[cKey(o.name)].dmi"   ///removed 8-14-5
					//usr << browse_rsc(I,nextname)

					//ew += "<center><image src = [nextname]>[o.name]"  ///changed on 8-14-5
					ew += "<center>[o.name]"
				ew +="<br><br>"
				var/i=0
				for (var/obj/o in move_effect)
					i++
					var/icon/I2 = icon(o.icon,o.icon_state)
					usr << browse_rsc(I2,"move_effect[i].dmi")
					ew += "<center><img src=move_effect[i].dmi>[o.name]<br>"

				if (Attached_Spell)
					ew+="[Attached_Spell] spell attached<br><br>"

				switch(rarity)
					if (COMMON)
						I = icon('rare.dmi',"common")
						usr << browse_rsc(I,"common.dmi")
						ew += "<right><img src = common.dmi width = 16 height = 16><br>"
					if (UNCOMMON)
						I = icon('rare.dmi',"uncommon")
						usr << browse_rsc(I,"uncommon.dmi")
						ew += "<right><img src = uncommon.dmi width = 16 height = 16><br>"
					if (RARE)
						I = icon('rare.dmi',"rare")
						usr << browse_rsc(I,"rare.dmi")
						ew += "<right><img src = rare.dmi width = 16 height = 16><br>"
					if (LEGENDARY)
						I = icon('rare.dmi',"legendary")
						usr << browse_rsc(I,"legendary.dmi")
						ew += "<right><img src = legendary.dmi width = 16 height = 16><br>"
					if (EPIC)
						I = icon('rare.dmi',"epic")
						usr << browse_rsc(I,"epic.dmi")
						ew += "<right><img src = epic.dmi width = 16 height = 16><br>"
				if (augments.len)
					ew += "Augments:<br>"
					i = 0
					for (var/obj/attainable/augments/A in src.augments)
						i++
						I = icon(A.icon,A.icon_state)
						usr << browse_rsc(I,"[ckeyEx(A.name)][i].dmi")
						if (A.snum < 2)
							ew += "<center><img src =[ckeyEx(A.name)][i].dmi width = 32 height = 32>[A.name]<br>"
						else
							ew += "<center><img src =[ckeyEx(A.name)][i].dmi width = 32 height = 32>[A.name] x[A.snum]<br>"

					ew+="<br>"

				usr << browse(ew,"window=ew")

				/*
				usr << "<center>\icon[src][src.name] can be used by:"
				var/output = ""
				for (var/t in classuse)
					output += "[t] - "
				output = copytext(output,1,length(output)-1)


				usr << "<center>[output]"
				usr << "<center> equipped on the [src.equipslot]"
				usr << "<br><center>Stats:"
				if (src.DblAtk) usr << "<center>[src.attackprob]% chance of an added attack per turn"
				if (src.HP) usr << "<center>[src.HP] HP"
				if (src.MP) usr << "<center>[src.MP] MP"
				if (src.STR) usr << "<center>[src.STR] Atk"
				if (src.AGI) usr << "<center>[src.AGI] Agi"
				if (src.CRIT) usr << "<center>[src.CRIT] Crit"
				if (src.DEF) usr << "<center>[src.DEF] Def"

				if (procage.len)
					usr << "<br><center>Procs"
				for (var/obj/spells/o in procage)
					usr << "<center>\icon[o][o]"
				*/


			Equip()
				var/eslot = src.equipslot
				var/lslot = null
				var/list/GMList = list("royalty","deity","noble","lord","lordess","king","Deity","Noble","Lord","Lordess","King","immortal","Immortal","Royalty")
				if (!equippable)
					usr << "<font color=yellow>That item is not equippable."
					return 0
				if (istype(src.equipslot,/list))
					var/cc = 0
					for (var/o in src.equipslot)
						lslot = o
						if (!usr.equippedslot.Find(o))
							cc = o
					if (cc)
						eslot = cc
					else
						eslot = lslot
				if (usr.equippedslot.Find(eslot))
					usr << "<font color=\"#CC0000\">You already have an item equipped on your [eslot]!"
					return 0
				else if (!classuse.Find(usr.class) && !GMList.Find(usr.class))
					usr << "<font color=\"#0000CC\">You are not the proper class to equip \icon[src][src.name].  You must be a one of the following classes to equip it:"
					var/i as num
					i=1
					while(i<=classuse.len)
						usr << "<center><b>~~~~~[classuse[i]]~~~~~"
						i++
					return 0
				else if (usr.lvl < src.minlvl)
					usr << "You try to equip the \icon[src][src], but your constitution just isn't powerful enough."
					return 0
				else
					usr.equippedslot += eslot
					usr.equipped += src
					src.equipped = eslot
					usr << "<font color=\"#0000CC\">You equip \icon[src][src.name]."

					//usr.health += HP
					//usr.magic += MP

					usr.totstr += STR
					usr.buffedstr += STR
					usr.totagi += AGI
					usr.buffedagi += AGI
					usr.totint += INT
					usr.buffedint += INT
					usr.totcrit += CRIT
					usr.buffedcrit += CRIT //this is what it should have been So basically it's been screwed for years. Yes because by
					usr.maxhealth += HP
					usr.buffedhp += HP
					usr.maxmagic += MP
					usr.buffedmp += MP
					usr.totdef += DEF
					usr.buffeddef += DEF
					usr.damagealter += damagealter
					usr.beatresist += beatresist
					usr.fire_reduc += fire_resist
					usr.light_reduc += light_resist
					usr.ice_reduc += ice_resist
					usr.wind_reduc += wind_resist
					usr.bonus.fire += fire_damage
					usr.bonus.healing += healing_bonus
					usr.bonus.lightning += lightning_damage
					usr.bonus.ice += ice_damage
					usr.bonus.wind += wind_damage
				//	usr.bonus.melee+=melee_damage
					usr.buff_reduc += buff_resist
					usr.melee_reduc+= melee_resist

					for (var/o in src.questlistflags)
						if (!usr.questlist.Find(o))
							usr.questlist += o


					//Added 8-14-5
					for(var/v in move_effect)
						usr.effects+=v
						if (istype(v,/obj/attainable/gildings))
							v:EquipGild(usr)


					return 1
/*
				if (!equippable)
					usr << "<font color=yellow>That item is not equippable."

				else if (usr.equippedslot.Find(src.equipslot))
					usr << "<font color=\"#CC0000\">You already have an item equipped on your [src.equipslot]!"
					return 0
				else if (!classuse.Find(usr.class))
					usr << "<font color=\"#0000CC\">You are not the proper class to equip \icon[src][src.name].  You must be a one of the following classes to equip it:"
					var/i as num
					i=1
					while(i<=classuse.len)
						usr << "<center><b>~~~~~[classuse[i]]~~~~~"
						i++
				else
					usr.equippedslot += src.equipslot
					usr.equipped += src
					src.equipped = 1
					usr << "<font color=\"#0000CC\">You equip \icon[src][src.name]."

					//usr.health += HP
					//usr.magic += MP

					usr.totstr += STR
					usr.totagi += AGI
					usr.totcrit += CRIT
					usr.maxhealth += HP
					usr.maxmagic += MP
					usr.totdef += DEF

					return 1

			Unequip()
				if (!usr.equipped.Find(src))
					usr << "<font color=\"#CC0000\">You don't have \icon[src][src.name] equipped!"
					return 0
				else
					usr.equipped -= src
					if (!istype(src.equipslot,/list))
						usr.equippedslot -= src.equipslot
					else
						usr.equippedslot -= src.equipped
					src.equipped = 0
					usr << "<font color=\"#0000CC\">You unequip \icon[src][src.name]."
					usr.totstr -= STR
					usr.totagi -= AGI
					usr.totcrit -= CRIT
					usr.maxhealth -= HP
					usr.maxmagic -= MP
					usr.totdef -= DEF

					//usr.health -= HP
					//usr.magic -= MP

					if (usr.health > usr.maxhealth)
						usr.health = usr.maxhealth
					if (usr.magic > usr.maxmagic)
						usr.magic = usr.maxmagic
					if (usr.health < 1)b
						usr.health = 1
					if (usr.magic < 1)
						usr.magic = 1
					return 1

*/
			Unequip(var/mob/m)
				if(m==null)
					m=usr
				if(m.noheal)
					m << "<font color=\"#CC0000\">The curse prevents you from unequipping your items!"
					return
				if (!m.equipped.Find(src))
					m << "<font color=\"#CC0000\">You don't have \icon[src][src.name] equipped!"
					return 0
				else if (cursed)
					m << "That item is cursed!  You try to remove the [src.name], but it won't budge!"
					return 0
				else
					m.equipped -= src
					if (!istype(src.equipslot,/list))
						m.equippedslot -= src.equipslot
					else
						m.equippedslot -= src.equipped
					src.equipped = 0
					m << "<font color=\"#0000CC\">You unequip \icon[src][src.name]."
					m.totstr -= STR
					m.buffedstr -= STR //xlax
					m.totagi -= AGI
					m.buffedagi -= AGI
					m.totint -= INT
					m.buffedint -= INT
					m.totcrit -= CRIT
					m.buffedcrit -= CRIT
					m.maxhealth -= HP
					m.buffedhp -= HP
					m.maxmagic -= MP
					m.buffedmp -= MP
					m.totdef -= DEF
					m.buffeddef -= DEF
					m.damagealter -= damagealter
					m.beatresist -= beatresist
					m.fire_reduc -= fire_resist
					m.light_reduc -= light_resist
					m.ice_reduc -= ice_resist
					m.wind_reduc -= wind_resist
					m.melee_reduc -= melee_resist
					m.bonus.fire -= fire_damage
					m.bonus.healing -= healing_bonus
					m.bonus.lightning -= lightning_damage
					m.bonus.ice -= ice_damage
					m.bonus.wind -= wind_damage
				//	m.bonus.melee-=melee_damage
					if(m.buffedmp < 0)
						m.buffedmp = 0
					if(m.buffedhp < 0)
						m.buffedhp = 0
					if(m.buffedstr < 0)
						m.buffedstr = 0
					if(m.buffeddef < 0)
						m.buffeddef = 0
					if(m.buffedagi < 0)
						m.buffedagi = 0
					if(m.buffedint < 0)
						m.buffedint = 0
					if(m.buffedcrit < 0)
						m.buffedcrit = 0
					for (var/o in src.questlistflags)
						if (m.questlist.Find(o))
							m.questlist -= o

					//usr.health -= HP
					//usr.magic -= MP

					if (m.health > usr.maxhealth)
						m.health = usr.maxhealth
					if (m.magic > usr.maxmagic)
						m.magic = usr.maxmagic
					if (m.health < 1)
						m.health = 1
					if (m.magic < 1)
						m.magic = 1
					//Added 8-14-5
					for(var/v in move_effect)
						usr.effects-=v
						if (istype(v,/obj/attainable/gildings))
							v:UnequipGild(usr)

					return 1
