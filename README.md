# ✡ Big Yahu UI Library

A polished, Israel-themed Roblox UI library with animated windows, tabs, sections, and interactive components. Features four built-in themes, smooth spring animations, drag support, and authentic Israeli imagery.

-----

## Loading the Library

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/MuryScript/Big-Yahu/refs/heads/main/Jew.lua"
))()
```

-----

## Quick Start

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/MuryScript/Big-Yahu/refs/heads/main/Jew.lua"
))()

local Window = Library:CreateWindow({
    Title    = "Big Yahu",
    SubTitle = "State of Israel",
    Theme    = "Bibi",
})

local Tab = Window:CreateTab({ Title = "Main" })

local Section = Tab:CreateSection({ Title = "General", Position = "left" })

Section:CreateToggle({
    Title    = "God Mode",
    Default  = false,
    Callback = function(Value)
        print("God Mode:", Value)
    end,
})
```

-----

## `Library:CreateWindow(Cfg)`

Creates the main UI window. Returns a **WindowObj**.

|Field            |Type         |Default            |Description                                                           |
|-----------------|-------------|-------------------|----------------------------------------------------------------------|
|`Title`          |string       |`"Bibi Settings"`  |Main title shown in the header                                        |
|`SubTitle`       |string       |`"State of Israel"`|Subtitle shown below the title                                        |
|`LoadingTitle`   |string       |`"Netanyahu Mode"` |Title shown on the loading screen                                     |
|`LoadingSubtitle`|string       |`"עם ישראל חי"`    |Subtitle shown on the loading screen                                  |
|`LoadingImage`   |number/string|Netanyahu asset    |Image shown on the loading screen (asset ID or `rbxassetid://` string)|
|`ShowText`       |string       |`"✡ Open"`         |Text on the re-open button after the window is closed                 |
|`Theme`          |string       |`"Bibi"`           |Starting theme — see [Themes](#themes)                                |

```lua
local Window = Library:CreateWindow({
    Title           = "My Script",
    SubTitle        = "v1.0",
    LoadingTitle    = "Loading...",
    LoadingSubtitle = "Please wait",
    LoadingImage    = 88477104967157, -- Netanyahu
    ShowText        = "✡ Open",
    Theme           = "IsraelBlue",
})
```

### WindowObj Methods

#### `WindowObj:SetTheme(Name)`

Switches the active theme with a smooth tween. See [Themes](#themes) for valid names.

```lua
Window:SetTheme("IDF")
```

#### `WindowObj:CreateTab(TabCfg)`

Creates a tab in the tab bar. Returns a **TabObj**. The first tab created is automatically selected.

|Field  |Type             |Default|Description                                                                        |
|-------|-----------------|-------|-----------------------------------------------------------------------------------|
|`Title`|string           |`"Tab"`|Tab label                                                                          |
|`Logo` |number/string/nil|`nil`  |Icon — asset ID, `rbxassetid://` string, or an icon name from the built-in icon set|

```lua
local Tab = Window:CreateTab({
    Title = "Combat",
    Logo  = "zap",   -- built-in icon name
})

local Tab2 = Window:CreateTab({
    Title = "Visuals",
    Logo  = 135711266569834,  -- Israel flag asset
})
```

-----

## `TabObj:CreateSection(SecCfg)`

Creates a card-style section inside a tab. Returns a **SecObj**.

|Field     |Type  |Default    |Description                             |
|----------|------|-----------|----------------------------------------|
|`Title`   |string|`"Section"`|Section heading (rendered in uppercase) |
|`Position`|string|`"left"`   |Column placement — `"left"` or `"right"`|

```lua
local LeftSec  = Tab:CreateSection({ Title = "Movement",  Position = "left"  })
local RightSec = Tab:CreateSection({ Title = "Visuals",   Position = "right" })
```

-----

## Components

All components are created on a **SecObj**.

-----

### `SecObj:CreateToggle(Cfg)`

An on/off switch with a Star of David thumb indicator.

|Field     |Type    |Default         |Description                         |
|----------|--------|----------------|------------------------------------|
|`Title`   |string  |`"Toggle"`      |Row label                           |
|`Default` |boolean |`false`         |Starting state                      |
|`Callback`|function|`function() end`|Called with `(boolean)` when toggled|

```lua
local Toggle = Section:CreateToggle({
    Title    = "Infinite Jump",
    Default  = false,
    Callback = function(Value)
        -- Value is true or false
        print("Infinite Jump:", Value)
    end,
})

-- Programmatically update the value:
Toggle.Value:Set(true)
```

-----

### `SecObj:CreateButton(Cfg)`

A pressable button with spring animation.

|Field     |Type    |Default         |Description                      |
|----------|--------|----------------|---------------------------------|
|`Title`   |string  |`"Button"`      |Button label                     |
|`Callback`|function|`function() end`|Called with no arguments on click|

```lua
local Button = Section:CreateButton({
    Title    = "Execute",
    Callback = function()
        print("Button pressed!")
    end,
})

-- Rename the button at runtime:
Button.Name:Set("New Label")
```

-----

### `SecObj:CreateDropdown(Cfg)`

A collapsible option picker, with optional multi-select.

|Field     |Type    |Default         |Description                                      |
|----------|--------|----------------|-------------------------------------------------|
|`Title`   |string  |`"Dropdown"`    |Row label                                        |
|`Options` |table   |`{}`            |List of string options                           |
|`Selected`|table   |first option    |Pre-selected option(s) as a list of strings      |
|`Multi`   |boolean |`false`         |Allow multiple selections at once                |
|`Callback`|function|`function() end`|Called with `(table)` — a list of selected values|

```lua
-- Single-select
local Dropdown = Section:CreateDropdown({
    Title    = "Aim Bone",
    Options  = { "Head", "Chest", "Pelvis" },
    Selected = { "Head" },
    Callback = function(Selection)
        print("Selected:", Selection[1])
    end,
})

-- Multi-select
local MultiDrop = Section:CreateDropdown({
    Title    = "Active Players",
    Options  = { "Alice", "Bob", "Charlie" },
    Selected = { "Alice", "Bob" },
    Multi    = true,
    Callback = function(Selection)
        for _, name in ipairs(Selection) do
            print(name)
        end
    end,
})

-- Runtime updates:
Dropdown.Value:Set("Chest")                  -- change selection
Dropdown.Options:Set({ "Head", "Neck" })     -- replace option list
Dropdown.Name:Set("Target Bone")             -- rename the row
```

-----

### `SecObj:CreateSlider(Cfg)`

A draggable range slider with a Star of David thumb.

|Field      |Type    |Default         |Description                                               |
|-----------|--------|----------------|----------------------------------------------------------|
|`Title`    |string  |`"Slider"`      |Row label                                                 |
|`Range`    |table   |`{0, 100}`      |`{min, max}`                                              |
|`Default`  |number  |min             |Starting value                                            |
|`Increment`|number  |`1`             |Snap step size                                            |
|`Suffix`   |string  |`""`            |Text appended to the displayed value (e.g. `"%"`, `" ms"`)|
|`Callback` |function|`function() end`|Called with `(number)` on change                          |

```lua
local Slider = Section:CreateSlider({
    Title     = "Walk Speed",
    Range     = { 16, 100 },
    Default   = 16,
    Increment = 1,
    Suffix    = " stud/s",
    Callback  = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- Programmatically set value:
Slider.Value:Set(50)

-- Rename at runtime:
Slider.Name:Set("Run Speed")
```

-----

### `SecObj:CreateLabel(Content)`

A single-line read-only text label in the muted sub-text colour.

```lua
local Label = Section:CreateLabel("Status: Active")

-- Update text at runtime:
Label.Value:Set("Status: Idle")
```

-----

### `SecObj:CreateParagraph(Cfg)`

A block of wrapped text with an optional bold title line above it.

|Field    |Type  |Default|Description                               |
|---------|------|-------|------------------------------------------|
|`Title`  |string|`""`   |Bold heading (omit or leave empty to hide)|
|`Content`|string|`""`   |Body text (wraps automatically)           |

```lua
local Para = Section:CreateParagraph({
    Title   = "About",
    Content = "This script was built with Big Yahu UI. "
           .. "Use responsibly. עם ישראל חי",
})

-- Update at runtime:
Para.Title:Set("Updated Heading")
Para.Content:Set("New body text here.")
```

-----

## Themes

Pass the theme name to `CreateWindow` or switch at any time with `SetTheme`.

|Name          |Description                                                       |
|--------------|------------------------------------------------------------------|
|`"Bibi"`      |Warm white with gold accents and deep-blue toggles — the default  |
|`"IsraelBlue"`|Clean white background with full Israeli-blue (`#003874`) accents |
|`"Jerusalem"` |Warm sandstone tones inspired by Jerusalem stone                  |
|`"IDF"`       |Dark navy background with bright-blue accents — tactical dark mode|

```lua
-- Set on creation:
local Window = Library:CreateWindow({ Theme = "Jerusalem" })

-- Or switch later:
Window:SetTheme("IDF")
Window:SetTheme("Bibi")
```

-----

## Full Example

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/MuryScript/Big-Yahu/refs/heads/main/Jew.lua"
))()

