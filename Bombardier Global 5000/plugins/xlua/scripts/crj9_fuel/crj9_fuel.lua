-- Get datarefs
Fuelleft = find_dataref("sim/flightmodel/weight/m_fuel[0]")
Fuelcenter = find_dataref("sim/flightmodel/weight/m_fuel[1]")
Fuelright= find_dataref("sim/flightmodel/weight/m_fuel[2]")
Fuelaft = find_dataref("sim/flightmodel/weight/m_fuel[3]")
TransferTo= find_dataref("sim/cockpit/engine/fuel_tank_transfer")
TransferFrom= find_dataref("sim/cockpit/engine/fuel_tank_transfer_from")
FuelpumpL= find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[0]")
FuelpumpR= find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[1]")
FuelBothEngines= find_dataref("sim/cockpit2/fuel/fuel_tank_selector")
FuelLeftEngine= find_dataref("sim/cockpit2/fuel/fuel_tank_selector_left")
FuelRightEngine= find_dataref("sim/cockpit2/fuel/fuel_tank_selector_right")
Fueloverride = find_dataref("sim/operation/override/override_fuel_system")
Fueltankcrossfeed = find_dataref("sim/cockpit2/fuel/auto_crossfeed")

function glex_empty_func()
end

pri_pump_l = create_dataref("robertsv/glex/fuel/pri_pump_l","number",glex_empty_func)
pri_pump_r = create_dataref("robertsv/glex/fuel/pri_pump_r","number",glex_empty_func)
aux_pump_l = create_dataref("robertsv/glex/fuel/aux_pump_l","number",glex_empty_func)
aux_pump_r = create_dataref("robertsv/glex/fuel/aux_pump_r","number",glex_empty_func)
recirc_pump_l = create_dataref("robertsv/glex/fuel/recirc_pump_l","number",glex_empty_func)
recirc_pump_r = create_dataref("robertsv/glex/fuel/recirc_pump_r","number",glex_empty_func)
crossf_sov = create_dataref("robertsv/glex/fuel/crossfeedSOV","number",glex_empty_func)
wing_xfer = create_dataref("robertsv/glex/fuel/wing_xfer","number",glex_empty_func)
aft_xfer = create_dataref("robertsv/glex/fuel/aft_xfer","number",glex_empty_func)

function aux_pump_l_toggle(phase, duration)
	if phase == 0 then
		if aux_pump_l == 0 then aux_pump_l = 1 else aux_pump_l = 0 end
	end
end

function aux_pump_r_toggle(phase, duration)
	if phase == 0 then
		if aux_pump_r == 0 then aux_pump_r = 1 else aux_pump_r = 0 end
	end
end

function pri_pump_l_toggle(phase, duration)
	if phase == 0 then
		if pri_pump_l == 0 then pri_pump_l = 1 else pri_pump_l = 0 end
	end
end

function pri_pump_r_toggle(phase, duration)
	if phase == 0 then
		if pri_pump_r == 0 then pri_pump_r = 1 else pri_pump_r = 0 end
	end
end

function recirc_pump_l_toggle(phase, duration)
	if phase == 0 then
		if recirc_pump_l == 0 then recirc_pump_l = 1 else recirc_pump_l = 0 end
	end
end

function recirc_pump_r_toggle(phase, duration)
	if phase == 0 then
		if recirc_pump_r == 0 then recirc_pump_r = 1 else recirc_pump_r = 0 end
	end
end

function crossf_sov_toggle(phase, duration)
	if phase == 0 then
		if crossf_sov == 0 then crossf_sov = 1 else crossf_sov = 0 end
	end
end

function wing_xfer_up(phase, duration)
	if phase == 0 then
		if wing_xfer <= 2 then wing_xfer = wing_xfer + 1 else wing_xfer = 0 end
	end
end

function wing_xfer_dn(phase, duration)
	if phase == 0 then
		if wing_xfer >= 1 then wing_xfer = wing_xfer - 1 else wing_xfer = 3 end
	end
end

function aft_xfer_up(phase, duration)
	if phase == 0 then
		if aft_xfer <= 0 then aft_xfer = aft_xfer + 1 end
	end
