local GetService = setmetatable({}, {
	__index = function(self, key)
		return game:GetService(key)
	end
})
getgenv().vis = {
    nightmode = false,
    drainmode = false,
    autoset = false,
    airshit = true,
    key = "v",
    nightmodeamount = -0.1,
    spedglitch = false,
    spedkey = "v",
    crosshair = true,
    hideuser = false,
    removebar = false,
    dot = false,
    camera = false,
    distance = 100,
    target = false
    }
    getgenv().colors = {
        boxcolor = Color3.fromRGB(255,255,255),
        healthcolor = Color3.fromRGB(0,255,0),
        namecolor = Color3.fromRGB(255,255,255),
        toolcolor = Color3.fromRGB(255,255,255),
        crosshaircolor = Color3.fromRGB(255,255,255)
        }
       

-- thusky old lock
local CC = game:GetService"Workspace".CurrentCamera
    local Plr
    local enabled = falseWD
    local accomidationfactor = 0.200
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
getgenv().target = false
getgenv().notifi = true
getgenv().airshot = true
_G.PART = "UpperTorso"
_G.PART2 = "UpperTorso"
_G.KEY = "q"
_G.FRAME = Vector3.new(0,20,0)
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = true
        local a = Instance.new("Frame", e)
        a.Size = UDim2.new(0.5, 0, 0.5, 0)
        a.Transparency = 0
        a.BackgroundTransparency = 0
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        g.CornerRadius = UDim.new(50, 50)
        return(e)
    end

    
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(_G.PART), Color3.fromRGB(107, 184, 255), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(_G.PART) end)


        spawn(function()
            while wait() do
                if player.Character then
                    TextLabel.Text = player.Name..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                end
            end
        end)
    end

    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end

    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)

    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        placemarker.Size = Vector3.new(11, 8, 11)
        placemarker.Transparency = 0.75
        makemarker(placemarker, placemarker, Color3.fromRGB(255, 255, 255), 0.40, 0)
    end)    

mouse.KeyDown:Connect(function(k)
    if k ~= _G.KEY then return end
    if enabled and getgenv().target then
        enabled = false
     if getgenv().notifi == true then
  game.StarterGui:SetCore("SendNotification", {
                        Title = "immamantium.club";
                        Text = "unlocked",
                        Duration = 1
    })
        end
        guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       
        
    else
        if getgenv().target then
        enabled = true 
        Plr = getClosestPlayerToCursor()
             if getgenv().notifi == true then
                game.StarterGui:SetCore("SendNotification", {
                        Title = "immamantium.club";
                        Text = "target: "..tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 1
                    })
        end
        guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end    
end
end)

    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = math.huge

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(_G.PART) then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end

    game:GetService"RunService".Stepped:connect(function()
        if enabled and getgenv().target and Plr.Character and Plr.Character:FindFirstChild(_G.PART) then
            placemarker.CFrame = CFrame.new(Plr.Character[_G.PART].Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if enabled and getgenv().target and getgenv().vis.target and Plr.Character and Plr.Character:FindFirstChild(_G.PART) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character[_G.PART].Position + _G.FRAME + (Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
            end
    end)

    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
              local args = {...}
        if getgenv().target == true and enabled  and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] = Plr.Character[_G.PART].Position+(Plr.Character[_G.PART].Velocity*accomidationfactor)
        
             return old(unpack(args))
        end
        return old(...)
    end)

local RunService = GetService.RunService
local Players = GetService.Players
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = workspace.CurrentCamera
local UserInputService = GetService.UserInputService
local GuiInset = GetService.GuiService:GetGuiInset()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/turbostain/gavnozalupa/main/lib"))()
local window = library:new({Name = "immamantium.club",accent = Color3.fromRGB(130,130,130),key = "Insert",textsize = {15,13,10}})
local tab = window:page({Name = "aiming"})
tab:open()

