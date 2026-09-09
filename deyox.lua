--// Final Del Mundo - Da Hood Script
--// Made By Lucho | discord.gg/clicka

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Configuración - TODO DESACTIVADO POR DEFECTO
local Config = {
    Spread = { Enabled = false, Amount = 82 },
    Aimbot = { 
        Enabled = false, 
        Target = nil, 
        FOV = 500, 
        Key = Enum.KeyCode.X, 
        HitPart = "Head",
        Smoothness = 1
    },
    ESP = { 
        Enabled = false, 
        ShowBoxes = false, 
        ShowNames = false, 
        ShowHealth = false, 
        ShowDead = true,
        BoxColor = Color3.fromRGB(60, 120, 255),
        NameColor = Color3.fromRGB(255, 255, 255),
        HealthColor = Color3.fromRGB(0, 255, 0)
    },
    Hitbox = { Enabled = false, Size = 10, Visualize = false },
    WallCheck = false,
    MenuKey = Enum.KeyCode.V
}

--// Variables
local ESPObjects = {}
local Locked = false
local AimTarget = nil

--// SPREAD HOOK VARIABLES (ofuscado)
local _0xn1 = (function() return 5 * 5 * 4 end)()
local _0xn2 = (function() return 3 + 2 end)()
local _0xn3 = (function() return 2 ^ 10 end)()
local _0xn4 = (function() return 16 * 16 - 1 end)()
local _0xn5 = (function() return 3 * 2 end)()
local _0xn6 = (function() return 4 * 2 end)()
local _0xn7 = (function() return 2 + 2 end)()
local _0xn8 = (function() return 2 + 2 end)()
local _0xn9 = (function() return 10 - 10 end)()
local _0xn10 = (function() return 2 * 2 end)()
local _0xn11 = (function() return 12 / 6 end)()
local _0xn12 = (function() return 15 / 5 end)()
local _0xn13 = (function() return 5 - 5 end)()
local _0xn14 = (function() return -1 + 1.05 end)()
local _0xn15 = (function() return -1 / 10 end)()
local _0xn16 = (function() return -1 / 20 end)()
local _0xn17 = (function() return 8 * 3 end)()
local _0xn18 = (function() return 9 / 2 end)()
local _0xn19 = (function() return 6 / 5 end)()
local _0xn20 = (function() return 320 end)()
local _0xn21 = (function() return 160 end)()
local _0xn22 = (function() return 10 end)()
local _0xn23 = (function() return 20 end)()
local _0xn24 = (function() return 30 end)()
local _0xn25 = (function() return 45 end)()
local _0xn26 = (function() return 260 end)()
local _0xn27 = (function() return 90 end)()
local _0xn28 = (function() return 16 end)()
local _0xn29 = (function() return 60 end)()
local _0xn30 = (function() return 12 end)()
local _0xn31 = (function() return 14 end)()
local _0xn32 = (function() return 50 end)()
local _0xn33 = (function() return 120 end)()
local _0xn34 = (function() return 70 end)()
local _0xn35 = (function() return 250 end)()
local _0xn36 = (function() return 0.5 end)()
local _0xn37 = (function() return 0.2 end)()
local _0xn38 = (function() return 0.25 end)()
local _0xn39 = (function() return 0.4 end)()
local _0xn40 = (function() return 0.8 end)()
local _0xn41 = (function() return 0.9 end)()
local _0xn42 = (function() return 25 end)()
local _0xn43 = (function() return 300 end)()

--// GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FinalDelMundoMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 700, 0, 450)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 120, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 25)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 6)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Final Del Mundo | Made By Lucho"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Size = UDim2.new(0, 200, 1, 0)
DiscordLabel.Position = UDim2.new(1, -210, 0, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/clicka"
DiscordLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
DiscordLabel.TextSize = 12
DiscordLabel.Font = Enum.Font.Gotham
DiscordLabel.TextXAlignment = Enum.TextXAlignment.Right
DiscordLabel.Parent = TopBar

-- Tabs
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 30)
TabContainer.Position = UDim2.new(0, 0, 0, 25)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabContainer.Parent = MainFrame

local Tabs = {"Main", "Aimbot", "ESP", "Hitbox", "Settings"}
local TabFrames = {}
local CurrentTab = "Main"

