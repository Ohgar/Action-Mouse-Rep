ActionMouse = ActionMouse or {}

ActionMouse.isActive = false
ActionMouse.isForced = false

--AUTO START STATE
function ActionMouse.GetAutoStartState()
	if ActionMouseSettings.AutoStartBags or
		ActionMouseSettings.AutoStartMap or
		ActionMouseSettings.AutoStartPanels or
		ActionMouseSettings.AutoStartPopups then
		return true
	else
		return false
	end
end

--UI OPEN STATE
function ActionMouse.GetUIOpenState()
	if ActionMouse.isBagOpen or
		ActionMouse.isMapOpen or
		ActionMouse.isPanelOpen or
		ActionMouse.isPopupOpen then
		return true
	else
		return false
	end
end

--UPDATE
local update = CreateFrame("Frame")
update:SetScript("OnUpdate", function(self,elapsed)
end)