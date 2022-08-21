function glex_radio1_func()
end

Transponder_mode = find_dataref("sim/cockpit/radios/transponder_mode")

glex_nosmoke = create_dataref("robertsv/glex/nosmoke/nosmokeswitch","number",glex_radio1_func) 
glex_radio1 = create_dataref("robertsv/glex/radio/sourceselect","number",glex_radio1_func) 
glex_radio2 = create_dataref("robertsv/glex/radio/sourceselect2","number",glex_radio1_func) 
glex_radio_tpmode = create_dataref("robertsv/glex/radio/transp_mode","number",glex_radio1_func)

com1_freq_coarse_up_cmd = find_command("sim/radios/stby_com1_coarse_up")
com1_freq_coarse_dn_cmd = find_command("sim/radios/stby_com1_coarse_down")
com1_freq_fine_up_cmd = find_command("sim/radios/stby_com1_fine_up")
com1_freq_fine_dn_cmd = find_command("sim/radios/stby_com1_fine_down")
nav1_freq_coarse_up_cmd = find_command("sim/radios/stby_nav1_coarse_up")
nav1_freq_coarse_dn_cmd = find_command("sim/radios/stby_nav1_coarse_down")
nav1_freq_fine_up_cmd = find_command("sim/radios/stby_nav1_fine_up")
nav1_freq_fine_dn_cmd = find_command("sim/radios/stby_nav1_fine_down")
com2_freq_coarse_up_cmd = find_command("sim/radios/stby_com2_coarse_up")
com2_freq_coarse_dn_cmd = find_command("sim/radios/stby_com2_coarse_down")
com2_freq_fine_up_cmd = find_command("sim/radios/stby_com2_fine_up")
com2_freq_fine_dn_cmd = find_command("sim/radios/stby_com2_fine_down")
nav2_freq_coarse_up_cmd = find_command("sim/radios/stby_nav2_coarse_up")
nav2_freq_coarse_dn_cmd = find_command("sim/radios/stby_nav2_coarse_down")
nav2_freq_fine_up_cmd = find_command("sim/radios/stby_nav2_fine_up")
nav2_freq_fine_dn_cmd = find_command("sim/radios/stby_na2_fine_down")
trsp_freq_coarse_up_cmd = find_command("sim/transponder/transponder_12_up")
trsp_freq_coarse_dn_cmd = find_command("sim/transponder/transponder_12_down")
trsp_freq_fine_up_cmd = find_command("sim/transponder/transponder_34_up")
trsp_freq_fine_dn_cmd = find_command("sim/transponder/transponder_34_down")

