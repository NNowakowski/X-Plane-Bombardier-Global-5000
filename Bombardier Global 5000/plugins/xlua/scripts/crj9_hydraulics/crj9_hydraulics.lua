-- Get datarefs
Eng1n1 = find_dataref("sim/flightmodel2/engines/N1_percent[0]")
Eng2n1 = find_dataref("sim/flightmodel2/engines/N1_percent[1]")
Engine1_reverse = find_dataref("sim/operation/failures/rel_revers0")
Engine2_reverse = find_dataref("sim/operation/failures/rel_revers1")
Controls_fail = find_dataref("sim/operation/failures/rel_conlock[2]")
Gear_fail = find_dataref("sim/operation/failures/rel_gear_act", "writeable")
Steering_fail = find_dataref("sim/operation/override/override_wheel_steer")
BrakesL_fail = find_dataref("sim/operation/failures/rel_lbrakes")
BrakesR_fail = find_dataref("sim/operation/failures/rel_rbrakes")

function SovEng1_func()
end
function SovEng2_func()
end
function Pump1_func()
end
function Pump1A_func()
end
function Pump1B_func()
end
function Pump2_func()
end
function Pump2A_func()
end
function Pump2B_func()
end
function Pump3_func()
end
function Pump3A_func()
end
function Pump3B_func()
end

soveng1 = create_dataref("robertsv/crjx/hydraulics/SovEng1","number",SovEng1_func)
soveng2 = create_dataref("robertsv/crjx/hydraulics/SovEng2","number",SovEng2_func)
pump1 = create_dataref("robertsv/crjx/hydraulics/Pump1","number",Pump1_func)
pump1A = create_dataref("robertsv/crjx/hydraulics/Pump1A","number",Pump1A_func)
pump1B = create_dataref("robertsv/crjx/hydraulics/Pump1B","number",Pump1B_func)
pump2 = create_dataref("robertsv/crjx/hydraulics/Pump2","number",Pump2_func)
pump2A = create_dataref("robertsv/crjx/hydraulics/Pump2A","number",Pump2A_func)
pump2B = create_dataref("robertsv/crjx/hydraulics/Pump2B","number",Pump2B_func)
pump3 = create_dataref("robertsv/crjx/hydraulics/Pump3","number",Pump3_func)
pump3A = create_dataref("robertsv/crjx/hydraulics/Pump3A","number",Pump3A_func)
pump3B = create_dataref("robertsv/crjx/hydraulics/Pump3B","number",Pump3B_func)

function SovEng1_toggle(phase, duration)
	if phase == 0 then
		if soveng1 == 0 then soveng1 = 1 elseif soveng1 == 1 then soveng1 = 0 end
	end
end

function SovEng2_toggle(phase, duration)
	if phase == 0 then
		if soveng2 == 0 then soveng2 = 1 elseif soveng2 == 1 then soveng2 = 0 end
	end
end

function Pump3A_toggle(phase, duration)
	if phase == 0 then
		if pump3A == 0 then pump3A = 1 elseif pump3A == 1 then pump3A = 0 end
	end
end

function Pump1B_up(phase, duration)
	if phase == 0 then
		if pump1B == 2 then 
			pump1B = 0
		else 
			if pump1B == 0 then 
				pump1B = 1
			end
		end
	end
end
function Pump1B_dn(phase, duration)
	if phase == 0 then
		if pump1B == 1 then 
			pump1B = 0
		else 
			if pump1B == 0 then 
				pump1B = 2
			end
		end
	end
end

function Pump2B_up(phase, duration)
	if phase == 0 then
		if pump2B == 2 then 
			pump2B = 0
		else 
			if pump2B == 0 then 
				pump2B = 1
			end
		end
	end
end
function Pump2B_dn(phase, duration)
	if phase == 0 then
		if pump2B == 1 then 
			pump2B = 0
		else 
			if pump2B == 0 then 
				pump2B = 2
			end
		end
	end
end

function Pump3B_up(phase, duration)
	if phase == 0 then
		if pump3B == 2 then 
			pump3B = 0
		else 
			if pump3B == 0 then 
				pump3B = 1
			end
		end
	end
end
function Pump3B_dn(phase, duration)
	if phase == 0 then
		if pump3B == 1 then 
			pump3B = 0
		else 
			if pump3B == 0 then 
				pump3B = 2
			end
		end
	end
end

cmdSovEng1tog = create_command("robertsv/crjx/hydraulics/SovEng1tog","SOV ENG 1",SovEng1_toggle)
cmdSovEng2tog = create_command("robertsv/crjx/hydraulics/SovEng2tog","SOV ENG 2",SovEng2_toggle)
cmdPump3Atog = create_command("robertsv/crjx/hydraulics/Pump3Atog","Hydraulic Pump 3A",Pump3A_toggle)
cmdPump1Btog_up = create_command("robertsv/crjx/hydraulics/Pump1B_up","Hydraulic Pump 1B",Pump1B_up)
cmdPump1Btog_dn = create_command("robertsv/crjx/hydraulics/Pump1B_dn","Hydraulic Pump 1B",Pump1B_dn)
cmdPump3Btog_up = create_command("robertsv/crjx/hydraulics/Pump3B_up","Hydraulic Pump 3B",Pump3B_up)
cmdPump2Btog_up = create_command("robertsv/crjx/hydraulics/Pump2B_up","Hydraulic Pump 2B",Pump2B_up)
cmdPump3Btog_dn = create_command("robertsv/crjx/hydraulics/Pump3B_dn","Hydraulic Pump 3B",Pump3B_dn)
cmdPump2Btog_dn = create_command("robertsv/crjx/hydraulics/Pump2B_dn","Hydraulic Pump 2B",Pump2B_dn)


			       

soveng1 = 0
soveng2 = 0
pump1B = 2
pump3A = 0
pump3B = 2
pump2B = 2

function after_physics()

if Eng1n1 > 15 and soveng1 == 0 then
	pump1A = 1
else
	pump1A = 0
end
if Eng2n1 > 15 and soveng2 == 0 then
	pump2A = 1
else
	pump2A = 0
end
if pump1A == 1 or pump1B >= 1 then
	pump1 = 1
else
	pump1 = 0
end
if pump2A == 1 or pump2B >= 1 then
	pump2 = 1
else
	pump2 = 0
end
if pump3A == 1 or pump3B >= 1 then
	pump3 = 1
else
	pump3 = 0
end

if pump1 == 0 then
	Engine1_reverse = 6
else
	Engine1_reverse = 0
end

if pump2 == 0 then
	Engine2_reverse = 6
else
	Engine2_reverse = 0
end

if pump3 == 0 then
	Gear_fail = 6
	Steering_fail = 6
else
	Gear_fail = 0
	Steering_fail = 0
end

if pump2 == 0 and pump3 == 0 then
	BrakesL_fail = 6
	BrakesR_fail = 6
else
	BrakesL_fail = 0
	BrakesR_fail = 0
end

if pump1 == 0 and pump2 == 0 and pump3 == 0 then
	Controls_fail = 6
else
	Controls_fail = 0
end



end








