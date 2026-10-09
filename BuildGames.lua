--[[
    🐕 BUILD GAMES v2.2
    Features: ESP, ESP Nicknames, SpeedHack, Fly, SpeedFly, Noclip, InfJump, Aimbot, Graphics
    Executor: Delta (Lua)
--]]

print("🐕 BUILD GAMES v2.2 | Загрузка...")

-- ═══════════════════════════════════════
-- СЕРВИСЫ
-- ═══════════════════════════════════════
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ═══════════════════════════════════════
-- GUI
-- ═══════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BuildGames"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 480, 0, 320)
Main.Position = UDim2.new(0.5, -240, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 200, 120)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
Title.BorderSizePixel = 0
Title.Text = "🐕 BUILD GAMES v2.2"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -68, 0, 6)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.Parent = Main

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Main

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Плавающая кнопка
local FloatingBtn = Instance.new("TextButton")
FloatingBtn.Name = "FloatingBtn"
FloatingBtn.Size = UDim2.new(0, 55, 0, 55)
FloatingBtn.Position = UDim2.new(0, 20, 0.5, -27)
FloatingBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
FloatingBtn.Text = "🐕"
FloatingBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
FloatingBtn.Font = Enum.Font.GothamBold
FloatingBtn.TextSize = 28
FloatingBtn.Visible = false
FloatingBtn.Active = true
FloatingBtn.Draggable = true
FloatingBtn.Parent = ScreenGui

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatingBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = Color3.fromRGB(0, 200, 120)
FloatStroke.Thickness = 2
FloatStroke.Parent = FloatingBtn

-- Вкладки
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(0, 130, 0, 270)
TabBar.Position = UDim2.new(0, 10, 0, 45)
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TabBar.BorderSizePixel = 0
TabBar.Parent = Main

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 10)
TabBarCorner.Parent = TabBar

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 6)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Parent = TabBar

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 8)
TabPadding.PaddingLeft = UDim.new(0, 8)
TabPadding.PaddingRight = UDim.new(0, 8)
TabPadding.Parent = TabBar

local Content = Instance.new("Frame")
Content.Size = UDim2.new(0, 320, 0, 270)
Content.Position = UDim2.new(0, 150, 0, 45)
Content.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
Content.BorderSizePixel = 0
Content.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = Content

-- ═══════════════════════════════════════
-- ЭЛЕМЕНТЫ
-- ═══════════════════════════════════════
local function makeTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.Parent = TabBar
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false
    page.Parent = Content
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page
    
    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    pad.Parent = page
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    return btn, page
end

local function makeToggle(parent, text, default, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.Text = "  " .. text .. ": " .. (default and "ON" or "OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    if default then btn.BackgroundColor3 = Color3.fromRGB(0, 150, 80) end
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = "  " .. text .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 150, 80) or Color3.fromRGB(40, 40, 50)
        if callback then callback(state) end
    end)
    
    return btn
end

local function makeSlider(parent, text, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 55)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    frame.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 22)
    label.Position = UDim2.new(0, 10, 0, 4)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -20, 0, 8)
    bar.Position = UDim2.new(0, 10, 0, 34)
    bar.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    bar.Parent = frame
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = bar
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
    fill.Parent = bar
    
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(1, 0)
    fc.Parent = fill
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = bar
    
    local kc = Instance.new("UICorner")
    kc.CornerRadius = UDim.new(1, 0)
    kc.Parent = knob
    
    local dragging = false
    local value = default
    
    local function update(input)
        local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * pos)
        fill.Size = UDim2.new(pos, 0, 1, 0)
        knob.Position = UDim2.new(pos, -7, 0.5, -7)
        label.Text = text .. ": " .. value
        if callback then callback(value) end
    end
    
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    
    bar.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return frame
end

local function makeButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return btn
end

-- ═══════════════════════════════════════
-- ВКЛАДКИ
-- ═══════════════════════════════════════
local mainTab, mainPage = makeTab("🏠 Main")
local moveTab, movePage = makeTab("🏃 Movement")
local combatTab, combatPage = makeTab("⚔️ Combat")
local gfxTab, gfxPage = makeTab("🎨 Graphics")

