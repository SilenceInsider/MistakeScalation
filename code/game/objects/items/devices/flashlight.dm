/obj/item/device/flashlight
	name = "flashlight"
	desc = "A hand-held emergency light."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flashlight"
	item_state = "flashlight"
	w_class = 2
	flags = CONDUCT
	slot_flags = SLOT_BELT

	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

	action_button_name = "Toggle Flashlight"
	var/on = 0
	var/brightness_on = 4 //luminosity when on

/obj/item/device/flashlight/initialize()
	..()
	update_icon()

/obj/item/device/flashlight/update_icon()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		set_light(brightness_on)
	else
		icon_state = "[initial(icon_state)]"
		set_light(0)

/obj/item/device/flashlight/attack_self(mob/user)
	if(!isturf(user.loc))
		user << "You cannot turn the light on while in this [user.loc]." //To prevent some lighting anomalities.
		return 0
	on = !on
	update_icon()
	playsound(loc, 'sound/items/flashlight_on.ogg', 75, 1, -3)
	user.update_action_buttons()
	return 1


/obj/item/device/flashlight/attack(mob/living/M as mob, mob/living/user as mob)
	add_fingerprint(user)
	if(on && user.zone_sel.selecting == BP_EYES)

		if((CLUMSY in user.mutations) && prob(50))	//too dumb to use flashlight properly
			return ..()	//just hit them in the head

		var/mob/living/carbon/human/H = M	//mob has protective eyewear
		if(istype(H))
			for(var/obj/item/clothing/C in list(H.head,H.wear_mask,H.glasses))
				if(istype(C) && (C.body_parts_covered & EYES))
					user << "<span class='warning'>You're going to need to remove [C] first.</span>"
					return

			var/obj/item/organ/vision
			if(!H.species.vision_organ || !H.should_have_organ(H.species.vision_organ))
				user << "<span class='warning'>You can't find anything on [H] to direct [src] into!</span>"
				return

			vision = H.internal_organs_by_name[H.species.vision_organ]
			if(!vision)
				vision = H.species.has_organ[H.species.vision_organ]
				user << "<span class='warning'>\The [H] is missing \his [initial(vision.name)]!</span>"
				return

			user.visible_message("<span class='notice'>\The [user] directs [src] into [M]'s [vision.name].</span>", \
								 "<span class='notice'>You direct [src] into [M]'s [vision.name].</span>")

			inspect_vision(vision, user)

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //can be used offensively
			M.flash_eyes()
	else
		return ..()

/obj/item/device/flashlight/proc/inspect_vision(obj/item/organ/vision, mob/living/user)
	var/mob/living/carbon/human/H = vision.owner

	if(H == user)	//can't look into your own eyes buster
		return

	if(vision.robotic < ORGAN_ROBOT )

		if(vision.owner.stat == DEAD || H.blinded)	//mob is dead or fully blind
			user << "<span class='warning'>\The [H]'s pupils do not react to the light!</span>"
			return
		if(XRAY in H.mutations)
			user << "<span class='notice'>\The [H]'s pupils give an eerie glow!</span>"
		if(vision.damage)
			user << "<span class='warning'>There's visible damage to [H]'s [vision.name]!</span>"
		else if(H.eye_blurry)
			user << "<span class='notice'>\The [H]'s pupils react slower than normally.</span>"
		if(H.getBrainLoss() > 15)
			user << "<span class='notice'>There's visible lag between left and right pupils' reactions.</span>"

		var/list/pinpoint = list("oxycodone"=1,"tramadol"=5)
		var/list/dilating = list("space_drugs"=5,"mindbreaker"=1)
		if(H.reagents.has_any_reagent(pinpoint) || H.ingested.has_any_reagent(pinpoint))
			user << "<span class='notice'>\The [H]'s pupils are already pinpoint and cannot narrow any more.</span>"
		else if(H.reagents.has_any_reagent(dilating) || H.ingested.has_any_reagent(dilating))
			user << "<span class='notice'>\The [H]'s pupils narrow slightly, but are still very dilated.</span>"
		else
			user << "<span class='notice'>\The [H]'s pupils narrow.</span>"

	//if someone wants to implement inspecting robot eyes here would be the place to do it.

/obj/item/device/flashlight/pen
	name = "penlight"
	desc = "A pen-sized light."
	icon_state = "penlight"
	item_state = ""
	flags = CONDUCT
	slot_flags = SLOT_EARS
	brightness_on = 2
	w_class = 1

/obj/item/device/flashlight/drone
	name = "low-power flashlight"
	desc = "A miniature lamp, that might be used by small robots."
	icon_state = "penlight"
	item_state = ""
	flags = CONDUCT
	brightness_on = 2
	w_class = 1

/obj/item/device/flashlight/usmc
	name = "military flashlight"
	desc = "A small flashlight used by US military."
	icon_state = "uslight"
	item_state = ""
	flags = CONDUCT
	brightness_on = 6
	w_class = 2


// the desk lamps are a bit special
/obj/item/device/flashlight/lamp
	name = "desk lamp"
	desc = "A desk lamp with an adjustable mount."
	icon_state = "lamp"
	item_state = "lamp"
	brightness_on = 5
	w_class = 4
	flags = CONDUCT

	on = 1


// green-shaded desk lamp
/obj/item/device/flashlight/lamp/green
	desc = "A classic green-shaded desk lamp."
	icon_state = "lampgreen"
	item_state = "lampgreen"
	brightness_on = 4
	light_color = "#FFC58F"

/obj/item/device/flashlight/lamp/verb/toggle_light()
	set name = "Toggle light"
	set category = "Object"
	set src in oview(1)

	if(!usr.stat)
		attack_self(usr)

// FLARES

/obj/item/device/flashlight/flare
	name = "flare"
	desc = "A red standard-issue flare. There are instructions on the side reading 'pull cord, make light'."
	w_class = 1
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = "#e58775"
	icon_state = "flare"
	item_state = "flare"
	action_button_name = null //just pull it manually, neckbeard.
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500

/obj/item/device/flashlight/flare/New()
	fuel = rand(800, 1000) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	..()

/obj/item/device/flashlight/flare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		processing_objects -= src

/obj/item/device/flashlight/flare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	update_icon()

/obj/item/device/flashlight/flare/attack_self(mob/user)
	if(turn_on(user))
		user.visible_message("<span class='notice'>\The [user] activates \the [src].</span>", "<span class='notice'>You pull the cord on the flare, activating it!</span>")
		playsound(loc, 'sound/items/flareOn.ogg', 75, 1, -3)

/obj/item/device/flashlight/flare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			user << "<span class='notice'>It's out of fuel.</span>"
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/slime
	gender = PLURAL
	name = "glowing slime extract"
	desc = "A glowing ball of what appears to be amber."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "floor1" //not a slime extract sprite but... something close enough!
	item_state = "slime"
	w_class = 1
	brightness_on = 6
	on = 1 //Bio-luminesence has one setting, on.

/obj/item/device/flashlight/slime/New()
	..()
	set_light(brightness_on)

/obj/item/device/flashlight/slime/update_icon()
	return

/obj/item/device/flashlight/slime/attack_self(mob/user)
	return //Bio-luminescence does not toggle.
