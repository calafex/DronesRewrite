ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "GAST 'G-P.R.O. Assistant'"
ENT.PrintName = "G-P.R.O. Assistant Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "GPRO"
ENT.HUD_hudName = "GPROSupport"
ENT.HUD_shouldDrawTargets = true

ENT.Weight = 550

ENT.Model = "models/dronesrewrite/gprodr/gprodr.mdl"

ENT.FirstPersonCam_pos = Vector(54, 0, 0)
ENT.ThirdPersonCam_distance = 200
ENT.RenderCam = false

ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.7
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.2
ENT.AngOffset = 4

ENT.HackValue = 4

ENT.Speed = 4500
ENT.UpSpeed = 18000
ENT.RotateSpeed = 6

ENT.PitchOffset = 0.7

ENT.AllowYawRestrictions = true
ENT.YawMin = -64
ENT.YawMax = 64

ENT.PitchMin = -5
ENT.PitchMax = 90

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Fuel = 500
ENT.MaxFuel = 500
ENT.FuelReduction = 0.2

ENT.HealthAmount = 700
ENT.DefaultHealth = 700

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 90,
		Level = 72,
		Volume = 0.7
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 80
	},

	SwitchOnSound = {
		Name = "npc/scanner/combat_scan2.wav",
		Level = 80
	},

	ShutdownSound = {
		Name = "buttons/combine_button2.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Scale = 0.9,
	Damage = 1,
	Health = 50,
	HitRange = 18,
	Model = "models/dronesrewrite/propellers/propeller2_4.mdl",

	Info = {
		Vector(23, 43.5, 1),
		Vector(23, -43.5, 1),
		Vector(-41.5, 43.5, 1),
		Vector(-41.5, -43.5, 1)
	}
}

ENT.Slots = {
	["Weapon"] = 1
}

ENT.Attachments = {
	["Multitool"] = {
		Pos = Vector(44, 0, -5),
		Angle = Angle(-5, 0, 0)
	},

	["Winch"] = { 
		Pos = Vector(1, 0, -6),
		Angle = Angle(0, 0, 0)
	},

	["Refueler"] = { 
		Pos = Vector(-32, 0, -5),
		Angle = Angle(0, 0, 0)
	}
}

ENT.Weapons = {	
	["Multitool"] = { 
		Name = "Multitool",
		Attachment = "Multitool"
	},

	["Winch"] = { 
		Name = "Winch",
		Attachment = "Winch"
	},

	["Refueler"] = { 
		Name = "Refuel",
		Attachment = "Refueler"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()


ENT.Modules["Invisible"] = {
	Slot = "Weapon",

	Initialize = function(drone)
		drone:FastAddWeapon("Invisible", "Invisible", Vector(0, 0, 0), { })
	end,

	OnRemove = function(drone)
		drone:AddWeapons()
	end,

	Think = function(drone) end
}

ENT.Modules["Microwave"] = {
	Slot = "Weapon",

	Initialize = function(drone)
		drone:FastAddWeapon("Microwave", "Microwave", Vector(0, 0, 0), { })
	end,

	OnRemove = function(drone)
		drone:AddWeapons()
	end,

	Think = function(drone) end
}
