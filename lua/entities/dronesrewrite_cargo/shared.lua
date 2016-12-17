ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "CRG 'Cargo'"
ENT.PrintName = "Cargo Transporter"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "CRG"
ENT.HUD_hudName = "Sci Fi"

ENT.Weight = 5500

ENT.Model = "models/dronesrewrite/cargo/cargo.mdl"

ENT.FirstPersonCam_pos = Vector(34, 0, -8)
ENT.ThirdPersonCam_distance = 200
ENT.RenderCam = false

ENT.ExplosionForce = 10
ENT.ExplosionAngForce = 0.03
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.Alignment = 0.4

ENT.HackValue = 4

ENT.NoiseCoefficient = 0.2
ENT.AngOffset = 3

ENT.Speed = 50000
ENT.UpSpeed = 200000
ENT.SprintCoefficient = 1.8
ENT.RotateSpeed = 4

ENT.PitchOffset = 0.07

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

--ENT.PitchMin = -30
--ENT.PitchMax = 50
ENT.PitchMin = 0
ENT.PitchMax = 90

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 800
ENT.DefaultHealth = 800

ENT.Fuel = 500
ENT.MaxFuel = 500
ENT.FuelReduction = 1

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 71,
		Volume = 0.65
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 86
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 12,
	Model = "models/dronesrewrite/cargo_propeller/cargo_propeller.mdl",

	Info = {
		Vector(34, 49, 11),
		Vector(-54, -49, 11),
		Vector(-54, 49, 11),
		Vector(34, -49, 11)
	}
}

ENT.Attachments = {
	["Winch"] = {
		Pos = Vector(-10, 0, -14),
		Angle = Angle(0, 90, 0)
	}
}

ENT.Weapons = { 
	["Winch"] = { 
		Name = "Winch",
		Attachment = "Winch"
	} 
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()