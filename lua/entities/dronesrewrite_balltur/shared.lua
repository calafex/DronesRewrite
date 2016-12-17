ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "BT 'Ball Turret'"
ENT.PrintName = "Ball Turret"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.RenderInCam = false
ENT.UNIT = "BT"

ENT.Model = "models/XQM/Rails/trackball_1.mdl"

ENT.Weight = 80

ENT.Speed = 200
ENT.UpSpeed = 0
ENT.SprintCoefficient = 1.5
ENT.RotateSpeed = 0
ENT.AngOffset = 0
ENT.NoiseCoefficient = 0
ENT.Alignment = 3
ENT.PitchOffset = 0

ENT.Fuel = 40
ENT.MaxFuel = 40

ENT.HackValue = 2

ENT.FirstPersonCam_pos = Vector(0, 0, 0)
ENT.ThirdPersonCam_pos = Vector(0, 0, 0)
ENT.ThirdPersonCam_distance = 90
ENT.SimplestCamera = true

ENT.UseFlashlight = false

ENT.HUD_hudName = "White Box"
ENT.HUD_shouldDrawCenter = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Forward"] = function(self)
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(self.CamAngles:Forward() * self.Speed * self.MoveCoefficient)

	self.MoveDir = 1
	self.IsMoving = true
end

ENT.KeysFuncs.Physics["Back"] = function(self)
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(-self.CamAngles:Forward() * self.Speed * self.MoveCoefficient)

	self.MoveDir = -1
	self.IsMoving = true
end

ENT.KeysFuncs.Physics["Left"] = function(self)
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(-self.CamAngles:Right() * self.Speed * self.MoveCoefficient)

	self.MoveDir = 1
	self.IsMoving = true
end

ENT.KeysFuncs.Physics["Right"] = function(self)
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(self.CamAngles:Right() * self.Speed * self.MoveCoefficient)

	self.MoveDir = 1
	self.IsMoving = true
end

ENT.KeysFuncs.Physics["Up"] = function(self)
	if self:WasKeyPressed("Up") then
		local phys = self:GetPhysicsObject()
		phys:ApplyForceCenter(vector_up * 30000)
	end
end

ENT.AllowPitchRestrictions = false

ENT.HealthAmount = 250
ENT.DefaultHealth = 250

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 85
	}
}

ENT.NoPropellers = true
ENT.Modules = DRONES_REWRITE.GetBaseModules()

ENT.AI_CustomEnemyChecker = function(drone, v)
	return drone:GetPos():Distance(v:GetPos()) < 500
end

ENT.AI_DistanceEnemy = 400
ENT.AI_UseZ = false