
-- Create datarefs
msg01 = create_dataref("robertsv/crjx/eicas/Eicas1", "string")
msg02 = create_dataref("robertsv/crjx/eicas/Eicas2", "string")
msg03 = create_dataref("robertsv/crjx/eicas/Eicas3", "string")
msg04 = create_dataref("robertsv/crjx/eicas/Eicas4", "string")
msg05 = create_dataref("robertsv/crjx/eicas/Eicas5", "string")
msg06 = create_dataref("robertsv/crjx/eicas/Eicas6", "string")
msg07 = create_dataref("robertsv/crjx/eicas/Eicas7", "string")
msg08 = create_dataref("robertsv/crjx/eicas/Eicas8", "string")
msg09 = create_dataref("robertsv/crjx/eicas/Eicas9", "string")
msg10 = create_dataref("robertsv/crjx/eicas/Eicas10", "string")
msg11 = create_dataref("robertsv/crjx/eicas/Eicas11", "string")
msg12 = create_dataref("robertsv/crjx/eicas/Eicas12", "string")
stat01 = create_dataref("robertsv/crjx/eicas/Stat01", "string")
stat02 = create_dataref("robertsv/crjx/eicas/Stat02", "string")
stat03 = create_dataref("robertsv/crjx/eicas/Stat03", "string")
stat04 = create_dataref("robertsv/crjx/eicas/Stat04", "string")
stat05 = create_dataref("robertsv/crjx/eicas/Stat05", "string")
stat06 = create_dataref("robertsv/crjx/eicas/Stat06", "string")
stat07 = create_dataref("robertsv/crjx/eicas/Stat07", "string")
stat08 = create_dataref("robertsv/crjx/eicas/Stat08", "string")
stat09 = create_dataref("robertsv/crjx/eicas/Stat09", "string")
stat10 = create_dataref("robertsv/crjx/eicas/Stat10", "string")
stat11 = create_dataref("robertsv/crjx/eicas/Stat11", "string")
stat12 = create_dataref("robertsv/crjx/eicas/Stat12", "string")
stat13 = create_dataref("robertsv/crjx/eicas/Stat13", "string")
msg01p = create_dataref("robertsv/crjx/eicas/Eicas01p", "number")
msg02p = create_dataref("robertsv/crjx/eicas/Eicas02p", "number")
msg03p = create_dataref("robertsv/crjx/eicas/Eicas03p", "number")
msg04p = create_dataref("robertsv/crjx/eicas/Eicas04p", "number")
msg05p = create_dataref("robertsv/crjx/eicas/Eicas05p", "number")
msg06p = create_dataref("robertsv/crjx/eicas/Eicas06p", "number")
msg07p = create_dataref("robertsv/crjx/eicas/Eicas07p", "number")
msg08p = create_dataref("robertsv/crjx/eicas/Eicas08p", "number")
msg09p = create_dataref("robertsv/crjx/eicas/Eicas09p", "number")
msg10p = create_dataref("robertsv/crjx/eicas/Eicas10p", "number")
msg11p = create_dataref("robertsv/crjx/eicas/Eicas11p", "number")
msg12p = create_dataref("robertsv/crjx/eicas/Eicas12p", "number")
stat01p = create_dataref("robertsv/crjx/eicas/Stat01p", "number")
stat02p = create_dataref("robertsv/crjx/eicas/Stat02p", "number")
stat03p = create_dataref("robertsv/crjx/eicas/Stat03p", "number")
stat04p = create_dataref("robertsv/crjx/eicas/Stat04p", "number")
stat05p = create_dataref("robertsv/crjx/eicas/Stat05p", "number")
stat06p = create_dataref("robertsv/crjx/eicas/Stat06p", "number")
stat07p = create_dataref("robertsv/crjx/eicas/Stat07p", "number")
stat08p = create_dataref("robertsv/crjx/eicas/Stat08p", "number")
stat09p = create_dataref("robertsv/crjx/eicas/Stat09p", "number")
stat10p = create_dataref("robertsv/crjx/eicas/Stat10p", "number")
stat11p = create_dataref("robertsv/crjx/eicas/Stat11p", "number")
stat12p = create_dataref("robertsv/crjx/eicas/Stat12p", "number")
stat13p = create_dataref("robertsv/crjx/eicas/Stat13p", "number")