local tabs = {
    {btn = mainTab, page = mainPage},
    {btn = moveTab, page = movePage},
    {btn = combatTab, page = combatPage},
    {btn = gfxTab, page = gfxPage}
}

local function selectTab(selected)
    for _, t in pairs(tabs) do
        if t.btn == selected then
            t.btn.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
            t.btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            t.page.Visible = true
        else
            t.btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            t.btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            t.page.Visible = false
        end
    end
end

for _, t in pairs(tabs) do
    t.btn.MouseButton1Click:Connect(function() selectTab(t.btn) end)
end
selectTab(mainTab)

-- ═══════════════════════════════════════
-- ПЕРЕМЕННЫЕ
-- ═══════════════════════════════════════
local ESPEnabled = false
local ESPNickEnabled = true
local ESPObjects = {}
local SpeedValue = 50
local FlySpeed = 50
local SpeedFlyValue = 150
local FlyEnabled = false
local SpeedFlyEnabled = false
local NoclipEnabled = false
local InfJumpEnabled = false
local AimbotEnabled = false
local AimbotFOV = 150
local AimbotSmooth = 0.25
local bodyVel, bodyGy, flyConn

-- Graphics
local PotatoEnabled = false
local FPSEnabled = false
local skyColorR, skyColorG, skyColorB = 100, 150, 255
local savedLighting = {}
local savedEffects = {}
local fpsLabel, fpsConn
local customSky = nil

-- ═══════════════════════════════════════
-- ESP
-- ═══════════════════════════════════════
local function createESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "BG_ESP"
    highlight.Adornee = char
    highlight.FillColor = Color3.fromRGB(255, 50, 50)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Parent = char
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "BG_Name"
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = head
    billboard.Enabled = ESPNickEnabled
    billboard.Parent = char
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = player.Name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = billboard
    
    ESPObjects[player] = {highlight = highlight, billboard = billboard}
end

local function removeESP(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            if obj and obj.Parent then obj:Destroy() end
        end
        ESPObjects[player] = nil
    end
end

local function clearAllESP()
    for p, _ in pairs(ESPObjects) do removeESP(p) end
end

local function updateNickVisibility()
    for _, objs in pairs(ESPObjects) do
        if objs.billboard then objs.billboard.Enabled = ESPNickEnabled end
    end
end

-- ═══════════════════════════════════════
-- FLY
-- ═══════════════════════════════════════
local function startFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    bodyVel = Instance.new("BodyVelocity")
    bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVel.Velocity = Vector3.new(0, 0, 0)
    bodyVel.Parent = hrp
    
    bodyGy = Instance.new("BodyGyro")
    bodyGy.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGy.P = 10000
    bodyGy.D = 100
    bodyGy.CFrame = hrp.CFrame
    bodyGy.Parent = hrp
    
    flyConn = RunService.RenderStepped:Connect(function()
        if not FlyEnabled then return end
        local c = LocalPlayer.Character
        if not c then return end
        local root = c:FindFirstChild("HumanoidRootPart")
        if not root or not bodyVel or not bodyGy then return end
        
        bodyGy.CFrame = Camera.CFrame
        
        local dir = Vector3.new(0, 0, 0)
        local speed = SpeedFlyEnabled and SpeedFlyValue or FlySpeed
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0, 1, 0) end
        
        bodyVel.Velocity = dir.Magnitude > 0 and dir.Unit * speed or Vector3.new(0, 0, 0)
    end)
end

local function stopFly()
    if flyConn then flyConn:Disconnect() flyConn = nil end
    if bodyVel then bodyVel:Destroy() bodyVel = nil end
    if bodyGy then bodyGy:Destroy() bodyGy = nil end
end

-- ═══════════════════════════════════════
-- NOCLIP
-- ═══════════════════════════════════════
RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- ═══════════════════════════════════════
-- INFINITE JUMP
-- ═══════════════════════════════════════
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end)

