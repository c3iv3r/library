--!strict
-- Noctis UI Library (re-written)
-- Dibuat agar struktur lebih bersih, mudah dipahami, dan enak dipakai.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local cloneref = cloneref or function(ref) return ref end

-- ===================================================================
-- Helpers
-- ===================================================================

local theme = {
    windowBackground = Color3.fromRGB(24, 25, 31),
    panel = Color3.fromRGB(16, 17, 22),
    panelAlt = Color3.fromRGB(26, 27, 35),
    stroke = Color3.fromRGB(52, 54, 66),
    highlight = Color3.fromRGB(10, 135, 213),
    text = Color3.fromRGB(197, 204, 219),
    textDim = Color3.fromRGB(137, 141, 155),
    textMuted = Color3.fromRGB(104, 108, 120),
    danger = Color3.fromRGB(209, 89, 89),
    success = Color3.fromRGB(86, 192, 142),
}

local fonts = {
    Title = Enum.Font.GothamSemibold,
    Body = Enum.Font.Gotham,
    Mono = Enum.Font.Code,
}

local defaultTweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function tween(instance: Instance, properties: {[string]: any}, info: TweenInfo?)
    local tw = TweenService:Create(instance, info or defaultTweenInfo, properties)
    tw:Play()
    return tw
end

local function create(className: string, properties, children)
    local object = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        object[prop] = value
    end
    for _, child in ipairs(children or {}) do
        child.Parent = object
    end
    return object
end

local function attachToParent(gui: ScreenGui)
    if typeof(protect_gui) == "function" then
        protect_gui(gui)
    end

    if typeof(gethui) == "function" then
        gui.Parent = gethui()
        return
    end

    local ok, coreGui = pcall(function()
        return cloneref(game:GetService("CoreGui"))
    end)

    if ok and coreGui then
        gui.Parent = coreGui
    else
        gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end

local function makeShadow(parent: GuiObject)
    local shadow = create("ImageLabel", {
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 12),
        Size = UDim2.new(1, 48, 1, 48),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = parent.ZIndex - 2,
    })
    shadow.Parent = parent
end

