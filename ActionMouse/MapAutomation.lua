ActionMouse = ActionMouse or {}

ActionMouse.isMapOpen = false

WorldMapFrame:HookScript("OnShow", function()
	ActionMouse.isMapOpen = true
	if not ActionMouse.isForced then
		if ActionMouseSettings.AutoStopMap then
			ActionMouse.Deactivate()
		end
	end
end)
WorldMapFrame:HookScript("OnHide", function()
	ActionMouse.isMapOpen = false
	if not ActionMouse.isForced then
		if ActionMouseSettings.AutoStartMap then
			ActionMouse.Activate()
		end
	end
end)