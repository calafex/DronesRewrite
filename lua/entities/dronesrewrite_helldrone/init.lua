include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:PhysicsCollide(data, phys)
	self.BaseClass.PhysicsCollide(self, data, phys)

	if data.DeltaTime > 0.3 then
		local ply = data.HitEntity

		if IsValid(ply) and (ply:IsPlayer() or ply:IsNPC()) then
		
			local PlyDamageCoef, SelfDamageCoef
			if data.Speed == 0 then PlyDamageCoef = 1 else PlyDamageCoef = data.Speed end 
			if self:GetVelocity():Length() == 0 then SelfDamageCoef = 15 else SelfDamageCoef = self:GetVelocity():Length() * 0.25 end 
			//print(self:GetVelocity():Length())
			
			local dmg = DamageInfo()
			local DamageCount = math.random(10, 30) * SelfDamageCoef * PlyDamageCoef * 0.001 * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat()
			dmg:SetDamage(DamageCount)
			dmg:SetAttacker(self)
			dmg:SetDamageType(DMG_SLASH)

			ply:TakeDamageInfo(dmg)
			
			//print(DamageCount)
		
			//ply:TakeDamage(math.random(30, 60) * ply:GetVelocity():Length() * self:GetVelocity():Length() * 0.001 * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
			
			if DamageCount >= 1 then 
				local ef = EffectData()
				ef:SetStart(data.HitPos)
				ef:SetOrigin(data.HitPos)
				util.Effect("BloodImpact", ef)

				//ply:EmitSound("ambient/machines/slicer" .. math.random(1, 4) .. ".wav", 65)
				if math.random(1,2) == 1 then 
					ply:EmitSound("ambient/machines/slicer4.wav", 65)
				else
					ply:EmitSound("ambient/machines/slicer1.wav", 65)
				end
			end
		end
	end
end