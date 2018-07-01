
-- Date: 02/11/2018
-- Time: 22:47
--




local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Speed Control",
    menu_subtitle = "Categories",
    color_r = 127,
    color_g = 200,
    color_b = 255,
}


------------------------------------------------------------------------------------------------------------------------


function PersonnalMenu()
    options.menu_subtitle = "CATEGORIES"  
    ClearMenu()
    Menu.addButton("Speed Limit", "speedo", nil)  
    Menu.addButton("Door Control", "portieres", nil)
	  Menu.addButton("Close the menu", "CloseMenu", nil)
end



function speedo()
    options.menu_subtitle = "LIMITEUR"
    ClearMenu()
    Menu.addButton("Disable", "vitesse", 0)
    Menu.addButton("35 ~g~MPH", "vitesse", "56.327")
    Menu.addButton("45 ~g~MPH", "vitesse", "72.4205")
    Menu.addButton("55 ~g~MPH", "vitesse", "88.5139")
    Menu.addButton("65 ~g~MPH", "vitesse", "104.607")
    Menu.addButton("85 ~r~MPH", "vitesse", "136.794")
    Menu.addButton("95 ~r~MPH", "vitesse", "152.888")
	Menu.addButton("MAX ~r~MPH", "vitesse", 0)
    Menu.addButton("Main Menu", "PersonnalMenu", nil)
end

function portieres()
    options.menu_subtitle = "CATEGORIES"  
    ClearMenu()
    Menu.addButton("Hood", "capot", nil)
    Menu.addButton("Trunk", "coffre", nil)
    Menu.addButton("Front Doors", "avant", nil)    
    Menu.addButton("Rear Doors", "arriere", nil)
    Menu.addButton("All Doors", "toute", nil)    
	  Menu.addButton("Main Menu", "PersonnalMenu", nil)
end

function avant()
    options.menu_subtitle = "PORTIERES"  
    ClearMenu()
    Menu.addButton("Left Front", "avantgauche", nil)
    Menu.addButton("Right Front", "avantdroite", nil)
	Menu.addButton("Back", "portieres", nil)
end

function arriere()
    options.menu_subtitle = "PORTIERES"  
    ClearMenu()
    Menu.addButton("Rear Left", "arrieregauche", nil)
    Menu.addButton("Rear Right", "arrieredroite", nil)
	Menu.addButton("Back", "portieres", nil)
end

function CloseMenu()
    Menu.hidden = not Menu.hidden
end

------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
function drawTxt(options)
    SetTextFont(options.font)
    SetTextProportional(0)
    SetTextScale(options.scale, options.scale)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry('STRING')
    AddTextComponentString(options.text)
    DrawRect(options.xBox,options.y,options.width,options.height,0,0,0,150)
    DrawText(options.x - options.width/2 + 0.005, options.y - options.height/2 + 0.0028)
end
function DisplayHelpText(str)
    SetTextComponentFormat('STRING')
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function notifs(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString( msg )
    DrawNotification(false, false)
end

--------------------------------------------------- NUI CALLBACKS ------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function vitesse(vit)
    speed = vit/3.6
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)
   
    local vehicleModel = GetEntityModel(vehicle)
    local float Max = GetVehicleMaxSpeed(vehicleModel)
   
    if (vit == 0) then
    SetEntityMaxSpeed(vehicle, Max)
    exports.pNotify:SendNotification({text = "Speed Limit Off", type = "error", layout = "bottomRight", timeout = math.random(4000, 8000)})
    else
    SetEntityMaxSpeed(vehicle, speed)
    exports.pNotify:SendNotification({text = "Speed Limit Set", type = "success", layout = "bottomRight", timeout = math.random(4000, 8000)})
    PersonnalMenu()
    end
end


function capot()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 4, false)
       else
         SetVehicleDoorOpen(playerVeh, 4, false)
         frontleft = true        
      end
   end
end

function coffre()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 5, false)
       else
         SetVehicleDoorOpen(playerVeh, 5, false)
         frontleft = true        
      end
   end
end

function maxspeed()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   enableCruise = not enableCruise -- inverts bool
   cruiseSpeed = GetEntitySpeed(veh)  
   GetEntitySpeed(playerVeh, 10)
end

function avantgauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 0, false)
       else
         SetVehicleDoorOpen(playerVeh, 0, false)
         frontleft = true        
      end
   end
end

function MyPed()
   return GetPlayerPed(-1)
end


function avantdroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 1, false)
       else
         SetVehicleDoorOpen(playerVeh, 1, false)
         frontleft = true        
      end
   end
end

function arrieredroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 3, false)
       else
         SetVehicleDoorOpen(playerVeh, 3, false)
         frontleft = true        
      end
   end
end

function toute()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 5, false)        
         SetVehicleDoorShut(playerVeh, 4, false)
         SetVehicleDoorShut(playerVeh, 3, false)
         SetVehicleDoorShut(playerVeh, 2, false)
         SetVehicleDoorShut(playerVeh, 1, false)
         SetVehicleDoorShut(playerVeh, 0, false)         
       else
         SetVehicleDoorOpen(playerVeh, 5, false)        
         SetVehicleDoorOpen(playerVeh, 4, false)
         SetVehicleDoorOpen(playerVeh, 3, false)
         SetVehicleDoorOpen(playerVeh, 2, false)
         SetVehicleDoorOpen(playerVeh, 1, false)
         SetVehicleDoorOpen(playerVeh, 0, false)  
         frontleft = true        
      end
   end
end

function arrieregauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 2, false)
       else
         SetVehicleDoorOpen(playerVeh, 2, false)
         frontleft = true        
      end
   end
end

function moteurOn()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
   exports.pNotify:SendNotification({text = "Moteur allumer", type = "success", layout = "bottomRight", timeout = math.random(4000, 8000)})
end

function moteurOff()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
   exports.pNotify:SendNotification({text = "Moteur éteint", type = "error", layout = "bottomRight", timeout = math.random(4000, 8000)})
end

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

------------------------------------------------------------------------------------------------------------------------
function drawMenuRight(txt,x,y,selected)
  local menu = personnelmenu.menu
  SetTextFont(menu.font)
  SetTextProportional(0)
  SetTextScale(menu.scale, menu.scale)
  SetTextRightJustify(1)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028) 
end

--------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        if IsControlJustPressed(1, 244) then
            PersonnalMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
			else
			end
        end
    end
end)

local working
------------------------------------------------------------------------------------------------------------------------
