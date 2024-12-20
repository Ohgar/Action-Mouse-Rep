ActionMouse = ActionMouse or {}

ActionMouse.isPopupOpen = false

local function AutoPopups()
	if not ActionMouse.isForced then
		if ActionMouseSettings.AutoStopPopups and IsMouselooking() and ActionMouse.isPopupOpen then
			ActionMouse.Deactivate()
		elseif ActionMouseSettings.AutoStartPopups and not IsMouselooking() and not ActionMouse.isPopupsOpen then
			ActionMouse.Activate()
		end
	end
end

--STATIC POPUP DETECTION
hooksecurefunc("StaticPopup_Show", function()
	ActionMouse.isPopupOpen = true
	AutoPopups()
end)

hooksecurefunc("StaticPopup_OnClick", function()
	ActionMouse.isPopupOpen = false
	AutoPopups()
end)
