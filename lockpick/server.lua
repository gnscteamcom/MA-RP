local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_static_menus")
 
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")
local lang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
 
 
 

-- repair nearest vehicle
local choice_lockpick = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    -- anim and repair
    if vRP.tryGetInventoryItem(user_id,"lockpick",1,true) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
      SetTimeout(15000, function()
        vRPclient.vc_toggleLock(player, {vtype})
        vRPclient.stopAnim(player,{false})
      end)
    end
  end
end}
 
 
-- REGISTER MAIN MENU CHOICES
vRP.registerMenuBuilder({"main", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}
   
    if vRP.hasPermission({user_id,"player.lockpick"}) then
      choices["lockpick"] = choice_lockpick
    end
   
    add(choices)
  end
end})

 
