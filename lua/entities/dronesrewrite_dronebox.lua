AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Gift Box"
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
	    self:SetModel("models/dronesrewrite/dronebox/dronebox.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)
	    self:SetUseType(SIMPLE_USE)

	    local phys = self:GetPhysicsObject()
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:Use(activator, caller)
		if not activator:IsPlayer() then return end

		local center = self:LocalToWorld(self:OBBCenter())

		local ef = EffectData()
		ef:SetOrigin(center)
		util.Effect("dronesrewrite_papers", ef)

		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Forward(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)

		local e = ents.Create("dronesrewrite_camera")
		e:SetPos(center)
		e:SetAngles(ang)
		e:Spawn()
		e:Activate()

		e.Owner = activator

		e.EnginePower = 0
		e:SetEnabled(false)

		e:AddHook("DriverSet", "sethint", function(ply)
			if not e.PrintHint then
				if IsValid(ply) then ply:ChatPrint("To enable me click [G] key") end
				e.PrintHint = true
			end
		end)

		undo.Create("Gift Drone")
			undo.AddEntity(e)
			undo.SetPlayer(activator)
		undo.Finish()

		activator:Give("weapon_drr_remote")
		activator:SelectWeapon("weapon_drr_remote")

		self:EmitSound("drones/paper1.wav", 80)
		self:Remove()
	end

	function ENT:OnTakeDamage(dmg)
		self:TakePhysicsDamage(dmg)
	end

	function ENT:PhysicsCollide(data, phys)
		if data.DeltaTime > 0.2 then
			self:EmitSound("physics/cardboard/cardboard_box_impact_hard" .. math.random(1, 7) .. ".wav")
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end