_G.KEY = "q"
_G.PART = "Head"
_G.PART2 = "LowerTorso"
_G.PART3 = "LeftFoot"
_G.PART4 = "LowerTorso"
_G.NIGGER = 20
_G.FAGNIGGA = 3.5
_G.RUSLANCHIK = 1
_G.Frame = Vector3.new(0,0.53,0)
_G.Frame2 = Vector3.new(0,0.53,0)
_G.Frame3 = Vector3.new(0,0.53,0)
_G.WEAPON = false
_G.NAME = false
_G.HEALTH = false
_G.BOX = false


	game:GetService("RunService").RenderStepped:connect(
function()
if getgenv().vis.nightmode == true then
    game:GetService("Lighting").ColorCorrection.Brightness = getgenv().vis.nightmodeamount
end
if getgenv().vis.nightmode == false then
    game:GetService("Lighting").ColorCorrection.Brightness = 0
end
if getgenv().vis.drainmode == true then
game:GetService("Lighting").ExposureCompensation = 5
end
if getgenv().vis.drainmode == false then
game:GetService("Lighting").ExposureCompensation = 0
end
if getgenv().vis.crosshair == true then
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = getgenv().colors.crosshaircolor
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = getgenv().colors.crosshaircolor
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = getgenv().colors.crosshaircolor
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = getgenv().colors.crosshaircolor
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = getgenv().colors.crosshaircolor
end
if getgenv().vis.crosshair == false then
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.fromRGB(255,255,255)
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.fromRGB(255,255,255)
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.fromRGB(255,255,255)
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.fromRGB(255,255,255)
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Color3.fromRGB(255,255,255)
end
if getgenv().vis.hideuser == true then
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Leaderboard.PlayerScroll.TextLabel.Visible = false
end
if getgenv().vis.hideuser == false then
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Leaderboard.PlayerScroll.TextLabel.Visible = true
end
if getgenv().vis.removebar == false then 
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Crew.Visible = true
end
if getgenv().vis.removebar == true then
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Crew.Visible = false
end
if getgenv().vis.dot == true then

	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = false
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = false
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = false
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = false
end
if getgenv().vis.dot == false then
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = true
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = true
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = true
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = true
    end
if getgenv().vis.autoset == true then
    local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Value = tostring(PingStats)
    local PingValue = Value:split(" ")
    local PingNumber = tonumber(PingValue[1])

       accomidationfactor = PingNumber / 1000 + 0.037
       accomidationfactor2 = PingNumber / 1000 + 0.037
end
if getgenv().vis.camera == true then
    Camera.Position = (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) and plr.Character:FindFirstChild("HumanoidRootPart").Position or Vector3.new(0, 0, 0)
    end

if vis.airshit == true then
            if Plr.Character.Humanoid.FloorMaterial == Enum.Material.Freefall then
                        _G.PART = _G.PART3
                       
                    else
                        _G.PART = _G.PART2
                       
            end
                end
end)

Mouse.KeyDown:connect(function(Key)
    local cf2Key = getgenv().vis.spedkey:lower()
    if (Key == cf2Key) then
        if (getgenv().vis.spedglitch) then
            SpeedGlitch = not SpeedGlitch
					if SpeedGlitch == true then
					
						repeat game:GetService("RunService").Heartbeat:wait()
							keypress(0x49)
							game:GetService("RunService").Heartbeat:wait()
							keypress(0x4F)
							game:GetService("RunService").Heartbeat:wait()
							keyrelease(0x49)
							game:GetService("RunService").Heartbeat:wait()
							keyrelease(0x4F)
							game:GetService("RunService").Heartbeat:wait()
						until SpeedGlitch == false
					end
				end
    end
		end)

function Alive(Player)
	if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("Head") ~= nil then
		return true
	end
	return false
