
-- Get datarefs
Brakesleft = find_dataref("sim/cockpit2/controls/left_brake_ratio")
Brakesright = find_dataref("sim/cockpit2/controls/right_brake_ratio")
Temperature = find_dataref("sim/weather/temperature_ambient_c")
Groundspeed = find_dataref("sim/flightmodel/position/groundspeed")
Override = find_dataref("sim/operation/override/override_toe_brakes")

function BrakeHeat_func()
end

BrakeHeatEicas = create_dataref("robertsv/crjx/emergency/BrakeHeat","number",BrakeHeat_func)


braketemperature = Temperature
brakedisplay = 1


function after_physics()

if Groundspeed > 2 then
	if Brakesleft > 0 or Brakesright > 0 then
		braketemperature = math.abs(braketemperature + (30 * SIM_PERIOD * ((Brakesleft + Brakesright)/2)))
	else
		if braketemperature > Temperature then
			braketemperature = math.abs(braketemperature - (4 / 60 * SIM_PERIOD))
		end
	end
end

if braketemperature < 0 then
	brakedisplay = 1
end 

if braketemperature >= 0 and braketemperature <= 220 then
	brakedisplay = math.abs(1 + (braketemperature / 36.833))
end 

if braketemperature >= 221 then
	brakedisplay = math.abs(7 + ((braketemperature - 221) / 38.714 ))
end

BrakeHeatEicas = brakedisplay

end





