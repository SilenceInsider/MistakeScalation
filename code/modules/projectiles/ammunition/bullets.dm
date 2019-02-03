/obj/item/ammo_casing/a357
	desc = "A .357 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/ammo_casing/a50
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/ammo_casing/a75
	desc = "A 20mm bullet casing."
	caliber = "75"
	projectile_type = /obj/item/projectile/bullet/gyro

/obj/item/ammo_casing/c38
	desc = "A .38 bullet casing."
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c38/rubber
	desc = "A .38 rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c9mm
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c9mm/flash
	desc = "A 9mm flash shell casing."
	projectile_type = /obj/item/projectile/energy/flash

/obj/item/ammo_casing/c9mm/rubber
	desc = "A 9mm rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c9mm/practice
	desc = "A 9mm practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice

/obj/item/ammo_casing/c45
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/pistol45

/obj/item/ammo_casing/c45/practice
	desc = "A .45 practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice

/obj/item/ammo_casing/c45/rubber
	desc = "A .45 rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol45/nl
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c45/hp
	desc = "A .45 HP bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol45/hp

/obj/item/ammo_casing/c45/ap
	desc = "A .45 AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol45/ap

/obj/item/ammo_casing/c45/flash
	desc = "A .45 flash shell casing."
	projectile_type = /obj/item/projectile/energy/flash

/obj/item/ammo_casing/a10mm
	desc = "A 10mm bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/pistol/medium/smg


/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A 12 gauge slug."
	icon_state = "slshell"
	spent_icon = "slshell-spent"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 360)

/obj/item/ammo_casing/shotgun/pellet
	name = "shotgun shell"
	desc = "A 12 gauge shell."
	icon_state = "gshell"
	spent_icon = "gshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 360)

/obj/item/ammo_casing/shotgun/blank
	name = "shotgun shell"
	desc = "A blank shell."
	icon_state = "blshell"
	spent_icon = "blshell-spent"
	projectile_type = /obj/item/projectile/bullet/blank
	matter = list(DEFAULT_WALL_MATERIAL = 90)

/obj/item/ammo_casing/shotgun/practice
	name = "shotgun shell"
	desc = "A practice shell."
	icon_state = "pshell"
	spent_icon = "pshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/practice
	matter = list("metal" = 90)

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag shell"
	desc = "A beanbag shell."
	icon_state = "bshell"
	spent_icon = "bshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list(DEFAULT_WALL_MATERIAL = 180)

//Can stun in one hit if aimed at the head, but
//is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/shotgun/stunshell
	name = "stun shell"
	desc = "A 12 gauge taser cartridge."
	icon_state = "stunshell"
	spent_icon = "stunshell-spent"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	leaves_residue = 0
	matter = list(DEFAULT_WALL_MATERIAL = 360, "glass" = 720)

/obj/item/ammo_casing/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

//Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/shotgun/flash
	name = "flash shell"
	desc = "A chemical shell used to signal distress or provide illumination."
	icon_state = "fshell"
	spent_icon = "fshell-spent"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list(DEFAULT_WALL_MATERIAL = 90, "glass" = 90)

/obj/item/ammo_casing/a762
	desc = "A 7.62mm bullet casing."
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a145
	name = "shell casing"
	desc = "A 14.5mm shell."
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = "14.5mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a145
	matter = list(DEFAULT_WALL_MATERIAL = 1250)

/obj/item/ammo_casing/a556
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a556/practice
	desc = "A 5.56mm practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a556/practice

/obj/item/ammo_casing/rocket
	name = "rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/missile
	caliber = "rocket"
	w_class = 4

/obj/item/ammo_casing/cap
	name = "cap"
	desc = "A cap for children toys."
	caliber = "caps"
	color = "#FF0000"
	projectile_type = /obj/item/projectile/bullet/pistol/cap

//Cold war stuff

//Rifle caliber

/obj/item/ammo_casing/a762x51
	desc = "A 7.62x51mm bullet casing."
	caliber = "762x51"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x51
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a762x51/ap
	desc = "A 7.62x51mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762x51/ap