function AntiiceXO_func()
end

function AntiiceWSrc_func()
end

yawdamp_switch = create_dataref("robertsv/glex/autopilot/yawdamp_switch", "number")
antiiceLE = create_dataref("robertsv/crjx/eicas/AntiiceLE", "number")
antiiceLEF = create_dataref("robertsv/crjx/eicas/AntiiceLEF", "number")
antiiceLW = create_dataref("robertsv/crjx/eicas/AntiiceLW", "number")
antiiceXO = create_dataref("robertsv/crjx/eicas/AntiiceXO", "number",AntiiceXO_func)
antiiceXW = create_dataref("robertsv/crjx/eicas/AntiiceXW", "number")
antiiceRE = create_dataref("robertsv/crjx/eicas/AntiiceRE", "number")
antiiceREF = create_dataref("robertsv/crjx/eicas/AntiiceREF", "number")
antiiceRW = create_dataref("robertsv/crjx/eicas/AntiiceRW", "number")
antiiceWing = create_dataref("robertsv/crjx/eicas/AntiiceW", "number")
antiiceWingSrc = create_dataref("robertsv/crjx/eicas/AntiiceWSrc", "number",AntiiceWSrc_func)
antiiceLeftc = create_dataref("robertsv/crjx/eicas/AntiiceCLH", "number")
antiiceRightc = create_dataref("robertsv/crjx/eicas/AntiiceCRH", "number")

function AntiiceXO_toggle(phase, duration)
	if phase == 0 then
		if antiiceXO == 0 then antiiceXO = 1 elseif antiiceXO == 1 then antiiceXO = 0 end
	end
end

function yawdamp_switch_toggle(phase, duration)
	if phase == 0 then
		if yawdamp_switch == 0 then yawdamp_switch = 1 else yawdamp_switch = 0 end
	end
end

function antiiceWing_toggle(phase, duration)
	if phase == 0 then
		if antiiceWing == 0 then antiiceWing = 1 elseif antiiceWing == 1 then antiiceWing = 0 end
	end
end

function antiiceLeftc_toggle(phase, duration)
	if phase == 0 then
		if antiiceLeftc == 0 then antiiceLeftc = 1 elseif antiiceLeftc == 1 then antiiceLeftc = 0 end
	end
end

function antiiceRightc_toggle(phase, duration)
	if phase == 0 then
		if antiiceRightc == 0 then antiiceRightc = 1 elseif antiiceRightc == 1 then antiiceRightc = 0 end
	end
end

function AntiiceWSrc_switch_up(phase, duration)
	if phase == 0 then
		if antiiceWingSrc < 2 then antiiceWingSrc = antiiceWingSrc + 1 end
	end
end

function AntiiceWSrc_switch_dwn(phase, duration)
	if phase == 0 then
		if antiiceWingSrc > 0 then antiiceWingSrc = antiiceWingSrc - 1 end
	end
end

cmdYawdamp_switchtog = create_command("robertsv/glex/autopilot/yawdamp_switch_toggle","Toggle yawdamper",yawdamp_switch_toggle)
cmdAntiiceXOtog = create_command("robertsv/crjx/eicas/AntiiceXO_toggle","Gravity crossflow",AntiiceXO_toggle)
cmdantiiceWingtog = create_command("robertsv/crjx/eicas/antiiceWing_toggle","Wing anti ice",antiiceWing_toggle)
cmdantiiceLeftctog = create_command("robertsv/crjx/eicas/antiiceLeftc_toggle","Cowl left hand anti ice",antiiceLeftc_toggle)
cmdantiiceRightctog = create_command("robertsv/crjx/eicas/antiiceRightc_toggle","Cowl right hand anti ice",antiiceRightc_toggle)
cmdAntiiceWSrcup = create_command("robertsv/crjx/eicas/AntiiceWSrc_up","Wing bleed up",AntiiceWSrc_switch_up)
cmdAntiiceWSrcdwn = create_command("robertsv/crjx/eicas/AntiiceWsrc_dwn","Wing bleed down",AntiiceWSrc_switch_dwn)

