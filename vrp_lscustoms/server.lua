MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_lscustoms")


MySQL.createCommand("vRP/ls_customs", "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle") -- added for lscustoms
MySQL.createCommand("vRP/lsc_get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND vehicle_plate = @plate") -- lscustoms and plygarages
MySQL.createCommand("vRP/lsc_update_vehicle","UPDATE vrp_user_vehicles SET vehicle_plateindex=@plateindex, vehicle_colorprimary=@primarycolor, vehicle_colorsecondary=@secondarycolor, vehicle_pearlescentcolor=@pearlescentcolor, vehicle_wheelcolor=@wheelcolor, vehicle_neoncolor1=@neoncolor1, vehicle_neoncolor2=@neoncolor2, vehicle_neoncolor3=@neoncolor3, vehicle_windowtint=@windowtint, vehicle_wheeltype=@wheeltype, vehicle_mods0=@mods0, vehicle_mods1=@mods1, vehicle_mods2=@mods2, vehicle_mods3=@mods3, vehicle_mods4=@mods4, vehicle_mods5=@mods5, vehicle_mods6=@mods6, vehicle_mods7=@mods7, vehicle_mods8=@mods8, vehicle_mods9=@mods9, vehicle_mods10=@mods10, vehicle_mods11=@mods11, vehicle_mods12=@mods12, vehicle_mods13=@mods13, vehicle_mods14=@mods14, vehicle_mods15=@mods15, vehicle_mods16=@mods16, vehicle_turbo=@turbo, vehicle_tiresmoke=@tiresmoke, vehicle_xenon=@xenon, vehicle_mods23=@mods23, vehicle_mods24=@mods24, vehicle_neon0=@neon0, vehicle_neon1=@neon1, vehicle_neon2=@neon2, vehicle_neon3=@neon3, vehicle_bulletproof=@bulletproof, vehicle_smokecolor1=@smokecolor1, vehicle_smokecolor2=@smokecolor2, vehicle_smokecolor3=@smokecolor3, vehicle_modvariation=@variation WHERE user_id=@user_id AND vehicle=@vehicle") 

-- init


-- LSCUSTOM SERVER LOCKS -- ADD CLIENT POSTION TOO
local tbl = {
	[1] = {locked = false},
	[2] = {locked = false},
	[3] = {locked = false},
	[4] = {locked = false},
	[5] = {locked = false},
}
RegisterServerEvent('lockGarage')
AddEventHandler('lockGarage', function(b,garage)
	tbl[tonumber(garage)].locked = b
	TriggerClientEvent('lockGarage',-1,tbl)
	--print(json.encode(tbl))
end)
RegisterServerEvent('getGarageInfo')
AddEventHandler('getGarageInfo', function()
TriggerClientEvent('lockGarage',-1,tbl)
--print(json.encode(tbl))
end)