end

    getgenv().OldAimPart = "UpperTorso"
    getgenv().AimPart = "UpperTorso" -- For R15 Games: {UpperTorso, LowerTorso, HumanoidRootPart, Head} | For R6 Games: {Head, Torso, HumanoidRootPart}  
    getgenv().AimlockKey = "q"
    getgenv().AirPart = "LowerTorso"
    getgenv().AimRadius = 30 -- How far away from someones character you want to lock on at
    getgenv().ThirdPerson = true 
    getgenv().FirstPerson = true
    getgenv().TeamCheck = false -- Check if Target is on your Team (True means it wont lock onto your teamates, false is vice versa) (Set it to false if there are no teams)
    getgenv().PredictMovement = true -- Predicts if they are moving in fast velocity (like jumping) so the aimbot will go a bit faster to match their speed 
    getgenv().PredictionVelocity = 6.1
    getgenv().CheckIfJumped = true
    getgenv().Smoothness = false
    getgenv().SmoothnessAmount = 0.0369

    local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
    local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
    local Aimlock, MousePressed, CanNotify = false, false, false;
    local AimlockTarget;
    local OldPre;
    

    
    getgenv().WorldToViewportPoint = function(P)
        return Camera:WorldToViewportPoint(P)
    end
    
    getgenv().WorldToScreenPoint = function(P)
        return Camera.WorldToScreenPoint(Camera, P)
    end
    
    getgenv().GetObscuringObjects = function(T)
        if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then 
            local RayPos = workspace:FindPartOnRay(RNew(
                T[getgenv().AimPart].Position, Client.Character.Head.Position)
            )
            if RayPos then return RayPos:IsDescendantOf(T) end
        end
    end
    
    getgenv().GetNearestTarget = function()
        -- Credits to whoever made this, i didnt make it, and my own mouse2plr function kinda sucks
        local players = {}
        local PLAYER_HOLD  = {}
        local DISTANCES = {}
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= Client then
                table.insert(players, v)
            end
        end
        for i, v in pairs(players) do
            if v.Character ~= nil then
                local AIM = v.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                elseif getgenv().TeamCheck == false and v.Team == Client.Team then 
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                end
            end
        end
        
        if unpack(DISTANCES) == nil then
            return nil
        end
        
        local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
        if L_DISTANCE > getgenv().AimRadius then
            return nil
        end
        
        for i, v in pairs(PLAYER_HOLD) do
            if v.diff == L_DISTANCE then
                return v.plr
            end
        end
        return nil
    end
    
    Mouse.KeyDown:Connect(function(a)
        if not (Uis:GetFocusedTextBox()) then 
            if a == AimlockKey and AimlockTarget == nil then
                pcall(function()
                    if MousePressed ~= true then MousePressed = true end 
                    local Target;Target = GetNearestTarget()
                    if Target ~= nil then 
                        AimlockTarget = Target
                    end
                end)
            elseif a == AimlockKey and AimlockTarget ~= nil then
                if AimlockTarget ~= nil then AimlockTarget = nil end
                if MousePressed ~= false then 
                    MousePressed = false 
                end
            end
        end
    end)
    
    RService.RenderStepped:Connect(function()
        if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        end
        if Aimlock == true and MousePressed == true then 
            if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
                if getgenv().FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                                
                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                            end
                        elseif getgenv().PredictMovement == false then 
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)

                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                            end
                        end
                    end
                end
            end
        end
         if CheckIfJumped == true then
       if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Freefall then
           getgenv().AimPart = getgenv().AirPart
       else
         getgenv().AimPart = getgenv().OldAimPart
       end
    end
end)


local aimsec = tab:section({Name = "aimlock",side = "left"})
aimsec:toggle({name = "enabled",default = false,callback = function(L_122_arg0)
    Aimlock = L_122_arg0
end})
aimsec:textbox({name = "bind",def = "q",callback = function(L_123_arg0)
    getgenv().AimlockKey = L_123_arg0
    end})
aimsec:label({name = "settings"})
aimsec:toggle({name = "smoothness",default = false,callback = function(ibroke)
    getgenv().Smoothness = ibroke
end})
aimsec:textbox({name = "prediction",def = "6.1",callback = function(L_124_arg0)
    getgenv().PredictionVelocity = L_124_arg0
end})
aimsec:textbox({name = "smoothness amount",def = "0.0369",callback = function(value3333)
  getgenv().SmoothnessAmount = value3333
end})
aimsec:slider({name = "radius",decimals = true,min = 1, max = 100,def = 30,measurement = "",callback = function(faggqq)
      getgenv().AimRadius = faggqq
    end})
aimsec:label({name = "hitboxes"})

