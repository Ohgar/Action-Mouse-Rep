ActionMouse = ActionMouse or {}

ActionMouse.isPanelOpen = false

--AUTO PANELS
local function AutoPanels()
	if not ActionMouse.isForced then
		if ActionMouseSettings.AutoStopPanels and IsMouselooking() and ActionMouse.isPanelOpen then
			ActionMouse.Deactivate()
		elseif ActionMouseSettings.AutoStartPanels and not IsMouselooking() and not ActionMouse.isPanelOpen then
			ActionMouse.Activate()
		end
	end
end

hooksecurefunc("ShowUIPanel", function(...)
	ActionMouse.isPanelOpen = true
	AutoPanels()
end)

hooksecurefunc("HideUIPanel", function(...)
	ActionMouse.isPanelOpen = false
	AutoPanels()
end)