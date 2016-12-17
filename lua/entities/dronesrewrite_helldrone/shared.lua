ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Lightbringer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "LB"

ENT.Weight = 666

ENT.Model = "models/dronesrewrite/helldrone/helldrone.mdl"

ENT.HealthAmount = 666
ENT.DefaultHealth = 666

ENT.Fuel = 666
ENT.MaxFuel = 666
ENT.FuelReduction = 0.3

ENT.HackValue = 4

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Red"

ENT.FirstPersonCam_pos = Vector(44, 0, 2)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.NoiseCoefficient = 0

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 1.4
ENT.AlignmentPitch = 3

ENT.NoiseCoefficient = 0.2
ENT.AngOffset = 1

ENT.SprintCoefficient = 3
ENT.Speed = 5000
ENT.UpSpeed = 25000
ENT.RotateSpeed = 4

ENT.PitchOffset = 0.1

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.PitchMin = -60

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/machines/laundry_machine1_amb.wav",
		Pitch = 85,
		Level = 90,
		NoPitchChanges = true
	},
	
	ExplosionSound = {
		Name = "npc/stalker/go_alert2a.wav",
		Level = 71,
		Pitch = 70
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Attachments = {
	["Skull"] = {
		Pos = Vector(0, 0, -16)
	}
}

ENT.Weapons = {
	["Skulls"] = {
		Name = "Hell Skull",
		Attachment = "Skull"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()