/obj/item/ammo_casing/a762x51/hp
	desc = "A 7.62x51mm HP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762x51/hp

/obj/item/ammo_casing/a762x39
	desc = "A 7.62x39mm bullet casing."
	caliber = "762x39"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a762x39/ap
	desc = "A 7.62x39mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39/ap

/obj/item/ammo_casing/a762x54
	desc = "A 7.62x54mm bullet casing."
	caliber = "762x54"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a762x54/ap
	desc = "A 7.62x54mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54/ap

/obj/item/ammo_casing/a762x54/hp
	desc = "A 7.62x54mm HP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54/hp

/obj/item/ammo_casing/a545x39
	desc = "A 5.45x39mm bullet casing."
	caliber = "545x39"
	projectile_type = /obj/item/projectile/bullet/rifle/a545x39
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a545x39/spent
	icon_state = "rifle-casing-spent"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a545x39/spent/New()
	expend(src)

/obj/item/ammo_casing/a545x39/ap
	desc = "A 5.45x39mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a545x39/ap

/obj/item/ammo_casing/a556x45
	desc = "A 5.56x45mm bullet casing."
	caliber = "556x45"
	projectile_type = /obj/item/projectile/bullet/rifle/a556x45
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a556x45/ap
	desc = "A 5.56x45mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a556x45/ap

/obj/item/ammo_casing/a9x19
	desc = "A 9x19mm bullet casing."
	caliber = "9x19"
	projectile_type = /obj/item/projectile/bullet/a9x19

/obj/item/ammo_casing/a9x19/ap
	desc = "A 9x19mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/a9x19/ap

/obj/item/ammo_casing/a9x18
	desc = "A 9x18mm bullet casing."
	caliber = "9x18"
	projectile_type = /obj/item/projectile/bullet/a9x18

/obj/item/ammo_casing/a9x18/ap
	desc = "A 9x18mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/a9x18/ap

/obj/item/ammo_casing/a4mm
	desc = "A 4mm bullet casing."
	caliber = "4mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a4mm

/obj/item/ammo_casing/a127x99mm
	desc = "A 12.7x99mm bullet casing."
	caliber = "127x99mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a127x99mm
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a127x108mm
	desc = "A 12.7x108mm bullet casing."
	caliber = "127x108mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a127x99mm
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"


/obj/item/ammo_casing/newrocket
	name = "rocket"
	desc = "A rocket."
	projectile_type = /obj/item/projectile/bullet/newrocket
	icon_state = "rocket"
	spent_icon = null
	caliber = "rocket"
	caseless = 1
	w_class = 4
	slot_flags = null

/obj/item/ammo_casing/oneuserocket
	name = "rocket"
	desc = "A rocket."
	projectile_type = /obj/item/projectile/bullet/oneuserocket
	icon_state = null
	spent_icon = null
	w_class = 4
	slot_flags = null
	caliber = "rocketoneuse"
	caseless = 1

/obj/item/ammo_casing/s40mmgrenade
	name = "40x53 HE grenade"
	desc = "A grenade."
	projectile_type = /obj/item/projectile/bullet/s40x53grenade
	icon_state = "40mm-hedp"
	spent_icon = null
	w_class = 2
	slot_flags = null
	caliber = "s40mm"
	spent_icon = "40mm-hedp_spent"

/obj/item/ammo_casing/s40mmgrenade/hedp
	name = "40x53 HEDP grenade"
	desc = "A grenade."
	projectile_type = /obj/item/projectile/bullet/s40x53grenade/hedp


/obj/item/ammo_casing/s3029mm
	name = "30x29 HE grenade"
	desc = "A grenade."
	projectile_type = /obj/item/projectile/bullet/s30x29grenade
	icon_state = "30mm"
	spent_icon = null
	w_class = 2
	slot_flags = null
	caliber = "s3029mm"
	spent_icon = "30mm-spent"

/obj/item/ammo_casing/s3029mm/shrapnel
	name = "30x29 shrapnel grenade"
	desc = "A grenade."
	projectile_type = /obj/item/projectile/bullet/s30x29grenade/shrapnel