-- Get datarefs
parkbrake = find_dataref("sim/cockpit2/controls/parking_brake_ratio")
OilpressL = find_dataref("sim/cockpit2/engine/indicators/oil_pressure_psi[0]")
OilpressR = find_dataref("sim/cockpit2/engine/indicators/oil_pressure_psi[1]")
FuelpressL = find_dataref("sim/cockpit2/engine/indicators/fuel_pressure_psi[0]")
FuelpressR = find_dataref("sim/cockpit2/engine/indicators/fuel_pressure_psi[1]")
FuelpumpL = find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[0]")
FuelpumpR = find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[1]")
EngFireL = find_dataref("sim/flightmodel2/engines/is_on_fire[0]")
EngFireR = find_dataref("sim/flightmodel2/engines/is_on_fire[1]")
EngN1L = find_dataref("sim/flightmodel2/engines/N1_percent[0]")
EngN1R = find_dataref("sim/flightmodel2/engines/N1_percent[1]")
OnGround = find_dataref("sim/flightmodel2/gear/on_ground[1]")
Spoilers = find_dataref("sim/flightmodel2/wing/spoiler1_deg")
Spoilerhandle = find_dataref("sim/cockpit2/controls/speedbrake_ratio")
Flaps = find_dataref("sim/flightmodel2/controls/flap_handle_deploy_ratio")
EngRevL = find_dataref("sim/cockpit2/annunciators/reverser_on[0]")
EngRevR = find_dataref("sim/cockpit2/annunciators/reverser_on[1]")
IceDet = find_dataref("sim/cockpit2/annunciators/ice")
RadioAlt = find_dataref("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot")
LandingGear = find_dataref("sim/cockpit2/controls/gear_handle_down")
Yawdamp = find_dataref("sim/cockpit/switches/yaw_damper_on")
AutoP = find_dataref("sim/cockpit2/autopilot/flight_director_mode")
altitude = find_dataref("sim/cockpit2/gauges/indicators/altitude_ft_pilot")
half_bank = find_dataref("sim/cockpit2/autopilot/bank_angle_mode")
seatbelt = find_dataref("sim/cockpit2/annunciators/fasten_seatbelt")
nosmoke = find_dataref("sim/cockpit2/switches/no_smoking")
autoreverse = find_dataref("sim/cockpit2/switches/auto_reverse_on")
Fuelleft = find_dataref("sim/cockpit2/fuel/fuel_quantity[0]")
Fuelright = find_dataref("sim/cockpit2/fuel/fuel_quantity[2]")
EICASwindow = find_dataref("sim/cockpit2/controls/wingsweep_ratio")
Groundspoilers = find_dataref("sim/cockpit2/switches/custom_slider_on[12]")


Bleedairmode = find_dataref("sim/cockpit2/pressurization/actuators/bleed_air_mode")
Antiiceleftwing = find_dataref("sim/cockpit2/ice/ice_surface_hot_bleed_air_left_on")
Antiicerightwing = find_dataref("sim/cockpit2/ice/ice_surface_hot_bleed_air_right_on")
Antiiceleftintake = find_dataref("sim/cockpit2/ice/ice_inlet_heat_on_per_engine[0]")
Antiicerightintake = find_dataref("sim/cockpit2/ice/ice_inlet_heat_on_per_engine[1]")
APU_running = find_dataref("sim/cockpit/engine/APU_running")

ECS_Pack1 = find_dataref("sim/cockpit2/bleedair/actuators/pack_left")
ECS_Pack2 = find_dataref("sim/cockpit2/bleedair/actuators/pack_right")
ECS_PackC = find_dataref("sim/cockpit2/bleedair/actuators/pack_center")

-- Default antiice
	antiiceXO = 1
	antiiceWing = 0
	antiiceWingSrc = 1
	antiiceLeftc = 0
	antiiceRightc = 0

-- FUNCTIONS

-- FUNCTION: RESET THE EOAP
function reset_eoap()
	msg01 = ""
	msg02 = ""
	msg03 = ""
	msg04 = ""
	msg05 = ""
	msg06 = ""
	msg07 = ""
	msg08 = ""
	msg09 = ""
	msg10 = ""
	msg11 = ""
	msg12 = ""
 	stat01 = ""
 	stat02 = ""
 	stat03 = ""
 	stat04 = ""
 	stat05 = ""
 	stat06 = ""
 	stat07 = ""
	stat08 = ""
	stat09 = ""
	stat10 = ""
	stat11 = ""
	stat12 = ""
	stat13 = ""
	msg = ""
	stat = ""
	EICASwindow = "0.1"