RegisterServerEvent('lscustoms:payGarage')
AddEventHandler('lscustoms:payGarage', function(button)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  if button.costs ~= nil then
	if vRP.tryFullPayment({user_id,tonumber(button.costs)}) then 
	  TriggerClientEvent("lscustoms:buttonSelected", player, button)
	else
	  TriggerClientEvent("lscustoms:payGarageFalse", player)
	end
  else
    TriggerClientEvent("lscustoms:buttonSelected", player, button)
  end
end)
RegisterServerEvent('lscustoms:UpdateVeh2')
AddEventHandler('lscustoms:UpdateVeh2', function(vehicle, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, mods)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local vehicle = vehicle
	local mods = mods
    local primarycolor = primarycolor
    local plate = plate
    local secondarycolor = secondarycolor
    local pearlescentcolor = pearlescentcolor
    local wheelcolor = wheelcolor
		if plate then
			-- MySQL.createCommand("vRP/lsc_update_vehicle","UPDATE vrp_user_vehicles SET vehicle_plateindex=@plateindex, vehicle_colorprimary=@primarycolor, vehicle_colorsecondary=@secondarycolor, vehicle_pearlescentcolor=@pearlescentcolor, vehicle_wheelcolor=@wheelcolor, vehicle_neoncolor1=@neoncolor1, vehicle_neoncolor2=@neoncolor2, vehicle_neoncolor3=@neoncolor3, vehicle_windowtint=@windowtint, vehicle_wheeltype=@wheeltype, vehicle_mods0=@mods0, vehicle_mods1=@mods1, vehicle_mods2=@mods2, vehicle_mods3=@mods3, vehicle_mods4=@mods4, vehicle_mods5=@mods5, vehicle_mods6=@mods6, vehicle_mods7=@mods7, vehicle_mods8=@mods8, vehicle_mods9=@mods9, vehicle_mods10=@mods10, vehicle_mods11=@mods11, vehicle_mods12=@mods12, vehicle_mods13=@mods13, vehicle_mods14=@mods14, vehicle_mods15=@mods15, vehicle_mods16=@mods16, vehicle_turbo=@turbo, vehicle_tiresmoke=@tiresmoke, vehicle_xenon=@xenon, vehicle_mods23=@mods23, vehicle_mods24=@mods24, vehicle_neon0=@neon0, vehicle_neon1=@neon1, vehicle_neon2=@neon2, vehicle_neon3=@neon3, vehicle_bulletproof=@bulletproof, vehicle_smokecolor1=@smokecolor1, vehicle_smokecolor2=@smokecolor2, vehicle_smokecolor3=@smokecolor3, vehicle_modvariation=@variation WHERE user_id=@user_id AND vehicle=@vehicle") 
			MySQL.createCommand("vRP/plate","update vrp_user_vehicles set vehicle_plate = '"..plate.."' where vehicle='".. vehicle .."' and user_id= '"..user_id.."'")
			MySQL.query("vRP/plate")
		end
		if primarycolor then
			-- MySQL.createCommand("vRP/lsc_update_vehicle","UPDATE vrp_user_vehicles SET vehicle_plateindex=@plateindex, vehicle_colorprimary=@primarycolor, vehicle_colorsecondary=@secondarycolor, vehicle_pearlescentcolor=@pearlescentcolor, vehicle_wheelcolor=@wheelcolor, vehicle_neoncolor1=@neoncolor1, vehicle_neoncolor2=@neoncolor2, vehicle_neoncolor3=@neoncolor3, vehicle_windowtint=@windowtint, vehicle_wheeltype=@wheeltype, vehicle_mods0=@mods0, vehicle_mods1=@mods1, vehicle_mods2=@mods2, vehicle_mods3=@mods3, vehicle_mods4=@mods4, vehicle_mods5=@mods5, vehicle_mods6=@mods6, vehicle_mods7=@mods7, vehicle_mods8=@mods8, vehicle_mods9=@mods9, vehicle_mods10=@mods10, vehicle_mods11=@mods11, vehicle_mods12=@mods12, vehicle_mods13=@mods13, vehicle_mods14=@mods14, vehicle_mods15=@mods15, vehicle_mods16=@mods16, vehicle_turbo=@turbo, vehicle_tiresmoke=@tiresmoke, vehicle_xenon=@xenon, vehicle_mods23=@mods23, vehicle_mods24=@mods24, vehicle_neon0=@neon0, vehicle_neon1=@neon1, vehicle_neon2=@neon2, vehicle_neon3=@neon3, vehicle_bulletproof=@bulletproof, vehicle_smokecolor1=@smokecolor1, vehicle_smokecolor2=@smokecolor2, vehicle_smokecolor3=@smokecolor3, vehicle_modvariation=@variation WHERE user_id=@user_id AND vehicle=@vehicle") 
			MySQL.createCommand("vRP/primarycolor","update vrp_user_vehicles set vehicle_colorprimary ='".. primarycolor .."' where vehicle='".. vehicle .."' and user_id= '"..user_id.."'")
			MySQL.query("vRP/primarycolor")
		end
		if secondarycolor then
			MySQL.createCommand("vRP/secondarycolor","update vrp_user_vehicles set vehicle_colorsecondary ='".. secondarycolor .."' where vehicle='".. vehicle .."' and user_id= '"..user_id.."'")
			MySQL.query("vRP/secondarycolor")
		end
		if pearlescentcolor  then
			MySQL.createCommand("vRP/pearlescentcolor","update vrp_user_vehicles set vehicle_pearlescentcolor ='".. pearlescentcolor .."' where vehicle='".. vehicle .."' and user_id= '"..user_id.."'")
			MySQL.query("vRP/pearlescentcolor")
		end
		if wheelcolor then
			MySQL.createCommand("vRP/wheelcolor","update vrp_user_vehicles set vehicle_wheelcolor ='".. wheelcolor .."' where vehicle='".. vehicle .."' and user_id= '"..user_id.."'")
			MySQL.query("vRP/wheelcolor")
		end

		for i,t in pairs(mods) do
        	print('Attempting to update mods')
        	if t.mod ~= nil then
           		print("Mod#: "..i.." Value: " .. t.mod)
			    MySQL.createCommand("vRP/mod"..i.."","update vrp_user_vehicles set mod"..i.." = '"..t.mod.."' where vehicle='"..vehicle.."' and user_id= '"..user_id.."'")
				MySQL.query("vRP/mod"..i.."")
        	end
		end
end)