local function makeStroke(obj: GuiObject, color: Color3?, thickness: number?)
    return create("UIStroke", {
        Parent = obj,
        Color = color or theme.stroke,
        Thickness = thickness or 1.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function makeCorner(obj: GuiObject, radius: UDim?)
    return create("UICorner", {
        Parent = obj,
        CornerRadius = radius or UDim.new(0, 8),
    })
end

local function dragify(mainFrame: Frame, dragArea: GuiObject)
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            dragInput = input
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragArea.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function formatValue(value, precision)
    if typeof(value) == "number" then
        return precision and string.format("%." .. precision .. "f", value) or tostring(value)
    elseif typeof(value) == "table" then
        return table.concat(value, ", ")
    end
    return tostring(value)
end

-- ===================================================================
-- Window / Tab / Section classes
-- ===================================================================

local Window = {}
Window.__index = Window

local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

-- ===================================================================
-- Component builders
-- ===================================================================

local ComponentBuilders = {}

function ComponentBuilders.Button(section, config)
    config = config or {}
    local callback = config.Callback or function() end

    local buttonFrame = create("TextButton", {
        Name = "Button",
        Parent = section.Container,
        Size = UDim2.new(1, 0, 0, config.Desc and 66 or 42),
        BackgroundColor3 = theme.panelAlt,
        AutoButtonColor = false,
        Text = "",
    })

    makeCorner(buttonFrame)
    makeStroke(buttonFrame)

    local padding = create("UIPadding", {
        Parent = buttonFrame,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = buttonFrame,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    local title = create("TextLabel", {
        Parent = buttonFrame,
        Name = "Title",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
        Font = fonts.Title,
        Text = config.Title or "Button",
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local desc
    if config.Desc then
        desc = create("TextLabel", {
            Parent = buttonFrame,
            Name = "Description",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 16),
            Font = fonts.Body,
            Text = config.Desc,
            TextColor3 = theme.textDim,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end

    local enabled = true

    buttonFrame.MouseButton1Click:Connect(function()
        if enabled then
            tween(buttonFrame, {BackgroundColor3 = theme.panel})
            tween(buttonFrame, {BackgroundColor3 = theme.panelAlt}, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
            callback()
        end
    end)

    buttonFrame.MouseEnter:Connect(function()
        if enabled then
            tween(buttonFrame, {BackgroundColor3 = theme.panel})
        end
    end)

    buttonFrame.MouseLeave:Connect(function()
        if enabled then
            tween(buttonFrame, {BackgroundColor3 = theme.panelAlt})
        end
    end)

    local api = {}

    function api:SetTitle(text)
        title.Text = text
    end

    function api:SetDescription(text)
        if not desc and text then
            desc = create("TextLabel", {
                Parent = buttonFrame,
                Name = "Description",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Font = fonts.Body,
                TextColor3 = theme.textDim,
                TextSize = 14,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end

        if desc then
            desc.Text = text or ""
            desc.Visible = text ~= nil and text ~= ""
            buttonFrame.Size = UDim2.new(1, 0, 0, desc.Visible and 66 or 42)
        end
    end

    function api:SetEnabled(state)
        enabled = state
        if state then
            tween(buttonFrame, {BackgroundColor3 = theme.panelAlt})
            tween(title, {TextColor3 = theme.text})
            if desc then
                tween(desc, {TextColor3 = theme.textDim})
            end
        else
            tween(buttonFrame, {BackgroundColor3 = Color3.fromRGB(18, 18, 24)})
            tween(title, {TextColor3 = theme.textMuted})
            if desc then
                tween(desc, {TextColor3 = theme.textMuted})
            end
        end
    end

    function api:Destroy()
        buttonFrame:Destroy()
    end

    return api
end

function ComponentBuilders.Toggle(section, config)
    config = config or {}
    local callback = config.Callback or function(_) end
    local state = config.Default == nil and false or config.Default

    local holder = create("Frame", {
        Name = "Toggle",
        Parent = section.Container,
        Size = UDim2.new(1, 0, 0, config.Desc and 66 or 42),
        BackgroundColor3 = theme.panelAlt,
    })

    makeCorner(holder)
    makeStroke(holder)

    local padding = create("UIPadding", {
        Parent = holder,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = holder,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local titleWrapper = create("Frame", {
        Parent = holder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
    })

    local titleLayout = create("UIListLayout", {
        Parent = titleWrapper,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })

    local title = create("TextLabel", {
        Parent = titleWrapper,
        Name = "Title",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -60, 1, 0),
        Font = fonts.Title,
        Text = config.Title or "Toggle",
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local switch = create("TextButton", {
        Parent = titleWrapper,
        Name = "Switch",
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(42, 45, 55),
        Size = UDim2.new(0, 48, 0, 22),
        Text = "",
        LayoutOrder = 99,
    })

    makeCorner(switch, UDim.new(0, 22))

    local knob = create("Frame", {
        Parent = switch,
        Name = "Knob",
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0, 2, 0.5, -9),
        BackgroundColor3 = theme.text,
    })

    makeCorner(knob, UDim.new(1, 0))

    local desc
    if config.Desc then
        desc = create("TextLabel", {
            Parent = holder,
            Name = "Description",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 16),
            Font = fonts.Body,
            Text = config.Desc,
            TextColor3 = theme.textDim,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end

    local function setState(value, runCallback)
        state = value
        if state then
            tween(switch, {BackgroundColor3 = theme.highlight})
            tween(knob, {Position = UDim2.new(1, -20, 0.5, -9)})
        else
            tween(switch, {BackgroundColor3 = Color3.fromRGB(42, 45, 55)})
            tween(knob, {Position = UDim2.new(0, 2, 0.5, -9)})
        end

        if runCallback ~= false then
            task.spawn(callback, state)
        end
    end

    switch.MouseButton1Click:Connect(function()
        setState(not state)
    end)

    holder.MouseEnter:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panel})
    end)

    holder.MouseLeave:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panelAlt})
    end)

    setState(state, false)

    local api = {}

    function api:Set(value)
        setState(value)
    end

    function api:SetTitle(text)
        title.Text = text
    end

    function api:SetDescription(text)
        if not desc and text then
            desc = create("TextLabel", {
                Parent = holder,
                Name = "Description",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Font = fonts.Body,
                TextColor3 = theme.textDim,
                TextSize = 14,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end

        if desc then
            desc.Text = text or ""
            desc.Visible = text ~= nil and text ~= ""
            holder.Size = UDim2.new(1, 0, 0, desc.Visible and 66 or 42)
        end
    end

    function api:Destroy()
        holder:Destroy()
    end

    return api
end

function ComponentBuilders.Slider(section, config)
    config = config or {}
    local callback = config.Callback or function(_) end

    local min = config.Min or 0
    local max = config.Max or 100
    local step = config.Step or 1
    local precision = config.Precision
    local value = math.clamp(config.Default or min, min, max)

    local holder = create("Frame", {
        Name = "Slider",
        Parent = section.Container,
        Size = UDim2.new(1, 0, 0, (config.Desc and 74 or 60)),
        BackgroundColor3 = theme.panelAlt,
    })

    makeCorner(holder)
    makeStroke(holder)

    local padding = create("UIPadding", {
        Parent = holder,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = holder,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local header = create("Frame", {
        Parent = holder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 20),
    })

    local headerLayout = create("UIListLayout", {
        Parent = header,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })

    local title = create("TextLabel", {
        Parent = header,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -70, 1, 0),
        Font = fonts.Title,
        Text = config.Title or "Slider",
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local valueLabel = create("TextLabel", {
        Parent = header,
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 60, 1, 0),
        Font = fonts.Body,
        Text = formatValue(value, precision),
        TextColor3 = theme.textDim,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        LayoutOrder = 99,
    })

    local desc
    if config.Desc then
        desc = create("TextLabel", {
            Parent = holder,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 16),
            Font = fonts.Body,
            Text = config.Desc,
            TextColor3 = theme.textDim,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end

    local sliderTrack = create("Frame", {
        Parent = holder,
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
    })

    local track = create("Frame", {
        Parent = sliderTrack,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 6),
        BackgroundColor3 = Color3.fromRGB(42, 45, 55),
    })

    makeCorner(track, UDim.new(0, 3))

    local fill = create("Frame", {
        Parent = track,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = theme.highlight,
    })

    makeCorner(fill, UDim.new(0, 3))

    local knob = create("Frame", {
        Parent = fill,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(1, 0, 0.5, 0),
        BackgroundColor3 = theme.text,
    })

    makeCorner(knob, UDim.new(1, 0))

    local dragging = false

    local function setValue(newValue, runCallback)
        newValue = math.clamp(newValue, min, max)
        newValue = math.round(newValue / step) * step
        value = newValue

        local percent = (value - min) / (max - min)
        tween(fill, {Size = UDim2.new(percent, 0, 1, 0)})
        valueLabel.Text = formatValue(value, precision)

        if runCallback ~= false then
            task.spawn(callback, value)
        end
    end

    local function updateFromInput(xPos, runCallback)
        local rel = math.clamp((xPos - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        setValue(min + (max - min) * rel, runCallback)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromInput(input.Position.X, true)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    track.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X, true)
        end
    end)

    holder.MouseEnter:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panel})
    end)

    holder.MouseLeave:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panelAlt})
    end)

    setValue(value, false)

    local api = {}

    function api:Set(newValue)
        setValue(newValue)
    end

    function api:SetTitle(text)
        title.Text = text
    end

    function api:SetDescription(text)
        if not desc and text then
            desc = create("TextLabel", {
                Parent = holder,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Font = fonts.Body,
                TextColor3 = theme.textDim,
                TextSize = 14,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end

        if desc then
            desc.Text = text or ""
            desc.Visible = text ~= nil and text ~= ""
            holder.Size = UDim2.new(1, 0, 0, desc.Visible and 74 or 60)
        end
    end

    function api:Destroy()
        holder:Destroy()
    end

    return api
end

function ComponentBuilders.TextBox(section, config)
    config = config or {}
    local callback = config.Callback or function(_) end

    local holder = create("Frame", {
        Parent = section.Container,
        BackgroundColor3 = theme.panelAlt,
        Size = UDim2.new(1, 0, 0, (config.Desc and 76 or 58)),
    })

    makeCorner(holder)
    makeStroke(holder)

    local padding = create("UIPadding", {
        Parent = holder,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = holder,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local title = create("TextLabel", {
        Parent = holder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
        Font = fonts.Title,
        Text = config.Title or "Input",
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local desc
    if config.Desc then
        desc = create("TextLabel", {
            Parent = holder,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 16),
            Font = fonts.Body,
            Text = config.Desc,
            TextColor3 = theme.textDim,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end

    local boxHolder = create("Frame", {
        Parent = holder,
        BackgroundColor3 = theme.panel,
        Size = UDim2.new(1, 0, 0, 28),
    })

    makeCorner(boxHolder, UDim.new(0, 6))
    makeStroke(boxHolder)

    local textBox = create("TextBox", {
        Parent = boxHolder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -12, 1, 0),
        Position = UDim2.new(0, 6, 0, 0),
        Font = fonts.Body,
        PlaceholderText = config.Placeholder or "Type here...",
        Text = config.Default or "",
        TextColor3 = theme.text,
        TextSize = 14,
        ClearTextOnFocus = config.ClearOnFocus or false,
        TextWrapped = false,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    textBox.FocusLost:Connect(function(enterPressed)
        callback(textBox.Text, enterPressed)
    end)

    holder.MouseEnter:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panel})
    end)

    holder.MouseLeave:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panelAlt})
    end)

    local api = {}

    function api:Set(text)
        textBox.Text = text
    end

    function api:SetTitle(text)
        title.Text = text
    end

    function api:SetDescription(text)
        if not desc and text then
            desc = create("TextLabel", {
                Parent = holder,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Font = fonts.Body,
                TextColor3 = theme.textDim,
                TextSize = 14,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end

        if desc then
            desc.Text = text or ""
            desc.Visible = text ~= nil and text ~= ""
            holder.Size = UDim2.new(1, 0, 0, desc.Visible and 76 or 58)
        end
    end

    function api:Destroy()
        holder:Destroy()
    end

    return api
end

function ComponentBuilders.Dropdown(section, config)
    config = config or {}
    local callback = config.Callback or function(_) end
    local multi = config.Multi or false

    local values = {}
    for _, option in pairs(config.Values or {}) do
        values[#values + 1] = tostring(option)
    end

    local currentValue
    if multi then
        currentValue = {}
        if typeof(config.Default) == "table" then
            for _, option in ipairs(config.Default) do
                currentValue[#currentValue + 1] = tostring(option)
            end
        end
    else
        currentValue = config.Default and tostring(config.Default) or ""
    end

    local holder = create("Frame", {
        Parent = section.Container,
        BackgroundColor3 = theme.panelAlt,
        Size = UDim2.new(1, 0, 0, 58),
    })

    makeCorner(holder)
    makeStroke(holder)

    local padding = create("UIPadding", {
        Parent = holder,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = holder,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local title = create("TextLabel", {
        Parent = holder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
        Font = fonts.Title,
        Text = config.Title or "Dropdown",
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local button = create("TextButton", {
        Parent = holder,
        AutoButtonColor = false,
        BackgroundColor3 = theme.panel,
        Size = UDim2.new(1, 0, 0, 26),
        Text = "",
    })

    makeCorner(button, UDim.new(0, 6))
    makeStroke(button)

    local buttonLayout = create("UIListLayout", {
        Parent = button,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 8),
    })

    local selectedLabel = create("TextLabel", {
        Parent = button,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -24, 1, 0),
        Font = fonts.Body,
        Text = multi and formatValue(currentValue) or currentValue,
        TextColor3 = theme.textDim,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local chevron = create("ImageLabel", {
        Parent = button,
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 14, 0, 14),
        Image = "rbxassetid://7072718361",
        ImageColor3 = theme.textDim,
        LayoutOrder = 99,
    })

    local listFrame = create("Frame", {
        Parent = holder,
        BackgroundColor3 = theme.panelAlt,
        Size = UDim2.new(1, 0, 0, 0),
        ClipsDescendants = true,
        Visible = false,
    })

    makeCorner(listFrame, UDim.new(0, 6))
    makeStroke(listFrame)

    local listPadding = create("UIPadding", {
        Parent = listFrame,
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
    })

    local listLayout = create("UIListLayout", {
        Parent = listFrame,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local function refreshButtonText()
        if multi then
            selectedLabel.Text = (#currentValue > 0) and formatValue(currentValue) or (config.Placeholder or "Select value(s)")
        else
            selectedLabel.Text = currentValue ~= "" and currentValue or (config.Placeholder or "Select a value")
        end
    end

    local function fireCallback()
        if multi then
            local copy = table.create(#currentValue)
            for i, v in ipairs(currentValue) do
                copy[i] = v
            end
            task.spawn(callback, copy)
        else
            task.spawn(callback, currentValue)
        end
    end

    local function isSelected(option)
        if multi then
            for _, v in ipairs(currentValue) do
                if v == option then
                    return true
                end
            end
            return false
        else
            return currentValue == option
        end
    end

    local function toggleOption(option)
        if multi then
            for i, v in ipairs(currentValue) do
                if v == option then
                    table.remove(currentValue, i)
                    return
                end
            end
            currentValue[#currentValue + 1] = option
        else
            currentValue = option
        end
    end

    local function recreateOptionList()
        listFrame.Visible = false
        listFrame.Size = UDim2.new(1, 0, 0, 0)
        for _, child in ipairs(listFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        for _, option in ipairs(values) do
            local optionButton = create("TextButton", {
                Parent = listFrame,
                AutoButtonColor = false,
                BackgroundColor3 = isSelected(option) and theme.highlight or theme.panel,
                Size = UDim2.new(1, 0, 0, 28),
                TextColor3 = theme.text,
                Text = option,
                Font = fonts.Body,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            makeCorner(optionButton, UDim.new(0, 6))

            optionButton.MouseEnter:Connect(function()
                if not isSelected(option) then
                    tween(optionButton, {BackgroundColor3 = theme.panelAlt})
                end
            end)

            optionButton.MouseLeave:Connect(function()
                if not isSelected(option) then
                    tween(optionButton, {BackgroundColor3 = theme.panel})
                end
            end)

            optionButton.MouseButton1Click:Connect(function()
                toggleOption(option)
                recreateOptionList()
                refreshButtonText()
                if not multi then
                    listFrame.Visible = false
                    tween(listFrame, {Size = UDim2.new(1, 0, 0, 0)})
                    tween(chevron, {Rotation = 0})
                end
                fireCallback()
            end)

            if multi and isSelected(option) then
                tween(optionButton, {BackgroundColor3 = theme.highlight})
            end
        end
    end

    local open = false

    button.MouseButton1Click:Connect(function()
        open = not open
        if open then
            listFrame.Visible = true
            local desiredHeight = math.max(0, (#values * 34) + 12)
            tween(listFrame, {Size = UDim2.new(1, 0, 0, desiredHeight)})
            tween(chevron, {Rotation = 180})
        else
            tween(listFrame, {Size = UDim2.new(1, 0, 0, 0)}).Completed:Connect(function()
                listFrame.Visible = false
            end)
            tween(chevron, {Rotation = 0})
        end
    end)

    holder.MouseEnter:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panel})
    end)

    holder.MouseLeave:Connect(function()
        tween(holder, {BackgroundColor3 = theme.panelAlt})
    end)

    recreateOptionList()
    refreshButtonText()

    local api = {}

    function api:Set(valuesTable)
        values = {}
        for _, option in pairs(valuesTable or {}) do
            values[#values + 1] = tostring(option)
        end

        if multi then
            currentValue = {}
        else
            currentValue = ""
        end

        recreateOptionList()
        refreshButtonText()
    end

    function api:Select(valueTableOrString)
        if multi then
            currentValue = {}
            for _, option in ipairs(valueTableOrString or {}) do
                currentValue[#currentValue + 1] = tostring(option)
            end
        else
            currentValue = valueTableOrString and tostring(valueTableOrString) or ""
        end
        recreateOptionList()
        refreshButtonText()
        fireCallback()
    end

    function api:SetTitle(text)
        title.Text = text
    end

    function api:Destroy()
        holder:Destroy()
    end

    return api
end

local function buildComponent(section, component, config)
    local builder = ComponentBuilders[component]
    assert(builder, string.format("Component '%s' tidak tersedia", tostring(component)))
    return builder(section, config)
end

-- ===================================================================
-- Section, Tab, Window implementations
-- ===================================================================

function Section:AddComponent(componentType: string, config)
    return buildComponent(self, componentType, config)
end

function Section:AddButton(config)
    return self:AddComponent("Button", config)
end

function Section:AddToggle(config)
    return self:AddComponent("Toggle", config)
end

function Section:AddSlider(config)
    return self:AddComponent("Slider", config)
end

function Section:AddInput(config)
    return self:AddComponent("TextBox", config)
end

function Section:AddDropdown(config)
    return self:AddComponent("Dropdown", config)
end

function Section:SetTitle(text)
    self.Title.Text = text
end

function Section:Destroy()
    self.Instance:Destroy()
end

function Tab:CreateSection(config)
    config = config or {}
    local sectionFrame = create("Frame", {
        Parent = self.ScrollingFrame,
        BackgroundColor3 = theme.panel,
        Size = UDim2.new(1, 0, 0, 60),
    })

    makeCorner(sectionFrame)
    makeStroke(sectionFrame)

    local padding = create("UIPadding", {
        Parent = sectionFrame,
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
        PaddingTop = UDim.new(0, 16),
        PaddingBottom = UDim.new(0, 16),
    })

    local layout = create("UIListLayout", {
        Parent = sectionFrame,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
    })

    local title = create("TextLabel", {
        Parent = sectionFrame,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 22),
        Font = fonts.Title,
        Text = config.Title or "Section",
        TextColor3 = theme.text,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local separator = create("Frame", {
        Parent = sectionFrame,
        BackgroundColor3 = theme.stroke,
        Size = UDim2.new(1, 0, 0, 1),
    })

    local container = create("Frame", {
        Parent = sectionFrame,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 10),
    })

    local containerLayout = create("UIListLayout", {
        Parent = container,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    })

    local api = setmetatable({
        Instance = sectionFrame,
        Container = container,
        Title = title,
        ParentTab = self,
    }, Section)

    return api
end

function Tab:Show()
    self.ParentWindow.PageLayout:JumpTo(self.Page)
    self.ParentWindow.CurrentTab = self
    self.ParentWindow:UpdateTabButtons()
end

function Tab:Destroy()
    if self.Button then
        self.Button:Destroy()
    end
    if self.Page then
        self.Page:Destroy()
    end
end

function Window:UpdateTabButtons()
    for _, tab in ipairs(self.Tabs) do
        local isActive = (tab == self.CurrentTab)
        local target = isActive and theme.highlight or theme.panelAlt
        tween(tab.ButtonBackground, {BackgroundColor3 = target})
        tween(tab.ButtonLabel, {TextColor3 = isActive and theme.text or theme.textDim})
    end
end

function Window:CreateTab(config)
    config = config or {}
    local tabName = config.Title or ("Tab " .. tostring(#self.Tabs + 1))

    local buttonHolder = create("TextButton", {
        Parent = self.TabList,
        BackgroundColor3 = theme.panelAlt,
        Size = UDim2.new(1, 0, 0, 36),
        AutoButtonColor = false,
        Text = "",
    })

    makeCorner(buttonHolder, UDim.new(0, 6))

    local buttonLabel = create("TextLabel", {
        Parent = buttonHolder,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        Font = fonts.Body,
        Text = tabName,
        TextColor3 = theme.textDim,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local page = create("Frame", {
        Parent = self.Pages,
        BackgroundTransparency = 1,
        LayoutOrder = #self.Tabs + 1,
    })

    local scrollFrame = create("ScrollingFrame", {
        Parent = page,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 4,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    })

    local layout = create("UIListLayout", {
        Parent = scrollFrame,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 18),
    })

    local tabObject = setmetatable({
        ParentWindow = self,
        Title = tabName,
        Button = buttonHolder,
        ButtonLabel = buttonLabel,
        ButtonBackground = buttonHolder,
        Page = page,
        ScrollingFrame = scrollFrame,
    }, Tab)

    buttonHolder.MouseEnter:Connect(function()
        if tabObject ~= self.CurrentTab then
            tween(buttonHolder, {BackgroundColor3 = theme.panel})
        end
    end)

    buttonHolder.MouseLeave:Connect(function()
        if tabObject ~= self.CurrentTab then
            tween(buttonHolder, {BackgroundColor3 = theme.panelAlt})
        end
    end)

    buttonHolder.MouseButton1Click:Connect(function()
        tabObject:Show()
    end)

    self.Tabs[#self.Tabs + 1] = tabObject

    if not self.CurrentTab then
        tabObject:Show()
    else
        self:UpdateTabButtons()
    end

    return tabObject
end

function Window:SetToggleKey(keyCodeOrName)
    if typeof(keyCodeOrName) == "EnumItem" then
        self.ToggleKey = keyCodeOrName
    elseif typeof(keyCodeOrName) == "string" then
        self.ToggleKey = Enum.KeyCode[keyCodeOrName] or self.ToggleKey
    end
end

function Window:Toggle(forceState)
    if typeof(forceState) == "boolean" then
        self.Visible = forceState
    else
        self.Visible = not self.Visible
    end

    if self.Visible then
        self.MainFrame.Visible = true
        tween(self.MainFrame, {Position = self.WindowPositionVisible, BackgroundTransparency = 0})
        tween(self.MainFrame, {BackgroundTransparency = 0}, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
    else
        local tw = tween(self.MainFrame, {Position = self.WindowPositionHidden}, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In))
        tw.Completed:Connect(function()
            if not self.Visible then
                self.MainFrame.Visible = false
            end
        end)
    end
end

function Window:Notify(config)
    config = config or {}
    local title = config.Title or "Notification"
    local message = config.Text or ""
    local duration = config.Duration or 4

    local container = create("Frame", {
        Parent = self.NotificationStack,
        BackgroundColor3 = theme.panelAlt,
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 0.1,
    })

    makeCorner(container, UDim.new(0, 8))
    makeStroke(container)

    local padding = create("UIPadding", {
        Parent = container,
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
    })

    local layout = create("UIListLayout", {
        Parent = container,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    local titleLabel = create("TextLabel", {
        Parent = container,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
        Font = fonts.Title,
        Text = title,
        TextColor3 = theme.text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local messageLabel = create("TextLabel", {
        Parent = container,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 18),
        Font = fonts.Body,
        Text = message,
        TextColor3 = theme.textDim,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    container.Size = UDim2.new(1, 0, 0, message ~= "" and 60 or 40)
    container.Position = UDim2.new(1, 200, 0, 0)
    tween(container, {Position = UDim2.new(0, 0, 0, 0)}, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out))

    task.delay(duration, function()
        tween(container, {Position = UDim2.new(1, 200, 0, 0)}, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)).Completed:Connect(function()
            container:Destroy()
        end)
    end)

    local api = {}

    function api:Close()
        if container and container.Parent then
            tween(container, {Position = UDim2.new(1, 200, 0, 0)}, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)).Completed:Connect(function()
                container:Destroy()
            end)
        end
    end

    return api
end

function Window:Dialog(config)
    config = config or {}
    local title = config.Title or "Dialog"
    local message = config.Text or ""
    local buttons = config.Buttons or {
        {Text = "OK", Style = "Primary", Callback = function() end},
    }

    self.DialogOverlay.Visible = true
    self.DialogOverlay.BackgroundTransparency = 1
    tween(self.DialogOverlay, {BackgroundTransparency = 0.35})

    local dialog = create("Frame", {
        Parent = self.DialogOverlay,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 320, 0, 140),
        BackgroundColor3 = theme.windowBackground,
        BackgroundTransparency = 0.05,
    })

    makeCorner(dialog, UDim.new(0, 10))
    makeStroke(dialog)

    makeShadow(dialog)

    local padding = create("UIPadding", {
        Parent = dialog,
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        PaddingTop = UDim.new(0, 16),
        PaddingBottom = UDim.new(0, 16),
    })

    local layout = create("UIListLayout", {
        Parent = dialog,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
    })

    local titleLabel = create("TextLabel", {
        Parent = dialog,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 20),
        Font = fonts.Title,
        Text = title,
        TextColor3 = theme.text,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local messageLabel = create("TextLabel", {
        Parent = dialog,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 42),
        Font = fonts.Body,
        Text = message,
        TextColor3 = theme.textDim,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    })

    local buttonRow = create("Frame", {
        Parent = dialog,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 32),
    })

    local buttonLayout = create("UIListLayout", {
        Parent = buttonRow,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })

    local callbacks = {}

    local function closeDialog()
        tween(dialog, {BackgroundTransparency = 1}, TweenInfo.new(0.2))
        tween(dialog, {Size = UDim2.new(0, 320, 0, 0)}, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)).Completed:Connect(function()
            dialog:Destroy()
        end)

        tween(self.DialogOverlay, {BackgroundTransparency = 1}, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)).Completed:Connect(function()
            self.DialogOverlay.Visible = false
        end)
    end

    for index, buttonConfig in ipairs(buttons) do
        local btn = create("TextButton", {
            Parent = buttonRow,
            BackgroundColor3 = buttonConfig.Style == "Danger" and theme.danger or (buttonConfig.Style == "Primary" and theme.highlight or theme.panel),
            Size = UDim2.new(0, 100, 1, 0),
            Text = buttonConfig.Text or ("Button " .. index),
            TextColor3 = theme.text,
            Font = fonts.Body,
            TextSize = 14,
            AutoButtonColor = false,
        })

        makeCorner(btn, UDim.new(0, 6))
        makeStroke(btn, theme.stroke, 1)

        btn.MouseButton1Click:Connect(function()
            closeDialog()
            if typeof(buttonConfig.Callback) == "function" then
                task.spawn(buttonConfig.Callback)
            end
        end)

        btn.MouseEnter:Connect(function()
            tween(btn, {BackgroundColor3 = (buttonConfig.Style == "Danger" and theme.danger) or theme.highlight})
        end)

        btn.MouseLeave:Connect(function()
            tween(btn, {BackgroundColor3 = buttonConfig.Style == "Danger" and theme.danger or (buttonConfig.Style == "Primary" and theme.highlight or theme.panel)}, TweenInfo.new(0.2))
        end)

        callbacks[index] = function()
            closeDialog()
            if typeof(buttonConfig.Callback) == "function" then
                task.spawn(buttonConfig.Callback)
            end
        end
    end

    tween(dialog, {Size = UDim2.new(0, 320, 0, 140), BackgroundTransparency = 0.05})
    tween(dialog, {BackgroundTransparency = 0.05})

    return {
        Close = closeDialog,
        Buttons = callbacks,
    }
end

function Window:Destroy()
    if self.Gui then
        self.Gui:Destroy()
    end
end

-- ===================================================================
-- Library entry
-- ===================================================================

local Library = {}

function Library:CreateWindow(config)
    config = config or {}
    local windowTitle = config.Title or "Noctis"
    local windowVersion = config.Subtitle or config.Version or ""
    local toggleKey = config.ToggleKey or Enum.KeyCode.RightShift

    local gui = create("ScreenGui", {
        Name = config.Name or "NoctisUI",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
    })

    attachToParent(gui)

    local mainFrame = create("Frame", {
        Parent = gui,
        Size = UDim2.new(0, 620, 0, 380),
        Position = UDim2.new(0.5, -310, 0.5, -190),
        BackgroundColor3 = theme.windowBackground,
        BackgroundTransparency = 0.05,
        ZIndex = 10,
    })

    makeCorner(mainFrame, UDim.new(0, 12))
    makeStroke(mainFrame, theme.stroke, 2)
    makeShadow(mainFrame)

    local topBar = create("Frame", {
        Parent = mainFrame,
        BackgroundColor3 = theme.panel,
        Size = UDim2.new(1, -24, 0, 44),
        Position = UDim2.new(0, 12, 0, 12),
    })

    makeCorner(topBar, UDim.new(0, 10))
    makeStroke(topBar)

    local topBarPadding = create("UIPadding", {
        Parent = topBar,
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        PaddingTop = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
    })

    local topBarLayout = create("UIListLayout", {
        Parent = topBar,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 10),
    })

    local titleLabel = create("TextLabel", {
        Parent = topBar,
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 300, 1, 0),
        Font = fonts.Title,
        Text = windowTitle .. (windowVersion ~= "" and ("  •  " .. windowVersion) or ""),
        TextColor3 = theme.text,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local toggleHint = create("TextLabel", {
        Parent = topBar,
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 140, 1, 0),
        Font = fonts.Body,
        Text = string.format("[Toggle: %s]", toggleKey.Name or "RightShift"),
        TextColor3 = theme.textDim,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        LayoutOrder = 98,
    })

    local closeButton = create("TextButton", {
        Parent = topBar,
        BackgroundColor3 = theme.danger,
        Size = UDim2.new(0, 32, 0, 28),
        Text = "✕",
        Font = fonts.Body,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 16,
        AutoButtonColor = false,
        LayoutOrder = 99,
    })

    makeCorner(closeButton, UDim.new(0, 6))

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    closeButton.MouseEnter:Connect(function()
        tween(closeButton, {BackgroundColor3 = Color3.fromRGB(232, 99, 99)})
    end)

    closeButton.MouseLeave:Connect(function()
        tween(closeButton, {BackgroundColor3 = theme.danger})
    end)

    local tabList = create("ScrollingFrame", {
        Parent = mainFrame,
        BackgroundColor3 = theme.panel,
        Position = UDim2.new(0, 16, 0, 68),
        Size = UDim2.new(0, 180, 1, -88),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 4,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    })

    makeCorner(tabList, UDim.new(0, 10))
    makeStroke(tabList)

    local tabListPadding = create("UIPadding", {
        Parent = tabList,
        PaddingTop = UDim.new(0, 12),
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
    })

    local tabListLayout = create("UIListLayout", {
        Parent = tabList,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
    })

    local pagesBackground = create("Frame", {
        Parent = mainFrame,
        BackgroundColor3 = theme.panel,
        Position = UDim2.new(0, 210, 0, 68),
        Size = UDim2.new(1, -226, 1, -88),
        ClipsDescendants = true,
    })

    makeCorner(pagesBackground, UDim.new(0, 12))
    makeStroke(pagesBackground)

    local pagesPadding = create("UIPadding", {
        Parent = pagesBackground,
        PaddingLeft = UDim.new(0, 18),
        PaddingRight = UDim.new(0, 18),
        PaddingTop = UDim.new(0, 18),
        PaddingBottom = UDim.new(0, 18),
    })

    local pages = create("Frame", {
        Parent = pagesBackground,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
    })

    local pageLayout = create("UIPageLayout", {
        Parent = pages,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        TweenTime = 0.2,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
    })

    local notificationStack = create("Frame", {
        Parent = mainFrame,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, 12),
        Size = UDim2.new(0, 260, 0, 0),
        BackgroundTransparency = 1,
    })

    local notificationLayout = create("UIListLayout", {
        Parent = notificationStack,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    })

    local dialogOverlay = create("Frame", {
        Parent = mainFrame,
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Visible = false,
        ZIndex = 20,
    })

    local windowObject = setmetatable({
        Gui = gui,
        MainFrame = mainFrame,
        TabList = tabList,
        Pages = pages,
        PageLayout = pageLayout,
        Tabs = {},
        CurrentTab = nil,
        NotificationStack = notificationStack,
        DialogOverlay = dialogOverlay,
        ToggleKey = toggleKey,
        Visible = true,
        WindowPositionVisible = mainFrame.Position,
        WindowPositionHidden = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, mainFrame.Position.Y.Scale, -400),
    }, Window)

    dragify(mainFrame, topBar)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and windowObject.ToggleKey and input.KeyCode == windowObject.ToggleKey then
            windowObject:Toggle()
        end
    end)

    windowObject:UpdateTabButtons()

    return windowObject
end

return setmetatable(Library, {
    __call = function(_, ...)
        return Library:CreateWindow(...)
    end,
})
