repeat
    task.wait()
until game:IsLoaded()
local library = {}
local ToggleUI = false
library.currentTab = nil
library.flags = {}

local services =
    setmetatable(
    {},
    {__index = function(t, k)
            return game.GetService(game, k)
        end})

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local lc = Players.LocalPlayer
local group = 35063130
local grouplink = "云脚本"
local animating = false 

local function createRainbowEffect(label)
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
    local tweenColorSequence = {
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(255, 127, 0),
        Color3.fromRGB(0, 127, 255),
        Color3.fromRGB(255, 0, 127),
        Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(127, 0, 255),
        Color3.fromRGB(255, 0, 0)
    }

    for _, color in ipairs(tweenColorSequence) do
        local tween = TweenService:Create(label, tweenInfo, {TextColor3 = color})
        tween:Play()
    end
end

if lc:IsInGroup(group) then
    print("已加入群组")
else
    setclipboard(grouplink)
    local screenGui = Instance.new("ScreenGui", lc:WaitForChild("PlayerGui"))
    screenGui.IgnoreGuiInset = true

    local fullScreenFrame = Instance.new("Frame", screenGui)
    fullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
    fullScreenFrame.Position = UDim2.new(0, 0, 0, 0)
    fullScreenFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    fullScreenFrame.BorderSizePixel = 0

    local titleLabel = Instance.new("TextLabel", fullScreenFrame)
    titleLabel.Size = UDim2.new(1, 0, 0, 60)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "抱歉打扰一下"
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    createRainbowEffect(titleLabel) 

    local textLabel1 = Instance.new("TextLabel", fullScreenFrame)
    textLabel1.Size = UDim2.new(1, 0, 0, 80)
    textLabel1.Position = UDim2.new(0, 0, 0.135, 0)
    textLabel1.Text = "请搜索并加入‘云脚本’群组以使用云脚本，谢谢您\n 2024年10月20日后，未加入群组不可使用云脚本"
    textLabel1.TextColor3 = Color3.new(1, 1, 1) 
    textLabel1.TextScaled = true
    textLabel1.BackgroundTransparency = 1
    textLabel1.Font = Enum.Font.Gotham

    local unknownButton = Instance.new("TextButton", fullScreenFrame)
    unknownButton.Size = UDim2.new(0, 200, 0, 50)
    unknownButton.Position = UDim2.new(0.5, -100, 0.4, 0)
    unknownButton.Text = "在哪找到群组"
    unknownButton.TextScaled = true
    unknownButton.TextColor3 = Color3.new(1, 1, 1) 
    unknownButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    unknownButton.BorderSizePixel = 0
    unknownButton.Font = Enum.Font.GothamMedium

    local exitButton = Instance.new("TextButton", fullScreenFrame)
    exitButton.Size = UDim2.new(0, 150, 0, 50)
    exitButton.Position = UDim2.new(1, -160, 1, -60)
    exitButton.Text = "拒绝，我要使用云脚本"
    exitButton.TextColor3 = Color3.new(1, 1, 1)
    exitButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    exitButton.BorderSizePixel = 0
    exitButton.Font = Enum.Font.GothamMedium
    exitButton.TextScaled = true
    exitButton.MouseButton1Click:Connect(function()
        screenGui.Enabled = false 
    end)

    local function createFadeInAnimation(frame)
        if not animating then 
            animating = true
            frame.Position = UDim2.new(0.5, -frame.Size.X.Offset / 2, 0.5, -frame.Size.Y.Offset / 2)
            frame.Size = UDim2.new(0, 0, 0, 0)
            frame:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 1.5, true)
            frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 1.5, true)
            wait(0.5) 
            animating = false
        end
    end

    local function createScaleAnimation(button)
        button.MouseEnter:Connect(function()
            if not animating then 
                button:TweenSize(UDim2.new(0.1, 0, 0.1, 0), "Out", "Quad", 0.2, true)
            end
        end)

        button.MouseLeave:Connect(function()
            if not animating then 
                button:TweenSize(UDim2.new(0.15, 0, 0.15, 0), "Out", "Quad", 0.2, true)
            end
        end)
    end

    createFadeInAnimation(fullScreenFrame)
    createScaleAnimation(unknownButton)
    createScaleAnimation(exitButton)

    unknownButton.MouseButton1Click:Connect(function()
        if not animating then 
            animating = true
            local infoFrame = Instance.new("Frame", fullScreenFrame)
            infoFrame.Size = UDim2.new(0.8, 0, 0.4, 0)
            infoFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            infoFrame.AnchorPoint = Vector2.new(0.5, 0.5) 
            infoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            infoFrame.BorderSizePixel = 0

            local infoLabel = Instance.new("TextLabel", infoFrame)
            infoLabel.Size = UDim2.new(1, 0, 0.8, 0)
            infoLabel.Text = "你可以在ROBLOX设置的搜索框中找到群组，输入'云脚本'进行搜索。"
            infoLabel.TextColor3 = Color3.new(1, 1, 1) 
            infoLabel.TextScaled = true
            infoLabel.BackgroundTransparency = 1
            infoLabel.Font = Enum.Font.Gotham

            local closeButtonInInfo = Instance.new("TextButton", infoFrame)
            closeButtonInInfo.Size = UDim2.new(0, 100, 0, 40)
            closeButtonInInfo.Position = UDim2.new(0.5, -50, 0.9, 0)
            closeButtonInInfo.Text = "关闭"
            closeButtonInInfo.TextColor3 = Color3.new(1, 1, 1) 
            closeButtonInInfo.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            closeButtonInInfo.BorderSizePixel = 0
            closeButtonInInfo.Font = Enum.Font.GothamMedium
            closeButtonInInfo.TextScaled = true

            closeButtonInInfo.MouseButton1Click:Connect(function()
                infoFrame:Destroy()
                animating = false 
            end)

            createFadeInAnimation(infoFrame)
        end
    end)

    unknownButton.MouseButton1Down:Connect(function()
        if not animating then  
            unknownButton:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.2, true)
        end
    end)
end

local mouse = services.Players.LocalPlayer:GetMouse()

function Tween(obj, t, data)
    services.TweenService:Create(obj, TweenInfo.new(t[1], Enum.EasingStyle[t[2]], Enum.EasingDirection[t[3]]), data):Play()
    return true
end

