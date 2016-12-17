AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Spider Antidote"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

if SERVER then
	function ENT:SpawnFunction(ply, tr, class)
		if not tr.Hit then return end

		local pos = tr.HitPos + tr.HitNormal * 16

		local ent = ents.Create(class)
		ent:SetPos(pos)
		ent:SetAngles(Angle(0, (ply:GetPos() - tr.HitPos):Angle().y + 90, 0))
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()
	    self:SetModel("models/props_lab/jar01a.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)
	    self:SetUseType(SIMPLE_USE)

	    local phys = self:GetPhysicsObject()
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:Use(activator, caller)
		if not activator:IsPlayer() then return end

		local val = -5

		if activator.DRR_Poisoned then
			val = 5

			activator:ChatPrint("[Drones] You feel bad")
			
			net.Start("dronesrewrite_playsound")
				net.WriteString("vo/npc/male01/moan04.wav")
			net.Send(activator)

			if math.random(1, 2) == 1 then
				timer.Create("dronesrewrite_stoppoison_antidote" .. activator:EntIndex(), 2, 1, function()
					if IsValid(activator) then
						hook.Remove("Think", "dronesrewrite_bite_poison" .. activator:EntIndex())
						activator.DRR_Poisoned = false
					end
				end)
			end
		else
			if activator.SHOULDDIE_ANTIDOTE then 
				activator:Kill() 
				activator.SHOULDDIE_ANTIDOTE = false

				return
			end

			activator.SHOULDDIE_ANTIDOTE = true

			timer.Create("dronesrewrite_antidoteshit" .. activator:EntIndex(), 30, 1, function()
				if IsValid(activator) then
					activator.SHOULDDIE_ANTIDOTE = false
				end
			end)
		end

		activator:SetHealth(math.min(activator:Health() + val, activator:GetMaxHealth()))

		self:Remove()
	end

	function ENT:OnTakeDamage(dmg)
		self:TakePhysicsDamage(dmg)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end