-- Select radio 1
function glex_radio1_b1_select(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			glex_radio1 = 6
		else
			glex_radio1 = 0 
		end
	end
end

function glex_radio1_b2_select(phase, duration)
	if phase == 0 then
		if glex_radio1 == 1 then
			glex_radio1 = 6
		else
			glex_radio1 = 1 
		end
	end
end

function glex_radio1_b3_select(phase, duration)
	if phase == 0 then
		if glex_radio1 == 2 then
			glex_radio1 = 6
		else
			glex_radio1 = 2 
		end
	end
end

function glex_radio1_b4_select(phase, duration)
	if phase == 0 then
		if glex_radio1 == 3 then
			glex_radio1 = 6
		else
			glex_radio1 = 3 
		end
	end
end

function glex_radio1_b5_select(phase, duration)
	if phase == 0 then
		if glex_radio1 == 4 then
			glex_radio1 = 6
		else
			glex_radio1 = 4 
		end
	end
end

-- Select radio 2
function glex_radio2_b1_select(phase, duration)
	if phase == 0 then
		if glex_radio2 == 0 then
			glex_radio2 = 6
		else
			glex_radio2 = 0 
		end
	end
end

function glex_radio2_b2_select(phase, duration)
	if phase == 0 then
		if glex_radio2 == 1 then
			glex_radio2 = 6
		else
			glex_radio2 = 1 
		end
	end
end

function glex_radio2_b3_select(phase, duration)
	if phase == 0 then
		if glex_radio2 == 2 then
			glex_radio2 = 6
		else
			glex_radio2 = 2 
		end
	end
end

function glex_radio2_b4_select(phase, duration)
	if phase == 0 then
		if glex_radio2 == 3 then
			glex_radio2 = 6
		else
			glex_radio2 = 3 
		end
	end
end

function glex_radio2_b5_select(phase, duration)
	if phase == 0 then
		if glex_radio2 == 4 then
			glex_radio2 = 6
		else
			glex_radio2 = 4 
		end
	end
end

--  Up and down radio 1
function glex_radio1_large_down(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			trsp_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 5 then
			if glex_radio_tpmode > 0 then
				glex_radio_tpmode = glex_radio_tpmode - 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio1_large_up(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			trsp_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 5 then
			if glex_radio_tpmode < 4 then
				glex_radio_tpmode = glex_radio_tpmode + 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio1_small_down(phase, duration)
	if phase == 0 then

		if glex_radio1 == 0 then
			trsp_freq_fine_dn_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_fine_dn_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_fine_dn_cmd:once()
		end
	end
end

function glex_radio1_small_up(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			trsp_freq_fine_up_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_fine_up_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_fine_up_cmd:once()
		end
	end
end

function glex_transponder_mode()
	if glex_radio_tpmode == 0 then
		Transponder_mode = 1
	else
		Transponder_mode = 2
	end
end

function glex_radio1_tpmode_toggle(phase, duration)
	if phase == 0 then
		if glex_radio1 == 5 then
			glex_radio1 = 6
		else
			glex_radio1 = 5 
		end 
	end
end

--  Up and down
function glex_radio1_large_down(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			trsp_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_coarse_dn_cmd:once()
		end
		if glex_radio1 == 5 then
			if glex_radio_tpmode > 0 then
				glex_radio_tpmode = glex_radio_tpmode - 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio1_large_up(phase, duration)
	if phase == 0 then
		if glex_radio1 == 0 then
			trsp_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_coarse_up_cmd:once()
		end
		if glex_radio1 == 5 then
			if glex_radio_tpmode < 4 then
				glex_radio_tpmode = glex_radio_tpmode + 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio1_small_down(phase, duration)
	if phase == 0 then

		if glex_radio1 == 0 then
			trsp_freq_fine_dn_cmd:once()
		end
		if glex_radio1 == 1 then
			com1_freq_fine_dn_cmd:once()
		end
		if glex_radio1 == 2 then
			nav1_freq_fine_dn_cmd:once()
		end
	end
end

-- Up and down radio 2

function glex_radio2_large_down(phase, duration)
	if phase == 0 then
		if glex_radio2 == 0 then
			trsp_freq_coarse_dn_cmd:once()
		end
		if glex_radio2 == 1 then
			com2_freq_coarse_dn_cmd:once()
		end
		if glex_radio2 == 2 then
			nav2_freq_coarse_dn_cmd:once()
		end
		if glex_radio2 == 5 then
			if glex_radio_tpmode > 0 then
				glex_radio_tpmode = glex_radio_tpmode - 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio2_large_up(phase, duration)
	if phase == 0 then
		if glex_radio2 == 0 then
			trsp_freq_coarse_up_cmd:once()
		end
		if glex_radio2 == 1 then
			com2_freq_coarse_up_cmd:once()
		end
		if glex_radio2 == 2 then
			nav2_freq_coarse_up_cmd:once()
		end
		if glex_radio2 == 5 then
			if glex_radio_tpmode < 4 then
				glex_radio_tpmode = glex_radio_tpmode + 1
				glex_transponder_mode()
			end
		end
	end
end

function glex_radio2_small_down(phase, duration)
	if phase == 0 then

		if glex_radio2 == 0 then
			trsp_freq_fine_dn_cmd:once()
		end
		if glex_radio2 == 1 then
			com2_freq_fine_dn_cmd:once()
		end
		if glex_radio2 == 2 then
			nav2_freq_fine_dn_cmd:once()
		end
	end
end

function glex_radio2_small_up(phase, duration)
	if phase == 0 then
		if glex_radio2 == 0 then
			trsp_freq_fine_up_cmd:once()
		end
		if glex_radio2 == 1 then
			com2_freq_fine_up_cmd:once()
		end
		if glex_radio2 == 2 then
			nav2_freq_fine_up_cmd:once()
		end
	end
end

function glex_radio2_tpmode_toggle(phase, duration)
	if phase == 0 then
		if glex_radio2 == 5 then
			glex_radio2 = 6
		else
			glex_radio2 = 5 
		end
	end
end

function glex_nosmoke_toggle(phase, duration)
	if phase == 0 then
		if glex_nosmoke == 0 then
			glex_nosmoke = 1
		else
			if glex_nosmoke == 1 then
				glex_nosmoke = 2
			else
				glex_nosmoke = 0
			end
		end
	end
end

cmdglex_radio1_b1 = create_command("robertsv/glex/radio1/transp_select","COM1",glex_radio1_b1_select)
cmdglex_radio1_b2 = create_command("robertsv/glex/radio1/com1_select","COM1",glex_radio1_b2_select)
cmdglex_radio1_b3 = create_command("robertsv/glex/radio1/nav1_select","NAV1",glex_radio1_b3_select)
cmdglex_radio1_b4 = create_command("robertsv/glex/radio1/adf_select","ADF1",glex_radio1_b4_select)
cmdglex_radio1_b5 = create_command("robertsv/glex/radio1/hf1_select","HF1",glex_radio1_b5_select)

cmdglex_radio2_b1 = create_command("robertsv/glex/radio2/transp_select","COM2",glex_radio2_b1_select)
cmdglex_radio2_b2 = create_command("robertsv/glex/radio2/com2_select","COM2",glex_radio2_b2_select)
cmdglex_radio2_b3 = create_command("robertsv/glex/radio2/nav2_select","NAV2",glex_radio2_b3_select)
cmdglex_radio2_b4 = create_command("robertsv/glex/radio2/adf_select","ADF2",glex_radio2_b4_select)
cmdglex_radio2_b5 = create_command("robertsv/glex/radio2/hf1_select","HF2",glex_radio2_b5_select)

cmdglex_radio2_lu = create_command("robertsv/glex/radio2/large_up","Up",glex_radio2_large_up)
cmdglex_radio2_ld = create_command("robertsv/glex/radio2/large_dn","Down",glex_radio2_large_down)
cmdglex_radio2_su = create_command("robertsv/glex/radio2/small_up","finetune up",glex_radio2_small_up)
cmdglex_radio2_sd = create_command("robertsv/glex/radio2/small_dn","finetine down",glex_radio2_small_down)

cmdglex_radio1_lu = create_command("robertsv/glex/radio1/large_up","Up",glex_radio1_large_up)
cmdglex_radio1_ld = create_command("robertsv/glex/radio1/large_dn","Down",glex_radio1_large_down)
cmdglex_radio1_su = create_command("robertsv/glex/radio1/small_up","finetune up",glex_radio1_small_up)
cmdglex_radio1_sd = create_command("robertsv/glex/radio1/small_dn","finetine down",glex_radio1_small_down)

cmdglex_radio1_tm = create_command("robertsv/glex/radio1/transp_mode_toggle","Transponder mode toggle",glex_radio1_tpmode_toggle)
cmdglex_radio2_tm = create_command("robertsv/glex/radio2/transp_mode_toggle","Transponder mode toggle",glex_radio2_tpmode_toggle)

cmdglex_nosmoke_tm = create_command("robertsv/glex/nosmoke/nosmoke_toggle","Smoke toggle",glex_nosmoke_toggle)

function flight_start()
glex_radio1 = 6
glex_radio2 = 6
glex_radio_tpmode = 0
Transponder_mode = 1
glex_nosmoke = 0
end

function after_physics()

end










