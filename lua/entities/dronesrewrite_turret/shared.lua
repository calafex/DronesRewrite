ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Combine Turret Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "TUR"

ENT.Weight = 128
ENT.SpawnHeight = 1
ENT.Model = "models/Combine_turrets/Floor_turret.mdl"

ENT.HealthAmount = 640
ENT.DefaultHealth = 640

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Default"

ENT.FirstPersonCam_pos = Vector(8, -2, 58.5)
ENT.ThirdPersonCam_pos = Vector(0, 0, 64)
ENT.RenderCam = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.HackValue = 2

ENT.PitchMin = -15
ENT.PitchMax = 15

ENT.UseFlashlight = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics = { }

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

-- TODO: add turret weapon
ENT.Weapons = {
	["Turret's Gun"] = {
		Name = "Turret's Gun",
		Pos = Vector(50, 4, 50)
	}
}

ENT.Modules = DRONES_REWRITE.GetAIModules()
DRONES_REWRITE.CopyModule(ENT.Modules, "Healer")