end

-- FUNCTION: CHECK IF A MESSAGE IS ALREADY ON DISPLAYS
function checkEXSISTmsg()
	isalreadypresent = 0
	yetcheck = 0
	if msg == msg01 then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg02) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg03) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg04) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg05) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg06) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg07) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg08) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg09) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg10) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg11) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (msg == msg12) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	return isalreadypresent
end

-- FUNCTION: CHECK IF A MESSAGE IS ALREADY ON DISPLAYS
function checkEXSISTstat()
	isalreadypresent = 0
	yetcheck = 0
	if stat == stat01 then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat02) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat03) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat04) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat05) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat06) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat07) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat08) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat09) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat10) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat11) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat12) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	if (stat == stat13) and (yetcheck == 0) then isalreadypresent = 1 yetcheck = 1 end
	return isalreadypresent
end

-- FUNCTION: WRITE THE ALERT MESSAGE ON THE EOAP IN THE FIRST EMPTY LINE
function filldisplays()
	yetwrite = 0
	if msg01 == "" then msg01 = msg msg01p = msgp yetwrite = 1 end
	if (msg02 == "") and (yetwrite == 0) then msg02 = msg msg02p = msgp yetwrite = 1 end
	if (msg03 == "") and (yetwrite == 0) then msg03 = msg msg03p = msgp yetwrite = 1 end
	if (msg04 == "") and (yetwrite == 0) then msg04 = msg msg04p = msgp yetwrite = 1 end
	if (msg05 == "") and (yetwrite == 0) then msg05 = msg msg05p = msgp yetwrite = 1 end
	if (msg06 == "") and (yetwrite == 0) then msg06 = msg msg06p = msgp yetwrite = 1 end
	if (msg07 == "") and (yetwrite == 0) then msg07 = msg msg07p = msgp yetwrite = 1 end
	if (msg08 == "") and (yetwrite == 0) then msg08 = msg msg08p = msgp yetwrite = 1 end
	if (msg09 == "") and (yetwrite == 0) then msg09 = msg msg09p = msgp yetwrite = 1 end
	if (msg10 == "") and (yetwrite == 0) then msg10 = msg msg10p = msgp yetwrite = 1 end
	if (msg11 == "") and (yetwrite == 0) then msg11 = msg msg11p = msgp yetwrite = 1 end
	if (msg12 == "") and (yetwrite == 0) then msg12 = msg msg12p = msgp yetwrite = 1 end
end

function filldisplaysstat()
	yetwrite = 0
	if stat01 == "" then stat01 = stat stat01p = statp yetwrite = 1 end
	if (stat02 == "") and (yetwrite == 0) then stat02 = stat stat02p = statp yetwrite = 1 end
	if (stat03 == "") and (yetwrite == 0) then stat03 = stat stat03p = statp yetwrite = 1 end
	if (stat04 == "") and (yetwrite == 0) then stat04 = stat stat04p = statp yetwrite = 1 end
	if (stat05 == "") and (yetwrite == 0) then stat05 = stat stat05p = statp yetwrite = 1 end
	if (stat06 == "") and (yetwrite == 0) then stat06 = stat stat06p = statp yetwrite = 1 end
	if (stat07 == "") and (yetwrite == 0) then stat07 = stat stat07p = statp yetwrite = 1 end
	if (stat08 == "") and (yetwrite == 0) then stat08 = stat stat08p = statp yetwrite = 1 end
	if (stat09 == "") and (yetwrite == 0) then stat09 = stat stat09p = statp yetwrite = 1 end
	if (stat10 == "") and (yetwrite == 0) then stat10 = stat stat10p = statp yetwrite = 1 end
	if (stat11 == "") and (yetwrite == 0) then stat11 = stat stat11p = statp yetwrite = 1 end
	if (stat12 == "") and (yetwrite == 0) then stat12 = stat stat12p = statp yetwrite = 1 end
	if (stat13 == "") and (yetwrite == 0) then stat13 = stat stat13p = statp yetwrite = 1 end
end