end

function aft_xfer_dn(phase, duration)
	if phase == 0 then
		if aft_xfer >= 0 then aft_xfer = aft_xfer - 1 end
	end
end

cmd_aux_pump_l_tog = create_command("robertsv/glex/fuel/aux_pump_l_toggle","left aux pump",aux_pump_l_toggle)
cmd_aux_pump_r_tog = create_command("robertsv/glex/fuel/aux_pump_r_toggle","right aux pump",aux_pump_r_toggle)
cmd_pri_pump_l_tog = create_command("robertsv/glex/fuel/pri_pump_l_toggle","left primary pump",pri_pump_l_toggle)
cmd_pri_pump_r_tog = create_command("robertsv/glex/fuel/pri_pump_r_toggle","right primary pump",pri_pump_r_toggle)
cmd_recirc_pump_l_tog = create_command("robertsv/glex/fuel/recirc_pump_l_toggle","left recircling pump",recirc_pump_l_toggle)
cmd_recirc_pump_r_tog = create_command("robertsv/glex/fuel/recirc_pump_r_toggle","right recircling pump",recirc_pump_r_toggle)
cmd_crossf_sov_tog = create_command("robertsv/glex/fuel/crossfeedSOV_toggle","crossfeed SOV",crossf_sov_toggle)
cmd_wing_xfer_up = create_command("robertsv/glex/fuel/wing_xfer_up","Wing xfer up",wing_xfer_up)
cmd_wing_xfer_dn = create_command("robertsv/glex/fuel/wing_xfer_dn","Wing xfer dn",wing_xfer_dn)
cmd_aft_xfer_up = create_command("robertsv/glex/fuel/aft_xfer_up","aft xfer up",aft_xfer_up)
cmd_aft_xfer_dn = create_command("robertsv/glex/fuel/aft_xfer_dn","aft xfer dn",aft_xfer_dn)

Starttransferleft = 0
Starttransferright = 0
Fuel_timer = 0
Fueloverride = 0
TransferTo = 0
TransferFrom = 0


function after_physics()
Fueltankcrossfeed = 0
	Fuel_timer = Fuel_timer + (1 * SIM_PERIOD)	
	if Fuel_timer >= 1 then
		-- Center tank, automated
		if Fuelcenter >= 3 then
			if Fuelleft <= 6285 then
				Starttransferleft = 1
			end
			if Fuelleft >= 6556 then
				Starttransferleft = 0
			end
			if Fuelright <= 6285 then
				Starttransferright = 1
			end
			if Fuelright >= 6556 then
				Starttransferright = 0
			end
			if Starttransferleft == 1 then
				Fuelleft = Fuelleft + 1
				Fuelcenter = Fuelcenter - 1
			end	
			if Starttransferright == 1 then
				Fuelright = Fuelright + 1
				Fuelcenter = Fuelcenter - 1
			end	
		end
		-- Aft tank, automated
		if aft_xfer == 0 then	
			if Fuelleft < 2495 or Fuelright < 2495 then
				Starttransferaft = 1
			end
			if Starttransferaft == 1 then
				if Fuelaft > 3 then
					Fuelleft = Fuelleft + 1
					Fuelright = Fuelright + 1
					Fuelaft = Fuelaft - 2
				end
			end
		end
		if aft_xfer == 1 then	
			if Fuelaft > 3 then
				if Fuelleft <= 6556 then
					Fuelleft = Fuelleft + 1
					Fuelaft = Fuelaft -1
				end
				if Fuelright <= 6556 then
					Fuelright = Fuelright + 1
					Fuelaft = Fuelaft - 1
				end
			end
		end
		-- Fuel transfer left and right
		if wing_xfer == 1 then
			if Fuelleft >= 3 then
				if Fuelright <= 6556 then
					Fuelright = Fuelright + 1
					Fuelleft = Fuelleft - 1	
				end
			end
		end
		if wing_xfer == 3 then
			if Fuelright >= 3 then
				if Fuelleft <= 6556 then
					Fuelright = Fuelright - 1
					Fuelleft = Fuelleft + 1	
				end
			end
		end
	Fuel_timer = 0
	end	

end