-- ═══════════════════════════════════════
-- AIMBOT
-- ═══════════════════════════════════════
local function getClosestPlayer()
    local closest, dist = nil, AimbotFOV
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local d = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if d < dist then
                        dist = d
                        closest = head
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local target = getClosestPlayer()
        if target then
            local currentCF = Camera.CFrame
            local newCF = CFrame.new(currentCF.Position, target.Position)
            Camera.CFrame = currentCF:Lerp(newCF, AimbotSmooth)
        end
    end
end)

-- ═══════════════════════════════════════
-- GRAPHICS FUNCTIONS
-- ═══════════════════════════════════════

-- ══════ POTATO GRAPHICS ══════
local function applyPotato()
    -- Сохраняем настройки освещения
    savedLighting = {
        GlobalShadows = Lighting.GlobalShadows,
        ShadowSoftness = Lighting.ShadowSoftness,
        Brightness = Lighting.Brightness,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        FogEnd = Lighting.FogEnd,
        FogStart = Lighting.FogStart,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale
    }
    
    Lighting.GlobalShadows = false
    Lighting.ShadowSoftness = 0
    Lighting.Brightness = 0
    Lighting.Ambient = Color3.fromRGB(120, 120, 120)
    Lighting.OutdoorAmbient = Color3.fromRGB(120, 120, 120)
    Lighting.FogEnd = 100000
    Lighting.FogStart = 100000
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
    
    -- Убираем эффекты
    savedEffects = {}
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("Atmosphere") or effect:IsA("Sky") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") then
            table.insert(savedEffects, {obj = effect, parent = effect.Parent})
            effect.Parent = nil
        end
    end
    
    -- Понижаем качество текстур
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = false
        elseif obj:IsA("MeshPart") then
            obj.TextureID = ""
            obj.RenderFidelity = Enum.RenderFidelity.Performance
        elseif obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
        end
    end
    
    -- Понижаем качество Roblox
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
end

local function restorePotato()
    -- Восстанавливаем свет
    for k, v in pairs(savedLighting) do
        pcall(function() Lighting[k] = v end)
    end
    
    -- Возвращаем эффекты
    for _, data in pairs(savedEffects) do
        if data.obj then
            data.obj.Parent = data.parent or Lighting
        end
    end
    savedEffects = {}
    
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end)
end

-- ══════ SKY COLOR ══════
local function applySkyColor()
    if customSky then customSky:Destroy() end
    
    local color = Color3.fromRGB(skyColorR, skyColorG, skyColorB)
    
    customSky = Instance.new("Sky")
    customSky.Name = "BG_CustomSky"
    customSky.SkyboxBk = "rbxassetid://159454299"
    customSky.SkyboxDn = "rbxassetid://159454296"
    customSky.SkyboxFt = "rbxassetid://159454293"
    customSky.SkyboxLf = "rbxassetid://159454286"
    customSky.SkyboxRt = "rbxassetid://159454300"
    customSky.SkyboxUp = "rbxassetid://159454288"
    customSky.SunAngularSize = 0
    customSky.MoonAngularSize = 0
    customSky.StarCount = 0
    customSky.Parent = Lighting
    
    -- Через ColorCorrection делаем оттенок неба
    local existing = Lighting:FindFirstChild("BG_SkyTint")
    if existing then existing:Destroy() end
    
    local cc = Instance.new("ColorCorrectionEffect")
    cc.Name = "BG_SkyTint"
    cc.TintColor = color
    cc.Brightness = 0
    cc.Contrast = 0
    cc.Saturation = 0
    cc.Parent = Lighting
end

local function resetSkyColor()
    if customSky then customSky:Destroy() customSky = nil end
    local tint = Lighting:FindFirstChild("BG_SkyTint")
    if tint then tint:Destroy() end
end