function rearrange()
	if msg01 == "" then msg01 = msg02 msg02 = "" msg01p = msg02p end
	if msg02 == "" then msg02 = msg03 msg03 = "" msg02p = msg03p end
	if msg03 == "" then msg03 = msg04 msg04 = "" msg03p = msg04p end
	if msg04 == "" then msg04 = msg05 msg05 = "" msg04p = msg05p end
	if msg05 == "" then msg05 = msg06 msg06 = "" msg05p = msg06p end
	if msg06 == "" then msg06 = msg07 msg07 = "" msg06p = msg07p end
	if msg07 == "" then msg07 = msg08 msg08 = "" msg07p = msg08p end
	if msg08 == "" then msg08 = msg09 msg09 = "" msg08p = msg09p end
	if msg09 == "" then msg09 = msg10 msg10 = "" msg09p = msg10p end
	if msg10 == "" then msg10 = msg11 msg11 = "" msg10p = msg11p end
	if msg11 == "" then msg11 = msg12 msg12 = "" msg11p = msg12p end
	if msg12 == "" then msg12 = "" end
	if stat01 == "" then stat01 = stat02 stat02 = "" stat01p = stat02p end
	if stat02 == "" then stat02 = stat03 stat03 = "" stat02p = stat03p end
	if stat03 == "" then stat03 = stat04 stat04 = "" stat03p = stat04p end
	if stat04 == "" then stat04 = stat05 stat05 = "" stat04p = stat05p end
	if stat05 == "" then stat05 = stat06 stat06 = "" stat05p = stat06p end
	if stat06 == "" then stat06 = stat07 stat07 = "" stat06p = stat07p end
	if stat07 == "" then stat07 = stat08 stat08 = "" stat07p = stat08p end
	if stat08 == "" then stat08 = stat09 stat09 = "" stat08p = stat09p end
	if stat09 == "" then stat09 = stat10 stat10 = "" stat09p = stat10p end
	if stat10 == "" then stat10 = stat11 stat11 = "" stat10p = stat11p end
	if stat11 == "" then stat11 = stat12 stat12 = "" stat11p = stat12p end
	if stat12 == "" then stat12 = stat13 stat13 = "" stat12p = stat13p end
	if stat13 == "" then stat13 = "" end
	rearrangeprio()
end

function rearrangeprio()
	if msg12p > msg11p then temp = msg11 tempp = msg11p msg11 = msg12 msg11p = msg12p msg12 = temp msg12p = tempp end
	if msg11p > msg10p then temp = msg10 tempp = msg10p msg10 = msg11 msg10p = msg11p msg11 = temp msg11p = tempp end
	if msg10p > msg09p then temp = msg09 tempp = msg09p msg09 = msg10 msg09p = msg10p msg10 = temp msg10p = tempp end
	if msg09p > msg08p then temp = msg08 tempp = msg08p msg08 = msg09 msg08p = msg09p msg09 = temp msg09p = tempp end
	if msg08p > msg07p then temp = msg07 tempp = msg07p msg07 = msg08 msg07p = msg08p msg08 = temp msg08p = tempp end
	if msg07p > msg06p then temp = msg06 tempp = msg06p msg06 = msg07 msg06p = msg07p msg07 = temp msg07p = tempp end
	if msg06p > msg05p then temp = msg05 tempp = msg05p msg05 = msg06 msg05p = msg06p msg06 = temp msg06p = tempp end
	if msg05p > msg04p then temp = msg04 tempp = msg04p msg04 = msg05 msg04p = msg05p msg05 = temp msg05p = tempp end
	if msg04p > msg03p then temp = msg03 tempp = msg03p msg03 = msg04 msg03p = msg04p msg04 = temp msg04p = tempp end
	if msg03p > msg02p then temp = msg02 tempp = msg02p msg02 = msg03 msg02p = msg03p msg03 = temp msg03p = tempp end
	if msg02p > msg01p then temp = msg01 tempp = msg01p msg01 = msg02 msg01p = msg02p msg02 = temp msg02p = tempp end
	if stat13p > stat12p then temp = stat12 tempp = stat12p stat12 = stat13 stat12p = stat13p stat13 = temp stat13p = tempp end
	if stat12p > stat11p then temp = stat11 tempp = stat11p stat11 = stat12 stat11p = stat12p stat12 = temp stat12p = tempp end
	if stat11p > stat10p then temp = stat10 tempp = stat10p stat10 = stat11 stat10p = stat11p stat11 = temp stat11p = tempp end
	if stat10p > stat09p then temp = stat09 tempp = stat09p stat09 = stat10 stat09p = stat10p stat10 = temp stat10p = tempp end
	if stat09p > stat08p then temp = stat08 tempp = stat08p stat08 = stat09 stat08p = stat09p stat09 = temp stat09p = tempp end
	if stat08p > stat07p then temp = stat07 tempp = stat07p stat07 = stat08 stat07p = stat08p stat08 = temp stat08p = tempp end
	if stat07p > stat06p then temp = stat06 tempp = stat06p stat06 = stat07 stat06p = stat07p stat07 = temp stat07p = tempp end
	if stat06p > stat05p then temp = stat05 tempp = stat05p stat05 = stat06 stat05p = stat06p stat06 = temp stat06p = tempp end
	if stat05p > stat04p then temp = stat04 tempp = stat04p stat04 = stat05 stat04p = stat05p stat05 = temp stat05p = tempp end
	if stat04p > stat03p then temp = stat03 tempp = stat03p stat03 = stat04 stat03p = stat04p stat04 = temp stat04p = tempp end
	if stat03p > stat02p then temp = stat02 tempp = stat02p stat02 = stat03 stat02p = stat03p stat03 = temp stat03p = tempp end
	if stat02p > stat01p then temp = stat01 tempp = stat01p stat01 = stat02 stat01p = stat02p stat02 = temp stat02p = tempp end
