include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Think()
	self.BaseClass.Think(self)

	local i = 0

	for k, v in pairs(self.ValidLegs) do
		if not IsValid(v) then 
			continue 
		end

		local leg = self.Legs[k]

		i = i + 45

		local ang = self:GetAngles()
		local pos = self:GetPos()

		if leg.rel then
			local r = self.ValidLegs[leg.rel]
			pos = r:GetPos()
			ang = r:GetAngles()
		end

		local lpos = leg.pos
		local lang = leg.ang

		local legpos = pos + ang:Forward() * lpos.x + ang:Right() * lpos.y + ang:Up() * lpos.z

		local phys = self:GetPhysicsObject()
		local len = phys:GetVelocity():Length() + phys:GetAngleVelocity():Length()
	
		local pitch = math.cos(CurTime() * 9) * math.Clamp(len * 0.16, 0, 65) * leg.pitch * 2
		pitch = math.Clamp(pitch, 0, 60)
		local yaw = math.sin(CurTime() * 9) * math.Clamp(len * 0.16, 0, 32) * leg.yaw * self.MoveDir * 0.8

		if len < 10 then 
			pitch = 0
			yaw = 0
		end 

		lang = lang + Angle(pitch, yaw, 0)

		v:SetPos(legpos)
		ang:RotateAroundAxis(ang:Up(), lang.y)
		ang:RotateAroundAxis(ang:Right(), lang.p)
		ang:RotateAroundAxis(ang:Forward(), lang.r)
		v:SetAngles(ang)
	end

	self.oldAng = self:GetAngles().y

	self:NextThink(CurTime())
	return true
end