local Window = Library:CreateWindow({
    Title           = "Big Yahu",
    SubTitle        = "עם ישראל חי",
    LoadingTitle    = "Netanyahu Mode",
    LoadingSubtitle = "Initialising...",
    Theme           = "Bibi",
})

-- ── Tab 1: Player ──────────────────────────────────────────────────────────
local PlayerTab = Window:CreateTab({ Title = "Player", Logo = "user" })

local MoveSec = PlayerTab:CreateSection({ Title = "Movement", Position = "left" })

local SpeedSlider = MoveSec:CreateSlider({
    Title     = "Walk Speed",
    Range     = { 16, 100 },
    Default   = 16,
    Increment = 2,
    Suffix    = " s/s",
    Callback  = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then char.Humanoid.WalkSpeed = v end
    end,
})

MoveSec:CreateToggle({
    Title    = "Infinite Jump",
    Default  = false,
    Callback = function(v)
        _G.InfiniteJump = v
    end,
})

local CombatSec = PlayerTab:CreateSection({ Title = "Combat", Position = "right" })

CombatSec:CreateDropdown({
    Title    = "Aim Bone",
    Options  = { "Head", "Chest", "Pelvis", "Left Arm", "Right Arm" },
    Selected = { "Head" },
    Callback = function(sel)
        print("Aim bone:", sel[1])
    end,
})

