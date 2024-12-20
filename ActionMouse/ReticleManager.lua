ActionMouse = ActionMouse or {}

ActionMouse.reticleButton = CreateFrame("Button", "ClickButton", UIParent, "SecureActionButtonTemplate")

--CLICK RETICLE
function ActionMouse.SetClickReticle()
	ActionMouse.reticleButton:SetSize(ActionMouseSettings.sSlider, ActionMouseSettings.sSlider)
	ActionMouse.reticleButton:SetPoint("CENTER", UIParent, "CENTER", ActionMouseSettings.crSliderX, ActionMouseSettings.crSliderY)
	ActionMouse.reticleButton:SetNormalTexture("Interface\\AddOns\\ActionMouse\\action_mouse_reticle.png")
	ActionMouse.reticleButton:SetScript("OnClick", function()
		ActionMouse.Activate()
		if ActionMouseSettings.HideRet then
			ActionMouse.reticleButton:Hide()
		end
	end)
end

--CLICK RESET
function ActionMouse.ResetClickReticle()
	if ActionMouseSettings.Click and isActive and not IsMouselooking() then
		ActionMouse.Deactivate()
	end
end

--FORCED RETICLE
function ActionMouse.SetForcedReticle()
	ActionMouse.reticleButton:SetSize(ActionMouseSettings.sSlider, ActionMouseSettings.sSlider)
	ActionMouse.reticleButton:SetPoint("CENTER", UIParent, "CENTER", ActionMouseSettings.crSliderX, ActionMouseSettings.crSliderY)	
	ActionMouse.reticleButton:SetNormalTexture("Interface\\AddOns\\ActionMouse\\action_mouse_forced_state_reticle.png")
	ActionMouse.reticleButton:Show()
end

--CURSOR RETICLE
function ActionMouse.SetCursorReticle(xPos, yPos)
    local uiScale = UIParent:GetEffectiveScale()
    local uiCenterX, uiCenterY = UIParent:GetCenter()
    local cursorX = (xPos / uiScale) - uiCenterX
    local cursorY = (yPos / uiScale) - uiCenterY
	ActionMouse.reticleButton:SetSize(ActionMouseSettings.sSlider, ActionMouseSettings.sSlider)
	ActionMouse.reticleButton:SetPoint("CENTER", UIParent, "CENTER", cursorX, cursorY)
	ActionMouse.reticleButton:SetNormalTexture("Interface\\AddOns\\ActionMouse\\action_mouse_reticle.png")
	ActionMouse.reticleButton:Show()
end