end

-- FUNCTION: SEARCH AND REMOVE THE ALERT MESSAGE FROM THE EOAP
function removemsg()
	if msg01 == msg then msg01 = "" end
	if msg02 == msg then msg02 = "" end
	if msg03 == msg then msg03 = "" end
	if msg04 == msg then msg04 = "" end
	if msg05 == msg then msg05 = "" end
	if msg06 == msg then msg06 = "" end
	if msg07 == msg then msg07 = "" end
	if msg08 == msg then msg08 = "" end
	if msg09 == msg then msg09 = "" end
	if msg10 == msg then msg10 = "" end
	if msg11 == msg then msg11 = "" end
	if msg12 == msg then msg12 = "" end
	rearrangeprio()
end

function removestat()
	if stat01 == stat then stat01 = "" end
	if stat02 == stat then stat02 = "" end
	if stat03 == stat then stat03 = "" end
	if stat04 == stat then stat04 = "" end
	if stat05 == stat then stat05 = "" end
	if stat06 == stat then stat06 = "" end
	if stat07 == stat then stat07 = "" end
	if stat08 == stat then stat08 = "" end
	if stat09 == stat then stat09 = "" end
	if stat10 == stat then stat10 = "" end
	if stat11 == stat then stat11 = "" end
	if stat12 == stat then stat12 = "" end
	if stat13 == stat then stat13 = "" end
	rearrangeprio()
end



function half_bank_31500()
	-- check if aircraft higher then 31500
	if altitude > 31500 then
		if altitude < 31750 then
			half_bank = 3
		end
	end
	-- check if aircraft higher then 31500
	if altitude < 31501 then
		if altitude > 31250 then
			half_bank = 6
		end
	end
end

function antiice()
-- Is the engine suplying bleed?
if APU_running == 0 then
	if EngN1L > 12 then
		if Bleedairmode == 1 or Bleedairmode == 2 or Bleedairmode == 5 then	
			antiiceLE = 0
		else
			antiiceLE = 1
		end
	else
		antiiceLE = 1
	end
	if EngN1R > 12 then
		if Bleedairmode == 3 or Bleedairmode == 2 or Bleedairmode == 5 then
			antiiceRE = 0
		else
			antiiceRE = 1
		end
	else
		antiiceRE = 1
	end
else
		antiiceLE = 1
		antiiceRE = 1
end

-- Is bleed supplied on the left side
if antiiceLE == 0 then
	antiiceLEF = 0
else
	if antiiceRE == 0 and antiiceXO == 1 then
		antiiceLEF = 0
	else
		antiiceLEF = 1
	end
end

-- Is bleed supplied on the right side
if antiiceRE == 0 then
	antiiceREF = 0
