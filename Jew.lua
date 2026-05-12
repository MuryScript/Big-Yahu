local Library = {}
Library.__index = Library

local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")

local Themes = {
    Bibi = {
        BG           = Color3.fromRGB(252, 250, 242),
        HeaderBG     = Color3.fromRGB(255, 255, 255),
        SectionBG    = Color3.fromRGB(255, 255, 255),
        SectionTitle = Color3.fromRGB(150, 120,   0),
        Text         = Color3.fromRGB( 10,  10,  30),
        SubText      = Color3.fromRGB(130, 100,  40),
        Separator    = Color3.fromRGB(220, 195, 120),
        Accent       = Color3.fromRGB(212, 175,  55),
        AccentDark   = Color3.fromRGB(165, 130,  10),
        ToggleOn     = Color3.fromRGB(  0,  56, 116),
        ToggleOff    = Color3.fromRGB(210, 225, 250),
        SliderTrack  = Color3.fromRGB(210, 225, 250),
        SliderFill   = Color3.fromRGB(212, 175,  55),
        White        = Color3.fromRGB(255, 255, 255),
        PressHL      = Color3.fromRGB(250, 242, 210),
        TabActive    = Color3.fromRGB(212, 175,  55),
        TabInactive  = Color3.fromRGB(160, 140,  80),
        Handle       = Color3.fromRGB(  0,  56, 116),
        DropHL       = Color3.fromRGB(252, 248, 232),
        CardStroke   = Color3.fromRGB(212, 175,  55),
    },
    IsraelBlue = {
        BG           = Color3.fromRGB(240, 246, 255),
        HeaderBG     = Color3.fromRGB(255, 255, 255),
        SectionBG    = Color3.fromRGB(255, 255, 255),
        SectionTitle = Color3.fromRGB(  0,  56, 116),
        Text         = Color3.fromRGB(  5,  10,  40),
        SubText      = Color3.fromRGB( 55,  90, 155),
        Separator    = Color3.fromRGB(170, 200, 240),
        Accent       = Color3.fromRGB(  0,  56, 116),
        AccentDark   = Color3.fromRGB(  0,  35,  80),
        ToggleOn     = Color3.fromRGB(  0, 105, 210),
        ToggleOff    = Color3.fromRGB(170, 200, 240),
        SliderTrack  = Color3.fromRGB(170, 200, 240),
        SliderFill   = Color3.fromRGB(  0,  56, 116),
        White        = Color3.fromRGB(255, 255, 255),
        PressHL      = Color3.fromRGB(210, 228, 255),
        TabActive    = Color3.fromRGB(  0,  56, 116),
        TabInactive  = Color3.fromRGB( 95, 138, 195),
        Handle       = Color3.fromRGB(  0,  56, 116),
        DropHL       = Color3.fromRGB(238, 246, 255),
        CardStroke   = Color3.fromRGB(  0,  56, 116),
    },
    Jerusalem = {
        BG           = Color3.fromRGB(250, 244, 232),
        HeaderBG     = Color3.fromRGB(255, 250, 240),
        SectionBG    = Color3.fromRGB(255, 252, 244),
        SectionTitle = Color3.fromRGB(145,  95,  35),
        Text         = Color3.fromRGB( 40,  22,   8),
        SubText      = Color3.fromRGB(165, 130,  85),
        Separator    = Color3.fromRGB(225, 205, 168),
        Accent       = Color3.fromRGB(  0,  56, 116),
        AccentDark   = Color3.fromRGB(  0,  35,  80),
        ToggleOn     = Color3.fromRGB(  0,  56, 116),
        ToggleOff    = Color3.fromRGB(225, 205, 168),
        SliderTrack  = Color3.fromRGB(225, 205, 168),
        SliderFill   = Color3.fromRGB(  0,  56, 116),
        White        = Color3.fromRGB(255, 252, 244),
        PressHL      = Color3.fromRGB(242, 228, 202),
        TabActive    = Color3.fromRGB(  0,  56, 116),
        TabInactive  = Color3.fromRGB(165, 130,  85),
        Handle       = Color3.fromRGB(  0,  56, 116),
        DropHL       = Color3.fromRGB(248, 240, 224),
        CardStroke   = Color3.fromRGB(200, 165, 100),
    },
    IDF = {
        BG           = Color3.fromRGB( 18,  24,  36),
        HeaderBG     = Color3.fromRGB( 26,  34,  50),
        SectionBG    = Color3.fromRGB( 26,  34,  50),
        SectionTitle = Color3.fromRGB( 70, 118, 185),
        Text         = Color3.fromRGB(215, 228, 248),
        SubText      = Color3.fromRGB( 95, 138, 195),
        Separator    = Color3.fromRGB( 44,  60,  88),
        Accent       = Color3.fromRGB( 55, 125, 220),
        AccentDark   = Color3.fromRGB( 78, 152, 248),
        ToggleOn     = Color3.fromRGB( 55, 125, 220),
        ToggleOff    = Color3.fromRGB( 44,  60,  88),
        SliderTrack  = Color3.fromRGB( 44,  60,  88),
        SliderFill   = Color3.fromRGB( 55, 125, 220),
        White        = Color3.fromRGB(215, 228, 248),
        PressHL      = Color3.fromRGB( 38,  52,  76),
        TabActive    = Color3.fromRGB( 55, 125, 220),
        TabInactive  = Color3.fromRGB( 95, 138, 195),
        Handle       = Color3.fromRGB(  0,  56, 116),
        DropHL       = Color3.fromRGB( 22,  30,  46),
        CardStroke   = Color3.fromRGB( 44,  60,  88),
    },
}

local T = Themes.Bibi

local ICONS = {
    home="⌂", settings="⚙", user="👤", search="🔍", star="★", heart="♥",
    bell="🔔", mail="✉", lock="🔒", unlock="🔓", check="✓", x="✕",
    plus="+", minus="−", trash="🗑", edit="✎", eye="👁", camera="📷",
    image="🖼", music="♪", play="▶", pause="⏸", stop="⏹", info="ℹ",
    alert="⚠", globe="🌐", map="🗺", bookmark="🔖", share="⎋",
    download="↓", upload="↑", folder="📁", file="📄", code="</>",
    terminal=">_", wifi="📶", battery="🔋", cpu="💻", monitor="🖥",
    phone="📱", message="💬", send="➤", menu="≡", grid="⊞", list="≡",
    layers="⧉", tag="🏷", flag="⚑", tool="🔧", zap="⚡", sun="☀",
    moon="🌙", cloud="☁", wind="💨",
    ["star-of-david"]="✡", menorah="🕎", shield="🛡",
    ["arrow-right"]="→", ["arrow-left"]="←", ["arrow-up"]="↑", ["arrow-down"]="↓",
    ["arrow-up-right"]="↗", ["arrow-up-left"]="↖", ["arrow-down-right"]="↘", ["arrow-down-left"]="↙",
    ["arrow-big-up"]="⇑", ["arrow-big-down"]="⇓", ["arrow-big-left"]="⇐", ["arrow-big-right"]="⇒",
    ["arrow-right-circle"]="→", ["arrow-left-circle"]="←", ["arrow-up-circle"]="↑", ["arrow-down-circle"]="↓",
    ["arrow-right-square"]="→", ["arrow-left-square"]="←",
    ["arrow-right-from-line"]="→", ["arrow-left-from-line"]="←",
    ["arrow-right-to-line"]="→", ["arrow-left-to-line"]="←",
    ["chevron-right"]="›", ["chevron-left"]="‹", ["chevron-up"]="‸", ["chevron-down"]="⌄",
    ["chevrons-right"]="»", ["chevrons-left"]="«", ["chevrons-up"]="⇑", ["chevrons-down"]="⇓",
    ["chevron-right-circle"]="›", ["chevron-left-circle"]="‹", ["chevron-up-circle"]="‸", ["chevron-down-circle"]="⌄",
    ["chevron-first"]="⟪", ["chevron-last"]="⟫",
    activity="〜", airplay="⊡",
    ["alert-circle"]="⊙", ["alert-octagon"]="⊛", ["alert-triangle"]="⚠",
    ["align-center"]="≡", ["align-justify"]="≣", ["align-left"]="≡", ["align-right"]="≡",
    anchor="⚓", aperture="◎", archive="◫", ["at-sign"]="@", award="◈",
    baby="◉", backpack="◫", badge="⬡", ban="⊘", banknote="▣",
    ["bar-chart"]="▮", ["bar-chart-2"]="▮▮", ["bar-chart-3"]="▮▮▮", ["bar-chart-4"]="▮▮▮▮",
    ["battery-charging"]="⚡", ["battery-full"]="█", ["battery-low"]="▒",
    ["battery-medium"]="▓", ["battery-warning"]="⚠", beaker="⚗", bed="▬",
    ["bell-minus"]="🔔", ["bell-off"]="🔕", ["bell-plus"]="🔔", ["bell-ring"]="🔔",
    bike="◎", bold="B", bomb="◉", bone="—",
    book="📖", ["book-open"]="📖", ["book-marked"]="🔖", ["book-copy"]="📖",
    bot="◻", box="📦", boxes="⊡",
    brain="◌", briefcase="💼", brush="✏",
    bug="◌", building="▣", ["building-2"]="▤", bus="▣", calculator="▣", calendar="📅",
    ["camera-off"]="⊘", car="▣", cast="⊹",
    ["chart-area"]="◔", ["chart-bar"]="▮", ["chart-line"]="〜",
    ["check-circle"]="✅", ["check-circle-2"]="☑", ["check-square"]="☑",
    circle="○", ["circle-dashed"]="◌", ["circle-dot"]="⊙",
    ["circle-slash"]="⊘", ["circle-off"]="⊘",
    ["circle-check"]="✓", ["circle-x"]="⊗",
    clipboard="📋", ["clipboard-check"]="✅", ["clipboard-list"]="📋",
    clock="🕐", ["clock-alert"]="⚠",
    ["cloud-download"]="↓", ["cloud-upload"]="↑",
    cloudy="☁", coffee="☕", cog="⚙", columns="⊟", command="⌘",
    compass="◎", component="⊞", copy="⧉",
    crosshair="⊕", crown="♛", ["credit-card"]="💳", crop="⊠", database="🗄",
    delete="⌫", diamond="◆", disc="◎", divide="÷", ["dollar-sign"]="$",
    dumbbell="▬", ear="◌", egg="○", eraser="✏", euro="€", expand="⤢",
    ["external-link"]="↗", ["eye-off"]="⊘", fan="◎", ["fast-forward"]="⏭",
    feather="✎", filter="⊟", flame="▲",
    ["folder-open"]="📂", ["folder-plus"]="📁", ["folder-minus"]="📁",
    frown="☹", gift="◈", ["git-branch"]="⎇", ["git-commit"]="⊙",
    github="⊛", gitlab="◈", ["globe-2"]="🌍",
    ["graduation-cap"]="◈", ["grip"]="⊞",
    ["hand"]="✋", ["handshake"]="✋", ["hard-drive"]="💾", hash="#", headphones="🎧",
    ["help-circle"]="?", hexagon="⬡",
    ["history"]="↺", ["house"]="⌂", ["hourglass"]="⌛",
    inbox="▣", italic="I", key="🔑", keyboard="⌨",
    ["lamp"]="💡", layout="▤", ["layout-grid"]="⊞",
    laptop="💻", leaf="◌", ["library"]="📖",
    ["life-buoy"]="⊙", link="🔗", ["linkedin"]="ℒ", loader="◌",
    ["log-in"]="→", ["log-out"]="←",
    ["mail-open"]="✉", ["map-pin"]="📍",
    maximize="⊡", medal="◈", meh="○",
    ["message-circle"]="💬", ["message-square"]="🗨",
    mic="🎤", minimize="⊟",
    ["minus-circle"]="⊖", ["minus-square"]="⊟",
    ["monitor-check"]="🖥", ["more-horizontal"]="⋯", ["more-vertical"]="⋮",
    ["mouse"]="◌", move="⤢",
    navigation="▲", network="⊞", ["newspaper"]="📄", ["notebook"]="📓",
    octagon="⬡",
    package="📦", paintbrush="✏",
    paperclip="📎", pencil="✏", percent="%", ["pi"]="π",
    ["phone-call"]="📞", ["pie-chart"]="◔", pin="📍", plane="✈",
    ["play-circle"]="▶", ["plug"]="⏻",
    ["plus-circle"]="⊕", ["plus-square"]="⊞", power="⏻",
    printer="▣", puzzle="◌",
    radio="📻", ["receipt"]="📄",
    ["refresh-ccw"]="↺", ["refresh-cw"]="↻",
    ["repeat"]="↺",
    save="💾", scissors="✂", ["screen-share"]="⊡",
    ["search-check"]="🔍",
    ["send-horizontal"]="➤",
    ["shapes"]="◎", ["share-2"]="⎋",
    ["shield-check"]="🛡", ["shield-x"]="🛡",
    ["shopping-bag"]="🛍", ["shopping-cart"]="🛒",
    ["sidebar"]="▤", ["signal"]="📶",
    ["skip-back"]="⏮", ["skip-forward"]="⏭",
    ["sliders"]="⊟", ["sliders-2"]="⊟",
    smile="☺", ["sort-asc"]="↑", ["sort-desc"]="↓",
    ["sparkles"]="✳", ["spell-check"]="✓",
    ["star-2"]="★",
    ["subscript"]="x₂", ["sun-dim"]="☀",
    table="▤", ["tabs"]="▤",
    ["test-tube"]="⚗",
    ["text"]="T", ["text-cursor"]="▮",
    thumbsup="▲", thumbsdown="▽",
    timer="🕐", ["toggle-left"]="◯", ["toggle-right"]="◉",
    ["tool-2"]="🔧", tornado="〜",
    trash2="🗑", ["trending-up"]="↗", ["trending-down"]="↘",
    trophy="◈", truck="▣",
    underline="U", undo="↩", redo="↪",
    unlink="🔗", ["user-2"]="👤",
    video="📹", ["video-off"]="⊘",
    volume="🔊", ["volume-x"]="🔇",
    wallet="👛",
    wifi2="📶", ["wifi-off"]="⊘",
    ["x-circle"]="⊗", ["x-square"]="⊠",
    ["zoom-in"]="🔍", ["zoom-out"]="🔍",
}

