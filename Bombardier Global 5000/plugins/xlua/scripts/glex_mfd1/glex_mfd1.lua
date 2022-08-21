Vspeed_t_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_t-delta","number")
Vspeed_t = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_t","number")
Vspeed_1_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_1-delta","number")
Vspeed_1 = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_1","number")
Vspeed_2_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_2-delta","number")
Vspeed_2 = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_2","number")
Vspeed_r_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_r-delta","number")
Vspeed_r = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_r","number")
Vspeed_1r_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_1r-delta","number")
Vspeed_1r = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_1r","number")
Vspeed_rf_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_rf-delta","number")
Vspeed_rf = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_rf","number")

Vspeed_f_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_f-delta","number")
Vspeed_f3_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_f3-delta","number")
Vspeed_lo_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_lo-delta","number")
Vspeed_so_delta = create_dataref("robertsv/glex/mfd1/mfd1_vspeed_so-delta","number")

ap_spd_bug_delta = create_dataref("robertsv/glex/mfd1/ap_spd_bug-delta","number")
ap_spd_bug_set = find_dataref("sim/cockpit2/autopilot/airspeed_dial_kts")

ap_ovsp_delta = create_dataref("robertsv/glex/mfd1/spd_over","number")
ap_minm_delta = create_dataref("robertsv/glex/mfd1/spd_minm","number")

Show_TO_Vspeeds = create_dataref("robertsv/glex/mfd1/Show_TO_Vspeeds","number")


mfd1_spd_lastdigit = create_dataref("robertsv/glex/mfd1/mfd1_spd_lastdigit","number")
mfd1_spd_firstdigits = create_dataref("robertsv/glex/mfd1/mfd1_spd_firstdigits","number")
mfd1_alt_lastdigit = create_dataref("robertsv/glex/mfd1/mfd1_alt_lastdigit","number")
mfd1_alt_firstdigits = create_dataref("robertsv/glex/mfd1/mfd1_alt_firstdigits","number")
Speed_pilot = find_dataref("sim/cockpit2/gauges/indicators/calibrated_airspeed_kts_pilot")

mfd1_alt_strip = create_dataref("robertsv/glex/mfd1/mfd1_altstrip","number")
mfd1_alt_strip_alt0 = create_dataref("robertsv/glex/mfd1/mfd1_altstrip_alt0","number")
mfd1_alt_strip_alt1 = create_dataref("robertsv/glex/mfd1/mfd1_altstrip_alt1","number")
mfd1_alt_strip_alt2 = create_dataref("robertsv/glex/mfd1/mfd1_altstrip_alt2","number")
mfd1_alt_strip_alt3 = create_dataref("robertsv/glex/mfd1/mfd1_altstrip_alt3","number")
mfd1_alt_strip_alt4 = create_dataref("robertsv/glex/mfd1/mfd1_altstrip_alt4","number")

ap_alt_bug_set = find_dataref("sim/cockpit/autopilot/altitude")
ap_alt_bug_delta = create_dataref("robertsv/glex/mfd1/ap_alt_bug-delta","number")
Alt_pilot = find_dataref("sim/cockpit2/gauges/indicators/altitude_ft_pilot")

Battery_on = find_dataref("sim/cockpit2/electrical/battery_on[0]")
Avionics_on = find_dataref("sim/cockpit2/switches/avionics_power_on")


-- For takeoff at 70909 lbs  1 and r = 108 and 2 = 121
-- For takeoff at MTOW 1 and r = 124 and 2 = 134
-- For landing at 57000 lbs fuel, Vref = 107
-- For landing at 62000 lbs, Vref = 114
Vspeed_t = 169
Vspeed_1 = 124
Vspeed_r = 124
Vspeed_2 = 134
Vspeed_rf = 114
ap_minspeed = 110
ap_maxspeed = 300
Show_TO_Vspeeds = 1
Timer = 0

function maxspeed_func()
	if Alt_pilot <= 8000 then
		ap_maxspeed = 300
	else
		if Alt_pilot <= 30267 then
			ap_maxspeed = 340
		else
			if Alt_pilot <= 35000 then
				ap_maxspeed = 307 + (((35000 - Alt_pilot) / 4733) * 33)
			else
				if Alt_pilot <= 47000 then
					ap_maxspeed = 227 + (((47000 - Alt_pilot) / 12000) * 80)
				else	
					if Alt_pilot <= 51000 then
						ap_maxspeed = 203 + (((51000 - Alt_pilot) / 4000) * 24)
					end
				end
			end
		end
	end
end

function after_physics()
	if Speed_pilot >= 40 then
		mfd1_spd_lastdigit = Speed_pilot % 10
		mfd1_spd_firstdigits = (Speed_pilot - (Speed_pilot % 10)) / 10
	else
		mfd1_spd_lastdigit = 0
		mfd1_spd_firstdigits = 0
	end

	mfd1_alt_lastdigit = Alt_pilot % 100
	mfd1_alt_firstdigits = (Alt_pilot - (Alt_pilot % 100)) / 100

	if Show_TO_Vspeeds == 1 then
		if Vspeed_r - Vspeed_1 <= 5 then
			Vspeed_1_delta = 60
			Vspeed_r_delta = 60
			Vspeed_1r_delta = Vspeed_r - Speed_pilot
		else
			Vspeed_1_delta = Vspeed_1 - Speed_pilot
			Vspeed_r_delta = Vspeed_r - Speed_pilot
			Vspeed_1r_delta = 60
		end	
		Vspeed_t_delta = Vspeed_t - Speed_pilot
		Vspeed_2_delta = Vspeed_2 - Speed_pilot
		if Speed_pilot >= Vspeed_t + 10 then
			Show_TO_Vspeeds = 0
		end
	end
	if Show_TO_Vspeeds == 0 and Alt_pilot <= 18000 then
		Vspeed_rf_delta = Vspeed_rf - Speed_pilot
		Vspeed_so_delta = 225 - Speed_pilot
		Vspeed_f_delta = 210 - Speed_pilot
		Vspeed_lo_delta = 200 - Speed_pilot
		Vspeed_f3_delta = 185 - Speed_pilot
	end

	ap_spd_bug_delta = ap_spd_bug_set - Speed_pilot
	ap_alt_bug_delta = ap_alt_bug_set - Alt_pilot
	ap_ovsp_delta = ap_maxspeed - Speed_pilot
	ap_minm_delta = (162 - (((51000 - Alt_pilot) / 51000) * 52)) - Speed_pilot

	mfd1_alt_strip = Alt_pilot % 1000
	mfd1_alt_strip_alt1 = (Alt_pilot - (Alt_pilot % 1000))
	mfd1_alt_strip_alt0 = mfd1_alt_strip_alt1 - 500
	mfd1_alt_strip_alt2 = mfd1_alt_strip_alt1 + 500
	mfd1_alt_strip_alt3 = mfd1_alt_strip_alt1 + 1000
	mfd1_alt_strip_alt4 = mfd1_alt_strip_alt1 + 1500

	Timer = Timer + (1 * SIM_PERIOD)	
	if Timer >= 2 then
		maxspeed_func()
		Timer = 0
	end

	if Battery_on == 1 then
		Avionics_on = 1
	else
		Avionics_on = 0
	end
end

