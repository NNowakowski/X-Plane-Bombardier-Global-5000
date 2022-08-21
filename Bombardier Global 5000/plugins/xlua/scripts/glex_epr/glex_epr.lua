
glex_eng1_epr = find_dataref("sim/cockpit2/engine/actuators/EPR_target_bug[0]")
glex_eng2_epr = find_dataref("sim/cockpit2/engine/actuators/EPR_target_bug[1]")
apu_bleed = find_dataref("sim/cockpit2/bleedair/actuators/apu_bleed")
Lcowl_heating = find_dataref("sim/cockpit2/ice/cowling_thermal_anti_ice_per_engine[0]")
Rcowl_heating = find_dataref("sim/cockpit2/ice/cowling_thermal_anti_ice_per_engine[1]")
Wing_heating = find_dataref("sim/cockpit2/ice/ice_surface_hot_bleed_air_on")
Isol_bleed_left = find_dataref("sim/cockpit2/bleedair/actuators/isol_valve_left")
Isol_bleed_right = find_dataref("sim/cockpit2/bleedair/actuators/isol_valve_right")
Bleed_leng = find_dataref("sim/cockpit2/bleedair/actuators/engine_bleed_sov[0]")
Bleed_reng = find_dataref("sim/cockpit2/bleedair/actuators/engine_bleed_sov[1]")

APU_switch_setting = create_dataref("robertsv/glex/bleed/apu_bleed","number")
L_Cowl_setting = create_dataref("robertsv/glex/bleed/l_cowl","number")
R_Cowl_setting = create_dataref("robertsv/glex/bleed/r_cowl","number")
Bleed_wing_setting = create_dataref("robertsv/glex/bleed/wing","number")
Bleed_xwing_setting = create_dataref("robertsv/glex/bleed/wing_xbleed","number")
Bleed_x_setting = create_dataref("robertsv/glex/bleed/xbleed","number")
Bleed_leng_setting = create_dataref("robertsv/glex/bleed/l_eng_bleed","number")
Bleed_reng_setting = create_dataref("robertsv/glex/bleed/r_eng_bleed","number")
Cabin_Oxy_knob = create_dataref("robertsv/glex/oxy/cabin_knob","number")
Cabin_Oxy_thera = create_dataref("robertsv/glex/oxy/cabin_thera","number")

function glex_cabin_oxy_up(phase, duration)
	if phase == 0 then
		if Cabin_Oxy_knob < 1 then
			Cabin_Oxy_knob = Cabin_Oxy_knob + 1
		end
	end
end

function glex_cabin_oxy_down(phase, duration)
	if phase == 0 then
		if Cabin_Oxy_knob > -2 then
			Cabin_Oxy_knob = Cabin_Oxy_knob - 1
		end
	end
end

function glex_epr_up(phase, duration)
	if phase == 0 then
		if glex_eng1_epr < 1.7 then
			glex_eng1_epr = glex_eng1_epr + 0.01
			glex_eng2_epr = glex_eng1_epr
		end
	end
end

function glex_epr_down(phase, duration)
	if phase == 0 then
		if glex_eng1_epr > 1.01 then
			glex_eng1_epr = glex_eng1_epr - 0.01
			glex_eng2_epr = glex_eng1_epr
		end
	end
end

function glex_apu_up(phase, duration)
	if phase == 0 then
		if APU_switch_setting < 1 then
			APU_switch_setting = APU_switch_setting + 1
		end
	end
end

function glex_apu_down(phase, duration)
	if phase == 0 then
		if APU_switch_setting >= 0 then
			APU_switch_setting = APU_switch_setting - 1
		end
	end
end

function glex_lcowl_up(phase, duration)
	if phase == 0 then
		if L_Cowl_setting < 1 then
			L_Cowl_setting = L_Cowl_setting + 1
		end
	end
end

function glex_lcowl_down(phase, duration)
	if phase == 0 then
		if L_Cowl_setting >= 0 then
			L_Cowl_setting = L_Cowl_setting - 1
		end
	end
end

function glex_rcowl_up(phase, duration)
	if phase == 0 then
		if R_Cowl_setting < 1 then
			R_Cowl_setting = R_Cowl_setting + 1
		end
	end
end

function glex_rcowl_down(phase, duration)
	if phase == 0 then
		if R_Cowl_setting >= 0 then
			R_Cowl_setting = R_Cowl_setting - 1
		end
	end
end

function glex_wingbl_up(phase, duration)
	if phase == 0 then
		if Bleed_wing_setting < 1 then
			Bleed_wing_setting = Bleed_wing_setting + 1
		end
	end
end

function glex_wingbl_down(phase, duration)
	if phase == 0 then
		if Bleed_wing_setting >= 0 then
			Bleed_wing_setting = Bleed_wing_setting - 1
		end
	end
end

function glex_xwingbl_up(phase, duration)
	if phase == 0 then
		if Bleed_xwing_setting < 1 then
			Bleed_xwing_setting = Bleed_xwing_setting + 1
		end
	end
