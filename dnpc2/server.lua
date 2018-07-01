local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_kekmememememes")

RegisterServerEvent('drugs:item2')
AddEventHandler('drugs:item2', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if not vRP.tryGetInventoryItem({user_id,"lsd",math.random(3),notify}) then
		TriggerClientEvent('done', player)
		TriggerClientEvent('cancel', player)
	else
		TriggerClientEvent('cancel', player)
	end
end)




RegisterServerEvent('drugs:money2')
AddEventHandler('drugs:money2', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local reward = math.random(600,950)
	vRP.giveMoney({user_id,reward})
end)

RegisterServerEvent('vRP_drugNPC:policia')
AddEventHandler('vRP_drugNPC:policia', function(x,y,z)
     vRP.sendServiceAlert({nil, "police",x,y,z,"Someone is offering me drugs."})
end)


