ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "DXL 'DXL-3000'"
ENT.PrintName = "DXL-3000"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "DXL"
ENT.HUD_hudName = "White Box"

ENT.Weight = 320

ENT.Model = "models/dronesrewrite/dxl/dxl.mdl"

ENT.FirstPersonCam_pos = Vector(15, 0, 6)
ENT.RenderCam = false

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.7
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.4
ENT.AngOffset = 3

ENT.Speed = 4500
ENT.UpSpeed = 24000
ENT.RotateSpeed = 5

ENT.HackValue = 3

ENT.PitchOffset = 0.7

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Fuel = 120
ENT.MaxFuel = 120
ENT.FuelReduction = 0.3

ENT.HealthAmount = 300
ENT.DefaultHealth = 300

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		Pitch = 120,
		Level = 65,
		Volume = 0.86
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 80
	},

	SwitchOnSound = {
		Name = "buttons/button17.wav",
		Pitch = 120,
		Level = 67
	},

	ShutdownSound = {
		Name = "buttons/button1.wav",
		Pitch = 140,
		Level = 67
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 15,
	Model = "models/dronesrewrite/propellers/propeller1_3.mdl",

	Info = {
		Vector(0, 31, 10),
		Vector(0, -31, 10),
	}
}

ENT.Slots = {
	["Weapon"] = 1
}

ENT.Attachments = {
	["Left"] = { Pos = Vector(0, 8, -1), Angle = Angle(0, 0, 14) },
	["Right"] = { Pos = Vector(0, -8, -1), Angle = Angle(0, 0, -14) }
}

ENT.Weapons = {
	["Red Blasters"] = {
		Name = "Red Blaster",
		Sync = { 
			["2"] = { fire1 = "fire1", fire2 = "fire2" }
		},

		Attachment = "Left"
	},

	["2"] = {
		Name = "Red Blaster",
		Select = false,
		Attachment = "Right"
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