for i, tabName in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.Position = UDim2.new(0, (i-1)*100, 0, 0)
    btn.BackgroundColor3 = tabName == "Main" and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(30, 30, 30)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.Parent = TabContainer
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 1, -65)
    frame.Position = UDim2.new(0, 10, 0, 60)
    frame.BackgroundTransparency = 1
    frame.Visible = tabName == "Main"
    frame.Parent = MainFrame
    TabFrames[tabName] = frame
    
    btn.MouseButton1Click:Connect(function()
        CurrentTab = tabName
        for name, f in pairs(TabFrames) do
            f.Visible = name == tabName
        end
        for _, b in ipairs(TabContainer:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = b.Text == tabName and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(30, 30, 30)
            end
        end
    end)
end

-- Helper functions
local function CreateSection(parent, title, pos, size)
    local s = Instance.new("Frame")
    s.Size = size
    s.Position = pos
    s.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    s.Parent = parent
    
    local sc = Instance.new("UICorner")
    sc.CornerRadius = UDim.new(0, 4)
    sc.Parent = s
    
    local t = Instance.new("Frame")
    t.Size = UDim2.new(1, 0, 0, 22)
    t.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    t.Parent = s
    
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 4)
    tc.Parent = t
    
    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -10, 1, 0)
    tl.Position = UDim2.new(0, 5, 0, 0)
    tl.BackgroundTransparency = 1
    tl.Text = title
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.Parent = t
    
    local c = Instance.new("Frame")
    c.Size = UDim2.new(1, -10, 1, -32)
    c.Position = UDim2.new(0, 5, 0, 27)
    c.BackgroundTransparency = 1
    c.Parent = s
    
    local cl = Instance.new("UIListLayout")
    cl.Padding = UDim.new(0, 5)
    cl.Parent = c
    
    return s, c
end

local function CreateCheckbox(parent, text, default, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 22)
    f.BackgroundTransparency = 1
    f.Parent = parent
    
    local cb = Instance.new("TextButton")
    cb.Size = UDim2.new(0, 16, 0, 16)
    cb.Position = UDim2.new(0, 0, 0.5, -8)
    cb.BackgroundColor3 = default and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(40, 40, 40)
    cb.Text = default and "✓" or ""
    cb.TextColor3 = Color3.fromRGB(255, 255, 255)
    cb.Font = Enum.Font.GothamBold
    cb.Parent = f
    
    local cbc = Instance.new("UICorner")
    cbc.CornerRadius = UDim.new(0, 2)
    cbc.Parent = cb
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -25, 1, 0)
    lbl.Position = UDim2.new(0, 22, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f
    
    local checked = default
    cb.MouseButton1Click:Connect(function()
        checked = not checked
        cb.BackgroundColor3 = checked and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(40, 40, 40)
        cb.Text = checked and "✓" or ""
        callback(checked)
    end)
end

local function CreateSlider(parent, text, min, max, default, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 45)
    f.BackgroundTransparency = 1
    f.Parent = parent
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. ": " .. default .. "/" .. max
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f
    
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, 0, 0, 8)
    track.Position = UDim2.new(0, 0, 0, 22)
    track.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    track.Parent = f
    
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 4)
    tc.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    fill.Parent = track
    
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(0, 4)
    fc.Parent = fill
    
    local dragging = false
    track.InputBegan:Connect(function(i) 
        if i.UserInputType == Enum.UserInputType.MouseButton1 then 
            dragging = true 
            local pos = math.clamp((i.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + pos * (max - min))
            fill.Size = UDim2.new(pos, 0, 1, 0)
            lbl.Text = text .. ": " .. val .. "/" .. max
            callback(val)
        end 
    end)
    
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((i.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + pos * (max - min))
            fill.Size = UDim2.new(pos, 0, 1, 0)
            lbl.Text = text .. ": " .. val .. "/" .. max
            callback(val)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

local function CreateDropdown(parent, text, options, default, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 45)
    f.BackgroundTransparency = 1
    f.Parent = parent
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. ": " .. default
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 22)
    btn.Position = UDim2.new(0, 0, 0, 22)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = default
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.Parent = f
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 4)
    bc.Parent = btn
    
    local currentIndex = 1
    for i, v in ipairs(options) do
        if v == default then currentIndex = i break end
    end
    
    btn.MouseButton1Click:Connect(function()
        currentIndex = currentIndex % #options + 1
        local selected = options[currentIndex]
        btn.Text = selected
        lbl.Text = text .. ": " .. selected
        callback(selected)
    end)
end

