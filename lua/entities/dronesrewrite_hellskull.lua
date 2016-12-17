AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/Gibs/HGIBS.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    self:DrawShadow(false)
		self:SetColor(Color(255, 0, 0))

	    local phys = self:GetPhysicsObject()

	    phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)	
	    phys:Wake()

		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Right(), 90)
		ParticleEffectAttach("skull_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	end

	function ENT:PhysicsUpdate(phys)
		if self.LastPhys == CurTime() then return end

		if self:WaterLevel() >= 3 then self:Remove() end
		phys:ApplyForceCenter(self:GetForward() * 10)

		self.LastPhys = CurTime()
	end

	function ENT:PhysicsCollide(data, physobj)
		local ent = data.HitEntity
		if ent:IsValid() then
			if ent:IsPlayer() and math.random(1, 8) == 1 then 
				ent:ConCommand("dronesrewrite_do_hell")
				ent:TakeDamage(2)

				if IsValid(self.LightbringerDr) then
					if not self.LightbringerDr.PoorHellVictims then self.LightbringerDr.PoorHellVictims = { } end
					table.insert(self.LightbringerDr.PoorHellVictims, ent)
				end
			else
				ent:TakeDamage(20)
			end
		end
		
		ParticleEffect("skull_impact", self:GetPos(), Angle(0, 0, 0))

		self:EmitSound("npc/stalker/go_alert2a.wav", 80, 70)
		self:EmitSound("ambient/water/water_splash"..math.random(1,3)..".wav",100,100)

		self:Remove()
	end
else
	function ENT:Draw()
		if SERVER then return end

		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:GetPos()
			dlight.r = 50
			dlight.g = 0
			dlight.b = 0
			dlight.brightness = 2
			dlight.Decay = 1000
			dlight.Size = 500
			dlight.DieTime = CurTime() + 0.3
		end

		self:DrawModel()
	end
end