local function Tween(Obj, Props, Duration, Style, Dir)
    TweenService:Create(Obj, TweenInfo.new(
        Duration or 0.25,
        Style    or Enum.EasingStyle.Quint,
        Dir      or Enum.EasingDirection.Out
    ), Props):Play()
end

local function Spring(Obj, Props, Duration)
    TweenService:Create(Obj, TweenInfo.new(
        Duration or 0.40,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ), Props):Play()
end

local function Snap(Obj, Props, Duration)
    TweenService:Create(Obj, TweenInfo.new(
        Duration or 0.18,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    ), Props):Play()
end

local function Corner(Parent, Radius)
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, Radius or 10)
    C.Parent = Parent
    return C
end

local function Pad(Parent, Top, Right, Bottom, Left)
    local P = Instance.new("UIPadding")
    P.PaddingTop    = UDim.new(0, Top    or 0)
    P.PaddingRight  = UDim.new(0, Right  or 0)
    P.PaddingBottom = UDim.new(0, Bottom or 0)
    P.PaddingLeft   = UDim.new(0, Left   or 0)
    P.Parent = Parent
end

local function ResolveIcon(Icon)
    if not Icon then return nil, false end
    if type(Icon) == "number" then return "rbxassetid://" .. Icon, true end
    if type(Icon) == "string" then
        if Icon:match("^rbxassetid://") then return Icon, true end
        if Icon:match("^%d+$") then return "rbxassetid://" .. Icon, true end
        return ICONS[Icon:lower()] or Icon, false
    end
    return nil, false
end

