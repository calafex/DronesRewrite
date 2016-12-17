ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Microwave"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "MWV"

ENT.Model = "models/dronesrewrite/microwave/microwave.mdl"

ENT.FirstPersonCam_pos = Vector(20, 17.5, 2.5)
ENT.ThirdPersonCam_distance = 70
ENT.RenderCam = false
ENT.AllowLowHealthExplosion = false

ENT.Speed = 1000
ENT.UpSpeed = 5000
ENT.SprintCoefficient = 1.2
ENT.RotateSpeed = 5

ENT.AngOffset = 2

ENT.HackValue = 2

ENT.Fuel = 50
ENT.MaxFuel = 50
ENT.FuelReduction = 0.1

ENT.HUD_hudName = "Drones 2"

ENT.UseNightVision = false
ENT.UseFlashlight = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.AI_CustomEnemyChecker = function(drone, v)
	return drone:GetPos():Distance(v:GetPos()) < 250 and DRONES_REWRITE.AI.ShouldAttack(drone, v)
end

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 200,
		Level = 60,
		Volume = 0.4
	}
}

ENT.Propellers = {
	Damage = 1,
	Health = 25,
	HitRange = 10,
	Model = "models/dronesrewrite/propellers/propeller2_2.mdl",

	Info = {
		Vector(0, 0, 16)
	}
}

ENT.Weapons = {	["Microwave"] = { Name = "Microwave" } }

ENT.Modules = DRONES_REWRITE.GetBaseModules()