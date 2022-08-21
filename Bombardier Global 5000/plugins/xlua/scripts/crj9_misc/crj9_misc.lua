
-- XPLANE CAN JUST HAVE ONE BLEED AIR INPUT MODE AT A TIME: 0=OFF, 1=LEFT ENGINE, 2=BOTH ENGINES, 3=RIGHT ENGINE, 4=APU, 5=AUTO
-- SO WE WILL HANDLE THE VARIOUS MD80's LEVERS AND SWITCHES WHO DEAL WITH BLEED AIR TO SET THAT MODE ACCORDINGLY.
-- ALSO THERE IS A SIMPLE HVAC (air conditioning) SIMULATED SYSTEM DRIVING RELATIVE NEEDLES AND SWITCHES.



----------------------------------- LOCATE AND CREATE DATAREFS -----------------------------------

-- EMPTY FUNCTIONS FOR WRITABLE DATAREFS
function EMER_func()
end

-- Lights
Light_Emergency_switch = create_dataref("robertsv/glex/lights/emergency","number",EMER_func) --> Emergency light
Light_Winginsp_switch = create_dataref("robertsv/glex/lights/winginsp","number",EMER_func) --> Wing inspection light
Light_Logo_switch = create_dataref("robertsv/glex/lights/logo","number",EMER_func) --> Logo light
Light_ll_left_switch = create_dataref("robertsv/glex/lights/ll_left","number",EMER_func) --> Left landing light
Light_tl_left_switch = create_dataref("robertsv/glex/lights/tl_left","number",EMER_func) --> Left taxi light
Light_tl_right_switch = create_dataref("robertsv/glex/lights/tl_right","number",EMER_func) --> Right taxi light
Light_ll_right_switch = create_dataref("robertsv/glex/lights/ll_right","number",EMER_func) --> Right landing light
Light_ll_nose_switch = create_dataref("robertsv/glex/lights/ll_nose","number",EMER_func) --> Nose landing light
Light_tl_nose_switch = create_dataref("robertsv/glex/lights/tl_front","number",EMER_func) --> Nose landing light actual dataref

Emergency_switch = create_dataref("robertsv/crjx/emergency/EMER_press","number",EMER_func) --> Emergency Switch
engine1_run_switch = create_dataref("robertsv/glex/engine1_run_switch","number",EMER_func) --> Engine 1 run switch
engine2_run_switch = create_dataref("robertsv/glex/engine2_run_switch","number",EMER_func) --> Engine 2 run switch
engine1_gen1_switch = create_dataref("robertsv/glex/generator/gen1","number",EMER_func) --> Engine 1 - Generator 1
engine1_gen2_switch = create_dataref("robertsv/glex/generator/gen2","number",EMER_func) --> Engine 1 - Generator 1
engine2_gen3_switch = create_dataref("robertsv/glex/generator/gen3","number",EMER_func) --> Engine 2 - Generator 3
engine2_gen4_switch = create_dataref("robertsv/glex/generator/gen4","number",EMER_func) --> Engine 2 - Generator 3
Gear_indi = create_dataref("robertsv/glex/gear/panelindi","number",EMER_func)

-- To calculate True air temperature
airspeed_true = find_dataref("sim/flightmodel2/position/true_airspeed")
temperature_sat = find_dataref("sim/cockpit2/temperature/outside_air_temp_degc")
temperature_tat = create_dataref("robertsv/glex/temperature/tat","number",EMER_func) --> True air temperature

-- To calculate relative heading of heading bug
relative_hdgbug = create_dataref("robertsv/glex/mfd1/relative_hdgbug","number",EMER_func) --> Relative heading
heading_tofly = find_dataref("sim/cockpit/autopilot/heading_mag")
aircraft_heading = find_dataref("sim/cockpit2/gauges/indicators/heading_electric_deg_mag_pilot")

-- EFIS selection
efis1 = find_dataref("sim/cockpit2/EFIS/EFIS_1_selection_pilot")
efis2 = find_dataref("sim/cockpit2/EFIS/EFIS_2_selection_pilot")

