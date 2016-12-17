ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Console"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

ENT.Useable = true
ENT.Hp = 120
ENT.MaxSymbols = 65

function ENT:ChangeLine(newstr, line)
	local line = line or #self.Cache
	local oldstr = self.Cache[line]

	if not oldstr then return end

	local max = self.MaxSymbols
	local len = string.len(newstr)

	oldstr.Text = string.sub(newstr, 0, max)

	if len > max then
		local newstr = string.sub(newstr, max + 1)
		self:AddLine(newstr, oldstr.Color, line + 1)
	end
end

function ENT:AddLine(str, color, pos)
	if CLIENT then
		if not self.Cache then self.Cache = { } end

		table.insert(self.Cache, pos or #self.Cache + 1, { Text = "", Color = color or Color(255, 255, 255) })
		self:ChangeLine(str)
	else
		color = color or Color(255, 255, 255)

		net.Start("dronesrewrite_addline")
			net.WriteEntity(self)
			net.WriteString(str)
			net.WriteColor(color)
		net.Broadcast()
	end
end
