ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Spy Weapon Drone"
ENT.Spawnable = false
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SDW"

ENT.Model = "models/maxofs2d/hover_classic.mdl"

ENT.Weight = 40

ENT.UseFlashlight = false

ENT.Speed = 800
ENT.UpSpeed = 1500
ENT.RotateSpeed = 6
ENT.AngOffset = 3
ENT.NoiseCoefficient = 0.1
ENT.Alignment = 3
ENT.PitchOffset = 7
ENT.DoExplosionEffect = false

ENT.FirstPersonCam_pos = Vector(12, 0, 0)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.HealthAmount = 20
ENT.DefaultHealth = 20

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/energy/zap2.wav",
		Pitch = 160,
		Level = 50
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Weapons = {
	["User & Invisible"] = { 
		Name = "User", 
		Sync = { ["1"] = { fire1 = "fire2" } } 
	},

	["1"] = { 
		Name = "Invisible",
		Select = false
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()