function Ripple(obj)
    spawn(
        function()
            if obj.ClipsDescendants ~= true then
                obj.ClipsDescendants = true
            end
            local Ripple = Instance.new("ImageLabel")
            Ripple.Name = "Ripple"
            Ripple.Parent = obj
            Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Ripple.BackgroundTransparency = 1.000
            Ripple.ZIndex = 8
            Ripple.Image = "rbxassetid://2708891598"
            Ripple.ImageTransparency = 0.800
            Ripple.ScaleType = Enum.ScaleType.Fit
            Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Ripple.Position =
                UDim2.new(
                (mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X,
                0,
                (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y,
                0)
            Tween(
                Ripple,
                {.3, "Linear", "InOut"},
                {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)})
            wait(0.15)
            Tween(Ripple, {.3, "Linear", "InOut"}, {ImageTransparency = 1})
            wait(.3)
            Ripple:Destroy()
        end)
end

local toggled = false

-- # Switch Tabs # --
local switchingTabs = false
function switchTab(new)
    if switchingTabs then
        return
    end
    local old = library.currentTab
    if old == nil then
        new[2].Visible = true
        library.currentTab = new
        services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
        services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
        return
    end

    if old[1] == new[1] then
        return
    end
    switchingTabs = true
    library.currentTab = new

    services.TweenService:Create(old[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
    services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
    services.TweenService:Create(old[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
    services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

    old[2].Visible = false
    new[2].Visible = true

    task.wait(0.1)

    switchingTabs = false
end

-- # Drag, Stolen from Kiriot or Wally # --
function drag(frame, hold)
    if not hold then
        hold = frame
    end
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    hold.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
            end
        end)

    frame.InputChanged:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

    services.UserInputService.InputChanged:Connect(
        function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
end

function library.NEWS(library, name, theme)
    for _, v in next, services.CoreGui:GetChildren() do
        if v.Name == "zhunzhi" then
            v:Destroy()
        end
    end
        

local TweenService = game:GetService("TweenService")
local textLabel = script.Parent 
local Colour = Color3.fromRGB(0, 255, 255)--名字颜色

if theme == 'dark' then
    MainColor = Color3.fromRGB(5, 5, 5)
    Background = Color3.fromRGB(0, 0, 0)
    zyColor = Color3.fromRGB(10, 10, 10)
    beijingColor = Color3.fromRGB(105, 105, 105)
    TextColor = Colour
    interfaceTransparency = 0.600 --界面透明
    NameTransparency = 0  --名字透明
else
    MainColor = Color3.fromRGB(5, 5, 5)
    Background = Color3.fromRGB(0, 0, 0)
    zyColor = Color3.fromRGB(10, 10, 10)
    beijingColor = Color3.fromRGB(105, 105, 105)
    TextColor = Colour
    interfaceTransparency = 0.600 --界面透明
    NameTransparency = 0  --名字透明
end



    local dogent = Instance.new("ScreenGui")
    local CloudMain = Instance.new("Frame")
    local TabMain = Instance.new("Frame")
    local MainC = Instance.new("UICorner")
    local SB = Instance.new("Frame")
    local SBC = Instance.new("UICorner")
    local Side = Instance.new("Frame")
    local SideG = Instance.new("UIGradient")
    local TabBtns = Instance.new("ScrollingFrame")
    local TabBtnsL = Instance.new("UIListLayout")
    local ScriptTitle = Instance.new("TextLabel")
    local SBG = Instance.new("UIGradient")
    local Open = Instance.new("TextButton")
    local UIG = Instance.new("UIGradient")
    local DropShadowHolder = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")
    local UICornerMain = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local UIGradientTitle = Instance.new("UIGradient")

    if syn and syn.protect_gui then
        syn.protect_gui(dogent)
    end

    dogent.Name = "zhunzhi"
    dogent.Parent = services.CoreGui

    function UiDestroy()
        dogent:Destroy()
    end

    function ToggleUILib()
        if not ToggleUI then
            dogent.Enabled = false
            ToggleUI = true
        else
            ToggleUI = false
            dogent.Enabled = true
        end
    end

    CloudMain.Name = "CloudMain"
    CloudMain.Parent = dogent
    CloudMain.AnchorPoint = Vector2.new(0.5, 0.5)
    CloudMain.BackgroundColor3 = Background
    CloudMain.BorderColor3 = MainColor
    CloudMain.Position = UDim2.new(0.5, 0, 0.5, 0)
    CloudMain.Size = UDim2.new(0, 572, 0, 353)
    CloudMain.ZIndex = 1
    CloudMain.Transparency = 0.800
    CloudMain.Active = true
    CloudMain.Draggable = true
    services.UserInputService.InputEnded:Connect(function(input)
          if input.KeyCode == Enum.KeyCode.LeftControl then
          if CloudMain.Visible == true then
          CloudMain.Visible = false else
          CloudMain.Visible = true
          end
          end
          end)
    drag(CloudMain)
          
    UICornerMain.Parent = CloudMain
    UICornerMain.CornerRadius = UDim.new(0, 3)

    DropShadowHolder.Name = "DropShadowHolder"
    DropShadowHolder.Parent = CloudMain
    DropShadowHolder.BackgroundTransparency = 1.000
    DropShadowHolder.BorderSizePixel = 0
    DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
    DropShadowHolder.BorderColor3 = TextColor
    DropShadowHolder.ZIndex = 0

    DropShadow.Name = "DropShadow"
    DropShadow.Parent = DropShadowHolder
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1.000
    DropShadow.BorderSizePixel = 0
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 43, 1, 43)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://"
    DropShadow.ImageColor3 = TextColor
    DropShadow.ImageTransparency = 0
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    UIGradient.Color = 
    ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(135, 206, 235)),  -- 轻云蓝（天空蓝）
        ColorSequenceKeypoint.new(0.10, Color3.fromRGB(200, 225, 255)),  -- 浅天蓝
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(211, 211, 211)),  -- 亮灰色（薄云）
        ColorSequenceKeypoint.new(0.30, Color3.fromRGB(180, 180, 180)),  -- 中灰色
        ColorSequenceKeypoint.new(0.40, Color3.fromRGB(192, 192, 192)),  -- 银色（中等云层）
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(169, 169, 169)),  -- 深灰色（厚云）
        ColorSequenceKeypoint.new(0.60, Color3.fromRGB(150, 150, 150)),  -- 更深灰色
        ColorSequenceKeypoint.new(0.70, Color3.fromRGB(105, 105, 105)),  -- 暴风云灰色
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(80, 80, 80)),    -- 暴风云加深
        ColorSequenceKeypoint.new(0.90, Color3.fromRGB(60, 60, 60)),    -- 几乎黑暗的云
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(135, 206, 235))   -- 轻云蓝（回到天空蓝）
    }
    UIGradient.Parent = DropShadow

    local TweenService = game:GetService("TweenService")
    local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
    local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
    tween:Play()

    function toggleui()
        toggled = not toggled
        spawn(
            function()
                if toggled then
                    wait(0.3)
                end
            end
        )
        Tween(
            CloudMain,
            {0.3, "Sine", "InOut"},
            {
                Size = UDim2.new(0, 609, 0, (toggled and 505 or 0))
            }
        )
    end

    TabMain.Name = "TabMain"
    TabMain.Parent = CloudMain
    TabMain.BackgroundColor3 = TextColor
    TabMain.BackgroundTransparency = 1.000
    TabMain.Position = UDim2.new(0.217000037, 0, 0, 3)
    TabMain.Size = UDim2.new(0, 448, 0, 353)
    

    MainC.CornerRadius = UDim.new(0, 5.5)
    MainC.Name = "MainC"
    MainC.Parent = Frame

    SB.Name = "SB"
    SB.Parent = CloudMain
    SB.BackgroundColor3 = TextColor
    SB.BorderColor3 = MainColor
    SB.Size = UDim2.new(0, 8, 0, 353)
    SB.Transparency = 0.700

    SBC.CornerRadius = UDim.new(0, 6)
    SBC.Name = "SBC"
    SBC.Parent = SB

    Side.Name = "Side"
    Side.Parent = SB
    Side.BackgroundColor3 = TextColor
    Side.BorderColor3 = TextColor
    Side.BorderSizePixel = 0
    Side.ClipsDescendants = true
    Side.Position = UDim2.new(1, 0, 0, 0)
    Side.Size = UDim2.new(0, 110, 0, 353)
    Side.Transparency = 0.700

    SideG.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
    SideG.Rotation = 90
    SideG.Name = "SideG"
    SideG.Parent = Side

    TabBtns.Name = "TabBtns"
    TabBtns.Parent = Side
    TabBtns.Active = true
    TabBtns.BackgroundColor3 = TextColor
    TabBtns.BackgroundTransparency = 1.000
    TabBtns.BorderSizePixel = 0
    TabBtns.Position = UDim2.new(0, 0, 0.0973535776, 0)
    TabBtns.Size = UDim2.new(0, 110, 0, 318)
    TabBtns.CanvasSize = UDim2.new(0, 0, 1, 0)
    TabBtns.ScrollBarThickness = 0

    TabBtnsL.Name = "TabBtnsL"
    TabBtnsL.Parent = TabBtns
    TabBtnsL.SortOrder = Enum.SortOrder.LayoutOrder
    TabBtnsL.Padding = UDim.new(0, 12)

    ScriptTitle.Name = "ScriptTitle"
    ScriptTitle.Parent = Side
    ScriptTitle.BackgroundColor3 = TextColor
    ScriptTitle.BackgroundTransparency = 1.000
    ScriptTitle.Position = UDim2.new(0, 0, 0.00953488424, 0)
    ScriptTitle.Size = UDim2.new(0, 102, 0, 20)
    ScriptTitle.Font = Enum.Font.GothamSemibold
    ScriptTitle.Text = name
    ScriptTitle.TextColor3 = TextColor
    ScriptTitle.TextSize = 14.000
    ScriptTitle.TextScaled = true
    ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

    UIGradientTitle.Parent = ScriptTitle

    local function NPLHKB_fake_script()
        local script = Instance.new("LocalScript", ScriptTitle)

        local button = script.Parent
        local gradient = button.UIGradient
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local offset = {Offset = Vector2.new(1, 0)}
        local create = ts:Create(gradient, ti, offset)
        local startingPos = Vector2.new(-1, 0)
        local list = {}
        local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
        local counter = 0
        local status = "down"
        gradient.Offset = startingPos
        local function rainbowColors()
            local sat, val = 255, 255
            for i = 1, 10 do
                local hue = i * 17
                table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
            end
        end
        rainbowColors()
        gradient.Color =
            s(
            {
                kpt(0, list[#list]),
                kpt(0.5, list[#list - 1]),
                kpt(1, list[#list - 2])
            }
        )
        counter = #list
        local function animate()
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 180
            if counter == #list - 1 and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[#list]),
                        kpt(1, list[1])
                    }
                )
                counter = 1
                status = "up"
            elseif counter == #list and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[1]),
                        kpt(1, list[2])
                    }
                )
                counter = 2
                status = "up"
            elseif counter <= #list - 2 and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[counter + 1]),
                        kpt(1, list[counter + 2])
                    }
                )
                counter = counter + 2
                status = "up"
            end
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 0
            if counter == #list - 1 and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[1]),
                        kpt(0.5, list[#list]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = 1
                status = "down"
            elseif counter == #list and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[2]),
                        kpt(0.5, list[1]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = 2
                status = "down"
            elseif counter <= #list - 2 and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[counter + 2]),
                        kpt(0.5, list[counter + 1]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = counter + 2
                status = "down"
            end
            animate()
        end
        animate()
    end
    coroutine.wrap(NPLHKB_fake_script)()

    SBG.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
    SBG.Rotation = 90
    SBG.Name = "SBG"
    SBG.Parent = SB

    TabBtnsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            TabBtns.CanvasSize = UDim2.new(0, 0, 0, TabBtnsL.AbsoluteContentSize.Y + 18)
        end
    )
    Open.Name = "Open"
    Open.Parent = dogent
    Open.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Open.BackgroundTransparency = 0
    Open.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
    Open.Size = UDim2.new(0, 61, 0, 32)
    Open.Transparency = 0.800
    Open.Font = Enum.Font.SourceSans
    Open.Text = "隐藏/打开"
    Open.TextColor3 = Color3.fromRGB(255, 255, 255)
    Open.TextTransparency = 0
    Open.TextSize = 14.000
    Open.Active = true
    Open.Draggable = true
    Open.MouseButton1Click:Connect(function()
          CloudMain.Visible = not CloudMain.Visible
          end)
    UIG.Parent = Open
    local window = {}
    function window.Tab(window, name, icon)
        local Tab = Instance.new("ScrollingFrame")
        local TabIco = Instance.new("ImageLabel")
        local TabText = Instance.new("TextLabel")
        local TabBtn = Instance.new("TextButton")
        local TabL = Instance.new("UIListLayout")

        Tab.Name = "Tab"
        Tab.Parent = TabMain
        Tab.Active = true
        Tab.BackgroundColor3 = TextColor
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(1, 0, 1, 0)
        Tab.ScrollBarThickness = 2
        Tab.Visible = false

        TabIco.Name = "TabIco"
        TabIco.Parent = TabBtns
        TabIco.BackgroundTransparency = 1.000
        TabIco.BorderSizePixel = 0
        TabIco.Size = UDim2.new(0, 24, 0, 24)
        TabIco.Image = ("rbxassetid://%s"):format((icon or 4370341699))
        TabIco.ImageTransparency = 0.2

        TabText.Name = "TabText"
        TabText.Parent = TabIco
        TabText.BackgroundColor3 = TextColor
        TabText.BackgroundTransparency = 1.000
        TabText.Position = UDim2.new(1.41666663, 0, 0, 0)
        TabText.Size = UDim2.new(0, 76, 0, 24)
        TabText.Font = Enum.Font.GothamSemibold
        TabText.Text = name
        TabText.TextColor3 = TextColor
        TabText.TextSize = 14.000
        TabText.TextXAlignment = Enum.TextXAlignment.Left
        TabText.TextTransparency = 0.2

        TabBtn.Name = "TabBtn"
        TabBtn.Parent = TabIco
        TabBtn.BackgroundColor3 = TextColor
        TabBtn.BackgroundTransparency = 1.000
        TabBtn.BorderSizePixel = 0
        TabBtn.Size = UDim2.new(0, 110, 0, 24)
        TabBtn.AutoButtonColor = false
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000

        TabL.Name = "TabL"
        TabL.Parent = Tab
        TabL.SortOrder = Enum.SortOrder.LayoutOrder
        TabL.Padding = UDim.new(0, 4)

        TabBtn.MouseButton1Click:Connect(
            function()
                spawn(
                    function()
                        Ripple(TabBtn)
                    end
                )
                switchTab({TabIco, Tab})
            end
        )

        if library.currentTab == nil then
            switchTab({TabIco, Tab})
        end

        TabL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                Tab.CanvasSize = UDim2.new(0, 0, 0, TabL.AbsoluteContentSize.Y + 8)
            end
        )

        local tab = {}
        function tab.section(tab, name, TabVal)
            local Section = Instance.new("Frame")
            local SectionC = Instance.new("UICorner")
            local SectionText = Instance.new("TextLabel")
            local SectionOpen = Instance.new("ImageLabel")
            local SectionOpened = Instance.new("ImageLabel")
            local SectionToggle = Instance.new("ImageButton")
            local Objs = Instance.new("Frame")
            local ObjsL = Instance.new("UIListLayout")

            Section.Name = "Section"
            Section.Parent = Tab
            Section.BackgroundColor3 = zyColor
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.ClipsDescendants = true
            Section.Size = UDim2.new(0.981000006, 0, 0, 36)

            SectionC.CornerRadius = UDim.new(0, 6)
            SectionC.Name = "SectionC"
            SectionC.Parent = Section

            SectionText.Name = "SectionText"
            SectionText.Parent = Section
            SectionText.BackgroundColor3 = TextColor
            SectionText.BackgroundTransparency = 1.000
            SectionText.Position = UDim2.new(0.0887396261, 0, 0, 0)
            SectionText.Size = UDim2.new(0, 401, 0, 36)
            SectionText.Font = Enum.Font.GothamSemibold
            SectionText.Text = name
            SectionText.TextColor3 = TextColor
            SectionText.TextSize = 16.000
            SectionText.TextXAlignment = Enum.TextXAlignment.Left

            SectionOpen.Name = "SectionOpen"
            SectionOpen.Parent = SectionText
            SectionOpen.BackgroundTransparency = 1
            SectionOpen.BorderSizePixel = 0
            SectionOpen.Position = UDim2.new(0, -33, 0, 5)
            SectionOpen.Size = UDim2.new(0, 26, 0, 26)
            SectionOpen.Image = "http://www.roblox.com/asset/?id=6031302934"

            SectionOpened.Name = "SectionOpened"
            SectionOpened.Parent = SectionOpen
            SectionOpened.BackgroundTransparency = 1.000
            SectionOpened.BorderSizePixel = 0
            SectionOpened.Size = UDim2.new(0, 26, 0, 26)
            SectionOpened.Image = "http://www.roblox.com/asset/?id=6031302932"
            SectionOpened.ImageTransparency = 1.000

            SectionToggle.Name = "SectionToggle"
            SectionToggle.Parent = SectionOpen
            SectionToggle.BackgroundTransparency = 1
            SectionToggle.BorderSizePixel = 0
            SectionToggle.Size = UDim2.new(0, 26, 0, 26)

            Objs.Name = "Objs"
            Objs.Parent = Section
            Objs.BackgroundColor3 = TextColor
            Objs.BackgroundTransparency = 1
            Objs.BorderSizePixel = 0
            Objs.Position = UDim2.new(0, 6, 0, 36)
            Objs.Size = UDim2.new(0.986347735, 0, 0, 0)

            ObjsL.Name = "ObjsL"
            ObjsL.Parent = Objs
            ObjsL.SortOrder = Enum.SortOrder.LayoutOrder
            ObjsL.Padding = UDim.new(0, 8)

            local open = TabVal
            if TabVal ~= false then
                Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
                SectionOpened.ImageTransparency = (open and 0 or 1)
                SectionOpen.ImageTransparency = (open and 1 or 0)
            end

            SectionToggle.MouseButton1Click:Connect(
                function()
                    open = not open
                    Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
                    SectionOpened.ImageTransparency = (open and 0 or 1)
                    SectionOpen.ImageTransparency = (open and 1 or 0)
                end
            )

            ObjsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    if not open then
                        return
                    end
                    Section.Size = UDim2.new(0.981000006, 0, 0, 36 + ObjsL.AbsoluteContentSize.Y + 8)
                end
            )

            local section = {}
            function section.Button(section, text, callback)
                local callback = callback or function()
                    end

                local BtnModule = Instance.new("Frame")
                local Btn = Instance.new("TextButton")
                local BtnC = Instance.new("UICorner")

                BtnModule.Name = "BtnModule"
                BtnModule.Parent = Objs
                BtnModule.BackgroundColor3 = TextColor
                BtnModule.BackgroundTransparency = 1.000
                BtnModule.BorderSizePixel = 0
                BtnModule.Position = UDim2.new(0, 0, 0, 0)
                BtnModule.Size = UDim2.new(0, 428, 0, 38)

                Btn.Name = "Btn"
                Btn.Parent = BtnModule
                Btn.BackgroundColor3 = zyColor
                Btn.BorderSizePixel = 0
                Btn.Size = UDim2.new(0, 428, 0, 38)
                Btn.AutoButtonColor = false
                Btn.Font = Enum.Font.GothamSemibold
                Btn.Text = "   " .. text
                Btn.TextColor3 = TextColor
                Btn.TextSize = 16.000
                Btn.TextXAlignment = Enum.TextXAlignment.Left
                Btn.Transparency = interfaceTransparency
                Btn.TextTransparency = NameTransparency

                BtnC.CornerRadius = UDim.new(0, 6)
                BtnC.Name = "BtnC"
                BtnC.Parent = Btn

                Btn.MouseButton1Click:Connect(
                    function()
                        spawn(
                            function()
                                Ripple(Btn)
                            end
                        )
                        spawn(callback)
                    end
                )
            end

            function section:Label(text)
                local LabelModule = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")
                local LabelC = Instance.new("UICorner")

                LabelModule.Name = "LabelModule"
                LabelModule.Parent = Objs
                LabelModule.BackgroundColor3 = TextColor
                LabelModule.BackgroundTransparency = 1.000
                LabelModule.BorderSizePixel = 0
                LabelModule.Position = UDim2.new(0, 0, NAN, 0)
                LabelModule.Size = UDim2.new(0, 428, 0, 19)
                

                TextLabel.Parent = LabelModule
                TextLabel.Transparency = interfaceTransparency
                TextLabel.BackgroundColor3 = zyColor
                TextLabel.Size = UDim2.new(0, 428, 0, 22)
                TextLabel.Font = Enum.Font.GothamSemibold
                TextLabel.Text = text
                TextLabel.TextColor3 = TextColor
                TextLabel.TextSize = 14.000
                TextLabel.TextTransparency = NameTransparency


                LabelC.CornerRadius = UDim.new(0, 6)
                LabelC.Name = "LabelC"
                LabelC.Parent = TextLabel
                return TextLabel
            end

            function section.Toggle(section, text, flag, enabled, callback)
                local callback = callback or function()
                    end
                local enabled = enabled or false
                assert(text, "No text provided")
                assert(flag, "No flag provided")

                library.flags[flag] = enabled

                local ToggleModule = Instance.new("Frame")
                local ToggleBtn = Instance.new("TextButton")
                local ToggleBtnC = Instance.new("UICorner")
                local ToggleDisable = Instance.new("Frame")
                local ToggleSwitch = Instance.new("Frame")
                local ToggleSwitchC = Instance.new("UICorner")
                local ToggleDisableC = Instance.new("UICorner")

                ToggleModule.Name = "ToggleModule"
                ToggleModule.Parent = Objs
                ToggleModule.BackgroundColor3 = TextColor
                ToggleModule.BackgroundTransparency = 1.000
                ToggleModule.BorderSizePixel = 0
                ToggleModule.Position = UDim2.new(0, 0, 0, 0)
                ToggleModule.Size = UDim2.new(0, 428, 0, 38)

                ToggleBtn.Name = "ToggleBtn"
                ToggleBtn.Parent = ToggleModule
                ToggleBtn.BackgroundColor3 = zyColor
                ToggleBtn.BorderSizePixel = 0
                ToggleBtn.Size = UDim2.new(0, 428, 0, 38)
                ToggleBtn.AutoButtonColor = false
                ToggleBtn.Font = Enum.Font.GothamSemibold
                ToggleBtn.Text = "   " .. text
                ToggleBtn.TextColor3 = TextColor
                ToggleBtn.TextSize = 16.000
                ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
                ToggleBtn.Transparency = interfaceTransparency
                ToggleBtn.TextTransparency = NameTransparency

                ToggleBtnC.CornerRadius = UDim.new(0, 6)
                ToggleBtnC.Name = "ToggleBtnC"
                ToggleBtnC.Parent = ToggleBtn

                ToggleDisable.Name = "ToggleDisable"
                ToggleDisable.Parent = ToggleBtn
                ToggleDisable.BackgroundColor3 = Background
                ToggleDisable.BorderSizePixel = 0
                ToggleDisable.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
                ToggleDisable.Size = UDim2.new(0, 36, 0, 22)

                ToggleSwitch.Name = "ToggleSwitch"
                ToggleSwitch.Parent = ToggleDisable
                ToggleSwitch.BackgroundColor3 = beijingColor
                ToggleSwitch.Size = UDim2.new(0, 24, 0, 22)

                ToggleSwitchC.CornerRadius = UDim.new(0, 6)
                ToggleSwitchC.Name = "ToggleSwitchC"
                ToggleSwitchC.Parent = ToggleSwitch

                ToggleDisableC.CornerRadius = UDim.new(0, 6)
                ToggleDisableC.Name = "ToggleDisableC"
                ToggleDisableC.Parent = ToggleDisable

                local funcs = {
                    SetState = function(self, state)
                        if state == nil then
                            state = not library.flags[flag]
                        end
                        if library.flags[flag] == state then
                            return
                        end
                        services.TweenService:Create(
                            ToggleSwitch,
                            TweenInfo.new(0.2),
                            {
                                Position = UDim2.new(0, (state and ToggleSwitch.Size.X.Offset / 2 or 0), 0, 0),
                                BackgroundColor3 = (state and TextColor or beijingColor)
                            }
                        ):Play()
                        library.flags[flag] = state
                        callback(state)
                    end,
                    Module = ToggleModule
                }

                if enabled ~= false then
                    funcs:SetState(flag, true)
                end

                ToggleBtn.MouseButton1Click:Connect(
                    function()
                        funcs:SetState()
                    end
                )
                return funcs
            end

            function section.Keybind(section, text, default, callback)
                local callback = callback or function()
                    end
                assert(text, "No text provided")
                assert(default, "No default key provided")

                local default = (typeof(default) == "string" and Enum.KeyCode[default] or default)
                local banned = {
                    Return = true,
                    Space = true,
                    Tab = true,
                    Backquote = true,
                    CapsLock = true,
                    Escape = true,
                    Unknown = true
                }
                local shortNames = {
                    RightControl = "Right Ctrl",
                    LeftControl = "Left Ctrl",
                    LeftShift = "Left Shift",
                    RightShift = "Right Shift",
                    Semicolon = ";",
                    Quote = '"',
                    LeftBracket = "[",
                    RightBracket = "]",
                    Equals = "=",
                    Minus = "-",
                    RightAlt = "Right Alt",
                    LeftAlt = "Left Alt"
                }

                local bindKey = default
                local keyTxt = (default and (shortNames[default.Name] or default.Name) or "None")

                local KeybindModule = Instance.new("Frame")
                local KeybindBtn = Instance.new("TextButton")
                local KeybindBtnC = Instance.new("UICorner")
                local KeybindValue = Instance.new("TextButton")
                local KeybindValueC = Instance.new("UICorner")
                local KeybindL = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")

                KeybindModule.Name = "KeybindModule"
                KeybindModule.Parent = Objs
                KeybindModule.BackgroundColor3 = TextColor
                KeybindModule.BackgroundTransparency = 1.000
                KeybindModule.BorderSizePixel = 0
                KeybindModule.Position = UDim2.new(0, 0, 0, 0)
                KeybindModule.Size = UDim2.new(0, 428, 0, 38)

                KeybindBtn.Name = "KeybindBtn"
                KeybindBtn.Parent = KeybindModule
                KeybindBtn.BackgroundColor3 = zyColor
                KeybindBtn.BorderSizePixel = 0
                KeybindBtn.Size = UDim2.new(0, 428, 0, 38)
                KeybindBtn.AutoButtonColor = false
                KeybindBtn.Font = Enum.Font.GothamSemibold
                KeybindBtn.Text = "   " .. text
                KeybindBtn.TextColor3 = TextColor
                KeybindBtn.TextSize = 16.000
                KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left
                KeybindBtn.Transparency = interfaceTransparency
                KeybindBtn.TextTransparency = NameTransparency

                KeybindBtnC.CornerRadius = UDim.new(0, 6)
                KeybindBtnC.Name = "KeybindBtnC"
                KeybindBtnC.Parent = KeybindBtn

                KeybindValue.Name = "KeybindValue"
                KeybindValue.Parent = KeybindBtn
                KeybindValue.BackgroundColor3 = Background
                KeybindValue.BorderSizePixel = 0
                KeybindValue.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                KeybindValue.Size = UDim2.new(0, 100, 0, 28)
                KeybindValue.AutoButtonColor = false
                KeybindValue.Font = Enum.Font.Gotham
                KeybindValue.Text = keyTxt
                KeybindValue.TextColor3 = TextColor
                KeybindValue.TextSize = 14.000

                KeybindValueC.CornerRadius = UDim.new(0, 6)
                KeybindValueC.Name = "KeybindValueC"
                KeybindValueC.Parent = KeybindValue

                KeybindL.Name = "KeybindL"
                KeybindL.Parent = KeybindBtn
                KeybindL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                KeybindL.SortOrder = Enum.SortOrder.LayoutOrder
                KeybindL.VerticalAlignment = Enum.VerticalAlignment.Center

                UIPadding.Parent = KeybindBtn
                UIPadding.PaddingRight = UDim.new(0, 6)

                services.UserInputService.InputBegan:Connect(
                    function(inp, gpe)
                        if gpe then
                            return
                        end
                        if inp.UserInputType ~= Enum.UserInputType.Keyboard then
                            return
                        end
                        if inp.KeyCode ~= bindKey then
                            return
                        end
                        callback(bindKey.Name)
                    end)

                KeybindValue.MouseButton1Click:Connect(
                    function()
                        KeybindValue.Text = "..."
                        wait()
                        local key, uwu = services.UserInputService.InputEnded:Wait()
                        local keyName = tostring(key.KeyCode.Name)
                        if key.UserInputType ~= Enum.UserInputType.Keyboard then
                            KeybindValue.Text = keyTxt
                            return
                        end
                        if banned[keyName] then
                            KeybindValue.Text = keyTxt
                            return
                        end
                        wait()
                        bindKey = Enum.KeyCode[keyName]
                        KeybindValue.Text = shortNames[keyName] or keyName
                    end)

                KeybindValue:GetPropertyChangedSignal("TextBounds"):Connect(
                    function()
                        KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
                    end)
                KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
            end

            function section.Textbox(section, text, flag, default, callback)
                local callback = callback or function()
                    end
                assert(text, "No text provided")
                assert(flag, "No flag provided")
                assert(default, "No default text provided")

                library.flags[flag] = default

                local TextboxModule = Instance.new("Frame")
                local TextboxBack = Instance.new("TextButton")
                local TextboxBackC = Instance.new("UICorner")
                local BoxBG = Instance.new("TextButton")
                local BoxBGC = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local TextboxBackL = Instance.new("UIListLayout")
                local TextboxBackP = Instance.new("UIPadding")

                TextboxModule.Name = "TextboxModule"
                TextboxModule.Parent = Objs
                TextboxModule.BackgroundColor3 = TextColor
                TextboxModule.BackgroundTransparency = 1.000
                TextboxModule.BorderSizePixel = 0
                TextboxModule.Position = UDim2.new(0, 0, 0, 0)
                TextboxModule.Size = UDim2.new(0, 428, 0, 38)

                TextboxBack.Name = "TextboxBack"
                TextboxBack.Parent = TextboxModule
                TextboxBack.BackgroundColor3 = zyColor
                TextboxBack.BorderSizePixel = 0
                TextboxBack.Size = UDim2.new(0, 428, 0, 38)
                TextboxBack.AutoButtonColor = false
                TextboxBack.Font = Enum.Font.GothamSemibold
                TextboxBack.Text = "   " .. text
                TextboxBack.TextColor3 = TextColor
                TextboxBack.TextSize = 16.000
                TextboxBack.TextXAlignment = Enum.TextXAlignment.Left
                TextboxBack.Transparency = interfaceTransparency
                TextboxBack.TextTransparency = NameTransparency

                TextboxBackC.CornerRadius = UDim.new(0, 6)
                TextboxBackC.Name = "TextboxBackC"
                TextboxBackC.Parent = TextboxBack

                BoxBG.Name = "BoxBG"
                BoxBG.Parent = TextboxBack
                BoxBG.BackgroundColor3 = Background
                BoxBG.BorderSizePixel = 0
                BoxBG.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                BoxBG.Size = UDim2.new(0, 100, 0, 28)
                BoxBG.AutoButtonColor = false
                BoxBG.Font = Enum.Font.Gotham
                BoxBG.Text = ""
                BoxBG.TextColor3 = TextColor
                BoxBG.TextSize = 14.000

                BoxBGC.CornerRadius = UDim.new(0, 6)
                BoxBGC.Name = "BoxBGC"
                BoxBGC.Parent = BoxBG

                TextBox.Parent = BoxBG
                TextBox.BackgroundColor3 = TextColor
                TextBox.BackgroundTransparency = 1.000
                TextBox.BorderSizePixel = 0
                TextBox.Size = UDim2.new(1, 0, 1, 0)
                TextBox.Font = Enum.Font.Gotham
                TextBox.Text = default
                TextBox.TextColor3 = TextColor
                TextBox.TextSize = 14.000

                TextboxBackL.Name = "TextboxBackL"
                TextboxBackL.Parent = TextboxBack
                TextboxBackL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                TextboxBackL.SortOrder = Enum.SortOrder.LayoutOrder
                TextboxBackL.VerticalAlignment = Enum.VerticalAlignment.Center

                TextboxBackP.Name = "TextboxBackP"
                TextboxBackP.Parent = TextboxBack
                TextboxBackP.PaddingRight = UDim.new(0, 6)

                TextBox.FocusLost:Connect(
                    function()
                        if TextBox.Text == "" then
                            TextBox.Text = default
                        end
                        library.flags[flag] = TextBox.Text
                        callback(TextBox.Text)
                    end)

                TextBox:GetPropertyChangedSignal("TextBounds"):Connect(
                    function()
                        BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
                    end)
                BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
            end

            function section.Slider(section, text, flag, default, min, max, precise, callback)
                local callback = callback or function()
                    end
                local min = min or 1
                local max = max or 10
                local default = default or min
                local precise = precise or false

                library.flags[flag] = default

                assert(text, "No text provided")
                assert(flag, "No flag provided")
                assert(default, "No default value provided")

                local SliderModule = Instance.new("Frame")
                local SliderBack = Instance.new("TextButton")
                local SliderBackC = Instance.new("UICorner")
                local SliderBar = Instance.new("Frame")
                local SliderBarC = Instance.new("UICorner")
                local SliderPart = Instance.new("Frame")
                local SliderPartC = Instance.new("UICorner")
                local SliderValBG = Instance.new("TextButton")
                local SliderValBGC = Instance.new("UICorner")
                local SliderValue = Instance.new("TextBox")
                local MinSlider = Instance.new("TextButton")
                local AddSlider = Instance.new("TextButton")

                SliderModule.Name = "SliderModule"
                SliderModule.Parent = Objs
                SliderModule.BackgroundColor3 = TextColor
                SliderModule.BackgroundTransparency = 1.000
                SliderModule.BorderSizePixel = 0
                SliderModule.Position = UDim2.new(0, 0, 0, 0)
                SliderModule.Size = UDim2.new(0, 428, 0, 38)

                SliderBack.Name = "SliderBack"
                SliderBack.Parent = SliderModule
                SliderBack.BackgroundColor3 = zyColor
                SliderBack.BorderSizePixel = 0
                SliderBack.Size = UDim2.new(0, 428, 0, 38)
                SliderBack.AutoButtonColor = false
                SliderBack.Font = Enum.Font.GothamSemibold
                SliderBack.Text = "   " .. text
                SliderBack.TextColor3 = TextColor
                SliderBack.TextSize = 16.000
                SliderBack.TextXAlignment = Enum.TextXAlignment.Left
                SliderBack.Transparency = interfaceTransparency
                SliderBack.TextTransparency = NameTransparency

                SliderBackC.CornerRadius = UDim.new(0, 6)
                SliderBackC.Name = "SliderBackC"
                SliderBackC.Parent = SliderBack

                SliderBar.Name = "SliderBar"
                SliderBar.Parent = SliderBack
                SliderBar.AnchorPoint = Vector2.new(0, 0.5)
                SliderBar.BackgroundColor3 = Background
                SliderBar.BorderSizePixel = 0
                SliderBar.Position = UDim2.new(0.369000018, 40, 0.5, 0)
                SliderBar.Size = UDim2.new(0, 140, 0, 12)

                SliderBarC.CornerRadius = UDim.new(0, 4)
                SliderBarC.Name = "SliderBarC"
                SliderBarC.Parent = SliderBar

                SliderPart.Name = "SliderPart"
                SliderPart.Parent = SliderBar
                SliderPart.BackgroundColor3 = TextColor
                SliderPart.BorderSizePixel = 0
                SliderPart.Size = UDim2.new(0, 54, 0, 13)

                SliderPartC.CornerRadius = UDim.new(0, 4)
                SliderPartC.Name = "SliderPartC"
                SliderPartC.Parent = SliderPart

                SliderValBG.Name = "SliderValBG"
                SliderValBG.Parent = SliderBack
                SliderValBG.BackgroundColor3 = Background
                SliderValBG.BorderSizePixel = 0
                SliderValBG.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
                SliderValBG.Size = UDim2.new(0, 44, 0, 28)
                SliderValBG.AutoButtonColor = false
                SliderValBG.Font = Enum.Font.Gotham
                SliderValBG.Text = ""
                SliderValBG.TextColor3 = TextColor
                SliderValBG.TextSize = 14.000

                SliderValBGC.CornerRadius = UDim.new(0, 6)
                SliderValBGC.Name = "SliderValBGC"
                SliderValBGC.Parent = SliderValBG

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = SliderValBG
                SliderValue.BackgroundColor3 = TextColor
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.BorderSizePixel = 0
                SliderValue.Size = UDim2.new(1, 0, 1, 0)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text = "1000"
                SliderValue.TextColor3 = TextColor
                SliderValue.TextSize = 14.000

                MinSlider.Name = "MinSlider"
                MinSlider.Parent = SliderModule
                MinSlider.BackgroundColor3 = TextColor
                MinSlider.BackgroundTransparency = 1.000
                MinSlider.BorderSizePixel = 0
                MinSlider.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
                MinSlider.Size = UDim2.new(0, 20, 0, 20)
                MinSlider.Font = Enum.Font.Gotham
                MinSlider.Text = "-"
                MinSlider.TextColor3 = TextColor
                MinSlider.TextSize = 24.000
                MinSlider.TextWrapped = true

                AddSlider.Name = "AddSlider"
                AddSlider.Parent = SliderModule
                AddSlider.AnchorPoint = Vector2.new(0, 0.5)
                AddSlider.BackgroundColor3 = TextColor
                AddSlider.BackgroundTransparency = 1.000
                AddSlider.BorderSizePixel = 0
                AddSlider.Position = UDim2.new(0.810906529, 0, 0.5, 0)
                AddSlider.Size = UDim2.new(0, 20, 0, 20)
                AddSlider.Font = Enum.Font.Gotham
                AddSlider.Text = "+"
                AddSlider.TextColor3 = TextColor
                AddSlider.TextSize = 24.000
                AddSlider.TextWrapped = true

                local funcs = {
                    SetValue = function(self, value)
                        local percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
                        if value then
                            percent = (value - min) / (max - min)
                        end
                        percent = math.clamp(percent, 0, 1)
                        if precise then
                            value = value or tonumber(string.format("%.1f", tostring(min + (max - min) * percent)))
                        else
                            value = value or math.floor(min + (max - min) * percent)
                        end
                        library.flags[flag] = tonumber(value)
                        SliderValue.Text = tostring(value)
                        SliderPart.Size = UDim2.new(percent, 0, 1, 0)
                        callback(tonumber(value))
                    end}

                MinSlider.MouseButton1Click:Connect(
                    function()
                        local currentValue = library.flags[flag]
                        currentValue = math.clamp(currentValue - 1, min, max)
                        funcs:SetValue(currentValue)
                    end)

                AddSlider.MouseButton1Click:Connect(
                    function()
                        local currentValue = library.flags[flag]
                        currentValue = math.clamp(currentValue + 1, min, max)
                        funcs:SetValue(currentValue)
                    end)

                funcs:SetValue(default)

                local dragging, boxFocused, allowed =
                    false,
                    false,
                    {
                        [""] = true,
                        ["-"] = true
                    }

                SliderBar.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            funcs:SetValue()
                            dragging = true
                        end
                    end)

                services.UserInputService.InputEnded:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)

                services.UserInputService.InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            funcs:SetValue()
                        end
                    end)

                SliderBar.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            funcs:SetValue()
                            dragging = true
                        end
                    end)

                services.UserInputService.InputEnded:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                        end
                    end)

                services.UserInputService.InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.Touch then
                            funcs:SetValue()
                        end
                    end)

                SliderValue.Focused:Connect(
                    function()
                        boxFocused = true
                    end)

                SliderValue.FocusLost:Connect(
                    function()
                        boxFocused = false
                        if SliderValue.Text == "" then
                            funcs:SetValue(default)
                        end
                    end)

                SliderValue:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        if not boxFocused then
                            return
                        end
                        SliderValue.Text = SliderValue.Text:gsub("%D+", "")

                        local text = SliderValue.Text

                        if not tonumber(text) then
                            SliderValue.Text = SliderValue.Text:gsub("%D+", "")
                        elseif not allowed[text] then
                            if tonumber(text) > max then
                                text = max
                                SliderValue.Text = tostring(max)
                            end
                            funcs:SetValue(tonumber(text))
                        end
                    end)

                return funcs
            end
            function section.Dropdown(section, text, flag, options, callback)
                local callback = callback or function()
                    end
                local options = options or {}
                assert(text, "No text provided")
                assert(flag, "No flag provided")

                library.flags[flag] = nil

                local DropdownModule = Instance.new("Frame")
                local DropdownTop = Instance.new("TextButton")
                local DropdownTopC = Instance.new("UICorner")
                local DropdownOpen = Instance.new("TextButton")
                local DropdownText = Instance.new("TextBox")
                local DropdownModuleL = Instance.new("UIListLayout")
                local Option = Instance.new("TextButton")
                local OptionC = Instance.new("UICorner")

                DropdownModule.Name = "DropdownModule"
                DropdownModule.Parent = Objs
                DropdownModule.BackgroundColor3 = TextColor
                DropdownModule.BackgroundTransparency = 1.000
                DropdownModule.BorderSizePixel = 0
                DropdownModule.ClipsDescendants = true
                DropdownModule.Position = UDim2.new(0, 0, 0, 0)
                DropdownModule.Size = UDim2.new(0, 428, 0, 38)

                DropdownTop.Name = "DropdownTop"
                DropdownTop.Parent = DropdownModule
                DropdownTop.BackgroundColor3 = zyColor
                DropdownTop.BorderSizePixel = 0
                DropdownTop.Size = UDim2.new(0, 428, 0, 38)
                DropdownTop.AutoButtonColor = false
                DropdownTop.Font = Enum.Font.GothamSemibold
                DropdownTop.Text = ""
                DropdownTop.TextColor3 = TextColor
                DropdownTop.TextSize = 16.000
                DropdownTop.TextXAlignment = Enum.TextXAlignment.Left
                DropdownTop.Transparency = interfaceTransparency
                DropdownTop.TextTransparency = NameTransparency

                DropdownTopC.CornerRadius = UDim.new(0, 6)
                DropdownTopC.Name = "DropdownTopC"
                DropdownTopC.Parent = DropdownTop

                DropdownOpen.Name = "DropdownOpen"
                DropdownOpen.Parent = DropdownTop
                DropdownOpen.AnchorPoint = Vector2.new(0, 0.5)
                DropdownOpen.BackgroundColor3 = TextColor
                DropdownOpen.BackgroundTransparency = 1.000
                DropdownOpen.BorderSizePixel = 0
                DropdownOpen.Position = UDim2.new(0.918383181, 0, 0.5, 0)
                DropdownOpen.Size = UDim2.new(0, 20, 0, 20)
                DropdownOpen.Font = Enum.Font.Gotham
                DropdownOpen.Text = "+"
                DropdownOpen.TextColor3 = TextColor
                DropdownOpen.TextSize = 24.000
                DropdownOpen.TextWrapped = true

                DropdownText.Name = "DropdownText"
                DropdownText.Parent = DropdownTop
                DropdownText.BackgroundColor3 = TextColor
                DropdownText.BackgroundTransparency = 1.000
                DropdownText.BorderSizePixel = 0
                DropdownText.Position = UDim2.new(0.0373831764, 0, 0, 0)
                DropdownText.Size = UDim2.new(0, 184, 0, 38)
                DropdownText.Font = Enum.Font.GothamSemibold
                DropdownText.PlaceholderColor3 = TextColor
                DropdownText.PlaceholderText = text
                DropdownText.Text = ""
                DropdownText.TextColor3 = TextColor
                DropdownText.TextSize = 16.000
                DropdownText.TextXAlignment = Enum.TextXAlignment.Left

                DropdownModuleL.Name = "DropdownModuleL"
                DropdownModuleL.Parent = DropdownModule
                DropdownModuleL.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownModuleL.Padding = UDim.new(0, 4)

                local setAllVisible = function()
                    local options = DropdownModule:GetChildren()
                    for i = 1, #options do
                        local option = options[i]
                        if option:IsA("TextButton") and option.Name:match("Option_") then
                            option.Visible = true
                        end
                    end
                end

                local searchDropdown = function(text)
                    local options = DropdownModule:GetChildren()
                    for i = 1, #options do
                        local option = options[i]
                        if text == "" then
                            setAllVisible()
                        else
                            if option:IsA("TextButton") and option.Name:match("Option_") then
                                if option.Text:lower():match(text:lower()) then
                                    option.Visible = true
                                else
                                    option.Visible = false
                                end
                            end
                        end
                    end
                end

                local open = false
                local ToggleDropVis = function()
                    open = not open
                    if open then
                        setAllVisible()
                    end
                    DropdownOpen.Text = (open and "-" or "+")
                    DropdownModule.Size =
                        UDim2.new(0, 428, 0, (open and DropdownModuleL.AbsoluteContentSize.Y + 4 or 38))
                end

                DropdownOpen.MouseButton1Click:Connect(ToggleDropVis)
                DropdownText.Focused:Connect(
                    function()
                        if open then
                            return
                        end
                        ToggleDropVis()
                    end)

                DropdownText:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        if not open then
                            return
                        end
                        searchDropdown(DropdownText.Text)
                    end)

                DropdownModuleL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                    function()
                        if not open then
                            return
                        end
                        DropdownModule.Size = UDim2.new(0, 428, 0, (DropdownModuleL.AbsoluteContentSize.Y + 4))
                    end)

                local funcs = {}
                funcs.AddOption = function(self, option)
                    local Option = Instance.new("TextButton")
                    local OptionC = Instance.new("UICorner")

                    Option.Name = "Option_" .. option
                    Option.Parent = DropdownModule
                    Option.BackgroundColor3 = zyColor
                    Option.BorderSizePixel = 0
                    Option.Position = UDim2.new(0, 0, 0.328125, 0)
                    Option.Size = UDim2.new(0, 428, 0, 26)
                    Option.AutoButtonColor = false
                    Option.Font = Enum.Font.Gotham
                    Option.Text = option
                    Option.TextColor3 = TextColor
                    Option.TextSize = 14.000

                    OptionC.CornerRadius = UDim.new(0, 6)
                    OptionC.Name = "OptionC"
                    OptionC.Parent = Option

                    Option.MouseButton1Click:Connect(
                        function()
                            ToggleDropVis()
                            callback(Option.Text)
                            DropdownText.Text = Option.Text
                            library.flags[flag] = Option.Text
                        end)
                end

                funcs.RemoveOption = function(self, option)
                    local option = DropdownModule:FindFirstChild("Option_" .. option)
                    if option then
                        option:Destroy()
                    end
                end

                funcs.SetOptions = function(self, options)
                    for _, v in next, DropdownModule:GetChildren() do
                        if v.Name:match("Option_") then
                            v:Destroy()
                        end
                    end
                    for _, v in next, options do
                        funcs:AddOption(v)
                    end
                end

                funcs:SetOptions(options)

                return funcs
            end
            return section
        end
        return tab
    end
    return window
end
return library