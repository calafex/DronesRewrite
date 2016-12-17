ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "HC 'Hunter-Chopper'"
ENT.PrintName = "Hunter-Chopper"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true
ENT.SpawnHeight = 128

ENT.UNIT = "HC"
ENT.HUD_hudName = "Drones 2"

ENT.Weight = 3000

ENT.Model = "models/Combine_Helicopter.mdl"

ENT.FirstPersonCam_pos = Vector(168, 0, -16)
ENT.ThirdPersonCam_pos = Vector(200, 200, -50)
ENT.ThirdPersonCam_distance = 400
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_big_drone_main"
ENT.ExplosionForce = 900
ENT.ExplosionAngForce = 0

ENT.Alignment = 0.8

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientPos = 100
ENT.NoiseCoefficientAng = 0.3
ENT.AngOffset = 2.5

ENT.HackValue = 4

ENT.Speed = 150000
ENT.UpSpeed = 350000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 4.5

ENT.PitchOffset = 0.045

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 700
ENT.DefaultHealth = 700

ENT.Fuel = 700
ENT.MaxFuel = 700
ENT.FuelReduction = 1

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		NoPitchChanges = true,
		Level = 100
	},

	ExplosionSound = {
		Name = "npc/attack_helicopter/aheli_damaged_alarm1.wav",
		Level = 120
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.AllowPitchRestrictions = false
ENT.AllowYawRestrictions = true
ENT.YawMin = -70
ENT.YawMax = 70

ENT.Attachments = {
	["Gun"] = {
		Pos = Vector(128, 10, -92)
	}
}

ENT.Weapons = {
	["Helicopter Gun"] = {
		Name = "Helicopter Gun",
		Attachment = "Gun"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()