-- ══════ FPS COUNTER ══════
local function createFPSLabel()
    if fpsLabel then return end
    
    fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "BG_FPS"
    fpsLabel.Size = UDim2.new(0, 140, 0, 34)
    fpsLabel.Position = UDim2.new(0, 10, 0, 10)
    fpsLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    fpsLabel.BackgroundTransparency = 0.3
    fpsLabel.BorderSizePixel = 0
    fpsLabel.Text = "FPS: 60"
    fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    fpsLabel.Font = Enum.Font.GothamBold
    fpsLabel.TextSize = 16
    fpsLabel.Parent = ScreenGui
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = fpsLabel
    
    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(0, 200, 120)
    s.Thickness = 1.5
    s.Parent = fpsLabel
    
    local frames = 0
    local lastTime = tick()
    
    fpsConn = RunService.RenderStepped:Connect(function()
        frames += 1
        local now = tick()
        if now - lastTime >= 1 then
            local fps = math.floor(frames / (now - lastTime))
            fpsLabel.Text = "FPS: " .. fps
            -- Цвет в зависимости от FPS
            if fps >= 50 then
                fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
            elseif fps >= 30 then
                fpsLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
            else
                fpsLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            end
            frames = 0
            lastTime = now
        end
    end)
end

local function removeFPSLabel()
    if fpsConn then fpsConn:Disconnect() fpsConn = nil end
    if fpsLabel then fpsLabel:Destroy() fpsLabel = nil end
end

-- ═══════════════════════════════════════
-- ГЛАВНАЯ
-- ═══════════════════════════════════════
makeToggle(mainPage, "ESP", false, function(state)
    ESPEnabled = state
    if state then
        for _, p in pairs(Players:GetPlayers()) do createESP(p) end
    else
        clearAllESP()
    end
end)

makeToggle(mainPage, "ESP Nicknames", true, function(state)
    ESPNickEnabled = state
    updateNickVisibility()
end)

makeToggle(mainPage, "SpeedHack", false, function(state)
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = state and SpeedValue or 16 end
    end
end)

makeSlider(mainPage, "Speed", 16, 200, 50, function(v)
    SpeedValue = v
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed > 16 then hum.WalkSpeed = v end
    end
end)

-- ═══════════════════════════════════════
-- MOVEMENT
-- ═══════════════════════════════════════
makeToggle(movePage, "Fly", false, function(state)
    FlyEnabled = state
    if state then startFly() else stopFly() end
end)

makeSlider(movePage, "Fly Speed", 10, 300, 50, function(v) FlySpeed = v end)

makeToggle(movePage, "SpeedFly", false, function(state) SpeedFlyEnabled = state end)

makeSlider(movePage, "SpeedFly Speed", 50, 800, 150, function(v) SpeedFlyValue = v end)

makeToggle(movePage, "Noclip", false, function(state)
    NoclipEnabled = state
    if not state then
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end
end)

makeToggle(movePage, "Infinite Jump", false, function(state) InfJumpEnabled = state end)

-- ═══════════════════════════════════════
-- COMBAT
-- ═══════════════════════════════════════
makeToggle(combatPage, "Aimbot", false, function(state) AimbotEnabled = state end)
makeSlider(combatPage, "Aimbot FOV", 50, 500, 150, function(v) AimbotFOV = v end)
makeSlider(combatPage, "Aimbot Smooth", 1, 100, 25, function(v) AimbotSmooth = v / 100 end)

-- ═══════════════════════════════════════
-- 🎨 GRAPHICS
-- ═══════════════════════════════════════
makeToggle(gfxPage, "Potato Graphics", false, function(state)
    PotatoEnabled = state
    if state then applyPotato() else restorePotato() end
end)

makeToggle(gfxPage, "FPS Counter", false, function(state)
    FPSEnabled = state
    if state then createFPSLabel() else removeFPSLabel() end
end)

