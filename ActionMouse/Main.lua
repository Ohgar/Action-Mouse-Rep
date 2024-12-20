ActionMouse = ActionMouse or {}

--ACTIVATE
function ActionMouse.Activate()
	--certain UI is not clearing their bool causing UIOpenState to read incorrectly
	if not ActionMouse.isForced and not ActionMouse.GetUIOpenState() then
		ActionMouse.isActive = true
		MouselookStart()
	end
end

--DEACTIVATE
function ActionMouse.Deactivate()
	MouselookStop()
	ActionMouse.isActive = false
	if ActionMouseSettings.Keybind then
		ActionMouse.reticleButton:Hide()
	end

	if ActionMouseSettings.Click then
		ActionMouse.reticleButton:Show()
	end
end

--TOGGLE KEYBIND ACTIVATION
function ActionMouse.ToggleKeybindActivation()
	if not ActionMouse.isForced then
		if ActionMouseSettings.Keybind and IsMouselooking() and not ActionMouse.GetAutoStartState() then
			ActionMouse.isActive = false
			ActionMouse.reticleButton:Hide()
			MouselookStop()
		elseif ActionMouseSettings.Keybind and not IsMouselooking() then
			ActionMouse.isActive = true
			local cursorX, cursorY = GetCursorPosition()
			ActionMouse.SetCursorReticle(cursorX, cursorY)
			MouselookStart()
			if ActionMouseSettings.HideRet or ActionMouse.GetAutoStartState() then
				ActionMouse.reticleButton:Hide()
			end
		end
	end
end

--FORCE FUNCTION
function ActionMouse.ForceFunction()
	if ActionMouse.isForced then
		ActionMouse.isForced = false
		if ActionMouseSettings.Click then
			ActionMouse.SetClickReticle()
		elseif ActionMouseSettings.Keybind then
			ActionMouse.reticleButton:Hide()
		end
		
		if ActionMouse.GetAutoStartState() then
			ActionMouse.Activate()
		end
	else
		ActionMouse.isForced = true
		ActionMouse.Deactivate()
		ActionMouse.SetForcedReticle()
	end
end

--PLAYER ENTERING WORLD
local onEnterWorld = CreateFrame("Frame")
onEnterWorld:RegisterEvent("PLAYER_ENTERING_WORLD")
onEnterWorld:SetScript("OnEvent", function(self, event, ...)
	if ActionMouseSettings.Click then
		ActionMouse.SetClickReticle(false)
	end
end)

--PREVENT RIGHT CLICK EXIT
local function PreventRightClick()
	if ActionMouseSettings.Keybind and ActionMouse.isActive and not IsMouselooking() then
		ActionMouse.ToggleKeybindActivation()
	end
end

--UPDATE
local update = CreateFrame("Frame")
update:SetScript("OnUpdate", function(self,elapsed)	
	PreventRightClick()
end)