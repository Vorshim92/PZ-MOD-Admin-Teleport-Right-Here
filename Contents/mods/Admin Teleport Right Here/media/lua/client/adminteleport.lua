-- Function to teleport the admin
local function tpToCoord(admin, x, y, z)
    print("Teleporting to:", x, y, z)
    admin:setX(x)
    admin:setY(y)
    admin:setZ(z)
    admin:setLx(x)
    admin:setLy(y)
    admin:setLz(z)
end

-- Save the original function
-- local original_AdmindoMenu = AdminContextMenu.doMenu

local function AdminTeleportContextMenu(player, context, worldobjects, test)
	-- original_AdmindoMenu(player, context, worldobjects, test)
	local admin = getSpecificPlayer(player)
    if not admin or admin:getAccessLevel() ~= "Admin" then
        return
    end

	-- if test then return ISWorldObjectContextMenu.setTest() end

	local square;
	
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		break;
	end

	local x,y,z = square:getX(), square:getY(), square:getZ();
	-- local sqTag = x .. "x" .. y .. "x" .. z;

	-- Get the "Tools" submenu
	-- local debugOption = context:getOptionFromName("Tools")
	-- if debugOption then
	-- 	print("test.lua: debugOption exists")
	-- 	local submenu = context:getSubMenu(debugOption.subOption)
	-- 	if submenu then
	-- 		print("test.lua: submenu exists")
	-- 		-- Use addOptionOnTop to add the option at the first position
	-- 		submenu:addOptionOnTop("Teleport here", admin, tpToCoord, x, y, z)
	-- 		-- if submenu:getOptionFromName("Teleport") then
	-- 		-- submenu:insertOptionBefore("Teleport", "Teleport here", admin, tpToCoord, x, y, z)
	-- 		-- end
	-- 		-- if submenu:getOptionFromName("Spawn Vehicle") then
	-- 		-- submenu:insertOptionAfter("Spawn Vehicle", "Teleport here", admin, tpToCoord, x, y, z)
	-- 		-- end

	-- 	else
	-- 		print("test.lua: submenu not found")
	-- 	end
	-- else
	-- 	print("test.lua: Tools option not found")
	-- end
	context:addOptionOnTop("Teleport Here", admin, tpToCoord, x, y, z)

end

Events.OnFillWorldObjectContextMenu.Add(AdminTeleportContextMenu)
-- Debug console one-liner: Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects) local sq; for i,v in ipairs(worldobjects) do sq = v:getSquare(); break end; local x,y,z = sq:getX(), sq:getY(), sq:getZ(); context:addOptionOnTop("Teleport Here", getSpecificPlayer(player), function(a, xx, yy, zz) a:setX(xx); a:setY(yy); a:setZ(zz); a:setLastX(xx); a:setLastY(yy); a:setLastZ(zz) end, x, y, z) end)