local function CreateColorPicker(parent, text, defaultColor, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 30)
    f.BackgroundTransparency = 1
    f.Parent = parent
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.7, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f
    
    local colorBtn = Instance.new("TextButton")
    colorBtn.Size = UDim2.new(0, 50, 0, 22)
    colorBtn.Position = UDim2.new(1, -50, 0.5, -11)
    colorBtn.BackgroundColor3 = defaultColor
    colorBtn.Text = ""
    colorBtn.Parent = f
    
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0, 4)
    cc.Parent = colorBtn
    
    -- Simple color cycler for common colors
    local colors = {
        Color3.fromRGB(255, 0, 0),    -- Red
        Color3.fromRGB(0, 255, 0),    -- Green
        Color3.fromRGB(0, 100, 255),  -- Blue
        Color3.fromRGB(255, 255, 0),  -- Yellow
        Color3.fromRGB(255, 0, 255),  -- Magenta
        Color3.fromRGB(0, 255, 255),  -- Cyan
        Color3.fromRGB(255, 255, 255),-- White
        Color3.fromRGB(60, 120, 255), -- Default Blue
        Color3.fromRGB(255, 100, 0),  -- Orange
        Color3.fromRGB(128, 0, 128),  -- Purple
    }
    
    local currentIndex = 1
    for i, c in ipairs(colors) do
        if c == defaultColor then currentIndex = i break end
    end
    
    colorBtn.MouseButton1Click:Connect(function()
        currentIndex = currentIndex % #colors + 1
        local newColor = colors[currentIndex]
        colorBtn.BackgroundColor3 = newColor
        callback(newColor)
    end)
end

-- MAIN TAB
local s1, c1 = CreateSection(TabFrames.Main, "Gun Mods", UDim2.new(0, 0, 0, 0), UDim2.new(0, 330, 0, 150))
CreateCheckbox(c1, "Spread Control", false, function(v) Config.Spread.Enabled = v end)
CreateSlider(c1, "Spread Amount", 0, 100, 82, function(v) Config.Spread.Amount = v end)

local s2, c2 = CreateSection(TabFrames.Main, "Combat", UDim2.new(0, 340, 0, 0), UDim2.new(0, 330, 0, 150))

-- AIMBOT TAB
local s3, c3 = CreateSection(TabFrames.Aimbot, "Targeting", UDim2.new(0, 0, 0, 0), UDim2.new(0, 330, 0, 250))
CreateCheckbox(c3, "Enable Aimbot", false, function(v) Config.Aimbot.Enabled = v end)

-- HitPart Dropdown
CreateDropdown(c3, "Target Part", {"Head", "Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart"}, "Head", function(v)
    Config.Aimbot.HitPart = v
end)

-- Keybind
local kbFrame = Instance.new("Frame")
kbFrame.Size = UDim2.new(1, 0, 0, 22)
kbFrame.BackgroundTransparency = 1
kbFrame.Parent = c3

local kbLabel = Instance.new("TextLabel")
kbLabel.Size = UDim2.new(0, 80, 1, 0)
kbLabel.BackgroundTransparency = 1
kbLabel.Text = "Toggle Key:"
kbLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
kbLabel.Font = Enum.Font.Gotham
kbLabel.TextXAlignment = Enum.TextXAlignment.Left
kbLabel.Parent = kbFrame

local kb = Instance.new("TextButton")
kb.Size = UDim2.new(0, 50, 0, 20)
kb.Position = UDim2.new(0, 85, 0, 1)
kb.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
kb.Text = "X"
kb.TextColor3 = Color3.fromRGB(200, 200, 200)
kb.Font = Enum.Font.GothamBold
kb.Parent = kbFrame

local kbc = Instance.new("UICorner")
kbc.CornerRadius = UDim.new(0, 3)
kbc.Parent = kb

local listening = false
kb.MouseButton1Click:Connect(function()
    listening = true
    kb.Text = "..."
    kb.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
end)

UserInputService.InputBegan:Connect(function(i, gp)
    if listening and not gp then
        listening = false
        kb.Text = i.KeyCode.Name
        kb.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Config.Aimbot.Key = i.KeyCode
    end
end)

CreateSlider(c3, "FOV", 100, 1000, 500, function(v) Config.Aimbot.FOV = v end)
CreateSlider(c3, "Smoothness", 1, 10, 1, function(v) Config.Aimbot.Smoothness = v end)
CreateCheckbox(c3, "Wall Check", false, function(v) Config.WallCheck = v end)

