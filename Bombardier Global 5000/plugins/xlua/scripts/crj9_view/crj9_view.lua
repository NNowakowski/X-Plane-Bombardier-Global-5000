View_pilot_x = find_dataref("sim/graphics/view/pilots_head_x")
View_pilot_y = find_dataref("sim/graphics/view/pilots_head_y")
View_pilot_z = find_dataref("sim/graphics/view/pilots_head_z")
View_pilot_pitch = find_dataref("sim/graphics/view/view_pitch")
View_pilot_r1 = find_dataref("sim/graphics/view/pilots_head_psi")
View_pilot_r2 = find_dataref("sim/graphics/view/pilots_head_the")

function VIEW_toggle(phase, duration)
	if phase == 0 then
		 -- toggle from 0 to 1 and viceversa
		View_number = View_number + 1
		if View_number > 3 then 
			View_number = 0
		end
		if View_number == 1 then
--		Op de bank
			View_pilot_x = 0.80
			View_pilot_z = -0.5
			View_pilot_y = 1.2
			View_pilot_r1 = -45
			View_pilot_r2 = 0
		end
		if View_number == 0 then
--		Cockpit view
			View_pilot_x = 0.64559 
			View_pilot_z = -11.21294
			View_pilot_y = 1.32238
			View_pilot_pitch = 0
			View_pilot_r1 = 0
			View_pilot_r2 = -6
		end
		if View_number == 2 then
--		aan de tafel
			View_pilot_x = -0.80
			View_pilot_z = -4.70
			View_pilot_y = 1.2
			View_pilot_r1 = 180
			View_pilot_r2 = 0
		end
		if View_number == 3 then
--		Copilot
			View_pilot_x = -0.64559
			View_pilot_z = -11.21294
			View_pilot_y = 1.32238
			View_pilot_r1 = 0
			View_pilot_r2 = -6
		end
	end
end

cmdViewtog = create_command("robertsv/gl6t/view/view_toggle","toggle view",VIEW_toggle)

View_number = 1

function after_physics()

end