else
	if antiiceLE == 0 and antiiceXO == 1 then
		antiiceREF = 0
	else
		antiiceREF = 1
	end
end

-- Is the left hand intake anti ice on?
if antiiceLEF == 0 and antiiceLeftc == 1 then
	Antiiceleftintake = 1
else
	Antiiceleftintake = 0
end

-- Is the right hand intake anti ice on?
if antiiceREF == 0 and antiiceRightc == 1 then
	Antiicerightintake = 1
else
	Antiicerightintake = 0
end

-- Is the left hand wing anti ice valve open?
if antiiceLEF == 0 and antiiceWing == 1 and antiiceWingSrc <= 1 then
	if Bleedairmode == 1 or Bleedairmode == 2 or Bleedairmode == 5 then
		antiiceLW = 0
	else
		antiiceLW= 1
	end
else
		antiiceLW= 1
end

-- Is the right hand wing anti ice valve open?
if antiiceREF == 0 and antiiceWing == 1 and antiiceWingSrc >= 1 then
	if Bleedairmode == 3 or Bleedairmode == 2 or Bleedairmode == 5 then
		antiiceRW = 0
	else
		antiiceRW= 1
	end
else
		antiiceRW= 1
end

-- Is the wing anti ice crossfeed open?
if antiiceWingSrc == 0 and antiiceLW == 0 then
	antiiceXW = 0
else
	if antiiceWingSrc == 2 and antiiceRW == 0 then
		antiiceXW = 0
	else
		antiiceXW = 1
	end
end

-- Is the left wing anti ice on?
if antiiceXW == 0 or antiiceLW == 0 then
	Antiiceleftwing = 1
else
	Antiiceleftwing = 0
end


-- Is the left wing anti ice on?
if antiiceXW == 0 or antiiceRW == 0 then
	Antiicerightwing = 1
else
	Antiicerightwing = 0
end

end

function ecs()
-- Is the left pack on?
if antiiceLE == 0 or APU_running == 1 then
	ECS_Pack1 = 1
else
	ECS_Pack1 = 0
end

-- Is the right pack on?
if antiiceRE == 0 then
	ECS_Pack2 = 1
else
	if APU_running == 1 and antiiceXO == 1 then
		ECS_Pack2 = 1
	else
		ECS_Pack2 = 0
	end
end

-- Is the center pack on (for sim use only, not available in real plane)?
if ECS_Pack1 == 1 or ECS_Pack2 == 1 then
	ECS_packC = 1
else
	ECS_packC = 0
end

end

function flight_start()
	reset_eoap()
	yawdamp_switch = 1
end

--- Main script
function after_physics()