aimsec:dropdown({name = "main hitbox",default = "2",options = {"Head","UpperTorso","LowerTorso","HumanoidRootPart"},callback = function(L_125_arg0)
	getgenv().AimPart = L_125_arg0
	getgenv().OldAimPart = L_125_arg0
end})
aimsec:dropdown({name = "airshot hitbox",default = "2",options = {"Head","UpperTorso","LowerTorso","RightFoot","RightUpperLeg"},callback = function(L_125_arg0vv)
	getgenv().AirPart = L_125_arg0vv
end})

local legitsec = tab:section({Name = "target aim",side = "right"})
legitsec:toggle({name = "enabled",default = false,callback = function(fuckniggers334q)
    getgenv().target = fuckniggers334q
end})
legitsec:textbox({name = "bind",def = "q",callback = function(L_1a22)
    	_G.KEY = L_1a22
end})
legitsec:textbox({name = "prediction",def = "0.200",callback = function(L_1a22)
    	accomidationfactor = L_1a22
end})
legitsec:dropdown({name = "hitbox",default = "2",options = {"Head","UpperTorso","LowerTorso","HumanoidRootPart"},callback = function(L_125_arg0)
	_G.PART = L_125_arg0
end})

legitsec:label({name = "settings"})
legitsec:slider({name = "hitbox transparency",decimals = true, min = 0, max = 99, def = 75,measurement = "%",callback = function(Value2)
        placemarker.Transparency = tonumber("0." .. Value2)
end})
legitsec:toggle({name = "wanna be target strafe",default = false,callback = function(fuckniggers334q)
     getgenv().vis.target = fuckniggers334q
end})
legitsec:slider({name = "height",decimals = true, min = 0, max = 90, def = 20,measurement = "",callback = function(value)
       _G.FRAME = Vector3.new(0,value,0)
end})








local VelocityCounter = Drawing.new("Text")
VelocityCounter.Text = ""
VelocityCounter.Center = true
VelocityCounter.Outline = true
VelocityCounter.Color = Color3.new(1,1,1)
VelocityCounter.Font = 3
VelocityCounter.Position = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y-130)
VelocityCounter.Size = 20
VelocityCounter.Visible = false
spawn(function()
repeat
wait(0)
local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
ping = math.floor(ping)
VelocityCounter.Text = ping.."ms"
until VelocityCounter == nil
end)
local esptab2 = window:page({name = "esp"})
local espsec = esptab2:section({name = "toggles",side = "left"})
espsec:toggle({name = "boxes",default = false,callback = function(fuckniggers3)
    _G.BOX = fuckniggers3
end})
espsec:toggle({name = "names",default = false,callback = function(fuckniggers3)
    _G.NAME = fuckniggers3
end})
espsec:toggle({name = "healths",default = false,callback = function(fuckniggers3)
    _G.HEALTH = fuckniggers3
end})
espsec:toggle({name = "weapons",default = false,callback = function(fuckniggers3)
    _G.WEAPON = fuckniggers3
end})
local espsecv = esptab2:section({name = "settings",side = "right"})
espsecv:slider({name = "distance",decimals = true, min = 0, max = 500, def = 100,measurement = "",callback = function(faggv)
      getgenv().vis.distance = faggv
end})
local esptab = window:page({name = "visuals"})
local main22 = esptab:section({name = "world",side = "left"})
main22:slider({name = "contrast",decimals = false,min = 0.05, max = 1,def = 0.05,measurement = "",callback = function(fagg)
      game:GetService("Lighting").ColorCorrection.Contrast = fagg
    end})
main22:slider({name = "saturation",decimals = false,min = 0.1, max = 1,def = 0.1,measurement = "",callback = function(faggv)
      game:GetService("Lighting").ColorCorrection.Saturation = faggv
end})
main22:label({name = ""})
main22:toggle({name = "nightmode",default = false,callback = function(fuckniggers3)
    getgenv().vis.nightmode = fuckniggers3
end})
main22:slider({name = "ampfiler",decimals = false,min = -0.4, max = 0,def = -0.01,measurement = "",callback = function(faggq)
      getgenv().vis.nightmodeamount = faggq
    end})