ignition_keyL = find_dataref("sim/cockpit2/engine/actuators/ignition_key[0]") -- 0=off, 1=left, 2=right, 3=both, 4=starting
ignition_keyR = find_dataref("sim/cockpit2/engine/actuators/ignition_key[1]") -- 0=off, 1=left, 2=right, 3=both, 4=starting
fuel_pumpL = find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[0]")
fuel_pumpR = find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[1]")
engine1_mixture = find_dataref("sim/cockpit2/engine/actuators/mixture_ratio[0]")
engine2_mixture = find_dataref("sim/cockpit2/engine/actuators/mixture_ratio[1]")
Engine1_gen = find_dataref("sim/cockpit2/electrical/generator_on[0]")
Engine2_gen = find_dataref("sim/cockpit2/electrical/generator_on[1]")
Spot_light = find_dataref("sim/cockpit2/switches/spot_light_on")
Spot_light_brtns = find_dataref("sim/flightmodel2/lights/spot_lights_brightness_ratio[0]")

Glex_APU_setting = find_dataref("sim/cockpit/engine/APU_switch")
Start_running_glex = find_dataref("sim/operation/prefs/startup_running")
Taxi_light_on = find_dataref("sim/cockpit2/switches/taxi_light_on")
Landing_light_on = find_dataref("sim/cockpit2/switches/landing_lights_on")
Landing_gear_up = find_dataref("sim/cockpit/switches/gear_handle_status")
Gear = find_dataref("sim/flightmodel2/gear/deploy_ratio[0]")
Slats = find_dataref("sim/flightmodel2/controls/slat1_deploy_ratio")
Flaps = find_dataref("sim/flightmodel2/wing/flap1_deg[1]")
Spoiler = find_dataref("sim/flightmodel2/wing/spoiler1_deg[1]")

------------------------------- FUNCTIONS -------------------------------

-- ANIMATION FUNCTION
function update_slowly(position,positionNEW,speed)
	position = position + ((positionNEW - position) * (speed * SIM_PERIOD))
	return position
end


------------------------------- FUNCTIONS: COMMANDS CALLBACK AND CREATION -------------------------------


-- Emergency switch
function EMER_toggle(phase, duration)
	if phase == 0 then
		if Emergency_switch == 0 then Emergency_switch = 1 elseif Emergency_switch == 1 then Emergency_switch = 0 end
	end
end

function Glex_generator1_toggle(phase, duration)
	if phase == 0 then
		 -- toggle from 0 to 1 and viceversa
		if engine1_gen1_switch == 0 then engine1_gen1_switch = 1 else engine1_gen1_switch = 0 end
	end
end

function Glex_generator2_toggle(phase, duration)
	if phase == 0 then
		 -- toggle from 0 to 1 and viceversa
		if engine1_gen2_switch == 0 then engine1_gen2_switch = 1 else engine1_gen2_switch = 0 end
	end
end

function Glex_generator3_toggle(phase, duration)
	if phase == 0 then
		 -- toggle from 0 to 1 and viceversa
		if engine2_gen3_switch == 0 then engine2_gen3_switch = 1 else engine2_gen3_switch = 0 end
	end
end

function Glex_generator4_toggle(phase, duration)
	if phase == 0 then
		 -- toggle from 0 to 1 and viceversa
		if engine2_gen4_switch == 0 then engine2_gen4_switch = 1 else engine2_gen4_switch = 0 end
	end
end

function glex_apu_off()
	Glex_APU_setting = 1	
end

function glex_apu_up(phase, duration)
	if Glex_APU_setting == 1 then 
		if phase == 0 then
			Glex_APU_setting = 2
			run_after_time(glex_apu_off, 5) -- turn starter off after 5 sec
		end
	end
	if Glex_APU_setting == 0 then 
		if phase == 0 then
			Glex_APU_setting = 1 
		end
	end
end

