include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

local vals = {
	1,
	-1,
	1,
	-1
}
function ENT:Think()
	self.BaseClass.Think(self)

	local phys = self:GetPhysicsObject()
	local len = phys:GetVelocity():Length() + phys:GetAngleVelocity():Length()

	local dir = self.MoveDir != 0 and self.MoveDir or 1
	local yaw = math.Clamp(math.sin(CurTime() * 32) * math.Clamp(len * 0.2, 0, 75), -30, 30) * dir
	local pitch = math.Clamp(math.sin(CurTime() * 64) * math.Clamp(len * 0.2, 0, 75), -30, 30) * dir
	
	for i = 1, 4 do
		local val = vals[i]
		yaw = yaw * val
		pitch = pitch * val

		if len < 10 then 
			yaw = 0 
		end 

		self:ManipulateBoneAngles(self:LookupBone("r" .. i), Angle(yaw, 0, 0))
		self:ManipulateBoneAngles(self:LookupBone("l" .. i), Angle(yaw, 0, 0))

		self:ManipulateBoneAngles(self:LookupBone("r2" .. i), Angle(0, pitch, 0))
		self:ManipulateBoneAngles(self:LookupBone("l2" .. i), Angle(0, pitch, 0))
	end

	self:NextThink(CurTime())
	return true
end