-- Разделитель — Sky Color
local skyHeader = Instance.new("TextLabel")
skyHeader.Size = UDim2.new(1, 0, 0, 24)
skyHeader.BackgroundTransparency = 1
skyHeader.Text = "☁️ Sky Color (RGB)"
skyHeader.TextColor3 = Color3.fromRGB(0, 255, 150)
skyHeader.Font = Enum.Font.GothamBold
skyHeader.TextSize = 13
skyHeader.TextXAlignment = Enum.TextXAlignment.Left
skyHeader.Parent = gfxPage

makeSlider(gfxPage, "🔴 Red", 0, 255, 100, function(v)
    skyColorR = v
    applySkyColor()
end)

makeSlider(gfxPage, "🟢 Green", 0, 255, 150, function(v)
    skyColorG = v
    applySkyColor()
end)

makeSlider(gfxPage, "🔵 Blue", 0, 255, 255, function(v)
    skyColorB = v
    applySkyColor()
end)

-- Пресеты неба
local presetHeader = Instance.new("TextLabel")
presetHeader.Size = UDim2.new(1, 0, 0, 24)
presetHeader.BackgroundTransparency = 1
presetHeader.Text = "🎨 Пресеты неба"
presetHeader.TextColor3 = Color3.fromRGB(0, 255, 150)
presetHeader.Font = Enum.Font.GothamBold
presetHeader.TextSize = 13
presetHeader.TextXAlignment = Enum.TextXAlignment.Left
presetHeader.Parent = gfxPage

-- Сетка пресетов
local presetFrame = Instance.new("Frame")
presetFrame.Size = UDim2.new(1, 0, 0, 80)
presetFrame.BackgroundTransparency = 1
presetFrame.Parent = gfxPage

local presetGrid = Instance.new("UIGridLayout")
presetGrid.CellSize = UDim2.new(0.5, -5, 0, 34)
presetGrid.CellPadding = UDim2.new(0, 6, 0, 6)
presetGrid.SortOrder = Enum.SortOrder.LayoutOrder
presetGrid.Parent = presetFrame

local presets = {
    {name = "☀️ День", color = Color3.fromRGB(135, 206, 235), rgb = {135, 206, 235}},
    {name = "🌅 Закат", color = Color3.fromRGB(255, 120, 80), rgb = {255, 120, 80}},
    {name = "🌙 Ночь", color = Color3.fromRGB(20, 25, 60), rgb = {20, 25, 60}},
    {name = "💜 Фиолет", color = Color3.fromRGB(160, 80, 220), rgb = {160, 80, 220}},
    {name = "💚 Матрица", color = Color3.fromRGB(0, 180, 80), rgb = {0, 180, 80}},
    {name = "🌑 Ад", color = Color3.fromRGB(180, 20, 20), rgb = {180, 20, 20}},
}

for _, preset in pairs(presets) do
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = preset.color
    btn.Text = preset.name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextStrokeTransparency = 0.5
    btn.Parent = presetFrame
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        skyColorR = preset.rgb[1]
        skyColorG = preset.rgb[2]
        skyColorB = preset.rgb[3]
        applySkyColor()
    end)
end

makeButton(gfxPage, "🔄 Сбросить небо", function()
    resetSkyColor()
end)

-- ═══════════════════════════════════════
-- СВЕРНУТЬ / РАЗВЕРНУТЬ / ЗАКРЫТЬ
-- ═══════════════════════════════════════
MinimizeBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    FloatingBtn.Visible = true
end)

FloatingBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    FloatingBtn.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    FlyEnabled = false
    stopFly()
    clearAllESP()
    removeFPSLabel()
    resetSkyColor()
    if PotatoEnabled then restorePotato() end
    
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
    ScreenGui:Destroy()
end)

-- ═══════════════════════════════════════
-- СОБЫТИЯ
-- ═══════════════════════════════════════
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(1)
        if ESPEnabled then createESP(p) end
    end)
end)

Players.PlayerRemoving:Connect(removeESP)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if FlyEnabled then stopFly() startFly() end
end)

print("🐕 BUILD GAMES v2.2 | Загружено!")
print("Раздел 🎨 Graphics: Potato, Sky Color, FPS")