-- ESP TAB
local s4, c4 = CreateSection(TabFrames.ESP, "ESP Settings", UDim2.new(0, 0, 0, 0), UDim2.new(0, 330, 0, 180))
CreateCheckbox(c4, "Enable ESP", false, function(v) Config.ESP.Enabled = v end)
CreateCheckbox(c4, "Show Boxes", false, function(v) Config.ESP.ShowBoxes = v end)
CreateCheckbox(c4, "Show Names", false, function(v) Config.ESP.ShowNames = v end)
CreateCheckbox(c4, "Show Health", false, function(v) Config.ESP.ShowHealth = v end)
CreateCheckbox(c4, "Show Dead", true, function(v) Config.ESP.ShowDead = v end)

local s4b, c4b = CreateSection(TabFrames.ESP, "ESP Colors", UDim2.new(0, 340, 0, 0), UDim2.new(0, 330, 0, 180))
CreateColorPicker(c4b, "Box Color", Config.ESP.BoxColor, function(v) Config.ESP.BoxColor = v end)
CreateColorPicker(c4b, "Name Color", Config.ESP.NameColor, function(v) Config.ESP.NameColor = v end)
CreateColorPicker(c4b, "Health Color", Config.ESP.HealthColor, function(v) Config.ESP.HealthColor = v end)

-- HITBOX TAB
local s5, c5 = CreateSection(TabFrames.Hitbox, "Hitbox Expander", UDim2.new(0, 0, 0, 0), UDim2.new(0, 330, 0, 150))
CreateCheckbox(c5, "Enable Hitbox", false, function(v) Config.Hitbox.Enabled = v end)
CreateCheckbox(c5, "Visualize", false, function(v) Config.Hitbox.Visualize = v end)
CreateSlider(c5, "Size", 1, 50, 10, function(v) Config.Hitbox.Size = v end)

-- SETTINGS TAB
local s6, c6 = CreateSection(TabFrames.Settings, "Menu", UDim2.new(0, 0, 0, 0), UDim2.new(0, 330, 0, 100))

local mkFrame = Instance.new("Frame")
mkFrame.Size = UDim2.new(1, 0, 0, 22)
mkFrame.BackgroundTransparency = 1
mkFrame.Parent = c6

local mkLabel = Instance.new("TextLabel")
mkLabel.Size = UDim2.new(0, 70, 1, 0)
mkLabel.BackgroundTransparency = 1
mkLabel.Text = "Menu Key:"
mkLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
mkLabel.Font = Enum.Font.Gotham
mkLabel.TextXAlignment = Enum.TextXAlignment.Left
mkLabel.Parent = mkFrame

local mk = Instance.new("TextButton")
mk.Size = UDim2.new(0, 50, 0, 20)
mk.Position = UDim2.new(0, 75, 0, 1)
mk.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mk.Text = "V"
mk.TextColor3 = Color3.fromRGB(200, 200, 200)
mk.Font = Enum.Font.GothamBold
mk.Parent = mkFrame

local mkc = Instance.new("UICorner")
mkc.CornerRadius = UDim.new(0, 3)
mkc.Parent = mk

local mkListening = false
mk.MouseButton1Click:Connect(function()
    mkListening = true
    mk.Text = "..."
    mk.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
end)

UserInputService.InputBegan:Connect(function(i, gp)
    if mkListening and not gp then
        mkListening = false
        mk.Text = i.KeyCode.Name
        mk.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Config.MenuKey = i.KeyCode
    end
end)

--// FUNCIONALIDAD

