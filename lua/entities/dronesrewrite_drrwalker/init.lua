include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

local sin = math.sin
local cos = math.cos
local clamp = math.Clamp
local approach = math.Approach
local trace = util.TraceLine

function ENT:Think()
	self.BaseClass.Think(self)

	local phys = self:GetPhysicsObject()
	local vel = phys:GetVelocity()
	vel.z = 0

	local vellen = vel:Length() + phys:GetAngleVelocity():Length()

	local pos = self:GetPos() + self:GetUp() * 72
	local tr = trace({
		start = pos,
		endpos = self:GetPos() - self:GetUp() * 45,
		filter = self
	})

	local dist = clamp(tr.HitPos:Distance(pos) - 70, -60, 40)

	if not self.byaw then self.byaw = 0 end

	if self.IsRotating then 
		self:ClickKey("Forward") 
		self.byaw = approach(self.byaw, -self.RotateDir * 8, 0.5)
	else
		self.byaw = approach(self.byaw, 0, 1)
	end

	if self.IsMoving then
		self:SwitchLoopSound("Walk", true, "vehicles/tank_turret_loop1.wav", 40, 1, 76)

		if not self.DoFootStepSound2 then
			timer.Simple(self.WaitForSound, function() 
				if IsValid(self) then
					if self.IsMoving or self.IsRotating then
						self:EmitSound("drones/mechstep.wav", 65, 100)
					end
							
					self.DoFootStepSound2 = false
				end
			end)

			self.DoFootStepSound2 = true
		end

		if self.LastCurTimeAnim == 0 then self.LastCurTimeAnim = CurTime() end
	else
		self:SwitchLoopSound("Walk", false)
		self.LastCurTimeAnim = 0
	end

	local x = (CurTime() - self.LastCurTimeAnim) * 7

	-- Animation

	--local pitch = (cos(x * 2)) * clamp(vellen * 0.03, 0, 10)
	--if vellen < 20 then pitch = 0 end 

	--self:ManipulateBonePosition(0, Vector(0, 0, pitch * 0.2))

	local pitch = -(cos(x)) * clamp(vellen * 0.2, 0, 16) * self.MoveDir
	if vellen < 20 then pitch = 0 end 

	self:ManipulateBoneAngles(1, Angle(self.byaw, 0, pitch - dist + 10))
	self:ManipulateBoneAngles(4, Angle(self.byaw, 0, -pitch - dist + 10))

	local pitch = (sin(x)) * clamp(vellen * 0.2, 0, 20)
	if vellen < 20 then pitch = 0 end

	self:ManipulateBoneAngles(2, Angle(0, 0, clamp(pitch, -20, 5) + dist))
	self:ManipulateBoneAngles(5, Angle(0, 0, clamp(-pitch, -20, 5) + dist))

	local pitch = (cos(x)) * clamp(vellen * 0.3, 0, 20) * self.MoveDir
	if vellen < 20 then pitch = 0 end

	self:ManipulateBoneAngles(3, Angle(0, 0, pitch - 10))
	self:ManipulateBoneAngles(6, Angle(0, 0, -pitch - 10))

	self:NextThink(CurTime())
	return true
end