main22:label({name = ""})
main22:toggle({name = "drain mode",default = false,callback = function(fuckniggers333)
    getgenv().vis.drainmode = fuckniggers333
end})
local main23 = esptab:section({name = "uis & etc",side = "right"})
main23:toggle({name = "ping counter",default = false,callback = function(fuckniggers3)
    VelocityCounter.Visible = fuckniggers3
end})
main23:toggle({name = "hide user in leaderboard",default = false,callback = function(value33vv)
    getgenv().vis.hideuser = value33vv
end})
main23:toggle({name = "hide settings frame",default = false,callback = function(ssssss)
    getgenv().vis.removebar = ssssss
end})
main23:label({name = "crosshair"})

main23:toggle({name = "dot crosshair",default = false,callback = function(fuckniggers33555v)
    getgenv().vis.dot = fuckniggers33555v
end})
main23:label({name = ""})
main23:button({name = "force field gun",callback = function()
    local Local = game.GetService(game, "Players").LocalPlayer
    Local.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.ForceField
    end})
local tabq = window:page({name = "toggles"})
local Zenaki = false




    game:GetService("RunService").RenderStepped:Connect(function()
    if Zenaki == true then

     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * _G.RUSLANCHIK
    end
    
end)


local userInput = game:GetService('UserInputService')
local runService = game:GetService('RunService')
Mouse.KeyDown:connect(function(Key)
    local cfKey = getgenv().vis.key:lower()
    if (Key == cfKey) then
        if (getgenv().vis.toggled) then
            Zenaki = not Zenaki
        end
    end
end
)

local mainq = tabq:section({name = "main",side = "left"})
mainq:keybind({name = "force reset bind",def = "none",callback = function()
    	for L_170_forvar0, L_171_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if L_171_forvar1:IsA("BasePart") then
			L_171_forvar1:Destroy()
		end
	end
    end})
mainq:button({name = "hitbox breaker",callback = function()
	local L_418_ = game.Players.LocalPlayer
	L_418_.Character.Head:BreakJoints()
	L_418_.Character.Head.Position = Vector3.new(0, 999999999999, 0)
	game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
	game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
end})
mainq:label({name = ""})
mainq:toggle({name = "cfspeed",default = false,callback = function(fuckniggers34)
    getgenv().vis.toggled = fuckniggers34
end})
mainq:textbox({name = "bind",def = "",callback = function(L_1a22)
    	getgenv().vis.key = L_1a22
    end})
mainq:slider({name = "amount",decimals = false,min = -3, max = 3,def = 2,measurement = "",callback = function(brokeeb)
     _G.RUSLANCHIK = brokeeb
end})
mainq:label({name = ""})
mainq:toggle({name = "macro",default = false,callback = function(fuckniggers334)
    getgenv().vis.spedglitch = fuckniggers334
end})
mainq:textbox({name = "bind",def = "",callback = function(L_1a22)
    	getgenv().vis.spedkey = L_1a22
end})
local mainqq = tabq:section({name = "gun position",side = "right"})
local gripposx = {["Value"] = 0.60}
local gripposy = {["Value"] = 0}
local gripposz = {["Value"] = 0}
local xslider = mainqq:slider({name = "x",decimals = false,min = 0.60, max = 10,def = 0,measurement = "",callback = function(value)
          local Local = game.GetService(game, "Players").LocalPlayer
    gripposx["Value"] = value
    Local.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.new(value, gripposy["Value"], gripposz["Value"])
end})
local yslider = mainqq:slider({name = "y",decimals = true,min = -10, max = 10,def = 0,measurement = "",callback = function(value)
   local Local = game.GetService(game, "Players").LocalPlayer
    gripposy["Value"] = value
    Local.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.new(gripposx["Value"], value, gripposz["Value"])
end})

local zslider = mainqq:slider({name = "z",decimals = true,min = 0, max = 10,def = 0,measurement = "",callback = function(value)
local Local = game.GetService(game, "Players").LocalPlayer
    gripposz["Value"] = value
    Local.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.new(gripposx["Value"], gripposy["Value"], value)
end})
mainqq:button({name = "reset position",callback = function()
    xslider:set(0.59,false)
    yslider:set(0,false)
    zslider:set(0,false)
    gripposx = {["Value"] = 0.60}
    gripposy = {["Value"] = 0}
    gripposz = {["Value"] = 0}
    local Local = game.GetService(game, "Players").LocalPlayer
    Local.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.new(gripposx["Value"], gripposy["Value"], value)
    end})



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local PlayerDrawings = {}
local Utility = {}

