ActionMouse = ActionMouse or {}

ActionMouse.isCombat = false

local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Entering combat
frame:RegisterEvent("PLAYER_REGEN_ENABLED") -- Exiting combat

local function AutoCombat()
	if not ActionMouse.isForced then
		if ActionMouseSettings.AutoStopCombat and IsMouselooking() and ActionMouse.isCombat then
			ActionMouse.Deactivate()
		elseif ActionMouseSettings.AutoStartCombat and not IsMouselooking() and not ActionMouse.isCombat then
			ActionMouse.Activate()
		end
	end
end

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ActionMouse.isCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        ActionMouse.isCombat = false
    end
	AutoCombat()
end)
