ET_mode = create_dataref("robertsv/crjx/crjx/radios/chret","number",timtogpshrs_func)
Clock_gpslcl = create_dataref("robertsv/crjx/crjx/radios/gpslcl","number",timtogpshrs_func)
Timeflight_hrs = create_dataref("robertsv/crjx/crjx/radios/timeflighthrs","number",timtogpshrs_func)
Timeflight_min = create_dataref("robertsv/crjx/crjx/radios/timeflightmin","number",timtogpshrs_func)
TimeChr_hrs = create_dataref("robertsv/crjx/crjx/radios/chrflighthrs","number",timtogpshrs_func)
TimeChr_min = create_dataref("robertsv/crjx/crjx/radios/chrflightmin","number",timtogpshrs_func)
TimeUTC_hrs = create_dataref("robertsv/crjx/crjx/radios/timeUTChrs","number",timtogpshrs_func)
TimeUTC_min = create_dataref("robertsv/crjx/crjx/radios/timeUTCmin","number",timtogpshrs_func)
TimeUTC_sec = create_dataref("robertsv/crjx/crjx/radios/timeUTCsec","number",timtogpshrs_func)
OnGround = find_dataref("sim/flightmodel2/gear/on_ground[1]")

Time_flight = 0
Time_Chr = 0
Clock_mode = 0
Chr_mode = 0
ET_mode = 0
Time_UTC = find_dataref("sim/time/zulu_time_sec")
Time_Local = find_dataref("sim/time/local_time_sec")


function Clockmode_toggle(phase, duration)
	if phase == 0 then
		if Clock_mode == 0 then Clock_mode = 1 elseif Clock_mode == 1 then Clock_mode = 0 end
	end
end

function ClockCHR_toggle(phase, duration)
	if phase == 0 then
		if Chr_mode == 0 then 
			Chr_mode = 1
		else
			if Chr_mode == 1 then
				Chr_mode = 2
			else
				Chr_mode = 0
				Time_Chr = 0
			end
		end	  	
	end
end

function ClockRST_toggle(phase, duration)
	if phase == 0 then
		if OnGround == 1 then
			Time_flight = 0
		end		
	end
end

function ClockET_toggle(phase, duration)
	if phase == 0 then
		if ET_mode == 0 then ET_mode = 1 else ET_mode = 0 end
	end
end



cmdClockET_toggle = create_command("robertsv/crjx/clock/ET_toggle","Clock ET",ClockET_toggle)
cmdClockRST_toggle = create_command("robertsv/crjx/clock/RST_toggle","Clock RST",ClockRST_toggle)
cmdClockMODE_toggle = create_command("robertsv/crjx/clock/MODE_toggle","Clock MODE",Clockmode_toggle)
cmdClockCHR_toggle = create_command("robertsv/crjx/clock/CHR_toggle","Clock CHR",ClockCHR_toggle)

function after_physics()

-- Add time to flighttime counter when aircraft is in the air
if OnGround == 0 then
	Time_flight = Time_flight + (1 * SIM_PERIOD)
end

if Chr_mode == 1 then
	Time_Chr = Time_Chr + (1 * SIM_PERIOD)
end

Clock_gpslcl = Clock_mode

-- Show time for chrono and flighttime counter
Timeflight_min = (Time_flight / 60) % 60
if Timeflight_min >= 59.5 then Timeflights_min = 59 end	
Timeflight_hrs = ((Time_flight / 60) - ((Time_flight / 60) % 60)) / 60

TimeChr_min = (Time_Chr % 60)
if TimeChr_min >= 59.5 then TimeChr_min = 59 end	
TimeChr_hrs = ((Time_Chr - (Time_Chr % 60)) / 60) % 60 


-- Show GPS-time/ local time (Airplane Zulu time and Data are not important in X-plane)
if Clock_gpslcl == 0 then
	TimeUTC_sec = (Time_UTC % 60)
	if TimeUTC_sec >= 59.5 then TimeUTC_sec = 59 end	
	TimeUTC_min = ((Time_UTC - (Time_UTC % 60)) / 60) % 60 
	if TimeUTC_min >= 59.5 then TimeUTC_min = 59 end	
	TimeUTC_hrs = ((Time_UTC / 60) - ((Time_UTC / 60) % 60)) / 60
else
	TimeUTC_sec = (Time_Local % 60)
	if TimeUTC_sec >= 59.5 then TimeUTC_sec = 59 end	
	TimeUTC_min = ((Time_Local - (Time_Local % 60)) / 60) % 60 
	if TimeUTC_min >= 59.5 then TimeUTC_min = 59 end	
	TimeUTC_hrs = ((Time_Local / 60) - ((Time_Local / 60) % 60)) / 60
end

end