function glex_apu_dn(phase, duration)
	if phase == 0 then
		if Glex_APU_setting >= 1 then Glex_APU_setting = Glex_APU_setting - 1 end
	end
end

function glex_engine1_starter_off()
	Run_Engine1_starter = 0
end

function glex_engine1_fuelstarter()
		fuel_pumpL = 1
end

function glex_engine1_toggle(phase, duration)
	if phase == 0 then
		if engine1_run_switch == 0 then
			engine1_run_switch = 1
			Run_Engine1_starter = 1
--			run_after_time(glex_engine1_fuelstarter, 12) -- introduce fuel after 12 sec
			run_after_time(glex_engine1_starter_off, 25) -- turn starter off after 25 sec
		else
			engine1_run_switch = 0
			Run_Engine1_starter = 0
			engine1_mixture = 0
		end
	end
end

function glex_engine2_starter_off()
	Run_Engine2_starter = 0
end

function glex_engine2_fuelstarter()
		fuel_pumpR = 1
end

function glex_engine2_toggle(phase, duration)
	if phase == 0 then
		if engine2_run_switch == 0 then
			engine2_run_switch = 1
			Run_Engine2_starter = 1
--			run_after_time(glex_engine2_fuelstarter, 12) -- introduce fuel after 12 sec
			run_after_time(glex_engine2_starter_off, 25) -- turn starter off after 25 sec
		else
			engine2_run_switch = 0
			Run_Engine2_starter = 0
			engine2_mixture = 0
		end
	end
end

function Glex_light_logo_toggle(phase, duration)
	if phase == 0 then
		if Light_Logo_switch == 1 then Light_Logo_switch = 0 else Light_Logo_switch = 1 end
	end
end

function Glex_light_emergency_toggle(phase, duration)
	if phase == 0 then
		if Light_Emergency_switch == 1 then Light_Emergency_switch = 0 else Light_Emergency_switch = 1 end
	end
end

function Glex_light_winginsp_toggle(phase, duration)
	if phase == 0 then
		if Light_Winginsp_switch == 1 then Light_Winginsp_switch = 0 else Light_Winginsp_switch = 1 end
	end
end

function Glex_light_ll_left_toggle(phase, duration)
	if phase == 0 then
		if Light_ll_left_switch == 1 then Light_ll_left_switch = 0 else Light_ll_left_switch = 1 end
	end
end

function Glex_light_ll_right_toggle(phase, duration)
	if phase == 0 then
		if Light_ll_right_switch == 1 then Light_ll_right_switch = 0 else Light_ll_right_switch = 1 end
	end
end

function Glex_light_ll_nose_toggle(phase, duration)
	if phase == 0 then
		if Light_ll_nose_switch == 1 then Light_ll_nose_switch = 0 else Light_ll_nose_switch = 1 end
	end
end

function Glex_efis1_toggle(phase, duration)
	if phase == 0 then
		if efis1 <= 1 then 
			efis1 = efis1 + 1
		else
			efis1 = 0
		end
	end
end

function Glex_efis2_toggle(phase, duration)
	if phase == 0 then
		if efis2 <= 1 then 
			efis2 = efis2 + 1
		else
			efis2 = 0
		end
	end
end

cmdEmertog = create_command("robertsv/crjx/emergency/EMER_press_toggle","toggle emergency",EMER_toggle)

Inverter1 = find_dataref("sim/cockpit2/electrical/inverter_on[0]")
Inverter2 = find_dataref("sim/cockpit2/electrical/inverter_on[1]")

cmdglex_apu_up = create_command("robertsv/glex/apu_up","",glex_apu_up)
cmdglex_apu_dn = create_command("robertsv/glex/apu_dn","",glex_apu_dn)

cmdglex_engine1_toggle = create_command("robertsv/glex/engine1_toggle","",glex_engine1_toggle)
cmdglex_engine2_toggle = create_command("robertsv/glex/engine2_toggle","",glex_engine2_toggle)

