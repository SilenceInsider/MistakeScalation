//This is a holder for things like the Skipjack and Nuke shuttle.
/datum/shuttle/multi_shuttle
	flags = SHUTTLE_FLAGS_NONE
	var/cloaked = 1
	var/at_origin = 1
	var/returned_home = 0
	var/move_time = 240
	var/cooldown = 20
	var/last_move = 0	//the time at which we last moved

	var/announcer
	var/arrival_message
	var/departure_message

	var/area/interim
	var/area/last_departed
	var/start_location
	var/last_location
	var/list/destinations
	var/list/destination_dock_controller_tags = list() //optional, in case the shuttle has multiple docking ports like the ERT shuttle (even though that isn't a multi_shuttle)
	var/list/destination_dock_controllers = list()
	var/list/destination_dock_targets = list()
	var/area/origin
	var/return_warning = 0
	category = /datum/shuttle/multi_shuttle

/datum/shuttle/multi_shuttle/New()
	origin = locate(origin)
	interim = locate(interim)
	for(var/destination in destinations)
		destinations[destination] = locate(destinations[destination])
	..()

/datum/shuttle/multi_shuttle/init_docking_controllers()
	..()
	for(var/destination in destinations)
		var/controller_tag = destination_dock_controller_tags[destination]
		if(!controller_tag)
			destination_dock_controllers[destination] = docking_controller
		else
			var/datum/computer/file/embedded_program/docking/C = locate(controller_tag)

			if(!istype(C))
				warning("Shuttle with docking tag [controller_tag] could not find it's controller!")
			else
				destination_dock_controllers[destination] = C

	//might as well set this up here.
	if(origin) last_departed = origin
	last_location = start_location

/datum/shuttle/multi_shuttle/current_dock_target()
	return destination_dock_targets[last_location]

/datum/shuttle/multi_shuttle/move(var/area/origin, var/area/destination)
	..()
	last_move = world.time
	if (destination == src.origin)
		returned_home = 1
	docking_controller = destination_dock_controllers[last_location]

/datum/shuttle/multi_shuttle/proc/announce_departure()

	if(cloaked || isnull(departure_message))
		return

	command_announcement.Announce(departure_message,(announcer ? announcer : "[boss_name]"))

/datum/shuttle/multi_shuttle/proc/announce_arrival()

	if(cloaked || isnull(arrival_message))
		return

	command_announcement.Announce(arrival_message,(announcer ? announcer : "[boss_name]"))


/obj/machinery/computer/shuttle_control/multi
	icon_keyboard = "syndie_key"
	icon_screen = "syndishuttle"

/obj/machinery/computer/shuttle_control/multi/attack_hand(user as mob)

	if(..(user))
		return
	src.add_fingerprint(user)

	var/datum/shuttle/multi_shuttle/MS = shuttle_controller.shuttles[shuttle_tag]
	if(!istype(MS)) return

	var/dat
	dat = "<center>[shuttle_tag] steering<hr>"


	if(MS.moving_status != SHUTTLE_IDLE)
		dat += "Location: <font color='red'>moving</font> <br>"

	if((MS.last_move + MS.cooldown*10) > world.time)
		dat += "<font color='red'>Engines charging.</font><br>"
	else
		dat += "<font color='green'>Engines ready.</font><br>"

//	dat += "<br><b><A href='?src=\ref[src];toggle_cloak=[1]'>Toggle cloaking field</A></b><br>"
	dat += "<b><A href='?src=\ref[src];move_multi=[1]'>move truck</A></b><br>"
	dat += "<b><A href='?src=\ref[src];start=[1]'>return to base</A></b></center>"

	user << browse("[dat]", "window=[shuttle_tag]shuttlecontrol;size=300x200")

//check if we're undocked, give option to force launch
/obj/machinery/computer/shuttle_control/proc/check_docking(datum/shuttle/multi_shuttle/MS)
	if(MS.skip_docking_checks() || MS.docking_controller.can_launch())
		return 1

	var/choice = alert("The shuttle is currently docked! Please undock before continuing.","Error","Cancel","Force Launch")
	if(choice == "Cancel")
		return 0

	choice = alert("Forcing a launch while landing may result a severe injury. Are you sure you wish to continue?", "Force Launch", "Force Launch", "Cancel")
	if(choice == "Cancel")
		return 0

	return 1

/obj/machinery/computer/shuttle_control/multi/Topic(href, href_list)
	if(..())
		return 1

	usr.set_machine(src)
	src.add_fingerprint(usr)

	var/datum/shuttle/multi_shuttle/MS = shuttle_controller.shuttles[shuttle_tag]
	if(!istype(MS)) return

	//world << "multi_shuttle: last_departed=[MS.last_departed], origin=[MS.origin], interim=[MS.interim], travel_time=[MS.move_time]"

	if(href_list["refresh"])
		updateUsrDialog()
		return

	if (MS.moving_status != SHUTTLE_IDLE)
		usr << "\blue [shuttle_tag] vessel is moving."
		return

	if(href_list["dock_command"])
		MS.dock()
		return

	if(href_list["undock_command"])
		MS.undock()
		return

	if(href_list["start"])
		if(MS.at_origin)
			usr << "\red You are already at your base."
			return

		if((MS.last_move + MS.cooldown*10) > world.time)
			usr << "\red the truck is inoperable while the engines are warming."
			return

		if(!check_docking(MS))
			updateUsrDialog()
			return

		MS.long_jump(MS.last_departed,MS.origin,MS.interim,MS.move_time)
		MS.last_departed = MS.origin
		MS.last_location = MS.start_location
		MS.at_origin = 1

	if(href_list["move_multi"])
		if((MS.last_move + MS.cooldown*10) > world.time)
			usr << "\red The truck engine are inoperable while the engines are warming."
			return

		if(!check_docking(MS))
			updateUsrDialog()
			return

		var/choice = input("Select a destination.") as null|anything in MS.destinations
		if(!choice) return

		usr << "\blue [shuttle_tag]'s engine whirrs to life."
		playsound(get_turf(usr),'sound/effects/get_in.wav',50,1)
		playsound(get_turf(usr),'sound/effects/dieseltruckloop1.wav',50,1)

		if(MS.at_origin)
			MS.announce_arrival()
			MS.last_departed = MS.origin
			MS.at_origin = 0


			MS.long_jump(MS.last_departed, MS.destinations[choice], MS.interim, MS.move_time)
			MS.last_departed = MS.destinations[choice]
			MS.last_location = choice
			return

		else if(choice == MS.origin)

			MS.announce_departure()

		MS.short_jump(MS.last_departed, MS.destinations[choice])
		MS.last_departed = MS.destinations[choice]
		MS.last_location = choice

	updateUsrDialog()