CombatSec:CreateButton({
    Title    = "Teleport to Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0, 5, 0)
        end
    end,
})

-- ── Tab 2: Settings ────────────────────────────────────────────────────────
local SettingsTab = Window:CreateTab({ Title = "Settings", Logo = "settings" })

local ThemeSec = SettingsTab:CreateSection({ Title = "Theme", Position = "left" })

ThemeSec:CreateDropdown({
    Title    = "UI Theme",
    Options  = { "Bibi", "IsraelBlue", "Jerusalem", "IDF" },
    Selected = { "Bibi" },
    Callback = function(sel)
        Window:SetTheme(sel[1])
    end,
})

local InfoSec = SettingsTab:CreateSection({ Title = "Info", Position = "right" })

InfoSec:CreateParagraph({
    Title   = "Big Yahu UI",
    Content = "A Roblox UI library themed around Israel. "
           .. "Switch themes live with the dropdown above.",
})

InfoSec:CreateLabel("Version 1.0  •  עם ישראל חי")
```

-----

## Icon Names

The library includes a large built-in icon set. Pass any of these as `Logo` in `CreateTab`:

`home` `settings` `user` `search` `star` `heart` `bell` `mail` `lock` `check` `plus` `trash` `edit` `eye` `music` `play` `info` `alert` `globe` `map` `download` `upload` `folder` `code` `wifi` `cpu` `monitor` `phone` `message` `flag` `tool` `zap` `sun` `moon` `cloud` `star-of-david` `menorah` `shield` `calendar` `clock` `bookmark` `key` `link` `database` `git-branch` `github` `brain` `bug` `fire` `filter` `layers` `tag` `activity` `award` `box` `briefcase` `camera` `chart-bar` `chart-line` `check-circle` `clipboard` `coffee` `compass` `copy` `crown` `diamond` `dumbbell` `expand` `feather` `gift` `headphones` `history` `inbox` `laptop` `leaf` `loader` `medal` `navigation` `package` `pencil` `pie-chart` `pin` `plane` `printer` `radio` `refresh-cw` `save` `scissors` `smile` `sparkles` `table` `timer` `trophy` `video` `volume` `wallet` and many more.

You can also pass any asset ID (number) or `rbxassetid://` string directly.

-----

## Notes

- The window appears after a **~2.4 second** animated loading screen featuring Netanyahu’s portrait.
- The window is **draggable** by clicking and holding the header.
- Pressing **Done** collapses the window into a small re-open button at the top of the screen.
- All theme transitions are **live-tweened** — no re-creation needed.
- Sections use a **two-column layout** (`"left"` / `"right"`); each column scrolls independently.