Utility.Settings = {
Line = {
Thickness = 1,
Color = Color3.fromRGB(0, 255, 0)
},
Text = {
Size = 13,
Center = true,
Outline = true,
Font = Drawing.Fonts.Plex,
Color = Color3.fromRGB(255, 255, 255)
},
Square = {
Thickness = 1,
Color = Color3.fromRGB(255, 255, 255),
Filled = false,
},
Triangle = {
Color = Color3.fromRGB(255, 255, 255),
Filled = true,
Visible = false,
Thickness = 1,
}
}
function Utility.New(Type, Outline, Name)
local drawing = Drawing.new(Type)
for i, v in pairs(Utility.Settings[Type]) do
drawing[i] = v
end
if Outline then
drawing.Color = Color3.new(0,0,0)
drawing.Thickness = 3
end
return drawing
end
function Utility.Add(Player)
if not PlayerDrawings[Player] then
PlayerDrawings[Player] = {
Name = Utility.New("Text", nil, "Name"),
Distance = Utility.New("Text", nil, "Distance"),
Tool = Utility.New("Text", nil, "Tool"),
BoxOutline = Utility.New("Square", true, "BoxOutline"),
Box = Utility.New("Square", nil, "Box"),
HealthOutline = Utility.New("Line", true, "HealthOutline"),
Health = Utility.New("Line", nil, "Health")
}
end
end

for _,Player in pairs(Players:GetPlayers()) do
if Player ~= LocalPlayer then
Utility.Add(Player)
end
end
Players.PlayerAdded:Connect(Utility.Add)
Players.PlayerRemoving:Connect(function(Player)
if PlayerDrawings[Player] then
for i,v in pairs(PlayerDrawings[Player]) do
if v then
v:Remove()
end
end

PlayerDrawings[Player] = nil
end
end)

local ESPLoop = RunService:BindToRenderStep("updateESP", 205, function()
for _,Player in pairs (Players:GetPlayers()) do
local PlayerDrawing = PlayerDrawings[Player]
if not PlayerDrawing then continue end

for _,Drawing in pairs (PlayerDrawing) do
Drawing.Visible = false
end



local Character = Player.Character
local RootPart, Humanoid = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid")
if not Character or not RootPart or not Humanoid then continue end

local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
 if getgenv().vis.distance < DistanceFromCharacter then continue end
local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
if OnScreen then
local Size = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

local Name = PlayerDrawing.Name
local Tool = PlayerDrawing.Tool
local Distance = PlayerDrawing.Distance
local Box = PlayerDrawing.Box
local BoxOutline = PlayerDrawing.BoxOutline
local Health = PlayerDrawing.Health
local HealthOutline = PlayerDrawing.HealthOutline

if _G.BOX then
Box.Size = BoxSize
Box.Position = BoxPos
Box.Visible = true
Box.Color = getgenv().colors.boxcolor
BoxOutline.Size = BoxSize
BoxOutline.Position = BoxPos
BoxOutline.Visible = true
end

if _G.HEALTH then
Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
Health.To = Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
Health.Color = getgenv().colors.healthcolor
Health.Visible = true

HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) -1)
HealthOutline.Visible = true
end

if _G.NAME then
Name.Text = "["..Player.Name.."]"
Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
Name.Color = getgenv().colors.namecolor
Name.Visible = true
end

if _G.WEAPON then
local BottomOffset = BoxSize.Y + BoxPos.Y + 1
local Equipped = Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name or "None"
Tool.Text = "["..Equipped.."]"
Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
Tool.Color = getgenv().colors.toolcolor
Tool.Visible = true
BottomOffset = BottomOffset + 15
end
end
end
end)



loadstring(game:HttpGet("https://pastebin.com/raw/LWV39GC1"))()