-- Toggle Menu
UserInputService.InputBegan:Connect(function(i, gp)
    if not gp and i.KeyCode == Config.MenuKey then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Dragging
local dragging = false
local dragStart, startPos

TopBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Wall Check function
local function isVisible(target)
    if not Config.WallCheck then return true end
    if not target or not target.Character then return false end
    
    local part = target.Character:FindFirstChild(Config.Aimbot.HitPart) or target.Character:FindFirstChild("Head")
    if not part then return false end
    
    local origin = Camera.CFrame.Position
    local direction = (part.Position - origin).Unit * 1000
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, target.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    
    local result = Workspace:Raycast(origin, direction, raycastParams)
    
    if result then
        return false
    end
    return true
end

-- AIMBOT
local function GetTarget()
    local closest, maxDist = nil, Config.Aimbot.FOV
    local mousePos = UserInputService:GetMouseLocation()
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local part = plr.Character:FindFirstChild(Config.Aimbot.HitPart)
            if not part then
                part = plr.Character:FindFirstChild("Head")
            end
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            
            if part and hum and hum.Health > 0 then
                local bodyEffects = plr.Character:FindFirstChild("BodyEffects")
                if bodyEffects then
                    local ko = bodyEffects:FindFirstChild("K.O")
                    if ko and ko.Value then continue end
                end
                if plr.Character:FindFirstChild("GRABBING_CONSTRAINT") then continue end
                
                if Config.WallCheck and not isVisible(plr) then continue end
                
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                    if dist < maxDist then
                        closest = plr
                        maxDist = dist
                    end
                end
            end
        end
    end
    return closest
end

UserInputService.InputBegan:Connect(function(i, gp)
    if not gp and i.KeyCode == Config.Aimbot.Key then
        if Locked then
            Locked = false
            AimTarget = nil
        else
            AimTarget = GetTarget()
            if AimTarget then Locked = true end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Locked and AimTarget and AimTarget.Character then
        local part = AimTarget.Character:FindFirstChild(Config.Aimbot.HitPart)
        if not part then
            part = AimTarget.Character:FindFirstChild("Head")
        end
        local hum = AimTarget.Character:FindFirstChildOfClass("Humanoid")
        if part and hum and hum.Health > 0 then
            local targetPos = part.Position
            local cameraPos = Camera.CFrame.Position
            local smoothness = Config.Aimbot.Smoothness / 10
            
            if smoothness >= 1 then
                Camera.CFrame = CFrame.new(cameraPos, targetPos)
            else
                local targetCFrame = CFrame.new(cameraPos, targetPos)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, smoothness)
            end
        else
            Locked = false
            AimTarget = nil
        end
    end
end)

-- ESP
local function GetTeamColor(plr)
    if not plr.Team then return Color3.fromRGB(255, 255, 255) end
    local name = plr.Team.Name:lower()
    if name:find("blood") or name:find("red") then return Color3.fromRGB(255, 0, 0)
    elseif name:find("crip") or name:find("blue") then return Color3.fromRGB(0, 100, 255)
    elseif name:find("green") then return Color3.fromRGB(0, 255, 0)
    else return Color3.fromRGB(255, 255, 255) end
end

local function CreateESP(plr)
    if plr == LocalPlayer then return end
    
    local data = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        HealthBG = Drawing.new("Square"),
        HealthBar = Drawing.new("Square"),
        HealthText = Drawing.new("Text")
    }
    
    data.Box.Thickness = 1.5
    data.Name.Size = 13
    data.Name.Center = true
    data.Name.Outline = true
    data.HealthBG.Filled = true
    data.HealthBG.Color = Color3.fromRGB(30, 30, 30)
    data.HealthBar.Filled = true
    data.HealthText.Size = 11
    data.HealthText.Center = true
    data.HealthText.Outline = true
    
    ESPObjects[plr] = data
    
    local function Update()
        if not Config.ESP.Enabled then
            for _, o in pairs(data) do o.Visible = false end
            return
        end
        
        if not plr.Character then
            for _, o in pairs(data) do o.Visible = false end
            return
        end
        
        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
        local root = plr.Character:FindFirstChild("HumanoidRootPart")
        local head = plr.Character:FindFirstChild("Head")
        
        if not root or not head then
            for _, o in pairs(data) do o.Visible = false end
            return
        end
        
        local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
        if not onScreen then
            for _, o in pairs(data) do o.Visible = false end
            return
        end
        
        local headPos = Camera:WorldToViewportPoint(head.Position)
        local h = math.abs(headPos.Y - pos.Y) * 2.5
        local w = h / 2
        local teamColor = GetTeamColor(plr)
        local health = hum and hum.Health or 0
        local maxHealth = hum and hum.MaxHealth or 100
        local isDead = health <= 0
        
        if isDead and not Config.ESP.ShowDead then
            for _, o in pairs(data) do o.Visible = false end
            return
        end
        
        if Config.ESP.ShowBoxes then
            data.Box.Color = isDead and Color3.fromRGB(100, 100, 100) or Config.ESP.BoxColor
            data.Box.Size = Vector2.new(w, h)
            data.Box.Position = Vector2.new(pos.X - w/2, pos.Y - h/2)
            data.Box.Visible = true
        else
            data.Box.Visible = false
        end
        
        if Config.ESP.ShowNames then
            data.Name.Text = isDead and plr.Name .. " [DEAD]" or plr.Name
            data.Name.Color = isDead and Color3.fromRGB(150, 150, 150) or Config.ESP.NameColor
            data.Name.Position = Vector2.new(pos.X, pos.Y - h/2 - 15)
            data.Name.Visible = true
        else
            data.Name.Visible = false
        end
        
        if Config.ESP.ShowHealth and hum then
            local pct = math.clamp(health / maxHealth, 0, 1)
            data.HealthBG.Size = Vector2.new(w, 4)
            data.HealthBG.Position = Vector2.new(pos.X - w/2, pos.Y + h/2 + 5)
            data.HealthBG.Visible = true
            
            data.HealthBar.Color = Config.ESP.HealthColor
            data.HealthBar.Size = Vector2.new(w * pct, 4)
            data.HealthBar.Position = Vector2.new(pos.X - w/2, pos.Y + h/2 + 5)
            data.HealthBar.Visible = true
            
            data.HealthText.Text = math.floor(health)
            data.HealthText.Color = Config.ESP.HealthColor
            data.HealthText.Position = Vector2.new(pos.X, pos.Y + h/2 + 12)
            data.HealthText.Visible = true
        else
            data.HealthBG.Visible = false
            data.HealthBar.Visible = false
            data.HealthText.Visible = false
        end
    end
    
    RunService.RenderStepped:Connect(Update)