-- MSGP = 0 for yellow or white  MSGP = 2 for red or green

	if parkbrake >= 0.5 then
		msg = "PARKING BRAKE"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "PARKING BRAKE"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if parkbrake >= 0.5 then
		stat = "PARK BRAKE ON"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "PARK BRAKE ON"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if autoreverse >= 0.5 and LandingGear == 1 then
		stat = "L REV ARMED"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
		stat = "R REV ARMED"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "L REV ARMED"
		if checkEXSISTstat() == 1 then removestat() end
		stat = "R REV ARMED"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if seatbelt >= 1 then
		stat = "SEATBELTS"
		statp = "0"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "SEATBELTS"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if nosmoke >= 1 then
		stat = "NO SMOKING"
		statp = "0"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "NO SMOKING"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if EngN1L <= 1 then
		stat = "L ENG SHUTDOWN"
		statp = "0"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "L ENG SHUTDOWN"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if EngN1R <= 1 then
		stat = "R ENG SHUTDOWN"
		statp = "0"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "R ENG SHUTDOWN"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if OilpressR <= 14 then
		msg = "R ENG OIL PRES"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "R ENG OIL PRES"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OilpressL <= 14 then
		msgp = "2"
		msg = "L ENG OIL PRES"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "L ENG OIL PRES"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if FuelpressR <= 14 then
		msg = "R FUEL LO PRES"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "R FUEL LO PRES"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if FuelpressL <= 14 then
		msg = "L FUEL LO PRES"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "L FUEL LO PRES"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if FuelpumpR == 0 then
		msg = "R FUEL PUMP"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "R FUEL PUMP"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if FuelpumpL == 0 then
		msg = "L FUEL PUMP"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "L FUEL PUMP"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if EngFireR == 1 then
		msg = "R ENG FIRE"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "R ENG FIRE"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if EngFireL == 1 then
		msg = "L ENG FIRE"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "L ENG FIRE"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 1 and EngN1L >= 70 and EngN1R >= 70 and Spoilers >= 0.01 then
		msg = "CONFIG SPLRS"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "CONFIG SPLRS"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 1 and EngN1L >= 70 and EngN1R >= 70 and Flaps <= 0.39 then
		msg = "CONFIG FLAPS"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "CONFIG FLAPS"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 1 and EngN1L >= 70 and EngN1R >= 70 and Spoilerhandle >= 0.00 then
		msg = "GLD NOT ARMED"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "GLD NOT ARMED"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 1 and Spoilerhandle >= 0.5 then
		stat = "GND SPLR DEPLOY"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "GND SPLR DEPLOY"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if OnGround == 0 and Spoilerhandle >= 0.01 then
		stat = "FLT SPLR DEPLOY"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "FLT SPLR DEPLOY"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if EngRevR == 1 then
		msg = "R REV UNLOCKED"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "R REV UNLOCKED"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if EngRevL == 1 then
		msg = "L REV UNLOCKED"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "L REV UNLOCKED"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if IceDet == 1 then
		msg = "ICE"
		msgp = "2"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "ICE"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 0 and RadioAlt <= 300 and Spoilers >= 0.01 then
		msg = "FLT SPLR DEPLOY"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "FLT SPLR DEPLOY"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if OnGround == 0 and Flaps >= 0.59 and LandingGear == 1 and Spoilerhandle >= 0.00 then
		msg = "GLD NOT ARMED"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		msg = "GLD NOT ARMED"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if yawdamp_switch == 0 then
		msg = "YAW DAMPER"
		msgp = "0"
		if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
		if AutoP == 2 then AutoP = 1 end
	else
		msg = "YAW DAMPER"
		if checkEXSISTmsg() == 1 then removemsg() end
	end

	if Antiiceleftwing == 1 then
		stat = "WING A/I ON"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "WING A/I ON"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if Antiiceleftintake == 1 and Antiicerightintake == 1 then
		stat = "COWL A/I ON"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "COWL A/I ON"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if Antiiceleftintake == 1 and Antiicerightintake == 0 then
		stat = "L COWL A/I ON"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "L COWL A/I ON"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if Antiiceleftintake == 0 and Antiicerightintake == 1 then
		stat = "R COWL A/I ON"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "R COWL A/I ON"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if ECS_Pack1 == 0 then
		stat = "L PACK OFF"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "L PACK OFF"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if ECS_Pack2 == 0 then
		stat = "R PACK OFF"
		statp = "2"
		if checkEXSISTstat() == 1 then stat = "" else filldisplaysstat() end
	else
		stat = "R PACK OFF"
		if checkEXSISTstat() == 1 then removestat() end
	end

	if Fuelleft >= Fuelright + 181 and Fuelleft <= Fuelright + 358 then
			msg = "FUEL IMBALANCE"
			msgp = "0"
			if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
	else
		if Fuelright >= Fuelleft + 181 and Fuelright <= Fuelleft + 358 then
			msg = "FUEL IMBALANCE"
			msgp = "0"
			if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
		else
			if Fuelleft >= Fuelright + 360 then
				msg = "FUEL IMBALANCE"
				msgp = "2"
				if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
			else
				if Fuelright >= Fuelleft + 360 then
					msg = "FUEL IMBALANCE"
					msgp = "2"
					if checkEXSISTmsg() == 1 then msg = "" else filldisplays() end
				else
					msg = "FUEL IMBALANCE"
					if checkEXSISTmsg() == 1 then removemsg() end
				end
			end
		end
	end
	rearrange()
	half_bank_31500()
	antiice()
	ecs()

	if OnGround == 1 and Spoilerhandle >= 0.5 then
		Groundspoilers = 1
	else
		Groundspoilers = 0
	end

	if OnGround == 0 and Yawdamp_switch == 1 then
		Yawdamp = 1
	else
		Yawdamp = 0
	end
end









