local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MuryScript/Big-Yahu/refs/heads/main/Jew.lua"))()

local Window = Library:CreateWindow({
    Title = "Am Yisrael Chai",
    SubTitle = "Benjamin Netanyahu Edition",
    LoadingTitle = "State of Israel",
    LoadingSubtitle = "Defending the Digital Frontier",
    ShowText = "Open Menu",
    Theme = "Jerusalem"
})

local Character, Humanoid, RootPart
local Connections = {}
local States = {
    WalkSpeed = 16,
    JumpPower = 50,
    Gravity = workspace.Gravity,
    InfiniteJump = false,
    Noclip = false,
    Fly = false,
    Spinbot = false,
    AutoClicker = false,
    ESP = false,
    FlySpeed = 60,
    SpinSpeed = 50
}

local function SetupCharacter(Char)
    Character = Char
    Humanoid = Char:WaitForChild("Humanoid")
    RootPart = Char:WaitForChild("HumanoidRootPart")
    
    Humanoid.WalkSpeed = States.WalkSpeed
    Humanoid.JumpPower = States.JumpPower
end

if LocalPlayer.Character then SetupCharacter(LocalPlayer.Character) end
Connections.CharAdded = LocalPlayer.CharacterAdded:Connect(SetupCharacter)

local Tabs = {
    Main = Window:CreateTab({Title = "IDF Operations", Logo = "rbxassetid://7733960981"}),
    Visuals = Window:CreateTab({Title = "Iron Dome", Logo = "rbxassetid://7733964440"}),
    World = Window:CreateTab({Title = "Territory", Logo = "rbxassetid://7733954760"}),
    Misc = Window:CreateTab({Title = "Knesset Utils", Logo = "rbxassetid://7734056608"})
}

local MoveSection = Tabs.Main:CreateSection({Title = "Elite Movement", Position = "left"})

MoveSection:CreateSlider({
    Title = "Mossad Speed", Range = {16, 500}, Increment = 1, Default = 16,
    Callback = function(v) States.WalkSpeed = v if Humanoid then Humanoid.WalkSpeed = v end end
})

MoveSection:CreateSlider({
    Title = "Zionist Jump", Range = {50, 500}, Increment = 1, Default = 50,
    Callback = function(v) States.JumpPower = v if Humanoid then Humanoid.JumpPower = v end end
})

MoveSection:CreateToggle({
    Title = "Divine Jump", Default = false,
    Callback = function(v) States.InfiniteJump = v end
})

MoveSection:CreateToggle({
    Title = "Ghost Protocol", Default = false,
    Callback = function(v) States.Noclip = v end
})

local FlightSection = Tabs.Main:CreateSection({Title = "Air Superiority", Position = "right"})

FlightSection:CreateToggle({
    Title = "IAF Flight", Default = false,
    Callback = function(v) States.Fly = v end
})

FlightSection:CreateSlider({
    Title = "Flight Velocity", Range = {20, 500}, Increment = 1, Default = 60,
    Callback = function(v) States.FlySpeed = v end
})

FlightSection:CreateToggle({
    Title = "Cyclone Spin", Default = false,
    Callback = function(v) States.Spinbot = v end
})

local EspSection = Tabs.Visuals:CreateSection({Title = "Intelligence", Position = "left"})

EspSection:CreateToggle({
    Title = "Target Tracking", Default = false,
    Callback = function(v) States.ESP = v end
})

local EnvSection = Tabs.Visuals:CreateSection({Title = "Vision", Position = "right"})

EnvSection:CreateSlider({
    Title = "Tactical FOV", Range = {70, 120}, Increment = 1, Default = 70,
    Callback = function(v) Camera.FieldOfView = v end
})

EnvSection:CreateButton({
    Title = "Eternal Light",
    Callback = function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    end
})

local WorldSection = Tabs.World:CreateSection({Title = "Environmental Control", Position = "left"})

WorldSection:CreateSlider({
    Title = "Gravity Shift", Range = {0, 196}, Increment = 1, Default = 196,
    Callback = function(v) workspace.Gravity = v end
})

WorldSection:CreateToggle({
    Title = "Rapid Strike (AutoClick)", Default = false,
    Callback = function(v) States.AutoClicker = v end
})

local SettingsSection = Tabs.Misc:CreateSection({Title = "Diplomacy Themes", Position = "left"})

SettingsSection:CreateDropdown({
    Title = "Select Aesthetics",
    Options = {"IDF", "Bibi","IsraelBlue", "Jerusalem"},
    Selected = {"Jerusalem"},
    Multi = false,
    Callback = function(Options)
       getgenv().SelTheme = unpack(Options)
    end
})

SettingsSection:CreateButton({
    Title = "Set Theme",
    Callback = function()
        Window:SetTheme(getgenv().SelTheme)
    end
})

local ServerSection = Tabs.Misc:CreateSection({Title = "Strategic Relocation", Position = "right"})

ServerSection:CreateButton({Title = "Re-establish Connection", Callback = function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end})
ServerSection:CreateButton({Title = "Diplomatic Server Hop", Callback = function()
    local Http = game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
    local Data = HttpService:JSONDecode(Http)
    for _, s in pairs(Data.data) do
        if s.playing < s.maxPlayers and s.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
            break
        end
    end
end})

local CleanSection = Tabs.Misc:CreateSection({Title = "System Purge", Position = "right"})
CleanSection:CreateButton({Title = "Cease Operations", Callback = function()
    for _, c in pairs(Connections) do pcall(function() c:Disconnect() end) end
    Window:Destroy()
end})

Connections.NoclipLoop = RunService.Stepped:Connect(function()
    if States.Noclip and Character then
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

Connections.FlyLoop = RunService.RenderStepped:Connect(function()
    if States.Fly and RootPart then
        local MoveDir = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then MoveDir += Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then MoveDir -= Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then MoveDir -= Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then MoveDir += Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then MoveDir += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then MoveDir -= Vector3.new(0,1,0) end
        
        RootPart.Velocity = MoveDir * States.FlySpeed
    end
    
    if States.Spinbot and RootPart then
        RootPart.CFrame *= CFrame.Angles(0, math.rad(States.SpinSpeed), 0)
    end
end)

Connections.InfJump = UserInputService.JumpRequest:Connect(function()
    if States.InfiniteJump and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if States.AutoClicker then
            VirtualUser:ClickButton1(Vector2.new(0,0))
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if States.ESP then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if not p.Character.HumanoidRootPart:FindFirstChild("BoxHighlight") then
                        local Box = Instance.new("BoxHandleAdornment")
                        Box.Name = "BoxHighlight"
                        Box.Adornee = p.Character.HumanoidRootPart
                        Box.AlwaysOnTop = true
                        Box.ZIndex = 5
                        Box.Size = Vector3.new(4, 5, 1)
                        Box.Transparency = 0.5
                        Box.Color3 = Color3.fromRGB(0, 56, 184)
                        Box.Parent = p.Character.HumanoidRootPart
                    end
                end
            end
        else
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.HumanoidRootPart:FindFirstChild("BoxHighlight") then
                    p.Character.HumanoidRootPart.BoxHighlight:Destroy()
                end
            end
        end
    end
end) 