end

for _, p in ipairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(function(p)
    if ESPObjects[p] then
        for _, o in pairs(ESPObjects[p]) do o:Remove() end
        ESPObjects[p] = nil
    end
end)

-- HITBOX
RunService.Heartbeat:Connect(function()
    if not Config.Hitbox.Enabled then 
        -- Reset hitbox when disabled
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                end
            end
        end
        return 
    end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Size = Vector3.new(Config.Hitbox.Size, Config.Hitbox.Size, Config.Hitbox.Size)
                hrp.Transparency = Config.Hitbox.Visualize and 0.7 or 1
                hrp.Color = Color3.fromRGB(0, 255, 255)
                hrp.CanCollide = false
            end
        end
    end
end)

-- SPREAD CONTROL - Hook de math.random (FUNCIONAL)
local _0x52a0d5 = { BulletSpread = { Enabled = false, Amount = 82 } }
local _0x9ba38e

-- Actualizar config en tiempo real
task.spawn(function()
    while true do
        _0x52a0d5.BulletSpread.Enabled = Config.Spread.Enabled
        _0x52a0d5.BulletSpread.Amount = Config.Spread.Amount
        task.wait(0.1)
    end
end)

_0x9ba38e = hookfunction(math.random, function(...)
    local _0x5e1a0d = { ... }
    if checkcaller() then
        return _0x9ba38e(...)
    end
    if
        (#_0x5e1a0d == _0xn9)
        or (_0x5e1a0d[_0xn8] == _0xn16 and _0x5e1a0d[_0xn11] == _0xn14)
        or (_0x5e1a0d[_0xn8] == _0xn15)
        or (_0x5e1a0d[_0xn8] == _0xn16)
    then
        if _0x52a0d5.BulletSpread.Enabled then
            return _0x9ba38e(...) * (_0x52a0d5.BulletSpread.Amount / _0xn1)
        end
    end
    return _0x9ba38e(...)
end)

-- Notificación
local notif = Instance.new("TextLabel")
notif.Size = UDim2.new(0, 400, 0, 60)
notif.Position = UDim2.new(0.5, -200, 0, -70)
notif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
notif.Text = "Final Del Mundo\nMade By Lucho | discord.gg/clicka\nPress V to Open"
notif.TextColor3 = Color3.fromRGB(255, 255, 255)
notif.Font = Enum.Font.GothamBold
notif.Parent = ScreenGui

local ns = Instance.new("UIStroke")
ns.Color = Color3.fromRGB(60, 120, 255)
ns.Thickness = 2
ns.Parent = notif

local nc = Instance.new("UICorner")
nc.CornerRadius = UDim.new(0, 8)
nc.Parent = notif

notif:TweenPosition(UDim2.new(0.5, -200, 0, 40), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5)
task.wait(5)
notif:TweenPosition(UDim2.new(0.5, -200, 0, -70), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5)
task.wait(0.5)
notif:Destroy()

print("Final Del Mundo | Made By Lucho - Loaded")
