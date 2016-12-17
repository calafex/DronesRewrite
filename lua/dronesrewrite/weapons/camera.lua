DRONES_REWRITE.Weapons["Camera"] = {
	Initialize = function(self)
		return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,
	
	Attack = function(self, gun)
		if self:WasKeyPressed("Fire1") then
			if self:GetDriver():IsValid() then
				local tr = util.TraceLine({
					start = gun:GetPos(),
					endpos = gun:GetPos() + gun:GetForward() * 256,
					filter = self
				})

				if self:GetNWBool("camera_flashen", true) then
					local ef = EffectData()
					ef:SetOrigin(tr.HitPos)
					util.Effect("camera_flash", ef, true)
				end

				gun:EmitSound("drones/camerawep.wav", 80, 100, 1, CHAN_WEAPON)
				self:GetDriver():ConCommand("jpeg")
			end
		end
	end,

	Attack2 = function(self, gun)
		if self:WasKeyPressed("Fire2") then
			self:SetNWBool("camera_flashen", not self:GetNWBool("camera_flashen", true))
		end
	end
}