cmdglex_gen1_toggle = create_command("robertsv/glex/generator/gen1_tog","",Glex_generator1_toggle)
cmdglex_gen2_toggle = create_command("robertsv/glex/generator/gen2_tog","",Glex_generator2_toggle)
cmdglex_gen3_toggle = create_command("robertsv/glex/generator/gen3_tog","",Glex_generator3_toggle)
cmdglex_gen4_toggle = create_command("robertsv/glex/generator/gen4_tog","",Glex_generator4_toggle)

-- Light commands
cmdglex_light_logo_toggle = create_command("robertsv/glex/lights/logo_toggle","",Glex_light_logo_toggle)
cmdglex_light_winginsp_toggle = create_command("robertsv/glex/lights/winginsp_toggle","",Glex_light_winginsp_toggle)
cmdglex_light_emergency_toggle = create_command("robertsv/glex/lights/emergency_toggle","",Glex_light_emergency_toggle)
cmdglex_light_ll_left_toggle = create_command("robertsv/glex/lights/ll_left_toggle","",Glex_light_ll_left_toggle)
cmdglex_light_ll_right_toggle = create_command("robertsv/glex/lights/ll_right_toggle","",Glex_light_ll_right_toggle)
cmdglex_light_ll_nose_toggle = create_command("robertsv/glex/lights/ll_nose_toggle","",Glex_light_ll_nose_toggle)

-- EFIS commands
cmdglex_efis1_toggle = create_command("robertsv/glex/mfd/efis1_toggle","",Glex_efis1_toggle)
cmdglex_efis2_toggle = create_command("robertsv/glex/mfd/efis2_toggle","",Glex_efis2_toggle)

function flight_start()
	if Inverter1 == 0 then
		Inverter1 = 1
		Inverter2 = 1
	end
	Glex_APU_setting = 0
	Run_Engine1_starter = 0
	Run_Engine2_starter = 0
	if Start_running_glex == 1 then
		engine1_run_switch = 1
		engine2_run_switch = 1
		engine1_gen1_switch = 1
		engine1_gen2_switch = 1
		engine2_gen3_switch = 1
		engine2_gen4_switch = 1
	end
	Spot_light = 1
	Spot_light_brtns = 1
	efis1 = 1
	efis2 = 1
	Landing_light_on = 1
	Gear_indi_timer = 0
end

function after_physics()
	if Run_Engine1_starter == 1 then
			ignition_keyL = 4
	else
			ignition_keyL = 0
	end

	if Run_Engine2_starter == 1 then
			ignition_keyR = 4
	else
			ignition_keyR = 0
	end
	-- If one of the generator buttons for the engine is on, generator is on.
	if engine1_gen1_switch + engine1_gen2_switch >= 1 then
		Engine1_gen = 1
	else		
		Engine1_gen = 0
	end
	if engine2_gen3_switch + engine2_gen4_switch >= 1 then
		Engine2_gen = 1
	else		
		Engine2_gen = 0
	end

	if Taxi_light_on == 1 or Light_ll_left_switch == 1 then
		Light_tl_left_switch = 1
	else
		Light_tl_left_switch = 0
	end

	if Taxi_light_on == 1 or Light_ll_right_switch == 1 then
		Light_tl_right_switch = 1
	else
		Light_tl_right_switch = 0
	end

	if Landing_gear_up == 1 then
		if Taxi_light_on == 1 or Light_ll_nose_switch == 1 then
			Light_tl_nose_switch = 1
		else
			Light_tl_nose_switch = 0
		end
	else
		Light_tl_nose_switch = 0
	end

	temperature_tat = temperature_sat + ((airspeed_true * airspeed_true) / 7569)
	relative_hdgbug = heading_tofly - aircraft_heading
	
	if Gear >= 0.05 or Flaps >= 0.05 or Slats >= 0.05 then
		Gear_indi = 0
		Gear_indi_timer = 30
	else
		if Gear_indi_timer > 0 then
			Gear_indi_timer = Gear_indi_timer - (1 * SIM_PERIOD)
		else
			Gear_indi = 1
		end
	end
	Landing_light_on = 1
end