end

function glex_xwingbl_down(phase, duration)
	if phase == 0 then
		if Bleed_xwing_setting >= 0 then
			Bleed_xwing_setting = Bleed_xwing_setting - 1
		end
	end
end

function glex_leng_bleed_up(phase, duration)
	if phase == 0 then
		if Bleed_leng_setting < 1 then
			Bleed_leng_setting = Bleed_leng_setting + 1
		end
	end
end

function glex_leng_bleed_down(phase, duration)
	if phase == 0 then
		if Bleed_leng_setting >= 0 then
			Bleed_leng_setting = Bleed_leng_setting - 1
		end
	end
end

function glex_reng_bleed_up(phase, duration)
	if phase == 0 then
		if Bleed_reng_setting < 1 then
			Bleed_reng_setting = Bleed_reng_setting + 1
		end
	end
end

function glex_reng_bleed_down(phase, duration)
	if phase == 0 then
		if Bleed_reng_setting >= 0 then
			Bleed_reng_setting = Bleed_reng_setting - 1
		end
	end
end

function glex_cabin_thera_toggle(phase, duration)
	if phase == 0 then
		if Cabin_Oxy_thera == 0 then Cabin_Oxy_thera = 1 else Cabin_Oxy_thera = 0 end
	end
end


cmdglex_epr_up = create_command("robertsv/glex/epr/up","EPR UP",glex_epr_up)
cmdglex_epr_down = create_command("robertsv/glex/epr/down","EPR DOWN",glex_epr_down)

cmdglex_apu_up = create_command("robertsv/glex/bleed/apu_bleed_up","APU Bleed Up",glex_apu_up)
cmdglex_apu_down = create_command("robertsv/glex/bleed/apu_bleed_dn","APU Bleed Down",glex_apu_down)
APU_switch_setting = 0

cmdglex_lcowl_up = create_command("robertsv/glex/bleed/l_cowl_up","L Cowl heat Up",glex_lcowl_up)
cmdglex_lcowl_down = create_command("robertsv/glex/bleed/l_cowl_dn","L Cowl heat Down",glex_lcowl_down)

cmdglex_rcowl_up = create_command("robertsv/glex/bleed/r_cowl_up","R Cowl heat Up",glex_rcowl_up)
cmdglex_rcowl_down = create_command("robertsv/glex/bleed/r_cowl_dn","R Cowl heat Down",glex_rcowl_down)

cmdglex_wingbl_up = create_command("robertsv/glex/bleed/wing_up","Wing bleed Up",glex_wingbl_up)
cmdglex_wingbl_down = create_command("robertsv/glex/bleed/wing_dn","Wing bleed Down",glex_wingbl_down)

cmdglex_xwingbl_up = create_command("robertsv/glex/bleed/wing_xbleed_up","Wing X bleed Up",glex_xwingbl_up)
cmdglex_xwingbl_down = create_command("robertsv/glex/bleed/wing_xbleed_dn","Wing X bleed Down",glex_xwingbl_down)

cmdglex_l_bleed_up = create_command("robertsv/glex/bleed/l_eng_bleed_up","X bleed Up",glex_leng_bleed_up)
cmdglex_l_bleed_down = create_command("robertsv/glex/bleed/l_eng_bleed_dn","X bleed Down",glex_leng_bleed_down)

cmdglex_r_bleed_up = create_command("robertsv/glex/bleed/r_eng_bleed_up","X bleed Up",glex_reng_bleed_up)
cmdglex_r_bleed_down = create_command("robertsv/glex/bleed/r_eng_bleed_dn","X bleed Down",glex_reng_bleed_down)

cmdglex_cabin_oxy_up = create_command("robertsv/glex/oxy/cabin_oxy_up","Cabin Oxygen",glex_cabin_oxy_up)
cmdglex_cabin_oxy_down = create_command("robertsv/glex/oxy/cabin_oxy_dn","Cabin Oxygen",glex_cabin_oxy_down)
cmdglex_cabin_thera_toggle = create_command("robertsv/glex/oxy/cabin_thera_toggle","Therapeutic Oxygen",glex_cabin_thera_toggle)



function after_physics()
	if APU_switch_setting >= 0 then apu_bleed = 1 else apu_bleed = 0 end
	if L_Cowl_setting >= 0 then Lcowl_heating = 1 else Lcowl_heating = 0 end
	if R_Cowl_setting >= 0 then Rcowl_heating = 1 else Rcowl_heating = 0 end
	if Bleed_wing_setting >= 0 then Wing_heating = 1 else Wing_heating = 0 end
	if Bleed_x_setting > 0 then
		Isol_bleed_left = 0
		Isol_bleed_right = 0
	else
		Isol_bleed_left = 1
		Isol_bleed_right = 1
	end
	if Bleed_leng_setting >= 0 then Bleed_leng = 1 else Bleed_leng = 0 end
	if Bleed_reng_setting >= 0 then Bleed_reng = 1 else Bleed_reng = 0 end
end