function Library:CreateWindow(Cfg)
    Cfg = Cfg or {}
    local Title      = Cfg.Title           or "Bibi Settings"
    local Subtitle   = Cfg.SubTitle        or "State of Israel"
    local LoadTitle  = Cfg.LoadingTitle    or "Netanyahu Mode"
    local LoadSub    = Cfg.LoadingSubtitle or "עם ישראל חי"
    local LoadImage  = Cfg.LoadingImage or 88477104967157
    local ShowText   = Cfg.ShowText        or "✡ Open"
    local ThemeName  = Cfg.Theme           or "Bibi"

    T = Themes[ThemeName] or Themes.Bibi

    local Nodes = {}

    local function Reg(Obj, Prop, Key)
        if Obj and Prop and Key then
            table.insert(Nodes, {Obj = Obj, Prop = Prop, Key = Key})
        end
    end

    local function RegFn(Fn)
        if Fn then table.insert(Nodes, {Fn = Fn}) end
    end

    local Gui = Instance.new("ScreenGui")
    Gui.Name           = "BibiUILib"
    Gui.ResetOnSpawn   = false
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Gui.IgnoreGuiInset = true
    local GuiOk = pcall(function() Gui.Parent = gethui() end)
    if not GuiOk then
        Gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local function GetWinSize()
        local SW = Gui.AbsoluteSize.X
        local SH = Gui.AbsoluteSize.Y
        local W  = math.clamp(math.floor(SW * 0.74), 256, 464)
        local H  = math.clamp(math.floor(SH * 0.64), 320, 496)
        return W, H
    end

    local LoadScreen = Instance.new("Frame")
    LoadScreen.Name             = "LoadScreen"
    LoadScreen.BackgroundColor3 = T.HeaderBG
    LoadScreen.BorderSizePixel  = 0
    LoadScreen.Size             = UDim2.new(1, 0, 1, 0)
    LoadScreen.ZIndex           = 200
    LoadScreen.Parent           = Gui

    local LoadBibiImg = Instance.new("ImageLabel")
    LoadBibiImg.BackgroundTransparency = 1
    LoadBibiImg.AnchorPoint    = Vector2.new(0.5, 0)
    LoadBibiImg.Size           = UDim2.new(0, 80, 0, 80)
    LoadBibiImg.Position       = UDim2.new(0.5, 0, 0.5, -148)
    LoadBibiImg.Image          = "rbxassetid://88477104967157"
    LoadBibiImg.ScaleType      = Enum.ScaleType.Fit
    LoadBibiImg.ZIndex         = 202
    LoadBibiImg.Parent         = LoadScreen
    Corner(LoadBibiImg, 40)

    local LoadCenter = Instance.new("Frame")
    LoadCenter.BackgroundTransparency = 1
    LoadCenter.Size     = UDim2.new(0, 224, 0, 192)
    LoadCenter.Position = UDim2.new(0.5, -112, 0.5, -96)
    LoadCenter.ZIndex   = 201
    LoadCenter.Parent   = LoadScreen

    local LoadOff = 0
    if LoadImage then
        local IconVal, IsAsset = ResolveIcon(LoadImage)
        local IconSz = 64
        if IsAsset then
            local Img = Instance.new("ImageLabel")
            Img.BackgroundColor3 = T.BG
            Img.BorderSizePixel  = 0
            Img.Size             = UDim2.new(0, IconSz, 0, IconSz)
            Img.Position         = UDim2.new(0.5, -IconSz/2, 0, 0)
            Img.Image            = IconVal
            Img.ScaleType        = Enum.ScaleType.Fit
            Img.ZIndex           = 202
            Img.Parent           = LoadCenter
            Corner(Img, 16)
        else
            local Gl = Instance.new("TextLabel")
            Gl.BackgroundTransparency = 1
            Gl.Size       = UDim2.new(0, IconSz, 0, IconSz)
            Gl.Position   = UDim2.new(0.5, -IconSz/2, 0, 0)
            Gl.Text       = IconVal or "✡"
            Gl.TextSize   = 42
            Gl.Font       = Enum.Font.Gotham
            Gl.TextColor3 = T.Accent
            Gl.ZIndex     = 202
            Gl.Parent     = LoadCenter
        end
        LoadOff = IconSz + 14
    end

    local function MkLoadLbl(Text, Y, Bold, Size)
        local L = Instance.new("TextLabel")
        L.BackgroundTransparency = 1
        L.Size     = UDim2.new(1, 0, 0, 22)
        L.Position = UDim2.new(0, 0, 0, LoadOff + Y)
        L.Text     = Text
        L.TextColor3     = Bold and T.Text or T.SubText
        L.Font           = Bold and Enum.Font.GothamBold or Enum.Font.Gotham
        L.TextSize       = Size or (Bold and 16 or 11)
        L.TextXAlignment = Enum.TextXAlignment.Center
        L.ZIndex   = 202
        L.Parent   = LoadCenter
        return L
    end
    MkLoadLbl(LoadTitle, 3,  true,  16)
    MkLoadLbl(LoadSub,   26, false, 11)

    local Spinner = Instance.new("Frame")
    Spinner.BackgroundTransparency = 1
    Spinner.Size     = UDim2.new(0, 29, 0, 29)
    Spinner.Position = UDim2.new(0.5, -14, 0, LoadOff + 61)
    Spinner.ZIndex   = 202
    Spinner.Parent   = LoadCenter

    for Idx = 1, 10 do
        local Dot = Instance.new("Frame")
        Dot.BackgroundColor3       = T.Accent
        Dot.BackgroundTransparency = 1 - ((Idx / 10) ^ 1.4)
        Dot.BorderSizePixel        = 0
        local DotSz = 2 + (Idx / 10) * 4
        Dot.Size        = UDim2.new(0, DotSz, 0, DotSz)
        Dot.AnchorPoint = Vector2.new(0.5, 0.5)
        local Ang = math.rad((Idx - 1) * 36)
        Dot.Position = UDim2.new(0.5, math.cos(Ang) * 12, 0.5, math.sin(Ang) * 12)
        Dot.ZIndex   = 203
        Dot.Parent   = Spinner
        Corner(Dot, math.ceil(DotSz / 2))
    end

    local SpinAngle = 0
    local SpinConn  = RunService.Heartbeat:Connect(function(Dt)
        SpinAngle = (SpinAngle + Dt * 320) % 360
        Spinner.Rotation = SpinAngle
    end)

    local WinW, WinH = GetWinSize()
    local HeaderH    = 48
    local TabBarH    = 40

    local Shadow = Instance.new("Frame")
    Shadow.BackgroundColor3       = Color3.fromRGB(0, 20, 60)
    Shadow.BackgroundTransparency = 0.72
    Shadow.BorderSizePixel        = 0
    Shadow.Size                   = UDim2.new(0, WinW + 24, 0, WinH + 24)
    Shadow.Position               = UDim2.new(0.5, -(WinW + 24)/2 + 4, 0.5, -(WinH + 24)/2 + 6)
    Shadow.Visible                = false
    Shadow.ZIndex                 = 8
    Shadow.Parent                 = Gui
    Corner(Shadow, 24)

    local Win = Instance.new("Frame")
    Win.Name             = "Window"
    Win.BackgroundColor3 = T.BG
    Win.BorderSizePixel  = 0
    Win.Size             = UDim2.new(0, WinW, 0, WinH)
    Win.Position         = UDim2.new(0.5, -WinW/2, 0.5, -WinH/2)
    Win.ClipsDescendants = true
    Win.Visible          = false
    Win.ZIndex           = 10
    Win.Parent           = Gui
    Corner(Win, 18)
    Reg(Win, "BackgroundColor3", "BG")

    local WinStroke = Instance.new("UIStroke")
    WinStroke.Color        = T.CardStroke
    WinStroke.Thickness    = 1.2
    WinStroke.Transparency = 0.55
    WinStroke.Parent       = Win
    Reg(WinStroke, "Color", "CardStroke")

    local WatermarkImg = Instance.new("ImageLabel")
    WatermarkImg.BackgroundTransparency = 1
    WatermarkImg.ImageTransparency  = 0.82
    WatermarkImg.AnchorPoint        = Vector2.new(1, 1)
    WatermarkImg.Size               = UDim2.new(0, 90, 0, 60)
    WatermarkImg.Position           = UDim2.new(1, -6, 1, -6)
    WatermarkImg.Image              = "rbxassetid://135711266569834"
    WatermarkImg.ScaleType          = Enum.ScaleType.Fit
    WatermarkImg.ZIndex             = 9
    WatermarkImg.Parent             = Win
    Corner(WatermarkImg, 4)

    local DragHandle = Instance.new("Frame")
    DragHandle.BackgroundColor3 = T.Handle
    DragHandle.BorderSizePixel  = 0
    DragHandle.Size             = UDim2.new(0, 36, 0, 5)
    DragHandle.Position         = UDim2.new(0.5, -18, 0, 8)
    DragHandle.ZIndex           = 20
    DragHandle.Parent           = Win
    Corner(DragHandle, 3)
    Reg(DragHandle, "BackgroundColor3", "Handle")

    local Header = Instance.new("Frame")
    Header.Name             = "Header"
    Header.BackgroundColor3 = T.HeaderBG
    Header.BorderSizePixel  = 0
    Header.Size             = UDim2.new(1, 0, 0, HeaderH)
    Header.Position         = UDim2.new(0, 0, 0, 0)
    Header.ZIndex           = 12
    Header.Parent           = Win
    Reg(Header, "BackgroundColor3", "HeaderBG")

    local HeaderFlagImg = Instance.new("ImageLabel")
    HeaderFlagImg.BackgroundTransparency = 1
    HeaderFlagImg.AnchorPoint    = Vector2.new(0, 0.5)
    HeaderFlagImg.Size           = UDim2.new(0, 38, 0, 26)
    HeaderFlagImg.Position       = UDim2.new(0, 8, 0.5, 0)
    HeaderFlagImg.Image          = "rbxassetid://135711266569834"
    HeaderFlagImg.ScaleType      = Enum.ScaleType.Fit
    HeaderFlagImg.ZIndex         = 14
    HeaderFlagImg.Parent         = Header
    Corner(HeaderFlagImg, 3)

    local NavLine = Instance.new("Frame")
    NavLine.BackgroundColor3 = T.Accent
    NavLine.BackgroundTransparency = 0.78
    NavLine.BorderSizePixel  = 0
    NavLine.Size     = UDim2.new(1, 0, 0, 1)
    NavLine.Position = UDim2.new(0, 0, 1, -1)
    NavLine.ZIndex   = 13
    NavLine.Parent   = Header
    Reg(NavLine, "BackgroundColor3", "Accent")

    local HasSub = Subtitle ~= ""

    local TitleLbl = Instance.new("TextLabel")
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.AnchorPoint     = Vector2.new(0.5, 0.5)
    TitleLbl.Size            = UDim2.new(0, 208, 0, HasSub and 16 or 21)
    TitleLbl.Position        = UDim2.new(0.5, 0, 0.5, HasSub and -9 or 0)
    TitleLbl.Text            = Title
    TitleLbl.TextColor3      = T.Text
    TitleLbl.Font            = Enum.Font.GothamBold
    TitleLbl.TextSize        = 14
    TitleLbl.TextXAlignment  = Enum.TextXAlignment.Center
    TitleLbl.TextYAlignment  = Enum.TextYAlignment.Center
    TitleLbl.ZIndex          = 13
    TitleLbl.Parent          = Header
    Reg(TitleLbl, "TextColor3", "Text")

    if HasSub then
        local SubLbl = Instance.new("TextLabel")
        SubLbl.BackgroundTransparency = 1
        SubLbl.AnchorPoint     = Vector2.new(0.5, 0.5)
        SubLbl.Size            = UDim2.new(0, 208, 0, 13)
        SubLbl.Position        = UDim2.new(0.5, 0, 0.5, 9)
        SubLbl.Text            = Subtitle
        SubLbl.TextColor3      = T.SubText
        SubLbl.Font            = Enum.Font.Gotham
        SubLbl.TextSize        = 10
        SubLbl.TextXAlignment  = Enum.TextXAlignment.Center
        SubLbl.TextYAlignment  = Enum.TextYAlignment.Center
        SubLbl.ZIndex          = 13
        SubLbl.Parent          = Header
        Reg(SubLbl, "TextColor3", "SubText")
    end

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.AnchorPoint     = Vector2.new(1, 0.5)
    CloseBtn.Size            = UDim2.new(0, 48, 0, 29)
    CloseBtn.Position        = UDim2.new(1, -6, 0.5, 0)
    CloseBtn.Text            = "Done"
    CloseBtn.TextColor3      = T.Accent
    CloseBtn.Font            = Enum.Font.GothamBold
    CloseBtn.TextSize        = 13
    CloseBtn.ZIndex          = 14
    CloseBtn.Parent          = Header
    Reg(CloseBtn, "TextColor3", "Accent")

    local CloseBtnScale = Instance.new("UIScale")
    CloseBtnScale.Scale  = 1
    CloseBtnScale.Parent = CloseBtn

    CloseBtn.MouseEnter:Connect(function()
        Snap(CloseBtn, {TextColor3 = T.AccentDark}, 0.12)
    end)
    CloseBtn.MouseLeave:Connect(function()
        Tween(CloseBtn, {TextColor3 = T.Accent}, 0.22)
    end)
    CloseBtn.MouseButton1Down:Connect(function()
        Snap(CloseBtnScale, {Scale = 0.88}, 0.10)
    end)
    CloseBtn.MouseButton1Up:Connect(function()
        Spring(CloseBtnScale, {Scale = 1}, 0.36)
    end)

    local TabBar = Instance.new("Frame")
    TabBar.Name             = "TabBar"
    TabBar.BackgroundColor3 = T.HeaderBG
    TabBar.BorderSizePixel  = 0
    TabBar.Size             = UDim2.new(1, 0, 0, TabBarH)
    TabBar.Position         = UDim2.new(0, 0, 0, HeaderH)
    TabBar.ZIndex           = 12
    TabBar.Parent           = Win
    Reg(TabBar, "BackgroundColor3", "HeaderBG")

    local TabBarBorder = Instance.new("Frame")
    TabBarBorder.BackgroundColor3       = T.Accent
    TabBarBorder.BackgroundTransparency = 0.82
    TabBarBorder.BorderSizePixel        = 0
    TabBarBorder.Size     = UDim2.new(1, 0, 0, 1)
    TabBarBorder.Position = UDim2.new(0, 0, 1, -1)
    TabBarBorder.ZIndex   = 13
    TabBarBorder.Parent   = TabBar
    Reg(TabBarBorder, "BackgroundColor3", "Accent")

    local TabScroll = Instance.new("ScrollingFrame")
    TabScroll.BackgroundTransparency = 1
    TabScroll.BorderSizePixel        = 0
    TabScroll.Size                   = UDim2.new(1, 0, 1, 0)
    TabScroll.CanvasSize             = UDim2.new(0, 0, 0, 0)
    TabScroll.ScrollBarThickness     = 0
    TabScroll.ScrollingDirection     = Enum.ScrollingDirection.X
    TabScroll.ZIndex                 = 13
    TabScroll.Parent                 = TabBar

    local TabLayout = Instance.new("UIListLayout")
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.SortOrder     = Enum.SortOrder.LayoutOrder
    TabLayout.Padding       = UDim.new(0, 0)
    TabLayout.Parent        = TabScroll

    local LastTabW = -1
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local W = TabLayout.AbsoluteContentSize.X
        if W == LastTabW then return end
        LastTabW = W
        TabScroll.CanvasSize = UDim2.new(0, W, 0, 0)
    end)

    local ContentArea = Instance.new("Frame")
    ContentArea.BackgroundTransparency = 1
    ContentArea.Size             = UDim2.new(1, 0, 1, -(HeaderH + TabBarH))
    ContentArea.Position         = UDim2.new(0, 0, 0, HeaderH + TabBarH)
    ContentArea.ClipsDescendants = true
    ContentArea.ZIndex           = 11
    ContentArea.Parent           = Win

    local TabFadeOverlay = Instance.new("Frame")
    TabFadeOverlay.BackgroundColor3       = T.BG
    TabFadeOverlay.BackgroundTransparency = 1
    TabFadeOverlay.BorderSizePixel        = 0
    TabFadeOverlay.Size                   = UDim2.new(1, 0, 1, 0)
    TabFadeOverlay.ZIndex                 = 50
    TabFadeOverlay.Parent                 = ContentArea
    Reg(TabFadeOverlay, "BackgroundColor3", "BG")

    local ShowBtn = Instance.new("TextButton")
    ShowBtn.BackgroundColor3 = T.Accent
    ShowBtn.Size             = UDim2.new(0, 96, 0, 34)
    ShowBtn.Position         = UDim2.new(0.5, -48, 0, 14)
    ShowBtn.Text             = ShowText
    ShowBtn.TextColor3       = T.White
    ShowBtn.Font             = Enum.Font.GothamBold
    ShowBtn.TextSize         = 12
    ShowBtn.Visible          = false
    ShowBtn.ZIndex           = 100
    ShowBtn.Parent           = Gui
    Corner(ShowBtn, 18)
    Reg(ShowBtn, "BackgroundColor3", "Accent")
    Reg(ShowBtn, "TextColor3", "White")

    local ShowBtnScale = Instance.new("UIScale")
    ShowBtnScale.Scale  = 1
    ShowBtnScale.Parent = ShowBtn

    local ShowBtnStroke = Instance.new("UIStroke")
    ShowBtnStroke.Color        = T.AccentDark
    ShowBtnStroke.Thickness    = 1
    ShowBtnStroke.Transparency = 0.6
    ShowBtnStroke.Parent       = ShowBtn
    Reg(ShowBtnStroke, "Color", "AccentDark")

    ShowBtn.MouseButton1Down:Connect(function()
        Snap(ShowBtnScale, {Scale = 0.94}, 0.10)
    end)
    ShowBtn.MouseButton1Up:Connect(function()
        Spring(ShowBtnScale, {Scale = 1}, 0.36)
    end)

    local IsDragging  = false
    local DragStart   = nil
    local StartWinPos = nil

    Header.InputBegan:Connect(function(Inp)
        if Inp.UserInputType == Enum.UserInputType.MouseButton1
        or Inp.UserInputType == Enum.UserInputType.Touch then
            IsDragging  = true
            DragStart   = Inp.Position
            StartWinPos = Win.Position
            Snap(DragHandle, {Size = UDim2.new(0, 26, 0, 5)}, 0.16)
        end
    end)

    UserInputService.InputChanged:Connect(function(Inp)
        if not IsDragging then return end
        if Inp.UserInputType ~= Enum.UserInputType.MouseMovement
        and Inp.UserInputType ~= Enum.UserInputType.Touch then return end
        local D = Inp.Position - DragStart
        Win.Position = UDim2.new(
            StartWinPos.X.Scale, StartWinPos.X.Offset + D.X,
            StartWinPos.Y.Scale, StartWinPos.Y.Offset + D.Y
        )
        Shadow.Position = UDim2.new(
            StartWinPos.X.Scale, StartWinPos.X.Offset + D.X - 8,
            StartWinPos.Y.Scale, StartWinPos.Y.Offset + D.Y - 6
        )
    end)

    UserInputService.InputEnded:Connect(function(Inp)
        if Inp.UserInputType == Enum.UserInputType.MouseButton1
        or Inp.UserInputType == Enum.UserInputType.Touch then
            IsDragging = false
            Spring(DragHandle, {Size = UDim2.new(0, 36, 0, 5)}, 0.38)
        end
    end)

    local WinScale = nil

    CloseBtn.MouseButton1Click:Connect(function()
        local WP = Win.Position
        if WinScale then Tween(WinScale, {Scale = 0.92}, 0.30) end
        Tween(Win, {
            BackgroundTransparency = 1,
            Position = UDim2.new(WP.X.Scale, WP.X.Offset, WP.Y.Scale, WP.Y.Offset + 36)
        }, 0.48, Enum.EasingStyle.Quint)
        Tween(Shadow, {BackgroundTransparency = 1}, 0.30, Enum.EasingStyle.Quint)
        for _, D in ipairs(Win:GetDescendants()) do
            if D:IsA("TextLabel") or D:IsA("TextButton") then
                Tween(D, {TextTransparency = 1}, 0.32, Enum.EasingStyle.Quint)
            end
        end
        task.delay(0.52, function()
            Win.Visible                = false
            Shadow.Visible             = false
            Win.BackgroundTransparency = 0
            Win.Position               = WP
            if WinScale then WinScale.Scale = 1 end
            for _, D in ipairs(Win:GetDescendants()) do
                if D:IsA("TextLabel") or D:IsA("TextButton") then
                    D.TextTransparency = 0
                end
            end
            ShowBtn.Visible                = true
            ShowBtn.BackgroundTransparency = 1
            ShowBtn.Size = UDim2.new(0, 72, 0, 29)
            ShowBtnScale.Scale = 0.82
            Tween(ShowBtn, {BackgroundTransparency = 0, Size = UDim2.new(0, 96, 0, 34)},
                0.40, Enum.EasingStyle.Quint)
            Spring(ShowBtnScale, {Scale = 1}, 0.56)
        end)
    end)

    ShowBtn.MouseButton1Click:Connect(function()
        Tween(ShowBtn, {BackgroundTransparency = 1}, 0.24, Enum.EasingStyle.Quint)
        Tween(ShowBtnScale, {Scale = 0.88}, 0.24)
        task.delay(0.26, function()
            ShowBtn.Visible = false
            ShowBtn.Size    = UDim2.new(0, 96, 0, 34)
            ShowBtnScale.Scale = 1
            local WP = Win.Position
            Win.Visible                = true
            Shadow.Visible             = true
            Win.BackgroundTransparency = 1
            Shadow.BackgroundTransparency = 1
            Win.Position = UDim2.new(WP.X.Scale, WP.X.Offset, WP.Y.Scale, WP.Y.Offset + 44)
            if WinScale then WinScale.Scale = 0.90 end
            Tween(Win, {
                BackgroundTransparency = 0,
                Position = UDim2.new(WP.X.Scale, WP.X.Offset, WP.Y.Scale, WP.Y.Offset)
            }, 0.60, Enum.EasingStyle.Quint)
            Tween(Shadow, {BackgroundTransparency = 0.72}, 0.50, Enum.EasingStyle.Quint)
            if WinScale then Spring(WinScale, {Scale = 1}, 0.64) end
        end)
    end)

    task.spawn(function()
        task.wait(2.4)
        SpinConn:Disconnect()

        Tween(LoadScreen, {BackgroundTransparency = 1}, 0.38, Enum.EasingStyle.Quint)
        for _, D in ipairs(LoadScreen:GetDescendants()) do
            if D:IsA("GuiObject") then
                local TP = {BackgroundTransparency = 1}
                if D:IsA("TextLabel")  then TP.TextTransparency  = 1 end
                if D:IsA("ImageLabel") then TP.ImageTransparency = 1 end
                Tween(D, TP, 0.34, Enum.EasingStyle.Quint)
            end
        end
        task.wait(0.42)
        LoadScreen:Destroy()

        local NW, NH = GetWinSize()
        Win.Visible                = true
        Shadow.Visible             = true
        Win.BackgroundTransparency = 1
        Shadow.BackgroundTransparency = 1
        Win.Position = UDim2.new(0.5, -NW/2, 0.5, -NH/2 + 52)

        WinScale = Instance.new("UIScale")
        WinScale.Scale  = 0.86
        WinScale.Parent = Win

        Tween(Win, {
            BackgroundTransparency = 0,
            Position = UDim2.new(0.5, -NW/2, 0.5, -NH/2)
        }, 0.62, Enum.EasingStyle.Quint)
        Tween(Shadow, {BackgroundTransparency = 0.72}, 0.55, Enum.EasingStyle.Quint)
        Spring(WinScale, {Scale = 1}, 0.66)
    end)

    local WindowObj = {}
    local TabList   = {}
    local TabCount  = 0

    local function DeactivateAllTabs()
        for _, TD in ipairs(TabList) do
            TD.Content.Visible    = false
            TD.ActiveLine.Visible = false
            TD.ActiveLine.Size    = UDim2.new(0, 0, 0, 3)
            Snap(TD.Label, {TextColor3 = T.TabInactive}, 0.16)
            if TD.Icon then
                local Prop = TD.Icon:IsA("ImageLabel") and "ImageColor3" or "TextColor3"
                Snap(TD.Icon, {[Prop] = T.TabInactive}, 0.16)
            end
            if TD.TabScale then
                Snap(TD.TabScale, {Scale = 1}, 0.16)
            end
        end
    end

    function WindowObj:SetTheme(Name)
        T = Themes[Name] or Themes.Bibi
        local Live = {}
        for _, N in ipairs(Nodes) do
            if N.Fn then
                N.Fn()
                Live[#Live + 1] = N
            elseif N.Obj and N.Obj.Parent then
                local Val = T[N.Key]
                if Val then
                    Tween(N.Obj, {[N.Prop] = Val}, 0.28, Enum.EasingStyle.Quint)
                end
                Live[#Live + 1] = N
            end
        end
        Nodes = Live
        for _, TD in ipairs(TabList) do
            local IsActive = TD.Content.Visible
            local Col = IsActive and T.TabActive or T.TabInactive
            Tween(TD.Label, {TextColor3 = Col}, 0.28, Enum.EasingStyle.Quint)
            Tween(TD.ActiveLine, {BackgroundColor3 = T.TabActive}, 0.28, Enum.EasingStyle.Quint)
            if TD.Icon then
                local Prop = TD.Icon:IsA("ImageLabel") and "ImageColor3" or "TextColor3"
                Tween(TD.Icon, {[Prop] = Col}, 0.28, Enum.EasingStyle.Quint)
            end
        end
        if TabFadeOverlay then
            Reg(TabFadeOverlay, "BackgroundColor3", "BG")
        end
    end

    function WindowObj:CreateTab(TabCfg)
        TabCfg = TabCfg or {}
        local TabTitle = TabCfg.Title or "Tab"
        local TabLogo  = TabCfg.Logo

        TabCount = TabCount + 1
        local Idx  = TabCount
        local MinW = math.max(62, #TabTitle * 6 + 29)

        local TabBtn = Instance.new("TextButton")
        TabBtn.BackgroundTransparency = 1
        TabBtn.Size        = UDim2.new(0, MinW, 1, 0)
        TabBtn.Text        = ""
        TabBtn.ZIndex      = 14
        TabBtn.LayoutOrder = Idx
        TabBtn.Parent      = TabScroll

        local TabBtnScale = Instance.new("UIScale")
        TabBtnScale.Scale  = 1
        TabBtnScale.Parent = TabBtn

        local TabIcon  = nil
        local IconXOff = 0

        if TabLogo then
            local IconVal, IsAsset = ResolveIcon(TabLogo)
            if IsAsset then
                TabIcon = Instance.new("ImageLabel")
                TabIcon.BackgroundTransparency = 1
                TabIcon.AnchorPoint  = Vector2.new(0, 0.5)
                TabIcon.Size         = UDim2.new(0, 12, 0, 12)
                TabIcon.Position     = UDim2.new(0, 8, 0.5, 0)
                TabIcon.Image        = IconVal
                TabIcon.ImageColor3  = T.TabInactive
                TabIcon.ZIndex       = 15
                TabIcon.Parent       = TabBtn
                IconXOff = 16
            else
                TabIcon = Instance.new("TextLabel")
                TabIcon.BackgroundTransparency = 1
                TabIcon.AnchorPoint    = Vector2.new(0, 0.5)
                TabIcon.Size           = UDim2.new(0, 13, 0, 13)
                TabIcon.Position       = UDim2.new(0, 6, 0.5, 0)
                TabIcon.Text           = IconVal or ""
                TabIcon.TextColor3     = T.TabInactive
                TabIcon.Font           = Enum.Font.Gotham
                TabIcon.TextSize       = 10
                TabIcon.TextXAlignment = Enum.TextXAlignment.Center
                TabIcon.TextYAlignment = Enum.TextYAlignment.Center
                TabIcon.ZIndex         = 15
                TabIcon.Parent         = TabBtn
                IconXOff = 20
            end
        end

        local TabLbl = Instance.new("TextLabel")
        TabLbl.BackgroundTransparency = 1
        TabLbl.AnchorPoint     = Vector2.new(0, 0.5)
        TabLbl.Size            = UDim2.new(1, -IconXOff - 6, 0, 14)
        TabLbl.Position        = UDim2.new(0, IconXOff + 5, 0.5, 0)
        TabLbl.Text            = TabTitle
        TabLbl.TextColor3      = T.TabInactive
        TabLbl.Font            = Enum.Font.GothamMedium
        TabLbl.TextSize        = 10
        TabLbl.TextXAlignment  = Enum.TextXAlignment.Center
        TabLbl.TextYAlignment  = Enum.TextYAlignment.Center
        TabLbl.ZIndex          = 15
        TabLbl.Parent          = TabBtn

        local ActiveLine = Instance.new("Frame")
        ActiveLine.BackgroundColor3 = T.TabActive
        ActiveLine.BorderSizePixel  = 0
        ActiveLine.AnchorPoint      = Vector2.new(0.5, 1)
        ActiveLine.Size             = UDim2.new(0, 0, 0, 3)
        ActiveLine.Position         = UDim2.new(0.5, 0, 1, 0)
        ActiveLine.ZIndex           = 16
        ActiveLine.Visible          = false
        ActiveLine.Parent           = TabBtn
        Corner(ActiveLine, 2)
        Reg(ActiveLine, "BackgroundColor3", "TabActive")

        local TabFrame = Instance.new("Frame")
        TabFrame.Name                   = "Tab_" .. Idx
        TabFrame.BackgroundTransparency = 1
        TabFrame.Size                   = UDim2.new(1, 0, 1, 0)
        TabFrame.Visible                = false
        TabFrame.ZIndex                 = 11
        TabFrame.Parent                 = ContentArea

        local ColPad = 6
        local ColGap = 6
        local ColTop = 11
        local ColBot = 14

        local LeftScroll = Instance.new("ScrollingFrame")
        LeftScroll.BackgroundTransparency = 1
        LeftScroll.BorderSizePixel        = 0
        LeftScroll.Size               = UDim2.new(0.5, -ColGap/2 - ColPad, 1, 0)
        LeftScroll.Position           = UDim2.new(0, ColPad, 0, 0)
        LeftScroll.CanvasSize         = UDim2.new(0, 0, 0, 0)
        LeftScroll.ScrollBarThickness = 0
        LeftScroll.ScrollingDirection = Enum.ScrollingDirection.Y
        LeftScroll.ZIndex             = 11
        LeftScroll.Parent             = TabFrame

        local RightScroll = Instance.new("ScrollingFrame")
        RightScroll.BackgroundTransparency = 1
        RightScroll.BorderSizePixel        = 0
        RightScroll.Size               = UDim2.new(0.5, -ColGap/2 - ColPad, 1, 0)
        RightScroll.Position           = UDim2.new(0.5, ColGap/2, 0, 0)
        RightScroll.CanvasSize         = UDim2.new(0, 0, 0, 0)
        RightScroll.ScrollBarThickness = 0
        RightScroll.ScrollingDirection = Enum.ScrollingDirection.Y
        RightScroll.ZIndex             = 11
        RightScroll.Parent             = TabFrame

        local function MakeColInner(ScrollFrame)
            local Inner = Instance.new("Frame")
            Inner.BackgroundTransparency = 1
            Inner.Size          = UDim2.new(1, 0, 0, 0)
            Inner.AutomaticSize = Enum.AutomaticSize.Y
            Inner.ZIndex        = 12
            Inner.Parent        = ScrollFrame

            local Lay = Instance.new("UIListLayout")
            Lay.FillDirection = Enum.FillDirection.Vertical
            Lay.SortOrder     = Enum.SortOrder.LayoutOrder
            Lay.Padding       = UDim.new(0, 0)
            Lay.Parent        = Inner

            Pad(Inner, ColTop, 0, ColBot, 0)

            Lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                local H = Lay.AbsoluteContentSize.Y + ColTop + ColBot
                ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, H)
            end)

            return Inner
        end

        local LeftInner  = MakeColInner(LeftScroll)
        local RightInner = MakeColInner(RightScroll)

        local TabData = {
            Btn        = TabBtn,
            Content    = TabFrame,
            ActiveLine = ActiveLine,
            Label      = TabLbl,
            Icon       = TabIcon,
            TabScale   = TabBtnScale,
        }
        table.insert(TabList, TabData)

        local function ActivateThis()
            DeactivateAllTabs()
            TabFadeOverlay.BackgroundTransparency = 0.55
            TabFadeOverlay.ZIndex = 50
            Tween(TabFadeOverlay, {BackgroundTransparency = 1}, 0.32, Enum.EasingStyle.Quint)

            TabFrame.Visible   = true
            ActiveLine.Visible = true
            ActiveLine.Size    = UDim2.new(0, 0, 0, 3)
            Spring(ActiveLine, {Size = UDim2.new(0.78, 0, 0, 3)}, 0.44)
            Snap(TabBtnScale, {Scale = 0.92}, 0.10)
            Spring(TabBtnScale, {Scale = 1}, 0.38)
            Snap(TabLbl, {TextColor3 = T.TabActive}, 0.14)
            if TabIcon then
                local Prop = TabIcon:IsA("ImageLabel") and "ImageColor3" or "TextColor3"
                Snap(TabIcon, {[Prop] = T.TabActive}, 0.14)
            end
        end

        TabBtn.MouseButton1Click:Connect(ActivateThis)
        if Idx == 1 then ActivateThis() end

        local TabObj = {}
        local SecCnt = 0

        function TabObj:CreateSection(SecCfg)
            SecCfg = SecCfg or {}
            local SecTitle = SecCfg.Title    or "Section"
            local SecPos   = (SecCfg.Position or "left"):lower()

            SecCnt = SecCnt + 1
            local SecOrder  = SecCnt
            local ParentCol = SecPos == "right" and RightInner or LeftInner

            local SecWrap = Instance.new("Frame")
            SecWrap.BackgroundTransparency = 1
            SecWrap.Size          = UDim2.new(1, 0, 0, 0)
            SecWrap.AutomaticSize = Enum.AutomaticSize.Y
            SecWrap.LayoutOrder   = SecOrder
            SecWrap.ZIndex        = 13
            SecWrap.Parent        = ParentCol

            local SecWrapLayout = Instance.new("UIListLayout")
            SecWrapLayout.FillDirection = Enum.FillDirection.Vertical
            SecWrapLayout.SortOrder     = Enum.SortOrder.LayoutOrder
            SecWrapLayout.Padding       = UDim.new(0, 0)
            SecWrapLayout.Parent        = SecWrap

            local TopSpacer = Instance.new("Frame")
            TopSpacer.BackgroundTransparency = 1
            TopSpacer.Size        = UDim2.new(1, 0, 0, 10)
            TopSpacer.LayoutOrder = 0
            TopSpacer.ZIndex      = 13
            TopSpacer.Parent      = SecWrap

            local SecHeadWrap = Instance.new("Frame")
            SecHeadWrap.BackgroundTransparency = 1
            SecHeadWrap.Size        = UDim2.new(1, 0, 0, 17)
            SecHeadWrap.LayoutOrder = 1
            SecHeadWrap.ZIndex      = 13
            SecHeadWrap.Parent      = SecWrap
            Pad(SecHeadWrap, 0, 3, 0, 8)

            local SecStarLbl = Instance.new("TextLabel")
            SecStarLbl.BackgroundTransparency = 1
            SecStarLbl.AnchorPoint    = Vector2.new(0, 0.5)
            SecStarLbl.Size           = UDim2.new(0, 13, 1, 0)
            SecStarLbl.Position       = UDim2.new(0, 0, 0.5, 0)
            SecStarLbl.Text           = "✡"
            SecStarLbl.TextColor3     = T.Accent
            SecStarLbl.Font           = Enum.Font.GothamBold
            SecStarLbl.TextSize       = 9
            SecStarLbl.TextXAlignment = Enum.TextXAlignment.Left
            SecStarLbl.TextYAlignment = Enum.TextYAlignment.Center
            SecStarLbl.ZIndex         = 14
            SecStarLbl.Parent         = SecHeadWrap
            Reg(SecStarLbl, "TextColor3", "Accent")

            local SecHead = Instance.new("TextLabel")
            SecHead.BackgroundTransparency = 1
            SecHead.Size           = UDim2.new(1, -14, 1, 0)
            SecHead.Position       = UDim2.new(0, 14, 0, 0)
            SecHead.Text           = SecTitle:upper()
            SecHead.TextColor3     = T.SectionTitle
            SecHead.Font           = Enum.Font.GothamMedium
            SecHead.TextSize       = 9
            SecHead.TextXAlignment = Enum.TextXAlignment.Left
            SecHead.TextYAlignment = Enum.TextYAlignment.Center
            SecHead.ZIndex         = 14
            SecHead.Parent         = SecHeadWrap
            Reg(SecHead, "TextColor3", "SectionTitle")

            local HeadSpacer = Instance.new("Frame")
            HeadSpacer.BackgroundTransparency = 1
            HeadSpacer.Size        = UDim2.new(1, 0, 0, 3)
            HeadSpacer.LayoutOrder = 2
            HeadSpacer.ZIndex      = 13
            HeadSpacer.Parent      = SecWrap

            local Card = Instance.new("Frame")
            Card.BackgroundColor3 = T.SectionBG
            Card.BorderSizePixel  = 0
            Card.Size             = UDim2.new(1, 0, 0, 0)
            Card.AutomaticSize    = Enum.AutomaticSize.Y
            Card.ClipsDescendants = true
            Card.LayoutOrder      = 3
            Card.ZIndex           = 13
            Card.Parent           = SecWrap
            Corner(Card, 14)
            Reg(Card, "BackgroundColor3", "SectionBG")

            local CardStroke = Instance.new("UIStroke")
            CardStroke.Color        = T.CardStroke
            CardStroke.Thickness    = 1
            CardStroke.Transparency = 0.55
            CardStroke.Parent       = Card
            Reg(CardStroke, "Color", "CardStroke")

            local CardStagger = (SecCnt - 1) * 0.055
            local CardEntryScale = Instance.new("UIScale")
            CardEntryScale.Scale  = 0.92
            CardEntryScale.Parent = Card
            Card.BackgroundTransparency = 1
            task.delay(CardStagger, function()
                if not Card or not Card.Parent then return end
                Tween(Card, {BackgroundTransparency = 0}, 0.28, Enum.EasingStyle.Quint)
                Spring(CardEntryScale, {Scale = 1}, 0.50)
            end)

            local CardLayout = Instance.new("UIListLayout")
            CardLayout.FillDirection = Enum.FillDirection.Vertical
            CardLayout.SortOrder     = Enum.SortOrder.LayoutOrder
            CardLayout.Padding       = UDim.new(0, 0)
            CardLayout.Parent        = Card

            local BottomSpacer = Instance.new("Frame")
            BottomSpacer.BackgroundTransparency = 1
            BottomSpacer.Size        = UDim2.new(1, 0, 0, 8)
            BottomSpacer.LayoutOrder = 4
            BottomSpacer.ZIndex      = 13
            BottomSpacer.Parent      = SecWrap

            local SecObj = {}
            SecObj._Card = Card
            SecObj._RowN = 0

            local function MakeRow(H, AutoY)
                SecObj._RowN = SecObj._RowN + 1
                local N = SecObj._RowN

                if N > 1 then
                    local SepWrap = Instance.new("Frame")
                    SepWrap.BackgroundTransparency = 1
                    SepWrap.BorderSizePixel        = 0
                    SepWrap.Size        = UDim2.new(1, 0, 0, 1)
                    SepWrap.ZIndex      = 15
                    SepWrap.LayoutOrder = N * 10 - 5
                    SepWrap.Parent      = Card

                    local Sep = Instance.new("Frame")
                    Sep.BackgroundColor3 = T.Separator
                    Sep.BorderSizePixel  = 0
                    Sep.Size     = UDim2.new(1, -16, 1, 0)
                    Sep.Position = UDim2.new(0, 16, 0, 0)
                    Sep.ZIndex   = 15
                    Sep.Parent   = SepWrap
                    Reg(Sep, "BackgroundColor3", "Separator")
                end

                local Row = Instance.new("Frame")
                Row.BackgroundTransparency = 1
                Row.BorderSizePixel        = 0
                Row.ZIndex                 = 14
                Row.LayoutOrder            = N * 10
                Row.Parent                 = Card

                if AutoY then
                    Row.Size          = UDim2.new(1, 0, 0, 0)
                    Row.AutomaticSize = Enum.AutomaticSize.Y
                else
                    Row.Size = UDim2.new(1, 0, 0, H or 48)
                end
                Pad(Row, 0, 13, 0, 13)
                return Row
            end

            function SecObj:CreateToggle(Cfg)
                Cfg = Cfg or {}
                local Ttl = Cfg.Title    or "Toggle"
                local Def = Cfg.Default  ~= nil and Cfg.Default or false
                local Cb  = Cfg.Callback or function() end

                local Row = MakeRow(40)

                local Lbl = Instance.new("TextLabel")
                Lbl.BackgroundTransparency = 1
                Lbl.AnchorPoint    = Vector2.new(0, 0.5)
                Lbl.Size           = UDim2.new(1, -53, 0, 16)
                Lbl.Position       = UDim2.new(0, 0, 0.5, 0)
                Lbl.Text           = Ttl
                Lbl.TextColor3     = T.Text
                Lbl.Font           = Enum.Font.Gotham
                Lbl.TextSize       = 13
                Lbl.TextXAlignment = Enum.TextXAlignment.Left
                Lbl.TextYAlignment = Enum.TextYAlignment.Center
                Lbl.ZIndex         = 15
                Lbl.Parent         = Row
                Reg(Lbl, "TextColor3", "Text")

                local Track = Instance.new("Frame")
                Track.BackgroundColor3 = Def and T.ToggleOn or T.ToggleOff
                Track.BorderSizePixel  = 0
                Track.AnchorPoint      = Vector2.new(1, 0.5)
                Track.Size             = UDim2.new(0, 41, 0, 25)
                Track.Position         = UDim2.new(1, 0, 0.5, 0)
                Track.ZIndex           = 15
                Track.Parent           = Row
                Corner(Track, 13)

                local TrackInnerStroke = Instance.new("UIStroke")
                TrackInnerStroke.Color        = T.Handle
                TrackInnerStroke.Thickness    = 0.8
                TrackInnerStroke.Transparency = 0.80
                TrackInnerStroke.Parent       = Track
                Reg(TrackInnerStroke, "Color", "Handle")

                local Thumb = Instance.new("Frame")
                Thumb.BackgroundColor3 = T.White
                Thumb.BorderSizePixel  = 0
                Thumb.AnchorPoint      = Vector2.new(0, 0.5)
                Thumb.Size             = UDim2.new(0, 21, 0, 21)
                Thumb.Position         = Def
                    and UDim2.new(0, 18, 0.5, 0)
                    or  UDim2.new(0,  2, 0.5, 0)
                Thumb.ZIndex           = 16
                Thumb.Parent           = Track
                Corner(Thumb, 9)
                Reg(Thumb, "BackgroundColor3", "White")

                local ThumbStroke = Instance.new("UIStroke")
                ThumbStroke.Color        = Color3.fromRGB(0, 0, 0)
                ThumbStroke.Thickness    = 0.5
                ThumbStroke.Transparency = 0.82
                ThumbStroke.Parent       = Thumb

                local StarThumb = Instance.new("TextLabel")
                StarThumb.BackgroundTransparency = 1
                StarThumb.AnchorPoint    = Vector2.new(0.5, 0.5)
                StarThumb.Size           = UDim2.new(1, 0, 1, 0)
                StarThumb.Position       = UDim2.new(0.5, 0, 0.5, 0)
                StarThumb.Text           = Def and "✡" or ""
                StarThumb.TextColor3     = T.Accent
                StarThumb.Font           = Enum.Font.GothamBold
                StarThumb.TextSize       = 10
                StarThumb.TextXAlignment = Enum.TextXAlignment.Center
                StarThumb.TextYAlignment = Enum.TextYAlignment.Center
                StarThumb.ZIndex         = 17
                StarThumb.Parent         = Thumb
                Reg(StarThumb, "TextColor3", "Accent")

                local State = Def
                local Busy  = false

                local function DoSet(V, Anim)
                    if Busy then return end
                    Busy  = true
                    State = V
                    local ThumbTarget = V and UDim2.new(0, 18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
                    local Color       = V and T.ToggleOn or T.ToggleOff
                    if Anim then
                        Snap(Track, {BackgroundColor3 = Color}, 0.18)
                        Snap(Thumb, {Size = UDim2.new(0, 25, 0, 21)}, 0.12)
                        task.delay(0.12, function()
                            if not Thumb or not Thumb.Parent then return end
                            Spring(Thumb, {
                                Position = ThumbTarget,
                                Size     = UDim2.new(0, 21, 0, 21),
                            }, 0.36)
                        end)
                    else
                        Track.BackgroundColor3 = Color
                        Thumb.Position         = ThumbTarget
                        Thumb.Size             = UDim2.new(0, 21, 0, 21)
                    end
                    StarThumb.Text = V and "✡" or ""
                    task.delay(0.36, function() Busy = false end)
                end

                RegFn(function()
                    Snap(Track, {BackgroundColor3 = State and T.ToggleOn or T.ToggleOff}, 0.20)
                end)

                local Hit = Instance.new("TextButton")
                Hit.BackgroundTransparency = 1
                Hit.Size   = UDim2.new(1, 0, 1, 0)
                Hit.Text   = ""
                Hit.ZIndex = 17
                Hit.Parent = Row

                Hit.MouseButton1Click:Connect(function()
                    DoSet(not State, true)
                    Cb(State)
                end)
                Hit.MouseButton1Down:Connect(function()
                    Snap(Row, {BackgroundColor3 = T.PressHL}, 0.06)
                    Row.BackgroundTransparency = 0
                end)
                Hit.MouseButton1Up:Connect(function()
                    Tween(Row, {BackgroundColor3 = T.SectionBG}, 0.28, Enum.EasingStyle.Quint)
                    task.delay(0.28, function()
                        if Row and Row.Parent then
                            Row.BackgroundTransparency = 1
                        end
                    end)
                end)

                local Obj = {}
                Obj.Value    = { Set = function(_, V) DoSet(V, true); Cb(V) end }
                Obj.Name     = { Set = function(_, N) Lbl.Text = N end }
                Obj.GetValue = function() return State end
                return Obj
            end

            function SecObj:CreateButton(Cfg)
                Cfg = Cfg or {}
                local Ttl = Cfg.Title    or "Button"
                local Cb  = Cfg.Callback or function() end

                local Row = MakeRow(38)

                local RowScale = Instance.new("UIScale")
                RowScale.Scale  = 1
                RowScale.Parent = Row

                local BtnBg = Instance.new("Frame")
                BtnBg.BackgroundColor3       = T.Accent
                BtnBg.BackgroundTransparency = 0.88
                BtnBg.BorderSizePixel        = 0
                BtnBg.AnchorPoint            = Vector2.new(0.5, 0.5)
                BtnBg.Size                   = UDim2.new(1, -16, 1, -10)
                BtnBg.Position               = UDim2.new(0.5, 0, 0.5, 0)
                BtnBg.ZIndex                 = 14
                BtnBg.Parent                 = Row
                Corner(BtnBg, 9)
                Reg(BtnBg, "BackgroundColor3", "Accent")

                local BtnStroke = Instance.new("UIStroke")
                BtnStroke.Color        = T.Accent
                BtnStroke.Thickness    = 1
                BtnStroke.Transparency = 0.55
                BtnStroke.Parent       = BtnBg
                Reg(BtnStroke, "Color", "Accent")

                local StarPrefix = Instance.new("TextLabel")
                StarPrefix.BackgroundTransparency = 1
                StarPrefix.AnchorPoint    = Vector2.new(0, 0.5)
                StarPrefix.Size           = UDim2.new(0, 18, 1, 0)
                StarPrefix.Position       = UDim2.new(0, 8, 0.5, 0)
                StarPrefix.Text           = "✡"
                StarPrefix.TextColor3     = T.Accent
                StarPrefix.Font           = Enum.Font.GothamBold
                StarPrefix.TextSize       = 12
                StarPrefix.TextXAlignment = Enum.TextXAlignment.Left
                StarPrefix.TextYAlignment = Enum.TextYAlignment.Center
                StarPrefix.ZIndex         = 15
                StarPrefix.Parent         = Row
                Reg(StarPrefix, "TextColor3", "Accent")

                local Lbl = Instance.new("TextLabel")
                Lbl.BackgroundTransparency = 1
                Lbl.AnchorPoint    = Vector2.new(0.5, 0.5)
                Lbl.Size           = UDim2.new(1, -36, 0, 16)
                Lbl.Position       = UDim2.new(0.5, 9, 0.5, 0)
                Lbl.Text           = Ttl
                Lbl.TextColor3     = T.Accent
                Lbl.Font           = Enum.Font.GothamMedium
                Lbl.TextSize       = 13
                Lbl.TextXAlignment = Enum.TextXAlignment.Center
                Lbl.TextYAlignment = Enum.TextYAlignment.Center
                Lbl.ZIndex         = 15
                Lbl.Parent         = Row
                Reg(Lbl, "TextColor3", "Accent")

                local Hit = Instance.new("TextButton")
                Hit.BackgroundTransparency = 1
                Hit.Size   = UDim2.new(1, 0, 1, 0)
                Hit.Text   = ""
                Hit.ZIndex = 16
                Hit.Parent = Row

                Hit.MouseButton1Down:Connect(function()
                    Snap(Row, {BackgroundColor3 = T.PressHL}, 0.06)
                    Row.BackgroundTransparency = 0
                    Snap(Lbl, {TextColor3 = T.AccentDark}, 0.06)
                    Snap(RowScale, {Scale = 0.95}, 0.10)
                end)
                Hit.MouseButton1Up:Connect(function()
                    Tween(Row, {BackgroundColor3 = T.SectionBG}, 0.28, Enum.EasingStyle.Quint)
                    task.delay(0.28, function()
                        if Row and Row.Parent then
                            Row.BackgroundTransparency = 1
                        end
                    end)
                    Tween(Lbl, {TextColor3 = T.Accent}, 0.22, Enum.EasingStyle.Quint)
                    Spring(RowScale, {Scale = 1}, 0.38)
                end)
                Hit.MouseButton1Click:Connect(function()
                    pcall(Cb)
                end)

                local Obj = {}
                Obj.Name = { Set = function(_, N) Lbl.Text = N end }
                return Obj
            end

            function SecObj:CreateDropdown(Cfg)
                Cfg = Cfg or {}
                local Ttl     = Cfg.Title    or "Dropdown"
                local Opts    = Cfg.Options  or {}
                local InitSel = Cfg.Selected or {}
                local Multi   = Cfg.Multi    or false
                local Cb      = Cfg.Callback or function() end

                local SelMap = {}
                for _, V in ipairs(InitSel) do SelMap[V] = true end
                if not Multi and not next(SelMap) and #Opts > 0 then
                    SelMap[Opts[1]] = true
                end

                local function SelText()
                    local Arr = {}
                    for K, V in pairs(SelMap) do if V then Arr[#Arr+1] = K end end
                    if #Arr == 0 then return "None" end
                    table.sort(Arr)
                    return table.concat(Arr, ", ")
                end

                local IsOpen  = false
                local CurOpts = {table.unpack(Opts)}

                local Row = MakeRow(38)

                local TtlLbl = Instance.new("TextLabel")
                TtlLbl.BackgroundTransparency = 1
                TtlLbl.AnchorPoint    = Vector2.new(0, 0.5)
                TtlLbl.Size           = UDim2.new(1, -69, 0, 16)
                TtlLbl.Position       = UDim2.new(0, 0, 0.5, 0)
                TtlLbl.Text           = Ttl
                TtlLbl.TextColor3     = T.Text
                TtlLbl.Font           = Enum.Font.Gotham
                TtlLbl.TextSize       = 13
                TtlLbl.TextXAlignment = Enum.TextXAlignment.Left
                TtlLbl.TextYAlignment = Enum.TextYAlignment.Center
                TtlLbl.ZIndex         = 15
                TtlLbl.Parent         = Row
                Reg(TtlLbl, "TextColor3", "Text")

                local SelLbl = Instance.new("TextLabel")
                SelLbl.BackgroundTransparency = 1
                SelLbl.AnchorPoint    = Vector2.new(1, 0.5)
                SelLbl.Size           = UDim2.new(0, 48, 0, 16)
                SelLbl.Position       = UDim2.new(1, -16, 0.5, 0)
                SelLbl.Text           = SelText()
                SelLbl.TextColor3     = T.SubText
                SelLbl.Font           = Enum.Font.Gotham
                SelLbl.TextSize       = 11
                SelLbl.TextXAlignment = Enum.TextXAlignment.Right
                SelLbl.TextYAlignment = Enum.TextYAlignment.Center
                SelLbl.TextTruncate   = Enum.TextTruncate.AtEnd
                SelLbl.ZIndex         = 15
                SelLbl.Parent         = Row
                Reg(SelLbl, "TextColor3", "SubText")

                local Chevron = Instance.new("TextLabel")
                Chevron.BackgroundTransparency = 1
                Chevron.AnchorPoint    = Vector2.new(1, 0.5)
                Chevron.Size           = UDim2.new(0, 13, 0, 16)
                Chevron.Position       = UDim2.new(1, 0, 0.5, 0)
                Chevron.Text           = "›"
                Chevron.TextColor3     = T.Accent
                Chevron.Font           = Enum.Font.GothamBold
                Chevron.TextSize       = 18
                Chevron.TextXAlignment = Enum.TextXAlignment.Center
                Chevron.TextYAlignment = Enum.TextYAlignment.Center
                Chevron.ZIndex         = 15
                Chevron.Parent         = Row
                Reg(Chevron, "TextColor3", "Accent")

                local Panel = Instance.new("Frame")
                Panel.BackgroundColor3 = T.SectionBG
                Panel.BorderSizePixel  = 0
                Panel.Size             = UDim2.new(1, 0, 0, 0)
                Panel.ClipsDescendants = true
                Panel.ZIndex           = 20
                Panel.Visible          = false
                Panel.LayoutOrder      = Row.LayoutOrder + 1
                Panel.Parent           = Card
                Reg(Panel, "BackgroundColor3", "SectionBG")

                local PanelStroke = Instance.new("UIStroke")
                PanelStroke.Color        = T.CardStroke
                PanelStroke.Thickness    = 0.8
                PanelStroke.Transparency = 0.70
                PanelStroke.Parent       = Panel
                Reg(PanelStroke, "Color", "CardStroke")

                local PanelList = Instance.new("UIListLayout")
                PanelList.FillDirection = Enum.FillDirection.Vertical
                PanelList.SortOrder     = Enum.SortOrder.LayoutOrder
                PanelList.Parent        = Panel

                local OptBtns = {}
                local PanelH  = 0

                local function RebuildOptions(NewOpts)
                    for _, B in ipairs(OptBtns) do
                        if B and B.Parent then B:Destroy() end
                    end
                    OptBtns = {}

                    for I, Opt in ipairs(NewOpts) do
                        if I > 1 then
                            local SepW = Instance.new("Frame")
                            SepW.BackgroundTransparency = 1
                            SepW.BorderSizePixel        = 0
                            SepW.Size        = UDim2.new(1, 0, 0, 1)
                            SepW.ZIndex      = 22
                            SepW.LayoutOrder = I * 10 - 5
                            SepW.Parent      = Panel
                            table.insert(OptBtns, SepW)

                            local SepLine = Instance.new("Frame")
                            SepLine.BackgroundColor3 = T.Separator
                            SepLine.BorderSizePixel  = 0
                            SepLine.Size     = UDim2.new(1, -16, 1, 0)
                            SepLine.Position = UDim2.new(0, 16, 0, 0)
                            SepLine.ZIndex   = 22
                            SepLine.Parent   = SepW
                            Reg(SepLine, "BackgroundColor3", "Separator")
                        end

                        local Ob = Instance.new("TextButton")
                        Ob.BackgroundTransparency = 1
                        Ob.Size        = UDim2.new(1, 0, 0, 37)
                        Ob.Text        = ""
                        Ob.ZIndex      = 22
                        Ob.LayoutOrder = I * 10
                        Ob.Parent      = Panel
                        table.insert(OptBtns, Ob)
                        Pad(Ob, 0, 13, 0, 13)

                        local Ol = Instance.new("TextLabel")
                        Ol.Name       = "OptionLabel"
                        Ol.BackgroundTransparency = 1
                        Ol.AnchorPoint    = Vector2.new(0, 0.5)
                        Ol.Size           = UDim2.new(1, -22, 0, 16)
                        Ol.Position       = UDim2.new(0, 0, 0.5, 0)
                        Ol.Text           = Opt
                        Ol.TextColor3     = T.Text
                        Ol.Font           = Enum.Font.Gotham
                        Ol.TextSize       = 12
                        Ol.TextXAlignment = Enum.TextXAlignment.Left
                        Ol.TextYAlignment = Enum.TextYAlignment.Center
                        Ol.ZIndex         = 23
                        Ol.Parent         = Ob
                        Reg(Ol, "TextColor3", "Text")

                        local Ck = Instance.new("TextLabel")
                        Ck.Name       = "Checkmark"
                        Ck.BackgroundTransparency = 1
                        Ck.AnchorPoint    = Vector2.new(1, 0.5)
                        Ck.Size           = UDim2.new(0, 16, 0, 16)
                        Ck.Position       = UDim2.new(1, 0, 0.5, 0)
                        Ck.Text           = SelMap[Opt] and "✡" or ""
                        Ck.TextColor3     = T.Accent
                        Ck.Font           = Enum.Font.GothamBold
                        Ck.TextSize       = 10
                        Ck.TextXAlignment = Enum.TextXAlignment.Center
                        Ck.TextYAlignment = Enum.TextYAlignment.Center
                        Ck.ZIndex         = 23
                        Ck.Parent         = Ob
                        Reg(Ck, "TextColor3", "Accent")

                        local ObScale = Instance.new("UIScale")
                        ObScale.Scale  = 1
                        ObScale.Parent = Ob

                        Ob.MouseButton1Down:Connect(function()
                            Snap(Ob, {BackgroundColor3 = T.PressHL}, 0.06)
                            Ob.BackgroundTransparency = 0
                            Snap(ObScale, {Scale = 0.97}, 0.08)
                        end)
                        Ob.MouseButton1Up:Connect(function()
                            Tween(Ob, {BackgroundColor3 = T.SectionBG}, 0.24, Enum.EasingStyle.Quint)
                            task.delay(0.24, function()
                                if Ob and Ob.Parent then
                                    Ob.BackgroundTransparency = 1
                                end
                            end)
                            Spring(ObScale, {Scale = 1}, 0.30)
                        end)

                        Ob.MouseButton1Click:Connect(function()
                            if Multi then
                                SelMap[Opt] = not SelMap[Opt]
                                Ck.Text = SelMap[Opt] and "✡" or ""
                            else
                                for _, O2 in ipairs(NewOpts) do SelMap[O2] = false end
                                SelMap[Opt] = true
                                for _, B2 in ipairs(OptBtns) do
                                    if B2:IsA("TextButton") then
                                        local CkLbl = B2:FindFirstChild("Checkmark")
                                        local OlLbl = B2:FindFirstChild("OptionLabel")
                                        if CkLbl and OlLbl then
                                            CkLbl.Text = SelMap[OlLbl.Text] and "✡" or ""
                                        end
                                    end
                                end
                            end
                            SelLbl.Text = SelText()
                            local Result = {}
                            for K, V in pairs(SelMap) do if V then Result[#Result+1] = K end end
                            pcall(Cb, Result)
                            if not Multi then
                                IsOpen = false
                                Tween(Panel, {Size = UDim2.new(1, 0, 0, 0)}, 0.24, Enum.EasingStyle.Quint)
                                task.delay(0.25, function()
                                    if Panel and Panel.Parent then Panel.Visible = false end
                                end)
                                Snap(Chevron, {Rotation = 0}, 0.20)
                            end
                        end)
                    end

                    PanelH = math.min(#NewOpts * 37, 157)
                    return PanelH
                end

                RebuildOptions(CurOpts)

                local Hit = Instance.new("TextButton")
                Hit.BackgroundTransparency = 1
                Hit.Size   = UDim2.new(1, 0, 1, 0)
                Hit.Text   = ""
                Hit.ZIndex = 16
                Hit.Parent = Row

                Hit.MouseButton1Down:Connect(function()
                    Snap(Row, {BackgroundColor3 = T.PressHL}, 0.06)
                    Row.BackgroundTransparency = 0
                end)
                Hit.MouseButton1Up:Connect(function()
                    Tween(Row, {BackgroundColor3 = T.SectionBG}, 0.24, Enum.EasingStyle.Quint)
                    task.delay(0.24, function()
                        if Row and Row.Parent then Row.BackgroundTransparency = 1 end
                    end)
                end)

                Hit.MouseButton1Click:Connect(function()
                    IsOpen = not IsOpen
                    if IsOpen then
                        Panel.Visible = true
                        Panel.Size    = UDim2.new(1, 0, 0, 0)
                        Spring(Panel, {Size = UDim2.new(1, 0, 0, PanelH)}, 0.42)
                        Snap(Chevron, {Rotation = 90}, 0.22)
                    else
                        Tween(Panel, {Size = UDim2.new(1, 0, 0, 0)}, 0.24, Enum.EasingStyle.Quint)
                        task.delay(0.25, function()
                            if Panel and Panel.Parent then Panel.Visible = false end
                        end)
                        Snap(Chevron, {Rotation = 0}, 0.20)
                    end
                end)

                local Obj = {}
                Obj.Name    = { Set = function(_, N) TtlLbl.Text = N end }
                Obj.Options = {
                    Set = function(_, NewOpts)
                        CurOpts = NewOpts
                        SelMap  = {}
                        if not Multi and #NewOpts > 0 then SelMap[NewOpts[1]] = true end
                        RebuildOptions(NewOpts)
                        SelLbl.Text = SelText()
                    end
                }
                Obj.Value = {
                    Set = function(_, V)
                        SelMap = {}
                        if type(V) == "table" then
                            for _, S in ipairs(V) do SelMap[S] = true end
                        elseif type(V) == "string" then
                            SelMap[V] = true
                        end
                        SelLbl.Text = SelText()
                        RebuildOptions(CurOpts)
                    end
                }
                return Obj
            end

            function SecObj:CreateSlider(Cfg)
                Cfg = Cfg or {}
                local Ttl = Cfg.Title     or "Slider"
                local Rng = Cfg.Range     or {0, 100}
                local Mn  = Rng[1] or 0
                local Mx  = Rng[2] or 100
                local Def = math.clamp(Cfg.Default or Mn, Mn, Mx)
                local Inc = Cfg.Increment or 1
                local Suf = Cfg.Suffix    or ""
                local Cb  = Cfg.Callback  or function() end
                local Cur = Def

                local Row = MakeRow(53)

                local TtlLbl = Instance.new("TextLabel")
                TtlLbl.BackgroundTransparency = 1
                TtlLbl.AnchorPoint    = Vector2.new(0, 0)
                TtlLbl.Size           = UDim2.new(0.60, 0, 0, 18)
                TtlLbl.Position       = UDim2.new(0, 0, 0, 8)
                TtlLbl.Text           = Ttl
                TtlLbl.TextColor3     = T.Text
                TtlLbl.Font           = Enum.Font.Gotham
                TtlLbl.TextSize       = 13
                TtlLbl.TextXAlignment = Enum.TextXAlignment.Left
                TtlLbl.TextYAlignment = Enum.TextYAlignment.Center
                TtlLbl.ZIndex         = 15
                TtlLbl.Parent         = Row
                Reg(TtlLbl, "TextColor3", "Text")

                local ValLbl = Instance.new("TextLabel")
                ValLbl.BackgroundTransparency = 1
                ValLbl.AnchorPoint    = Vector2.new(1, 0)
                ValLbl.Size           = UDim2.new(0.40, 0, 0, 18)
                ValLbl.Position       = UDim2.new(1, 0, 0, 8)
                ValLbl.Text           = tostring(Cur) .. Suf
                ValLbl.TextColor3     = T.Accent
                ValLbl.Font           = Enum.Font.GothamMedium
                ValLbl.TextSize       = 12
                ValLbl.TextXAlignment = Enum.TextXAlignment.Right
                ValLbl.TextYAlignment = Enum.TextYAlignment.Center
                ValLbl.ZIndex         = 15
                ValLbl.Parent         = Row
                Reg(ValLbl, "TextColor3", "Accent")

                local TrackBg = Instance.new("Frame")
                TrackBg.BackgroundColor3 = T.SliderTrack
                TrackBg.BorderSizePixel  = 0
                TrackBg.AnchorPoint      = Vector2.new(0, 1)
                TrackBg.Size             = UDim2.new(1, 0, 0, 5)
                TrackBg.Position         = UDim2.new(0, 0, 1, -10)
                TrackBg.ZIndex           = 15
                TrackBg.Parent           = Row
                Corner(TrackBg, 3)
                Reg(TrackBg, "BackgroundColor3", "SliderTrack")

                local TrackStroke = Instance.new("UIStroke")
                TrackStroke.Color        = T.CardStroke
                TrackStroke.Thickness    = 0.8
                TrackStroke.Transparency = 0.72
                TrackStroke.Parent       = TrackBg
                Reg(TrackStroke, "Color", "CardStroke")

                local InitPct = (Cur - Mn) / math.max(Mx - Mn, 0.0001)

                local TrackFill = Instance.new("Frame")
                TrackFill.BackgroundColor3 = T.SliderFill
                TrackFill.BorderSizePixel  = 0
                TrackFill.Size             = UDim2.new(InitPct, 0, 1, 0)
                TrackFill.ZIndex           = 16
                TrackFill.Parent           = TrackBg
                Corner(TrackFill, 3)
                Reg(TrackFill, "BackgroundColor3", "SliderFill")

                local Thumb = Instance.new("Frame")
                Thumb.BackgroundColor3 = T.White
                Thumb.BorderSizePixel  = 0
                Thumb.AnchorPoint      = Vector2.new(0.5, 0.5)
                Thumb.Size             = UDim2.new(0, 20, 0, 20)
                Thumb.Position         = UDim2.new(InitPct, 0, 0.5, 0)
                Thumb.ZIndex           = 17
                Thumb.Parent           = TrackBg
                Corner(Thumb, 10)
                Reg(Thumb, "BackgroundColor3", "White")

                local ThumbStroke = Instance.new("UIStroke")
                ThumbStroke.Color        = T.Accent
                ThumbStroke.Thickness    = 1.5
                ThumbStroke.Transparency = 0.30
                ThumbStroke.Parent       = Thumb
                Reg(ThumbStroke, "Color", "Accent")

                local ThumbStar = Instance.new("TextLabel")
                ThumbStar.BackgroundTransparency = 1
                ThumbStar.AnchorPoint    = Vector2.new(0.5, 0.5)
                ThumbStar.Size           = UDim2.new(1, 0, 1, 0)
                ThumbStar.Position       = UDim2.new(0.5, 0, 0.5, 0)
                ThumbStar.Text           = "✡"
                ThumbStar.TextColor3     = T.Accent
                ThumbStar.Font           = Enum.Font.GothamBold
                ThumbStar.TextSize       = 9
                ThumbStar.TextTransparency = 0.40
                ThumbStar.TextXAlignment = Enum.TextXAlignment.Center
                ThumbStar.TextYAlignment = Enum.TextYAlignment.Center
                ThumbStar.ZIndex         = 18
                ThumbStar.Parent         = Thumb
                Reg(ThumbStar, "TextColor3", "Accent")

                local Sliding = false

                local function Calc(Pos)
                    local Ab  = TrackBg.AbsolutePosition
                    local Sz  = TrackBg.AbsoluteSize
                    local Pct = math.clamp((Pos.X - Ab.X) / Sz.X, 0, 1)
                    local Snp = math.round((Mn + Pct * (Mx - Mn)) / Inc) * Inc
                    return math.clamp(Snp, Mn, Mx)
                end

                local function Apply(V, Anim)
                    Cur = V
                    local Pct = (V - Mn) / math.max(Mx - Mn, 0.0001)
                    if Anim then
                        Snap(TrackFill, {Size = UDim2.new(Pct, 0, 1, 0)}, 0.14)
                        Snap(Thumb, {Position = UDim2.new(Pct, 0, 0.5, 0)}, 0.14)
                    else
                        TrackFill.Size  = UDim2.new(Pct, 0, 1, 0)
                        Thumb.Position  = UDim2.new(Pct, 0, 0.5, 0)
                    end
                    ValLbl.Text = tostring(V) .. Suf
                end

                local Hit = Instance.new("TextButton")
                Hit.BackgroundTransparency = 1
                Hit.Size   = UDim2.new(1, 0, 1, 0)
                Hit.Text   = ""
                Hit.ZIndex = 18
                Hit.Parent = Row

                Hit.InputBegan:Connect(function(Inp)
                    if Inp.UserInputType == Enum.UserInputType.MouseButton1
                    or Inp.UserInputType == Enum.UserInputType.Touch then
                        Sliding = true
                        local V = Calc(Inp.Position)
                        Apply(V, false)
                        pcall(Cb, V)
                        local Pct = (V - Mn) / math.max(Mx - Mn, 0.0001)
                        Spring(Thumb, {
                            Size     = UDim2.new(0, 24, 0, 24),
                            Position = UDim2.new(Pct, 0, 0.5, 0)
                        }, 0.30)
                    end
                end)

                UserInputService.InputChanged:Connect(function(Inp)
                    if not Sliding then return end
                    if Inp.UserInputType ~= Enum.UserInputType.MouseMovement
                    and Inp.UserInputType ~= Enum.UserInputType.Touch then return end
                    local V = Calc(Inp.Position)
                    Apply(V, false)
                    local Pct = (V - Mn) / math.max(Mx - Mn, 0.0001)
                    Thumb.Position = UDim2.new(Pct, 0, 0.5, 0)
                    pcall(Cb, V)
                end)

                UserInputService.InputEnded:Connect(function(Inp)
                    if not Sliding then return end
                    if Inp.UserInputType == Enum.UserInputType.MouseButton1
                    or Inp.UserInputType == Enum.UserInputType.Touch then
                        Sliding = false
                        local Pct = (Cur - Mn) / math.max(Mx - Mn, 0.0001)
                        Spring(Thumb, {
                            Size     = UDim2.new(0, 20, 0, 20),
                            Position = UDim2.new(Pct, 0, 0.5, 0)
                        }, 0.36)
                    end
                end)

                local Obj = {}
                Obj.Value = { Set = function(_, V) Apply(math.clamp(V, Mn, Mx), true); pcall(Cb, Cur) end }
                Obj.Name  = { Set = function(_, N) TtlLbl.Text = N end }
                return Obj
            end

            function SecObj:CreateLabel(Content)
                Content = Content or ""
                local Row = MakeRow(35)

                local Lbl = Instance.new("TextLabel")
                Lbl.BackgroundTransparency = 1
                Lbl.AnchorPoint    = Vector2.new(0, 0.5)
                Lbl.Size           = UDim2.new(1, 0, 0, 16)
                Lbl.Position       = UDim2.new(0, 0, 0.5, 0)
                Lbl.Text           = Content
                Lbl.TextColor3     = T.SubText
                Lbl.Font           = Enum.Font.Gotham
                Lbl.TextSize       = 12
                Lbl.TextXAlignment = Enum.TextXAlignment.Left
                Lbl.TextYAlignment = Enum.TextYAlignment.Center
                Lbl.ZIndex         = 15
                Lbl.Parent         = Row
                Reg(Lbl, "TextColor3", "SubText")

                local Obj = {}
                Obj.Value = { Set = function(_, V) Lbl.Text = V end }
                return Obj
            end

            function SecObj:CreateParagraph(Cfg)
                Cfg = Cfg or {}
                local Ptl = Cfg.Title   or ""
                local Pct = Cfg.Content or ""

                SecObj._RowN = SecObj._RowN + 1
                local N = SecObj._RowN

                if N > 1 then
                    local SepW = Instance.new("Frame")
                    SepW.BackgroundTransparency = 1
                    SepW.BorderSizePixel        = 0
                    SepW.Size        = UDim2.new(1, 0, 0, 1)
                    SepW.ZIndex      = 15
                    SepW.LayoutOrder = N * 10 - 5
                    SepW.Parent      = Card

                    local SepLine = Instance.new("Frame")
                    SepLine.BackgroundColor3 = T.Separator
                    SepLine.BorderSizePixel  = 0
                    SepLine.Size     = UDim2.new(1, -16, 1, 0)
                    SepLine.Position = UDim2.new(0, 16, 0, 0)
                    SepLine.ZIndex   = 15
                    SepLine.Parent   = SepW
                    Reg(SepLine, "BackgroundColor3", "Separator")
                end

                local Frame = Instance.new("Frame")
                Frame.BackgroundTransparency = 1
                Frame.Size          = UDim2.new(1, 0, 0, 0)
                Frame.AutomaticSize = Enum.AutomaticSize.Y
                Frame.ZIndex        = 14
                Frame.LayoutOrder   = N * 10
                Frame.Parent        = Card
                Pad(Frame, 8, 13, 8, 13)

                local Flay = Instance.new("UIListLayout")
                Flay.FillDirection = Enum.FillDirection.Vertical
                Flay.SortOrder     = Enum.SortOrder.LayoutOrder
                Flay.Padding       = UDim.new(0, 4)
                Flay.Parent        = Frame

                local TitleLblP = nil
                if Ptl ~= "" then
                    TitleLblP = Instance.new("TextLabel")
                    TitleLblP.BackgroundTransparency = 1
                    TitleLblP.Size           = UDim2.new(1, 0, 0, 0)
                    TitleLblP.AutomaticSize  = Enum.AutomaticSize.Y
                    TitleLblP.Text           = Ptl
                    TitleLblP.TextColor3     = T.Text
                    TitleLblP.Font           = Enum.Font.GothamMedium
                    TitleLblP.TextSize       = 12
                    TitleLblP.TextWrapped    = true
                    TitleLblP.TextXAlignment = Enum.TextXAlignment.Left
                    TitleLblP.LayoutOrder    = 1
                    TitleLblP.ZIndex         = 15
                    TitleLblP.Parent         = Frame
                    Reg(TitleLblP, "TextColor3", "Text")
                end

                local ContentLbl = Instance.new("TextLabel")
                ContentLbl.BackgroundTransparency = 1
                ContentLbl.Size           = UDim2.new(1, 0, 0, 0)
                ContentLbl.AutomaticSize  = Enum.AutomaticSize.Y
                ContentLbl.Text           = Pct
                ContentLbl.TextColor3     = T.SubText
                ContentLbl.Font           = Enum.Font.Gotham
                ContentLbl.TextSize       = 11
                ContentLbl.TextWrapped    = true
                ContentLbl.TextXAlignment = Enum.TextXAlignment.Left
                ContentLbl.LayoutOrder    = 2
                ContentLbl.ZIndex         = 15
                ContentLbl.Parent         = Frame
                Reg(ContentLbl, "TextColor3", "SubText")

                local Obj = {}
                Obj.Title   = { Set = function(_, V) if TitleLblP then TitleLblP.Text = V end end }
                Obj.Content = { Set = function(_, V) ContentLbl.Text = V end }
                return Obj
            end

            return SecObj
        end

        return TabObj
    end

    return WindowObj
end

return Library
