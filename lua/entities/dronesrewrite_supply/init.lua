include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

local function playSequence(self, name)
	local seq = self:LookupSequence(name)
	self:ResetSequence(seq)

	self:SetPlaybackRate(1)
	self:SetSequence(seq)
			
	return self:SequenceDuration(seq)
end

local items = {
	"item_healthkit",
	"item_battery",

	"item_ammo_ar2_large",
	"item_ammo_357_large",
	"item_ammo_pistol_large",
	"item_ammo_pistol_large",
	"item_rpg_round",
	"item_ammo_smg1_large",
	"item_ammo_smg1_grenade"
}

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	playSequence(self, "idle")
	
	self:AddWeapon("Supply", {
		Initialize = function(self)
			return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		end,

		Attack = function(self, gun)
			if CurTime() > gun.NextShoot then
				local dur = playSequence(self, "open")

				gun:EmitSound("items/ammocrate_open.wav", 65)

				timer.Simple(dur * 0.3, function()
					if not IsValid(self) then return end

					local ent = ents.Create(table.Random(items))
					ent:SetPos(self:LocalToWorld(Vector(-15, 0, -2)))
					ent:SetAngles(self:GetAngles())
					ent:Spawn()
					ent:GetPhysicsObject():SetVelocity(self:GetVelocity())

					local driver = self:GetDriver()
					if IsValid(driver) and driver:IsPlayer() then
						undo.Create("Item")
							undo.AddEntity(ent)
							undo.SetPlayer(driver)
						undo.Finish("Item " .. ent:GetClass())
					end

					constraint.NoCollide(self, ent, 0, 0)
				end)

				timer.Simple(dur + 0.8, function()
					if not IsValid(self) then return end
					local dur = playSequence(self, "close")

					timer.Simple(dur * 0.8, function() 
						if IsValid(gun) then
							gun:EmitSound("items/ammocrate_close.wav", 65)
						end
					end)

					timer.Simple(dur, function()
						if not IsValid(self) then return end
						playSequence(self, "idle")
					end)
				end)

				gun.NextShoot = CurTime() + 2.6
			end
		end,

		Attack2 = function(self, gun) end,
		Think = function(self, gun) end
	})

	self:SelectNextWeapon()
end