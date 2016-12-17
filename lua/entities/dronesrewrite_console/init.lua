include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SetUser(user)
	self.User = user
	self:SetNWEntity("User", user)
end

function ENT:SetDrone(drone)
	if drone:IsValid() then
		if drone:IsDroneDestroyed() then return end

		drone:AddHook("DroneDestroyed", "console_delete", function()
			if IsValid(self) then
				self:SetDrone(NULL)
			end
			
			drone:RemoveHook("DroneDestroyed", "console_delete")
		end)
	end

	self.SelectedDrone = drone
	self:SetNWEntity("DronesRewriteDrone", drone)
end

function ENT:SpawnFunction(ply, tr, class)
	if not tr.Hit then return end

	local pos = tr.HitPos + tr.HitNormal * 16

	local ent = ents.Create(class)
	ent.Owner = ply
	ent:SetPos(pos)
	ent:SetAngles(Angle(0, (ply:GetPos() - tr.HitPos):Angle().y, 0))
	ent:Spawn()
	ent:Activate()
	ent.Owner = ply

	return ent
end

function ENT:Initialize()
    self:SetModel("models/dronesrewrite/console/console.mdl")
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    self:SetDrone(NULL)

    self:GetPhysicsObject():Wake()
    self:GetPhysicsObject():SetMass(400)

    self.SeanceLog = { }
    self.User = NULL
    self.Commands = DRONES_REWRITE.GetCommands()

    timer.Simple(1, function() 
    	if IsValid(self) then
    		self:AddLine("Initializing console...")
    		self:AddLine("Console has been initialized.")
    		self:AddLine("Console type: Drones Rewrite Console V2.0")
    		self:AddLine("")
    		self:AddLine("Downloading packages...") 

    		timer.Simple(1.5, function()
    			if IsValid(self) then 
    				self:AddLine("")
    				self:AddLine("Packages has been downloaded! Type helpmenu to get help.", Color(190, 255, 190))
    				self:AddLine("To use left and right screens type select DRONEID")
    			end
    		end)
    	end
    end)
end

function ENT:Use(activator, caller)
	if not self.Useable then return end
	if self.User:IsValid() then return end
	if not activator:IsPlayer() then return end
	if activator:GetNWEntity("DronesRewriteDrone"):IsValid() then return end
	if activator:GetPos():Distance(self:GetPos()) > 80 then return end

	net.Start("dronesrewrite_openconsole")
		net.WriteEntity(self)
	net.Send(activator)

	self:SetUser(activator)
end

function ENT:Clear()
	net.Start("dronesrewrite_clearconsole")
		net.WriteEntity(self)
	net.Broadcast()
end

function ENT:Exit()
	net.Start("dronesrewrite_closeconsole")
		net.WriteEntity(self)
	net.Send(self.User)

	self:SetUser(NULL)
end

function ENT:Think()
	if IsValid(self.User) then
		if self.User:GetPos():Distance(self:GetPos()) > 80 then
			self:Exit()
		end
	elseif IsValid(self.Chair) then
		if self.Chair:GetPos():Distance(self:GetPos()) > 70 then 
			self.Chair = nil 
			return 
		end

		local driver = self.Chair:GetDriver()

		if driver:IsValid() then
			if driver:KeyPressed(IN_RELOAD) then
				self:Use(driver, driver, 1, 1)
			end
		end
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Explode()
	self:Exit()
	self:Clear()
	self:SetDrone(NULL)
	self.Useable = false
	self.DRR_NotWorkableTransmitter = true

	for i = 1, 5 do
		self:EmitSound("ambient/energy/zap" .. math.random(1, 9) .. ".wav", 67)
	end

	self:SetNWBool("Destroyed", true)
end

-- We can repair console only if we still have some hp
function ENT:Repair()
	if self.Hp < 100 then self.Hp = self.Hp + 1 end

	if self.Hp > 0 then
		self.Useable = true
		self.DRR_NotWorkableTransmitter = false
		self:SetNWBool("Destroyed", false)
	end
end

function ENT:Boom()
	self.OnTakeDamage = function() end

	undo.Create("Console Debris")
	for i = 1, 9 do
		local e = ents.Create("prop_physics")
		e:SetModel("models/dronesrewrite/console/debris/console_debris" .. i .. ".mdl")
		e:SetPos(self:GetPos())
		e:SetAngles(self:GetAngles())
		e:Spawn()

		undo.AddEntity(e)
	end
	undo.SetPlayer(self.Owner)
	undo.Finish()

	self:Remove()

	--self:SetNWBool("shithappened", true)
end

function ENT:PhysicsCollide(data, physobj)
	if data.DeltaTime < 0.5 or data.Speed < 200 then return end
	self:TakeDamage(data.Speed * 0.02)
end

function ENT:OnTakeDamage(dmg)
	if CLIENT then return end

	self:AddLine("WARNING! Physical damage!")

	self:EmitSound("ambient/energy/zap" .. math.random(1, 9) .. ".wav", 60, math.random(120, 150))

	self.Hp = self.Hp - dmg:GetDamage()

	if self.Hp <= 20 and not self:GetNWBool("Destroyed") then self:Explode() end
	if self.Hp <= 0 then self:Boom() end
end

hook.Add("PlayerEnteredVehicle", "dronesrewrite_console_chair", function(ply, vehicle)
	if vehicle:GetVehicleClass() == "Chair_Office2" then
		for k, v in pairs(ents.FindByClass("dronesrewrite_console")) do
			if vehicle:GetPos():Distance(v:GetPos()) < 70 then
				v:Use(ply, ply, 1, 1)
				v.Chair = vehicle

				ply:ChatPrint("[Drones] Press [Reload Key] to open console.")
			end
		end
	end
end)

