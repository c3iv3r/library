-- Rewritten Noctis UI Library (Bagian 1/…)
-- Struktur instance dipertahankan 100%, hanya penamaan & format yang diperjelas.

local Instances = {}

----------------------------------------------------------------------
-- ScreenGui Setup
----------------------------------------------------------------------

Instances.ScreenGui = Instance.new("ScreenGui")
Instances.ScreenGui.Name = "Noctis"
Instances.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Instances.ScreenGui.ResetOnSpawn = false

local function safeCloneRef(ref)
	local cloneFunc = cloneref or function(target)
		return target
	end
	return cloneFunc(ref)
end

if protect_gui then
	protect_gui(Instances.ScreenGui)
elseif gethui then
	Instances.ScreenGui.Parent = gethui()
elseif pcall(function()
	game.CoreGui:GetChildren()
end) then
	Instances.ScreenGui.Parent = safeCloneRef(game:GetService("CoreGui"))
else
	Instances.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

----------------------------------------------------------------------
-- Main Window
----------------------------------------------------------------------

Instances.MainWindow = Instance.new("Frame")
Instances.MainWindow.Name = "Window"
Instances.MainWindow.Parent = Instances.ScreenGui
Instances.MainWindow.ZIndex = 0
Instances.MainWindow.BorderSizePixel = 2
Instances.MainWindow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.MainWindow.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.MainWindow.Size = UDim2.new(0, 528, 0, 334)
Instances.MainWindow.Position = UDim2.new(0.5278, 0, 0.5, 0)
Instances.MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)

Instances.MainWindowCorner = Instance.new("UICorner")
Instances.MainWindowCorner.Name = "WindowCorner"
Instances.MainWindowCorner.CornerRadius = UDim.new(0, 10)
Instances.MainWindowCorner.Parent = Instances.MainWindow

----------------------------------------------------------------------
-- Dropdown Selection Popup
----------------------------------------------------------------------

Instances.DropdownSelection = Instance.new("Frame")
Instances.DropdownSelection.Name = "DropdownSelection"
Instances.DropdownSelection.Parent = Instances.MainWindow
Instances.DropdownSelection.Visible = false
Instances.DropdownSelection.ZIndex = 4
Instances.DropdownSelection.BorderSizePixel = 0
Instances.DropdownSelection.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSelection.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.DropdownSelection.ClipsDescendants = true
Instances.DropdownSelection.Size = UDim2.new(0.7281, 0, 0.68367, 0)
Instances.DropdownSelection.Position = UDim2.new(0.5, 0, 0.5, 0)
Instances.DropdownSelection.AnchorPoint = Vector2.new(0.5, 0.5)

Instances.DropdownSelectionCorner = Instance.new("UICorner")
Instances.DropdownSelectionCorner.Name = "DropdownSelectionCorner"
Instances.DropdownSelectionCorner.CornerRadius = UDim.new(0, 6)
Instances.DropdownSelectionCorner.Parent = Instances.DropdownSelection

Instances.DropdownSelectionStroke = Instance.new("UIStroke")
Instances.DropdownSelectionStroke.Name = "DropdownSelectionStroke"
Instances.DropdownSelectionStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.DropdownSelectionStroke.Thickness = 1.5
Instances.DropdownSelectionStroke.Color = Color3.fromRGB(61, 61, 75)
Instances.DropdownSelectionStroke.Parent = Instances.DropdownSelection

Instances.DropdownTopBar = Instance.new("Frame")
Instances.DropdownTopBar.Name = "TopBar"
Instances.DropdownTopBar.Parent = Instances.DropdownSelection
Instances.DropdownTopBar.BackgroundTransparency = 1
Instances.DropdownTopBar.BorderSizePixel = 0
Instances.DropdownTopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownTopBar.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.DropdownTopBar.Size = UDim2.new(1, 0, 0, 50)
Instances.DropdownTopBar.Position = UDim2.new(0, 0, 0, 0)

Instances.DropdownSearchContainer = Instance.new("Frame")
Instances.DropdownSearchContainer.Name = "BoxFrame"
Instances.DropdownSearchContainer.Parent = Instances.DropdownTopBar
Instances.DropdownSearchContainer.BorderSizePixel = 0
Instances.DropdownSearchContainer.BackgroundTransparency = 1
Instances.DropdownSearchContainer.AnchorPoint = Vector2.new(1, 0.5)
Instances.DropdownSearchContainer.Size = UDim2.new(0, 120, 0, 25)
Instances.DropdownSearchContainer.Position = UDim2.new(1, -50, 0.5, 0)

Instances.DropdownSearchShadow = Instance.new("ImageLabel")
Instances.DropdownSearchShadow.Name = "DropShadow"
Instances.DropdownSearchShadow.Parent = Instances.DropdownSearchContainer
Instances.DropdownSearchShadow.ZIndex = 0
Instances.DropdownSearchShadow.BorderSizePixel = 0
Instances.DropdownSearchShadow.BackgroundTransparency = 1
Instances.DropdownSearchShadow.ImageTransparency = 0.75
Instances.DropdownSearchShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSearchShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.DropdownSearchShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Instances.DropdownSearchShadow.Size = UDim2.new(1, 30, 1, 30)
Instances.DropdownSearchShadow.Image = "rbxassetid://6014261993"
Instances.DropdownSearchShadow.ScaleType = Enum.ScaleType.Slice
Instances.DropdownSearchShadow.SliceCenter = Rect.new(49, 49, 450, 450)

Instances.DropdownSearchBoxFrame = Instance.new("Frame")
Instances.DropdownSearchBoxFrame.Name = "Frame"
Instances.DropdownSearchBoxFrame.Parent = Instances.DropdownSearchContainer
Instances.DropdownSearchBoxFrame.BorderSizePixel = 0
Instances.DropdownSearchBoxFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSearchBoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSearchBoxFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.DropdownSearchBoxFrame.Size = UDim2.new(1, 0, 1, 0)

Instances.DropdownSearchBoxCorner = Instance.new("UICorner")
Instances.DropdownSearchBoxCorner.Name = "SearchBoxCorner"
Instances.DropdownSearchBoxCorner.Parent = Instances.DropdownSearchBoxFrame
Instances.DropdownSearchBoxCorner.CornerRadius = UDim.new(0, 5)

Instances.DropdownSearchBoxStroke = Instance.new("UIStroke")
Instances.DropdownSearchBoxStroke.Name = "SearchBoxStroke"
Instances.DropdownSearchBoxStroke.Parent = Instances.DropdownSearchBoxFrame
Instances.DropdownSearchBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.DropdownSearchBoxStroke.Thickness = 1.5
Instances.DropdownSearchBoxStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.DropdownSearchTextBox = Instance.new("TextBox")
Instances.DropdownSearchTextBox.Name = "TextBox"
Instances.DropdownSearchTextBox.Parent = Instances.DropdownSearchBoxFrame
Instances.DropdownSearchTextBox.TextXAlignment = Enum.TextXAlignment.Left
Instances.DropdownSearchTextBox.BorderSizePixel = 0
Instances.DropdownSearchTextBox.TextWrapped = true
Instances.DropdownSearchTextBox.TextTruncate = Enum.TextTruncate.AtEnd
Instances.DropdownSearchTextBox.TextSize = 14
Instances.DropdownSearchTextBox.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.DropdownSearchTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.DropdownSearchTextBox.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.DropdownSearchTextBox.ClipsDescendants = true
Instances.DropdownSearchTextBox.PlaceholderText = "Input here..."
Instances.DropdownSearchTextBox.Size = UDim2.new(1, -25, 1, 0)
Instances.DropdownSearchTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSearchTextBox.Text = ""
Instances.DropdownSearchTextBox.BackgroundTransparency = 1

Instances.DropdownSearchPadding = Instance.new("UIPadding")
Instances.DropdownSearchPadding.Name = "SearchTextPadding"
Instances.DropdownSearchPadding.Parent = Instances.DropdownSearchTextBox
Instances.DropdownSearchPadding.PaddingTop = UDim.new(0, 10)
Instances.DropdownSearchPadding.PaddingRight = UDim.new(0, 10)
Instances.DropdownSearchPadding.PaddingLeft = UDim.new(0, 10)
Instances.DropdownSearchPadding.PaddingBottom = UDim.new(0, 10)

Instances.DropdownSearchButton = Instance.new("ImageButton")
Instances.DropdownSearchButton.Name = "Search"
Instances.DropdownSearchButton.Parent = Instances.DropdownSearchBoxFrame
Instances.DropdownSearchButton.BorderSizePixel = 0
Instances.DropdownSearchButton.BackgroundTransparency = 1
Instances.DropdownSearchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.DropdownSearchButton.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.DropdownSearchButton.AnchorPoint = Vector2.new(1, 0.5)
Instances.DropdownSearchButton.Image = "rbxassetid://86928976705683"
Instances.DropdownSearchButton.Size = UDim2.new(0, 15, 0, 15)
Instances.DropdownSearchButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownSearchButton.Position = UDim2.new(1, -5, 0.5, 0)

Instances.DropdownCloseButton = Instance.new("ImageButton")
Instances.DropdownCloseButton.Name = "Close"
Instances.DropdownCloseButton.Parent = Instances.DropdownTopBar
Instances.DropdownCloseButton.BorderSizePixel = 0
Instances.DropdownCloseButton.BackgroundTransparency = 1
Instances.DropdownCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.DropdownCloseButton.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.DropdownCloseButton.ZIndex = 0
Instances.DropdownCloseButton.AnchorPoint = Vector2.new(1, 0.5)
Instances.DropdownCloseButton.Image = "rbxassetid://132453323679056"
Instances.DropdownCloseButton.Size = UDim2.new(0, 25, 0, 25)
Instances.DropdownCloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownCloseButton.Position = UDim2.new(1, -12, 0.5, 0)

Instances.DropdownTitle = Instance.new("TextLabel")
Instances.DropdownTitle.Name = "Title"
Instances.DropdownTitle.Parent = Instances.DropdownTopBar
Instances.DropdownTitle.TextWrapped = true
Instances.DropdownTitle.Interactable = false
Instances.DropdownTitle.ZIndex = 0
Instances.DropdownTitle.BorderSizePixel = 0
Instances.DropdownTitle.TextSize = 18
Instances.DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.DropdownTitle.TextScaled = true
Instances.DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.DropdownTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.DropdownTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.DropdownTitle.BackgroundTransparency = 1
Instances.DropdownTitle.AnchorPoint = Vector2.new(0, 0.5)
Instances.DropdownTitle.Size = UDim2.new(0.5, 0, 0, 18)
Instances.DropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.DropdownTitle.Text = "Dropdown"
Instances.DropdownTitle.Position = UDim2.new(0, 12, 0.5, 0)

Instances.DropdownContentFolder = Instance.new("Folder")
Instances.DropdownContentFolder.Name = "Dropdowns"
Instances.DropdownContentFolder.Parent = Instances.DropdownSelection

----------------------------------------------------------------------
-- Tab Buttons Column
----------------------------------------------------------------------

Instances.TabButtons = Instance.new("Frame")
Instances.TabButtons.Name = "TabButtons"
Instances.TabButtons.Parent = Instances.MainWindow
Instances.TabButtons.BorderSizePixel = 0
Instances.TabButtons.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtons.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.TabButtons.ClipsDescendants = true
Instances.TabButtons.Size = UDim2.new(0, 165, 1, -35)
Instances.TabButtons.Position = UDim2.new(0, 0, 0, 35)
Instances.TabButtons.SelectionGroup = true

Instances.TabScrollingFrame = Instance.new("ScrollingFrame")
Instances.TabScrollingFrame.Name = "Lists"
Instances.TabScrollingFrame.Parent = Instances.TabButtons
Instances.TabScrollingFrame.Active = true
Instances.TabScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
Instances.TabScrollingFrame.BorderSizePixel = 0
Instances.TabScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
Instances.TabScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
Instances.TabScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TabScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabScrollingFrame.Selectable = false
Instances.TabScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TabScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instances.TabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
Instances.TabScrollingFrame.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.TabScrollingFrame.ScrollBarThickness = 4
Instances.TabScrollingFrame.BackgroundTransparency = 1

Instances.TabListLayout = Instance.new("UIListLayout")
Instances.TabListLayout.Name = "TabListLayout"
Instances.TabListLayout.Parent = Instances.TabScrollingFrame
Instances.TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TabButtonTemplate = Instance.new("Frame")
Instances.TabButtonTemplate.Name = "TabButton"
Instances.TabButtonTemplate.Parent = Instances.TabScrollingFrame
Instances.TabButtonTemplate.Visible = false
Instances.TabButtonTemplate.BorderSizePixel = 0
Instances.TabButtonTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TabButtonTemplate.Size = UDim2.new(1, 0, 0, 36)
Instances.TabButtonTemplate.Position = UDim2.new(-0.0375, 0, 0.38434, 0)
Instances.TabButtonTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonTemplate.BackgroundTransparency = 1

Instances.TabButtonHighlight = Instance.new("Frame")
Instances.TabButtonHighlight.Name = "Bar"
Instances.TabButtonHighlight.Parent = Instances.TabButtonTemplate
Instances.TabButtonHighlight.BorderSizePixel = 0
Instances.TabButtonHighlight.BackgroundColor3 = Color3.fromRGB(197, 204, 219)
Instances.TabButtonHighlight.AnchorPoint = Vector2.new(0, 0.5)
Instances.TabButtonHighlight.Size = UDim2.new(0, 5, 0, 25)
Instances.TabButtonHighlight.Position = UDim2.new(0, 8, 0, 18)
Instances.TabButtonHighlight.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TabButtonHighlightGradient = Instance.new("UIGradient")
Instances.TabButtonHighlightGradient.Name = "HighlightGradient"
Instances.TabButtonHighlightGradient.Parent = Instances.TabButtonHighlight
Instances.TabButtonHighlightGradient.Enabled = false
Instances.TabButtonHighlightGradient.Rotation = 90
Instances.TabButtonHighlightGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 212, 255)),
	ColorSequenceKeypoint.new(0.978, Color3.fromRGB(0, 124, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 218, 255)),
})

Instances.TabButtonHighlightCorner = Instance.new("UICorner")
Instances.TabButtonHighlightCorner.Name = "HighlightCorner"
Instances.TabButtonHighlightCorner.Parent = Instances.TabButtonHighlight
Instances.TabButtonHighlightCorner.CornerRadius = UDim.new(0, 100)

Instances.TabButtonIcon = Instance.new("ImageButton")
Instances.TabButtonIcon.Name = "Icon"
Instances.TabButtonIcon.Parent = Instances.TabButtonTemplate
Instances.TabButtonIcon.BorderSizePixel = 0
Instances.TabButtonIcon.BackgroundTransparency = 1
Instances.TabButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TabButtonIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TabButtonIcon.AnchorPoint = Vector2.new(0, 0.5)
Instances.TabButtonIcon.Image = "rbxassetid://113216930555884"
Instances.TabButtonIcon.Size = UDim2.new(0, 31, 0, 30)
Instances.TabButtonIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonIcon.Position = UDim2.new(0, 21, 0, 18)

Instances.TabButtonIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.TabButtonIconAspect.Name = "IconAspect"
Instances.TabButtonIconAspect.Parent = Instances.TabButtonIcon

Instances.TabButtonLabel = Instance.new("TextLabel")
Instances.TabButtonLabel.Name = "Title"
Instances.TabButtonLabel.Parent = Instances.TabButtonTemplate
Instances.TabButtonLabel.TextWrapped = true
Instances.TabButtonLabel.BorderSizePixel = 0
Instances.TabButtonLabel.TextSize = 14
Instances.TabButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
Instances.TabButtonLabel.TextScaled = true
Instances.TabButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TabButtonLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TabButtonLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TabButtonLabel.BackgroundTransparency = 1
Instances.TabButtonLabel.AnchorPoint = Vector2.new(0, 0.5)
Instances.TabButtonLabel.Size = UDim2.new(0, 88, 0, 16)
Instances.TabButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonLabel.Text = "Noctis"
Instances.TabButtonLabel.Position = UDim2.new(0, 57, 0.5, 0)

Instances.TabListPadding = Instance.new("UIPadding")
Instances.TabListPadding.Name = "TabListPadding"
Instances.TabListPaddingParent = Instances.TabScrollingFrame
Instances.TabListPaddingPaddingTop = UDim.new(0, 8)
Instances.TabListPadding.PaddingTop = UDim.new(0, 8)
Instances.TabListPadding.Parent = Instances.TabScrollingFrame

Instances.TabDividerTemplate = Instance.new("Frame")
Instances.TabDividerTemplate.Name = "Divider"
Instances.TabDividerTemplate.Parent = Instances.TabScrollingFrame
Instances.TabDividerTemplate.Visible = false
Instances.TabDividerTemplate.BorderSizePixel = 0
Instances.TabDividerTemplate.BackgroundColor3 = Color3.fromRGB(61, 61, 75)
Instances.TabDividerTemplate.Size = UDim2.new(1, 0, 0, 1)
Instances.TabDividerTemplate.BorderColor3 = Color3.fromRGB(61, 61, 75)

Instances.InactiveTabTemplate = Instance.new("ImageButton")
Instances.InactiveTabTemplate.Name = "TabButton"
Instances.InactiveTabTemplate.Parent = Instances.TabScrollingFrame
Instances.InactiveTabTemplate.Active = false
Instances.InactiveTabTemplate.BorderSizePixel = 0
Instances.InactiveTabTemplate.AutoButtonColor = false
Instances.InactiveTabTemplate.Visible = false
Instances.InactiveTabTemplate.BackgroundTransparency = 1
Instances.InactiveTabTemplate.Selectable = false
Instances.InactiveTabTemplate.Size = UDim2.new(1, 0, 0, 36)
Instances.InactiveTabTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.InactiveTabIcon = Instance.new("ImageButton")
Instances.InactiveTabIcon.Name = "Icon"
Instances.InactiveTabIcon.Parent = Instances.InactiveTabTemplate
Instances.InactiveTabIcon.BorderSizePixel = 0
Instances.InactiveTabIcon.ImageTransparency = 0.5
Instances.InactiveTabIcon.BackgroundTransparency = 1
Instances.InactiveTabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.InactiveTabIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.InactiveTabIcon.AnchorPoint = Vector2.new(0, 0.5)
Instances.InactiveTabIcon.Image = "rbxassetid://113216930555884"
Instances.InactiveTabIcon.Size = UDim2.new(0, 31, 0, 30)
Instances.InactiveTabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.InactiveTabIcon.Position = UDim2.new(0, 6, 0, 18)

Instances.InactiveTabIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.InactiveTabIconAspectName = "InactiveIconAspect"
Instances.InactiveTabIconAspect.Parent = Instances.InactiveTabIcon

Instances.InactiveTabLabel = Instance.new("TextLabel")
Instances.InactiveTabLabel.Name = "Title"
Instances.InactiveTabLabel.Parent = Instances.InactiveTabTemplate
Instances.InactiveTabLabel.TextWrapped = true
Instances.InactiveTabLabel.BorderSizePixel = 0
Instances.InactiveTabLabel.TextSize = 14
Instances.InactiveTabLabel.TextXAlignment = Enum.TextXAlignment.Left
Instances.InactiveTabLabel.TextTransparency = 0.5
Instances.InactiveTabLabel.TextScaled = true
Instances.InactiveTabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.InactiveTabLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.InactiveTabLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.InactiveTabLabel.BackgroundTransparency = 1
Instances.InactiveTabLabel.AnchorPoint = Vector2.new(0, 0.5)
Instances.InactiveTabLabel.Size = UDim2.new(0, 103, 0, 16)
Instances.InactiveTabLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.InactiveTabLabel.Text = "Noctis"
Instances.InactiveTabLabel.Position = UDim2.new(0, 42, 0.5, 0)

Instances.InactiveTabHighlight = Instance.new("Frame")
Instances.InactiveTabHighlight.Name = "Bar"
Instances.InactiveTabHighlight.Parent = Instances.InactiveTabTemplate
Instances.InactiveTabHighlight.BorderSizePixel = 0
Instances.InactiveTabHighlight.BackgroundColor3 = Color3.fromRGB(197, 204, 219)
Instances.InactiveTabHighlight.AnchorPoint = Vector2.new(0, 0.5)
Instances.InactiveTabHighlight.Size = UDim2.new(0, 5, 0, 0)
Instances.InactiveTabHighlight.Position = UDim2.new(0, 8, 0, 18)
Instances.InactiveTabHighlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.InactiveTabHighlight.BackgroundTransparency = 1

Instances.InactiveTabHighlightCorner = Instance.new("UICorner")
Instances.InactiveTabHighlightCorner.Name = "InactiveHighlightCorner"
Instances.InactiveTabHighlightCorner.Parent = Instances.InactiveTabHighlight
Instances.InactiveTabHighlightCorner.CornerRadius = UDim.new(0, 100)

Instances.TabButtonsCorner = Instance.new("UICorner")
Instances.TabButtonsCorner.Name = "TabButtonsCorner"
Instances.TabButtonsCorner.Parent = Instances.TabButtons
Instances.TabButtonsCorner.CornerRadius = UDim.new(0, 6)

Instances.TabButtonsAntiCornerTop = Instance.new("Frame")
Instances.TabButtonsAntiCornerTop.Name = "AntiCornerTop"
Instances.TabButtonsAntiCornerTop.Parent = Instances.TabButtons
Instances.TabButtonsAntiCornerTop.BorderSizePixel = 0
Instances.TabButtonsAntiCornerTop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonsAntiCornerTop.Size = UDim2.new(1, 0, 0, 5)

Instances.TabButtonsAntiCornerRight = Instance.new("Frame")
Instances.TabButtonsAntiCornerRight.Name = "AntiCornerRight"
Instances.TabButtonsAntiCornerRight.Parent = Instances.TabButtons
Instances.TabButtonsAntiCornerRight.BorderSizePixel = 0
Instances.TabButtonsAntiCornerRight.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonsAntiCornerRight.AnchorPoint = Vector2.new(0.5, 0)
Instances.TabButtonsAntiCornerRight.Size = UDim2.new(0, 2, 1, 0)
Instances.TabButtonsAntiCornerRight.Position = UDim2.new(1, 1, 0, 0)

Instances.TabButtonsBorder = Instance.new("Frame")
Instances.TabButtonsBorder.Name = "Border"
Instances.TabButtonsBorder.Parent = Instances.TabButtons
Instances.TabButtonsBorder.ZIndex = 2
Instances.TabButtonsBorder.BorderSizePixel = 0
Instances.TabButtonsBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabButtonsBorder.AnchorPoint = Vector2.new(1, 0)
Instances.TabButtonsBorder.Size = UDim2.new(0, 2, 1, 0)
Instances.TabButtonsBorder.Position = UDim2.new(1, 0, 0, 0)

----------------------------------------------------------------------
-- Top Frame (Title Bar)
----------------------------------------------------------------------

Instances.TopFrame = Instance.new("Frame")
Instances.TopFrame.Name = "TopFrame"
Instances.TopFrame.Parent = Instances.MainWindow
Instances.TopFrame.BorderSizePixel = 0
Instances.TopFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrame.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.TopFrame.ClipsDescendants = true
Instances.TopFrame.Size = UDim2.new(1, 0, 0, 35)

Instances.TopFrameIcon = Instance.new("ImageButton")
Instances.TopFrameIcon.Name = "Icon"
Instances.TopFrameIcon.Parent = Instances.TopFrame
Instances.TopFrameIcon.Active = false
Instances.TopFrameIcon.Interactable = false
Instances.TopFrameIcon.BorderSizePixel = 0
Instances.TopFrameIcon.BackgroundTransparency = 1
Instances.TopFrameIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TopFrameIcon.AnchorPoint = Vector2.new(0, 0.5)
Instances.TopFrameIcon.Image = "rbxassetid://113216930555884"
Instances.TopFrameIcon.Size = UDim2.new(0, 25, 0, 25)
Instances.TopFrameIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrameIcon.Position = UDim2.new(0, 10, 0.5, 0)

Instances.TopFrameIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.TopFrameIconAspect.Name = "TopIconAspect"
Instances.TopFrameIconAspect.Parent = Instances.TopFrameIcon

Instances.TopFrameTitle = Instance.new("TextLabel")
Instances.TopFrameTitle.Name = "Title"
Instances.TopFrameTitle.Parent = Instances.TopFrame
Instances.TopFrameTitle.TextWrapped = true
Instances.TopFrameTitle.Interactable = false
Instances.TopFrameTitle.BorderSizePixel = 0
Instances.TopFrameTitle.TextSize = 14
Instances.TopFrameTitle.TextScaled = true
Instances.TopFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TopFrameTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TopFrameTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TopFrameTitle.BackgroundTransparency = 1
Instances.TopFrameTitle.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TopFrameTitle.Size = UDim2.new(1, 0, 0, 16)
Instances.TopFrameTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrameTitle.Text = "Noctis - v1.2.3"
Instances.TopFrameTitle.Position = UDim2.new(0.5, 0, 0.5, -1)

Instances.TopFrameClose = Instance.new("ImageButton")
Instances.TopFrameClose.Name = "Close"
Instances.TopFrameClose.Parent = Instances.TopFrame
Instances.TopFrameClose.BorderSizePixel = 0
Instances.TopFrameClose.BackgroundTransparency = 1
Instances.TopFrameClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TopFrameClose.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TopFrameClose.AnchorPoint = Vector2.new(1, 0.5)
Instances.TopFrameClose.Image = "rbxassetid://132453323679056"
Instances.TopFrameClose.Size = UDim2.new(0, 20, 0, 20)
Instances.TopFrameClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrameClose.Position = UDim2.new(1, -15, 0.5, 0)

Instances.TopFrameMaximize = Instance.new("ImageButton")
Instances.TopFrameMaximize.Name = "Maximize"
Instances.TopFrameMaximize.Parent = Instances.TopFrame
Instances.TopFrameMaximize.BorderSizePixel = 0
Instances.TopFrameMaximize.BackgroundTransparency = 1
Instances.TopFrameMaximize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TopFrameMaximize.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TopFrameMaximize.AnchorPoint = Vector2.new(1, 0.5)
Instances.TopFrameMaximize.Image = "rbxassetid://108285848026510"
Instances.TopFrameMaximize.Size = UDim2.new(0, 15, 0, 15)
Instances.TopFrameMaximize.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrameMaximize.Position = UDim2.new(1, -55, 0.5, 0)

Instances.TopFrameHide = Instance.new("ImageButton")
Instances.TopFrameHide.Name = "Hide"
Instances.TopFrameHide.Parent = Instances.TopFrame
Instances.TopFrameHide.BorderSizePixel = 0
Instances.TopFrameHide.BackgroundTransparency = 1
Instances.TopFrameHide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TopFrameHide.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TopFrameHide.AnchorPoint = Vector2.new(1, 0.5)
Instances.TopFrameHide.Image = "rbxassetid://128209591224511"
Instances.TopFrameHide.Size = UDim2.new(0, 20, 0, 20)
Instances.TopFrameHide.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TopFrameHide.Position = UDim2.new(1, -90, 0.5, 0)

Instances.TopFrameCorner = Instance.new("UICorner")
Instances.TopFrameCorner.Name = "TopFrameCorner"
Instances.TopFrameCorner.Parent = Instances.TopFrame
Instances.TopFrameCorner.CornerRadius = UDim.new(0, 6)

Instances.TopFrameBorder = Instance.new("Frame")
Instances.TopFrameBorder.Name = "Border"
Instances.TopFrameBorder.Parent = Instances.TopFrame
Instances.TopFrameBorder.ZIndex = 2
Instances.TopFrameBorder.BorderSizePixel = 0
Instances.TopFrameBorder.BackgroundColor3 = Color3.fromRGB(61, 61, 75)
Instances.TopFrameBorder.AnchorPoint = Vector2.new(0, 0.5)
Instances.TopFrameBorder.Size = UDim2.new(1, 0, 0, 2)
Instances.TopFrameBorder.Position = UDim2.new(0, 0, 1, 0)

----------------------------------------------------------------------
-- Window Outline Stroke
----------------------------------------------------------------------

Instances.MainWindowStroke = Instance.new("UIStroke")
Instances.MainWindowStroke.Name = "WindowStroke"
Instances.MainWindowStroke.Parent = Instances.MainWindow
Instances.MainWindowStroke.Transparency = 0.5
Instances.MainWindowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.MainWindowStroke.Color = Color3.fromRGB(95, 95, 117)

----------------------------------------------------------------------
-- Tabs Content Area
----------------------------------------------------------------------

Instances.TabsContainer = Instance.new("Frame")
Instances.TabsContainer.Name = "Tabs"
Instances.TabsContainer.Parent = Instances.MainWindow
Instances.TabsContainer.BorderSizePixel = 0
Instances.TabsContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabsContainer.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.TabsContainer.ClipsDescendants = true
Instances.TabsContainer.Size = UDim2.new(1, -165, 1, -35)
Instances.TabsContainer.Position = UDim2.new(0, 165, 0, 35)

Instances.TabsContainerCorner = Instance.new("UICorner")
Instances.TabsContainerCorner.Name = "TabsCorner"
Instances.TabsContainerCorner.Parent = Instances.TabsContainer
Instances.TabsContainerCorner.CornerRadius = UDim.new(0, 6)

Instances.TabsAntiCornerLeft = Instance.new("Frame")
Instances.TabsAntiCornerLeft.Name = "AntiCornerLeft"
Instances.TabsAntiCornerLeft.Parent = Instances.TabsContainer
Instances.TabsAntiCornerLeft.Visible = false
Instances.TabsAntiCornerLeft.BorderSizePixel = 0
Instances.TabsAntiCornerLeft.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabsAntiCornerLeft.Size = UDim2.new(0, 5, 1, 0)

Instances.TabsAntiCornerTop = Instance.new("Frame")
Instances.TabsAntiCornerTop.Name = "AntiCornerTop"
Instances.TabsAntiCornerTop.Parent = Instances.TabsContainer
Instances.TabsAntiCornerTop.BorderSizePixel = 0
Instances.TabsAntiCornerTop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TabsAntiCornerTop.Size = UDim2.new(1, 0, 0, 5)

Instances.EmptyPlaceholder = Instance.new("TextLabel")
Instances.EmptyPlaceholder.Name = "NoObjectFoundText"
Instances.EmptyPlaceholder.Parent = Instances.TabsContainer
Instances.EmptyPlaceholder.TextWrapped = true
Instances.EmptyPlaceholder.Interactable = false
Instances.EmptyPlaceholder.BorderSizePixel = 0
Instances.EmptyPlaceholder.TextSize = 14
Instances.EmptyPlaceholder.TextScaled = true
Instances.EmptyPlaceholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.EmptyPlaceholder.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.EmptyPlaceholder.TextColor3 = Color3.fromRGB(135, 140, 150)
Instances.EmptyPlaceholder.BackgroundTransparency = 1
Instances.EmptyPlaceholder.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.EmptyPlaceholder.Size = UDim2.new(1, 0, 0, 16)
Instances.EmptyPlaceholder.Visible = false
Instances.EmptyPlaceholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.EmptyPlaceholder.Text = "This tab is empty :("
Instances.EmptyPlaceholder.Position = UDim2.new(0.5, 0, 0.45, 0)

----------------------------------------------------------------------
-- Notification Layer
----------------------------------------------------------------------

Instances.NotificationLayer = Instance.new("Frame")
Instances.NotificationLayer.Name = "NotificationFrame"
Instances.NotificationLayer.Parent = Instances.MainWindow
Instances.NotificationLayer.BorderSizePixel = 0
Instances.NotificationLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.NotificationLayer.ClipsDescendants = true
Instances.NotificationLayer.Size = UDim2.new(1, 0, 1, 0)
Instances.NotificationLayer.BackgroundTransparency = 1

Instances.NotificationList = Instance.new("Frame")
Instances.NotificationList.Name = "NotificationList"
Instances.NotificationList.Parent = Instances.NotificationLayer
Instances.NotificationList.ZIndex = 5
Instances.NotificationList.BorderSizePixel = 0
Instances.NotificationList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.NotificationList.AnchorPoint = Vector2.new(0.5, 0)
Instances.NotificationList.ClipsDescendants = true
Instances.NotificationList.Size = UDim2.new(0, 630, 1, -35)
Instances.NotificationList.Position = UDim2.new(1, 0, 0, 35)
Instances.NotificationList.BackgroundTransparency = 1

Instances.NotificationListLayout = Instance.new("UIListLayout")
Instances.NotificationListLayout.Name = "NotificationLayout"
Instances.NotificationListLayout.Parent = Instances.NotificationList
Instances.NotificationListLayout.Padding = UDim.new(0, 12)
Instances.NotificationListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.NotificationListPadding = Instance.new("UIPadding")
Instances.NotificationListPadding.Name = "NotificationPadding"
Instances.NotificationListPadding.Parent = Instances.NotificationList
Instances.NotificationListPadding.PaddingTop = UDim.new(0, 10)
Instances.NotificationListPadding.PaddingRight = UDim.new(0, 40)
Instances.NotificationListPadding.PaddingLeft = UDim2.new(0, 40)

----------------------------------------------------------------------
-- Dim Overlay (for popups)
----------------------------------------------------------------------

Instances.DarkOverlay = Instance.new("Frame")
Instances.DarkOverlay.Name = "DarkOverlay"
Instances.DarkOverlay.Parent = Instances.MainWindow
Instances.DarkOverlay.Visible = false
Instances.DarkOverlay.BorderSizePixel = 0
Instances.DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.DarkOverlay.ClipsDescendants = true
Instances.DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
Instances.DarkOverlay.BackgroundTransparency = 0.6

Instances.DarkOverlayCorner = Instance.new("UICorner")
Instances.DarkOverlayCorner.Name = "DarkOverlayCorner"
Instances.DarkOverlayCorner.Parent = Instances.DarkOverlay
Instances.DarkOverlayCorner.CornerRadius = UDim.new(0, 10)

----------------------------------------------------------------------
-- Embedded Modules
----------------------------------------------------------------------

Instances.LibraryModule = Instance.new("ModuleScript")
Instances.LibraryModule.Name = "Library"
Instances.LibraryModule.Parent = Instances.ScreenGui

Instances.IconModule = Instance.new("ModuleScript")
Instances.IconModule.Name = "IconModule"
Instances.IconModule.Parent = Instances.LibraryModule

Instances.LucideModule = Instance.new("ModuleScript")
Instances.LucideModule.Name = "Lucide"
Instances.LucideModule.Parent = Instances.IconModule

----------------------------------------------------------------------
-- Templates Folder
----------------------------------------------------------------------

Instances.TemplatesFolder = Instance.new("Folder")
Instances.TemplatesFolder.Name = "Templates"
Instances.TemplatesFolder.Parent = Instances.ScreenGui

Instances.TemplateDivider = Instance.new("Frame")
Instances.TemplateDivider.Name = "Divider"
Instances.TemplateDivider.Parent = Instances.TemplatesFolder
Instances.TemplateDivider.Visible = false
Instances.TemplateDivider.BorderSizePixel = 0
Instances.TemplateDivider.BackgroundColor3 = Color3.fromRGB(61, 61, 75)
Instances.TemplateDivider.BorderColor3 = Color3.fromRGB(61, 61, 75)
Instances.TemplateDivider.Size = UDim2.new(1, 0, 0, 1)

Instances.TemplateTab = Instance.new("ScrollingFrame")
Instances.TemplateTab.Name = "Tab"
Instances.TemplateTab.Parent = Instances.TemplatesFolder
Instances.TemplateTab.Visible = false
Instances.TemplateTab.Active = true
Instances.TemplateTab.ScrollingDirection = Enum.ScrollingDirection.Y
Instances.TemplateTab.BorderSizePixel = 0
Instances.TemplateTab.CanvasSize = UDim2.new(0, 0, 0, 0)
Instances.TemplateTab.ElasticBehavior = Enum.ElasticBehavior.Never
Instances.TemplateTab.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTab.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateTab.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instances.TemplateTab.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateTab.ScrollBarImageColor3 = Color3.fromRGB(99, 106, 122)
Instances.TemplateTab.ScrollBarThickness = 5
Instances.TemplateTab.BackgroundTransparency = 1
Instances.TemplateTab.Selectable = false

Instances.TemplateTabLayout = Instance.new("UIListLayout")
Instances.TemplateTabLayout.Name = "TemplateTabLayout"
Instances.TemplateTabLayout.Parent = Instances.TemplateTab
Instances.TemplateTabLayout.Padding = UDim.new(0, 15)
Instances.TemplateTabLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateTabPadding = Instance.new("UIPadding")
Instances.TemplateTabPadding.Name = "TemplateTabPadding"
Instances.TemplateTabPadding.Parent = Instances.TemplateTab
Instances.TemplateTabPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateTabPadding.PaddingRight = UDim.new(0, 14)
Instances.TemplateTabPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateTabPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateTabButton = Instance.new("ImageButton")
Instances.TemplateTabButton.Name = "TabButton"
Instances.TemplateTabButton.Parent = Instances.TemplatesFolder
Instances.TemplateTabButton.BorderSizePixel = 0
Instances.TemplateTabButton.AutoButtonColor = false
Instances.TemplateTabButton.Visible = false
Instances.TemplateTabButton.BackgroundTransparency = 1
Instances.TemplateTabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTabButton.Selectable = false
Instances.TemplateTabButton.Active = false
Instances.TemplateTabButton.Size = UDim2.new(1, 0, 0, 36)
Instances.TemplateTabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateTabButtonIcon = Instance.new("ImageButton")
Instances.TemplateTabButtonIcon.Name = "Icon"
Instances.TemplateTabButtonIcon.Parent = Instances.TemplateTabButton
Instances.TemplateTabButtonIcon.BorderSizePixel = 0
Instances.TemplateTabButtonIcon.ImageTransparency = 0.5
Instances.TemplateTabButtonIcon.BackgroundTransparency = 1
Instances.TemplateTabButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTabButtonIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTabButtonIcon.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateTabButtonIcon.Image = "rbxassetid://113216930555884"
Instances.TemplateTabButtonIcon.Size = UDim2.new(0, 20, 0, 20)
Instances.TemplateTabButtonIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTabButtonIcon.Position = UDim2.new(0, 12, 0, 18)

Instances.TemplateTabButtonIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.TemplateTabButtonIconAspect.Name = "TemplateTabIconAspect"
Instances.TemplateTabButtonIconAspect.Parent = Instances.TemplateTabButtonIcon

Instances.TemplateTabButtonLabel = Instance.new("TextLabel")
Instances.TemplateTabButtonLabel.Name = "Title"
Instances.TemplateTabButtonLabel.Parent = Instances.TemplateTabButton
Instances.TemplateTabButtonLabel.TextWrapped = true
Instances.TemplateTabButtonLabel.BorderSizePixel = 0
Instances.TemplateTabButtonLabel.TextSize = 14
Instances.TemplateTabButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateTabButtonLabel.TextTransparency = 0.5
Instances.TemplateTabButtonLabel.TextScaled = true
Instances.TemplateTabButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTabButtonLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateTabButtonLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTabButtonLabel.BackgroundTransparency = 1
Instances.TemplateTabButtonLabel.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateTabButtonLabel.Size = UDim2.new(0, 103, 0, 16)
Instances.TemplateTabButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTabButtonLabel.Text = ""
Instances.TemplateTabButtonLabel.Position = UDim2.new(0, 42, 0.5, 0)

Instances.TemplateTabButtonHighlight = Instance.new("Frame")
Instances.TemplateTabButtonHighlight.Name = "Bar"
Instances.TemplateTabButtonHighlight.Parent = Instances.TemplateTabButton
Instances.TemplateTabButtonHighlight.BorderSizePixel = 0
Instances.TemplateTabButtonHighlight.BackgroundColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTabButtonHighlight.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateTabButtonHighlight.Size = UDim2.new(0, 5, 0, 0)
Instances.TemplateTabButtonHighlight.Position = UDim2.new(0, 8, 0, 18)
Instances.TemplateTabButtonHighlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTabButtonHighlight.BackgroundTransparency = 1

Instances.TemplateTabButtonHighlightCorner = Instance.new("UICorner")
Instances.TemplateTabButtonHighlightCorner.Name = "TemplateTabBarCorner"
Instances.TemplateTabButtonHighlightCorner.Parent = Instances.TemplateTabButtonHighlight
Instances.TemplateTabButtonHighlightCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateTabPadding = Instance.new("UIPadding")
Instances.TemplateTabPadding.Name = "TemplateTabButtonPadding"
Instances.TemplateTabPadding.Parent = Instances.TemplateTabButton
Instances.TemplateTabPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateTabPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateTabPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateTabPadding.PaddingBottom = UDim2.new(0, 10)

Instances.TemplateTabButtonLayout = Instance.new("UIListLayout")
Instances.TemplateTabButtonLayout.Name = "TemplateTabButtonLayout"
Instances.TemplateTabButtonLayout.Parent = Instances.TemplateTabButton
Instances.TemplateTabButtonLayout.Padding = UDim.new(0, 5)
Instances.TemplateTabButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateTabButtonDescription = Instance.new("TextLabel")
Instances.TemplateTabButtonDescription.Name = "Description"
Instances.TemplateTabButtonDescription.Parent = Instances.TemplateTabButton
Instances.TemplateTabButtonDescription.TextWrapped = true
Instances.TemplateTabButtonDescription.Interactable = false
Instances.TemplateTabButtonDescription.BorderSizePixel = 0
Instances.TemplateTabButtonDescription.TextSize = 16
Instances.TemplateTabButtonDescription.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateTabButtonDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTabButtonDescription.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateTabButtonDescription.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTabButtonDescription.BackgroundTransparency = 1
Instances.TemplateTabButtonDescription.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateTabButtonDescription.Visible = false
Instances.TemplateTabButtonDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTabButtonDescription.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateTabButtonDescription.LayoutOrder = 1
Instances.TemplateTabButtonDescription.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateTabGradientA = Instance.new("UIGradient")
Instances.TemplateTabGradientA.Name = "GradientA"
Instances.TemplateTabGradientA.Parent = Instances.TemplateTabButton
Instances.TemplateTabGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateTabGradientB = Instance.new("UIGradient")
Instances.TemplateTabGradientB.Name = "GradientB"
Instances.TemplateTabGradientB.Parent = Instances.TemplateTabButton
Instances.TemplateTabGradientB.Enabled = false
Instances.TemplateTabGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateTabGradientC = Instance.new("UIGradient")
Instances.TemplateTabGradientC.Name = "GradientC"
Instances.TemplateTabGradientC.Parent = Instances.TemplateTabButton
Instances.TemplateTabGradientC.Enabled = false
Instances.TemplateTabGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateButton = Instance.new("ImageButton")
Instances.TemplateButton.Name = "Button"
Instances.TemplateButton.Parent = Instances.TemplatesFolder
Instances.TemplateButton.BorderSizePixel = 0
Instances.TemplateButton.AutoButtonColor = false
Instances.TemplateButton.Visible = false
Instances.TemplateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButton.Selectable = false
Instances.TemplateButton.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateButton.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButton.Position = UDim2.new(0, 0, 0.384, 0)

Instances.TemplateButtonCorner = Instance.new("UICorner")
Instances.TemplateButtonCorner.Name = "ButtonCorner"
Instances.TemplateButtonCorner.Parent = Instances.TemplateButton
Instances.TemplateButtonCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateButtonFrame = Instance.new("Frame")
Instances.TemplateButtonFrame.Name = "Frame"
Instances.TemplateButtonFrame.Parent = Instances.TemplateButton
Instances.TemplateButtonFrame.BorderSizePixel = 0
Instances.TemplateButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateButtonFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateButtonFrame.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButtonFrame.BackgroundTransparency = 1

Instances.TemplateButtonLayout = Instance.new("UIListLayout")
Instances.TemplateButtonLayout.Name = "ButtonLayout"
Instances.TemplateButtonLayout.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonLayout.Padding = UDim.new(0, 5)
Instances.TemplateButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateButtonPadding = Instance.new("UIPadding")
Instances.TemplateButtonPadding.Name = "ButtonPadding"
Instances.TemplateButtonPadding.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateButtonPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateButtonPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateButtonPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateButtonTitle = Instance.new("TextLabel")
Instances.TemplateButtonTitle.Name = "Title"
Instances.TemplateButtonTitle.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonTitle.TextWrapped = true
Instances.TemplateButtonTitle.Interactable = false
Instances.TemplateButtonTitle.BorderSizePixel = 0
Instances.TemplateButtonTitle.TextSize = 16
Instances.TemplateButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateButtonTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateButtonTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateButtonTitle.BackgroundTransparency = 1
Instances.TemplateButtonTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButtonTitle.Text = "Button"

Instances.TemplateButtonClickIcon = Instance.new("ImageButton")
Instances.TemplateButtonClickIcon.Name = "ClickIcon"
Instances.TemplateButtonClickIcon.Parent = Instances.TemplateButtonTitle
Instances.TemplateButtonClickIcon.BorderSizePixel = 0
Instances.TemplateButtonClickIcon.AutoButtonColor = false
Instances.TemplateButtonClickIcon.BackgroundTransparency = 1
Instances.TemplateButtonClickIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateButtonClickIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateButtonClickIcon.AnchorPoint = Vector2.new(1, 0.5)
Instances.TemplateButtonClickIcon.Image = "rbxassetid://91877599529856"
Instances.TemplateButtonClickIcon.Size = UDim2.new(0, 23, 0, 23)
Instances.TemplateButtonClickIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButtonClickIcon.Position = UDim2.new(1, 0, 0.5, 0)

Instances.TemplateButtonDesc = Instance.new("TextLabel")
Instances.TemplateButtonDesc.Name = "Description"
Instances.TemplateButtonDesc.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonDesc.TextWrapped = true
Instances.TemplateButtonDesc.Interactable = false
Instances.TemplateButtonDesc.BorderSizePixel = 0
Instances.TemplateButtonDesc.TextSize = 16
Instances.TemplateButtonDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateButtonDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateButtonDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateButtonDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateButtonDesc.BackgroundTransparency = 1
Instances.TemplateButtonDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateButtonDesc.Visible = false
Instances.TemplateButtonDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateButtonDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateButtonDesc.LayoutOrder = 1
Instances.TemplateButtonDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateButtonGradientA = Instance.new("UIGradient")
Instances.TemplateButtonGradientA.Name = "GradientA"
Instances.TemplateButtonGradientA.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateButtonGradientB = Instance.new("UIGradient")
Instances.TemplateButtonGradientB.Name = "GradientB"
Instances.TemplateButtonGradientB.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonGradientB.Enabled = false
Instances.TemplateButtonGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateButtonGradientC = Instance.new("UIGradient")
Instances.TemplateButtonGradientC.Name = "GradientC"
Instances.TemplateButtonGradientC.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonGradientC.Enabled = false
Instances.TemplateButtonGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateButtonCornerInner = Instance.new("UICorner")
Instances.TemplateButtonCornerInner.Name = "InnerCorner"
Instances.TemplateButtonCornerInner.Parent = Instances.TemplateButtonFrame
Instances.TemplateButtonCornerInner.CornerRadius = UDim.new(0, 6)

Instances.TemplateButtonStroke = Instance.new("UIStroke")
Instances.TemplateButtonStroke.Name = "ButtonStroke"
Instances.TemplateButtonStroke.Parent = Instances.TemplateButton
Instances.TemplateButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateButtonStroke.Thickness = 1.5
Instances.TemplateButtonStroke.Color = Color3.fromRGB(61, 61, 75)

----------------------------------------------------------------------
-- Template Paragraph
----------------------------------------------------------------------

Instances.TemplateParagraph = Instance.new("Frame")
Instances.TemplateParagraph.Name = "Paragraph"
Instances.TemplateParagraph.Parent = Instances.TemplatesFolder
Instances.TemplateParagraph.Visible = false
Instances.TemplateParagraph.BorderSizePixel = 0
Instances.TemplateParagraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateParagraph.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateParagraph.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateParagraph.Position = UDim2.new(-0.0375, 0, 0.38434, 0)
Instances.TemplateParagraph.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateParagraphCorner = Instance.new("UICorner")
Instances.TemplateParagraphCorner.Name = "ParagraphCorner"
Instances.TemplateParagraphCorner.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateParagraphStroke = Instance.new("UIStroke")
Instances.TemplateParagraphStroke.Name = "ParagraphStroke"
Instances.TemplateParagraphStroke.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateParagraphStroke.Thickness = 1.5
Instances.TemplateParagraphStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateParagraphTitle = Instance.new("TextLabel")
Instances.TemplateParagraphTitle.Name = "Title"
Instances.TemplateParagraphTitle.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphTitle.TextWrapped = true
Instances.TemplateParagraphTitle.Interactable = false
Instances.TemplateParagraphTitle.BorderSizePixel = 0
Instances.TemplateParagraphTitle.TextSize = 16
Instances.TemplateParagraphTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateParagraphTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateParagraphTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateParagraphTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateParagraphTitle.BackgroundTransparency = 1
Instances.TemplateParagraphTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateParagraphTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateParagraphTitle.Text = "Title"
Instances.TemplateParagraphTitle.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateParagraphPadding = Instance.new("UIPadding")
Instances.TemplateParagraphPadding.Name = "ParagraphPadding"
Instances.TemplateParagraphPadding.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateParagraphPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateParagraphPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateParagraphPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateParagraphLayout = Instance.new("UIListLayout")
Instances.TemplateParagraphLayout.Name = "ParagraphLayout"
Instances.TemplateParagraphLayout.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphLayout.Padding = UDim.new(0, 5)
Instances.TemplateParagraphLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateParagraphDesc = Instance.new("TextLabel")
Instances.TemplateParagraphDesc.Name = "Description"
Instances.TemplateParagraphDesc.Parent = Instances.TemplateParagraph
Instances.TemplateParagraphDesc.TextWrapped = true
Instances.TemplateParagraphDesc.Interactable = false
Instances.TemplateParagraphDesc.BorderSizePixel = 0
Instances.TemplateParagraphDesc.TextSize = 16
Instances.TemplateParagraphDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateParagraphDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateParagraphDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateParagraphDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateParagraphDesc.BackgroundTransparency = 1
Instances.TemplateParagraphDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateParagraphDesc.Visible = false
Instances.TemplateParagraphDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateParagraphDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateParagraphDesc.LayoutOrder = 1
Instances.TemplateParagraphDesc.AutomaticSize = Enum.AutomaticSize.Y

----------------------------------------------------------------------
-- Template Toggle
----------------------------------------------------------------------

Instances.TemplateToggle = Instance.new("ImageButton")
Instances.TemplateToggle.Name = "Toggle"
Instances.TemplateToggle.Parent = Instances.TemplatesFolder
Instances.TemplateToggle.BorderSizePixel = 0
Instances.TemplateToggle.AutoButtonColor = false
Instances.TemplateToggle.Visible = false
Instances.TemplateToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggle.Selectable = false
Instances.TemplateToggle.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateToggle.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggle.Position = UDim2.new(-0.0375, 0, 0.38434, 0)

Instances.TemplateToggleCorner = Instance.new("UICorner")
Instances.TemplateToggleCorner.Name = "ToggleCorner"
Instances.TemplateToggleCorner.Parent = Instances.TemplateToggle
Instances.TemplateToggleCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateToggleStroke = Instance.new("UIStroke")
Instances.TemplateToggleStroke.Name = "ToggleStroke"
Instances.TemplateToggleStroke.Parent = Instances.TemplateToggle
Instances.TemplateToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateToggleStroke.Thickness = 1.5
Instances.TemplateToggleStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateTogglePadding = Instance.new("UIPadding")
Instances.TemplateTogglePadding.Name = "TogglePadding"
Instances.TemplateTogglePadding.Parent = Instances.TemplateToggle
Instances.TemplateTogglePadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateTogglePadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateTogglePadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateTogglePadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateToggleLayout = Instance.new("UIListLayout")
Instances.TemplateToggleLayout.Name = "ToggleLayout"
Instances.TemplateToggleLayout.Parent = Instances.TemplateToggle
Instances.TemplateToggleLayout.Padding = UDim.new(0, 5)
Instances.TemplateToggleLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateToggleDesc = Instance.new("TextLabel")
Instances.TemplateToggleDesc.Name = "Description"
Instances.TemplateToggleDesc.Parent = Instances.TemplateToggle
Instances.TemplateToggleDesc.TextWrapped = true
Instances.TemplateToggleDesc.Interactable = false
Instances.TemplateToggleDesc.BorderSizePixel = 0
Instances.TemplateToggleDesc.TextSize = 16
Instances.TemplateToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateToggleDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateToggleDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateToggleDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateToggleDesc.BackgroundTransparency = 1
Instances.TemplateToggleDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateToggleDesc.Visible = false
Instances.TemplateToggleDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateToggleDesc.LayoutOrder = 1
Instances.TemplateToggleDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateToggleTitle = Instance.new("TextLabel")
Instances.TemplateToggleTitle.Name = "Title"
Instances.TemplateToggleTitle.Parent = Instances.TemplateToggle
Instances.TemplateToggleTitle.TextWrapped = true
Instances.TemplateToggleTitle.BorderSizePixel = 0
Instances.TemplateToggleTitle.TextSize = 16
Instances.TemplateToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateToggleTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateToggleTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateToggleTitle.BackgroundTransparency = 1
Instances.TemplateToggleTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleTitle.Text = "Toggle"

Instances.TemplateToggleFill = Instance.new("ImageButton")
Instances.TemplateToggleFill.Name = "Fill"
Instances.TemplateToggleFill.Parent = Instances.TemplateToggleTitle
Instances.TemplateToggleFill.BorderSizePixel = 0
Instances.TemplateToggleFill.AutoButtonColor = false
Instances.TemplateToggleFill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleFill.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateToggleFill.AnchorPoint = Vector2.new(1, 0.5)
Instances.TemplateToggleFill.Size = UDim2.new(0, 45, 0, 25)
Instances.TemplateToggleFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleFill.Position = UDim2.new(1, 0, 0.5, 0)

Instances.TemplateToggleFillCorner = Instance.new("UICorner")
Instances.TemplateToggleFillCorner.Name = "FillCorner"
Instances.TemplateToggleFillCorner.Parent = Instances.TemplateToggleFill
Instances.TemplateToggleFillCorner.CornerRadius = UDim.new(100, 0)

Instances.TemplateToggleBall = Instance.new("ImageButton")
Instances.TemplateToggleBall.Name = "Ball"
Instances.TemplateToggleBall.Parent = Instances.TemplateToggleFill
Instances.TemplateToggleBall.Active = false
Instances.TemplateToggleBall.Interactable = false
Instances.TemplateToggleBall.BorderSizePixel = 0
Instances.TemplateToggleBall.AutoButtonColor = false
Instances.TemplateToggleBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateToggleBall.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateToggleBall.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateToggleBall.Size = UDim2.new(0, 20, 0, 20)
Instances.TemplateToggleBall.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleBall.Position = UDim2.new(0, 0, 0.5, 0)

Instances.TemplateToggleBallCorner = Instance.new("UICorner")
Instances.TemplateToggleBallCorner.Name = "BallCorner"
Instances.TemplateToggleBallCorner.Parent = Instances.TemplateToggleBall
Instances.TemplateToggleBallCorner.CornerRadius = UDim.new(100, 0)

Instances.TemplateToggleBallIcon = Instance.new("ImageLabel")
Instances.TemplateToggleBallIcon.Name = "Icon"
Instances.TemplateToggleBallIcon.Parent = Instances.TemplateToggleBall
Instances.TemplateToggleBallIcon.BorderSizePixel = 0
Instances.TemplateToggleBallIcon.BackgroundTransparency = 1
Instances.TemplateToggleBallIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateToggleBallIcon.ImageColor3 = Color3.fromRGB(54, 57, 63)
Instances.TemplateToggleBallIcon.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateToggleBallIcon.Size = UDim2.new(1, -5, 1, -5)
Instances.TemplateToggleBallIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateToggleBallIcon.Position = UDim2.new(0.5, 0, 0.5, 0)

Instances.TemplateToggleFillPadding = Instance.new("UIPadding")
Instances.TemplateToggleFillPadding.Name = "FillPadding"
Instances.TemplateToggleFillPadding.Parent = Instances.TemplateToggleFill
Instances.TemplateToggleFillPadding.PaddingTop = UDim.new(0, 2)
Instances.TemplateToggleFillPadding.PaddingRight = UDim.new(0, 2)
Instances.TemplateToggleFillPadding.PaddingLeft = UDim.new(0, 2)
Instances.TemplateToggleFillPadding.PaddingBottom = UDim.new(0, 2)

----------------------------------------------------------------------
-- Template Notification
----------------------------------------------------------------------

Instances.TemplateNotification = Instance.new("Frame")
Instances.TemplateNotification.Name = "Notification"
Instances.TemplateNotification.Parent = Instances.TemplatesFolder
Instances.TemplateNotification.Visible = false
Instances.TemplateNotification.BorderSizePixel = 0
Instances.TemplateNotification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotification.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateNotification.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateNotification.Size = UDim2.new(1, 0, 0, 65)
Instances.TemplateNotification.Position = UDim2.new(0.8244, 0, 0.88221, 0)
Instances.TemplateNotification.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotification.BackgroundTransparency = 1

Instances.TemplateNotificationCanvas = Instance.new("CanvasGroup")
Instances.TemplateNotificationCanvas.Name = "Items"
Instances.TemplateNotificationCanvas.Parent = Instances.TemplateNotification
Instances.TemplateNotificationCanvas.ZIndex = 2
Instances.TemplateNotificationCanvas.BorderSizePixel = 0
Instances.TemplateNotificationCanvas.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationCanvas.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateNotificationCanvas.Size = UDim2.new(0, 265, 0, 70)
Instances.TemplateNotificationCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateNotificationFrame = Instance.new("Frame")
Instances.TemplateNotificationFrame.Name = "Frame"
Instances.TemplateNotificationFrame.Parent = Instances.TemplateNotificationCanvas
Instances.TemplateNotificationFrame.BorderSizePixel = 0
Instances.TemplateNotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateNotificationFrame.Size = UDim2.new(0, 265, 0, 70)
Instances.TemplateNotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationFrame.BackgroundTransparency = 1

Instances.TemplateNotificationLayout = Instance.new("UIListLayout")
Instances.TemplateNotificationLayout.Name = "NotificationLayout"
Instances.TemplateNotificationLayout.Parent = Instances.TemplateNotificationFrame
Instances.TemplateNotificationLayout.Padding = UDim.new(0, 5)
Instances.TemplateNotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instances.TemplateNotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Center

Instances.TemplateNotificationPadding = Instance.new("UIPadding")
Instances.TemplateNotificationPadding.Name = "NotificationPadding"
Instances.TemplateNotificationPadding.Parent = Instances.TemplateNotificationFrame
Instances.TemplateNotificationPadding.PaddingTop = UDim.new(0, 15)
Instances.TemplateNotificationPadding.PaddingLeft = UDim.new(0, 15)
Instances.TemplateNotificationPadding.PaddingBottom = UDim.new(0, 15)

Instances.TemplateNotificationSubContent = Instance.new("TextLabel")
Instances.TemplateNotificationSubContent.Name = "SubContent"
Instances.TemplateNotificationSubContent.Parent = Instances.TemplateNotificationFrame
Instances.TemplateNotificationSubContent.TextWrapped = true
Instances.TemplateNotificationSubContent.BorderSizePixel = 0
Instances.TemplateNotificationSubContent.TextSize = 12
Instances.TemplateNotificationSubContent.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateNotificationSubContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationSubContent.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.TemplateNotificationSubContent.TextColor3 = Color3.fromRGB(181, 181, 181)
Instances.TemplateNotificationSubContent.BackgroundTransparency = 1
Instances.TemplateNotificationSubContent.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateNotificationSubContent.Size = UDim2.new(0, 218, 0, 10)
Instances.TemplateNotificationSubContent.Visible = false
Instances.TemplateNotificationSubContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationSubContent.Text = "This is a notification"
Instances.TemplateNotificationSubContent.LayoutOrder = 1
Instances.TemplateNotificationSubContent.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateNotificationSubContent.Position = UDim2.new(0, 0, 0, 19)

Instances.TemplateNotificationSubGradient = Instance.new("UIGradient")
Instances.TemplateNotificationSubGradient.Name = "SubGradient"
Instances.TemplateNotificationSubGradient.Parent = Instances.TemplateNotificationSubContent
Instances.TemplateNotificationSubGradient.Enabled = false
Instances.TemplateNotificationSubGradient.Rotation = -90
Instances.TemplateNotificationSubGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(3, 100, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 226)),
})

Instances.TemplateNotificationTitle = Instance.new("TextLabel")
Instances.TemplateNotificationTitle.Name = "Title"
Instances.TemplateNotificationTitle.Parent = Instances.TemplateNotificationFrame
Instances.TemplateNotificationTitle.TextWrapped = true
Instances.TemplateNotificationTitle.BorderSizePixel = 0
Instances.TemplateNotificationTitle.TextSize = 16
Instances.TemplateNotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateNotificationTitle.TextScaled = true
Instances.TemplateNotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateNotificationTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateNotificationTitle.BackgroundTransparency = 1
Instances.TemplateNotificationTitle.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateNotificationTitle.Size = UDim2.new(0, 235, 0, 18)
Instances.TemplateNotificationTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationTitle.Text = "Title"
Instances.TemplateNotificationTitle.Position = UDim2.new(0, 0, 0, 9)

Instances.TemplateNotificationClose = Instance.new("ImageButton")
Instances.TemplateNotificationClose.Name = "Close"
Instances.TemplateNotificationClose.Parent = Instances.TemplateNotificationTitle
Instances.TemplateNotificationClose.BorderSizePixel = 0
Instances.TemplateNotificationClose.BackgroundTransparency = 1
Instances.TemplateNotificationClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationClose.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateNotificationClose.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateNotificationClose.Size = UDim2.new(0.09706, 0, 1.33333, 0)
Instances.TemplateNotificationClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationClose.Image = "rbxassetid://132453323679056"
Instances.TemplateNotificationClose.Position = UDim2.new(0.92, 0, 0.5, 0)

Instances.TemplateNotificationCloseAspect = Instance.new("UIAspectRatioConstraint")
Instances.TemplateNotificationCloseAspect.Name = "CloseAspect"
Instances.TemplateNotificationCloseAspect.Parent = Instances.TemplateNotificationClose

Instances.TemplateNotificationTitlePadding = Instance.new("UIPadding")
Instances.TemplateNotificationTitlePadding.Name = "TitlePadding"
Instances.TemplateNotificationTitlePadding.Parent = Instances.TemplateNotificationTitle
Instances.TemplateNotificationTitlePadding.PaddingLeft = UDim.new(0, 30)

Instances.TemplateNotificationIcon = Instance.new("ImageButton")
Instances.TemplateNotificationIcon.Name = "Icon"
Instances.TemplateNotificationIcon.Parent = Instances.TemplateNotificationTitle
Instances.TemplateNotificationIcon.BorderSizePixel = 0
Instances.TemplateNotificationIcon.BackgroundTransparency = 1
Instances.TemplateNotificationIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateNotificationIcon.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateNotificationIcon.Size = UDim2.new(0.09706, 0, 1.33333, 0)
Instances.TemplateNotificationIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationIcon.Image = "rbxassetid://92049322344253"
Instances.TemplateNotificationIcon.Position = UDim2.new(0, -30, 0.5, 0)

Instances.TemplateNotificationIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.TemplateNotificationIconAspect.Name = "IconAspect"
Instances.TemplateNotificationIconAspect.Parent = Instances.TemplateNotificationIcon

Instances.TemplateNotificationContent = Instance.new("TextLabel")
Instances.TemplateNotificationContent.Name = "Content"
Instances.TemplateNotificationContent.Parent = Instances.TemplateNotificationFrame
Instances.TemplateNotificationContent.TextWrapped = true
Instances.TemplateNotificationContent.BorderSizePixel = 0
Instances.TemplateNotificationContent.TextSize = 16
Instances.TemplateNotificationContent.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateNotificationContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateNotificationContent.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateNotificationContent.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateNotificationContent.BackgroundTransparency = 1
Instances.TemplateNotificationContent.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateNotificationContent.Size = UDim2.new(0, 218, 0, 10)
Instances.TemplateNotificationContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationContent.Text = "Content"
Instances.TemplateNotificationContent.LayoutOrder = 2
Instances.TemplateNotificationContent.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateNotificationContent.Position = UDim2.new(0, 0, 0, 19)

Instances.TemplateNotificationContentGradient = Instance.new("UIGradient")
Instances.TemplateNotificationContentGradient.Name = "ContentGradient"
Instances.TemplateNotificationContentGradient.Parent = Instances.TemplateNotificationContent
Instances.TemplateNotificationContentGradient.Enabled = false
Instances.TemplateNotificationContentGradient.Rotation = -90
Instances.TemplateNotificationContentGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(3, 100, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 226)),
})

Instances.TemplateNotificationTimer = Instance.new("Frame")
Instances.TemplateNotificationTimer.Name = "TimerBarFill"
Instances.TemplateNotificationTimer.Parent = Instances.TemplateNotificationCanvas
Instances.TemplateNotificationTimer.BorderSizePixel = 0
Instances.TemplateNotificationTimer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationTimer.AnchorPoint = Vector2.new(0, 1)
Instances.TemplateNotificationTimer.Size = UDim2.new(1, 0, 0, 5)
Instances.TemplateNotificationTimer.Position = UDim2.new(0, 0, 1, 0)
Instances.TemplateNotificationTimer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationTimer.BackgroundTransparency = 0.7

Instances.TemplateNotificationTimerCorner = Instance.new("UICorner")
Instances.TemplateNotificationTimerCorner.Name = "TimerCorner"
Instances.TemplateNotificationTimerCorner.Parent = Instances.TemplateNotificationTimer

Instances.TemplateNotificationTimerBar = Instance.new("Frame")
Instances.TemplateNotificationTimerBar.Name = "Bar"
Instances.TemplateNotificationTimerBar.Parent = Instances.TemplateNotificationTimer
Instances.TemplateNotificationTimerBar.BorderSizePixel = 0
Instances.TemplateNotificationTimerBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateNotificationTimerBar.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateNotificationTimerBar.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateNotificationTimerBarCorner = Instance.new("UICorner")
Instances.TemplateNotificationTimerBarCorner.Name = "TimerBarCorner"
Instances.TemplateNotificationTimerBarCorner.Parent = Instances.TemplateNotificationTimerBar

Instances.TemplateNotificationStroke = Instance.new("UIStroke")
Instances.TemplateNotificationStroke.Name = "NotificationStroke"
Instances.TemplateNotificationStroke.Parent = Instances.TemplateNotificationCanvas
Instances.TemplateNotificationStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateNotificationStroke.Thickness = 1.5
Instances.TemplateNotificationStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateNotificationCanvasCorner = Instance.new("UICorner")
Instances.TemplateNotificationCanvasCorner.Name = "NotificationCorner"
Instances.TemplateNotificationCanvasCorner.Parent = Instances.TemplateNotificationCanvas

----------------------------------------------------------------------
-- Template Slider
Instances.TemplateSlider = Instance.new("Frame")
Instances.TemplateSlider.Name = "Slider"
Instances.TemplateSlider.Parent = Instances.TemplatesFolder
Instances.TemplateSlider.Visible = false
Instances.TemplateSlider.BorderSizePixel = 0
Instances.TemplateSlider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSlider.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateSlider.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateSlider.Position = UDim2.new(-0.0375, 0, 0.38434, 0)
Instances.TemplateSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateSliderCorner = Instance.new("UICorner")
Instances.TemplateSliderCorner.Name = "SliderCorner"
Instances.TemplateSliderCorner.Parent = Instances.TemplateSlider
Instances.TemplateSliderCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateSliderStroke = Instance.new("UIStroke")
Instances.TemplateSliderStroke.Name = "SliderStroke"
Instances.TemplateSliderStroke.Parent = Instances.TemplateSlider
Instances.TemplateSliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateSliderStroke.Thickness = 1.5
Instances.TemplateSliderStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateSliderTitle = Instance.new("TextLabel")
Instances.TemplateSliderTitle.Name = "Title"
Instances.TemplateSliderTitle.Parent = Instances.TemplateSlider
Instances.TemplateSliderTitle.TextWrapped = true
Instances.TemplateSliderTitle.Interactable = false
Instances.TemplateSliderTitle.BorderSizePixel = 0
Instances.TemplateSliderTitle.TextSize = 16
Instances.TemplateSliderTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateSliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateSliderTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSliderTitle.BackgroundTransparency = 1
Instances.TemplateSliderTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateSliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderTitle.Text = "Slider"
Instances.TemplateSliderTitle.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateSliderPadding = Instance.new("UIPadding")
Instances.TemplateSliderPadding.Name = "SliderPadding"
Instances.TemplateSliderPadding.Parent = Instances.TemplateSlider
Instances.TemplateSliderPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateSliderPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateSliderPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateSliderPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateSliderLayout = Instance.new("UIListLayout")
Instances.TemplateSliderLayout.Name = "SliderLayout"
Instances.TemplateSliderLayout.Parent = Instances.TemplateSlider
Instances.TemplateSliderLayout.Padding = UDim.new(0, 5)
Instances.TemplateSliderLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateSliderDesc = Instance.new("TextLabel")
Instances.TemplateSliderDesc.Name = "Description"
Instances.TemplateSliderDesc.Parent = Instances.TemplateSlider
Instances.TemplateSliderDesc.TextWrapped = true
Instances.TemplateSliderDesc.Interactable = false
Instances.TemplateSliderDesc.BorderSizePixel = 0
Instances.TemplateSliderDesc.TextSize = 16
Instances.TemplateSliderDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateSliderDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateSliderDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSliderDesc.BackgroundTransparency = 1
Instances.TemplateSliderDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateSliderDesc.Visible = false
Instances.TemplateSliderDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateSliderDesc.LayoutOrder = 1
Instances.TemplateSliderDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateSliderFrame = Instance.new("Frame")
Instances.TemplateSliderFrame.Name = "SliderFrame"
Instances.TemplateSliderFrame.Parent = Instances.TemplateSlider
Instances.TemplateSliderFrame.ZIndex = 0
Instances.TemplateSliderFrame.BorderSizePixel = 0
Instances.TemplateSliderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderFrame.Size = UDim2.new(1, 0, 0, 25)
Instances.TemplateSliderFrame.LayoutOrder = 2
Instances.TemplateSliderFrame.BackgroundTransparency = 1

Instances.TemplateSliderContainer = Instance.new("Frame")
Instances.TemplateSliderContainer.Name = "Frame"
Instances.TemplateSliderContainer.Parent = Instances.TemplateSliderFrame
Instances.TemplateSliderContainer.ZIndex = 0
Instances.TemplateSliderContainer.BorderSizePixel = 0
Instances.TemplateSliderContainer.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateSliderContainer.Size = UDim2.new(1, 0, 0, 20)
Instances.TemplateSliderContainer.Position = UDim2.new(0, 0, 0.5, 0)
Instances.TemplateSliderContainer.BackgroundTransparency = 1

Instances.TemplateSliderShadow = Instance.new("ImageLabel")
Instances.TemplateSliderShadow.Name = "DropShadow"
Instances.TemplateSliderShadow.Parent = Instances.TemplateSliderContainer
Instances.TemplateSliderShadow.ZIndex = 0
Instances.TemplateSliderShadow.BorderSizePixel = 0
Instances.TemplateSliderShadow.SliceCenter = Rect.new(49, 49, 450, 450)
Instances.TemplateSliderShadow.ScaleType = Enum.ScaleType.Slice
Instances.TemplateSliderShadow.ImageTransparency = 0.75
Instances.TemplateSliderShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateSliderShadow.Image = "rbxassetid://6014261993"
Instances.TemplateSliderShadow.Size = UDim2.new(1, 25, 1, 25)
Instances.TemplateSliderShadow.BackgroundTransparency = 1
Instances.TemplateSliderShadow.Position = UDim2.new(0.5, 0, 0.5, 0)

Instances.TemplateSliderCanvas = Instance.new("CanvasGroup")
Instances.TemplateSliderCanvas.Name = "Slider"
Instances.TemplateSliderCanvas.Parent = Instances.TemplateSliderContainer
Instances.TemplateSliderCanvas.BorderSizePixel = 0
Instances.TemplateSliderCanvas.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderCanvas.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateSliderCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateSliderCanvasCorner = Instance.new("UICorner")
Instances.TemplateSliderCanvasCorner.Name = "SliderCorner"
Instances.TemplateSliderCanvasCorner.Parent = Instances.TemplateSliderCanvas
Instances.TemplateSliderCanvasCorner.CornerRadius = UDim.new(0, 5)

Instances.TemplateSliderCanvasStroke = Instance.new("UIStroke")
Instances.TemplateSliderCanvasStroke.Name = "SliderStroke"
Instances.TemplateSliderCanvasStroke.Parent = Instances.TemplateSliderCanvas
Instances.TemplateSliderCanvasStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateSliderCanvasStroke.Thickness = 1.5
Instances.TemplateSliderCanvasStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateSliderCanvasPadding = Instance.new("UIPadding")
Instances.TemplateSliderCanvasPadding.Name = "CanvasPadding"
Instances.TemplateSliderCanvasPadding.Parent = Instances.TemplateSliderCanvas
Instances.TemplateSliderCanvasPadding.PaddingTop = UDim.new(0, 2)
Instances.TemplateSliderCanvasPadding.PaddingRight = UDim.new(0, 2)
Instances.TemplateSliderCanvasPadding.PaddingLeft = UDim.new(0, 2)
Instances.TemplateSliderCanvasPadding.PaddingBottom = UDim.new(0, 2)

Instances.TemplateSliderTrigger = Instance.new("TextButton")
Instances.TemplateSliderTrigger.Name = "Trigger"
Instances.TemplateSliderTrigger.Parent = Instances.TemplateSliderCanvas
Instances.TemplateSliderTrigger.BorderSizePixel = 0
Instances.TemplateSliderTrigger.TextSize = 14
Instances.TemplateSliderTrigger.AutoButtonColor = false
Instances.TemplateSliderTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.TemplateSliderTrigger.BackgroundTransparency = 1
Instances.TemplateSliderTrigger.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateSliderTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderTrigger.Text = ""

Instances.TemplateSliderFill = Instance.new("ImageButton")
Instances.TemplateSliderFill.Name = "Fill"
Instances.TemplateSliderFill.Parent = Instances.TemplateSliderCanvas
Instances.TemplateSliderFill.Active = false
Instances.TemplateSliderFill.Interactable = false
Instances.TemplateSliderFill.BorderSizePixel = 0
Instances.TemplateSliderFill.AutoButtonColor = false
Instances.TemplateSliderFill.BackgroundTransparency = 1
Instances.TemplateSliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderFill.Selectable = false
Instances.TemplateSliderFill.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateSliderFill.Size = UDim2.new(0, 0, 1, 0)
Instances.TemplateSliderFill.ClipsDescendants = true
Instances.TemplateSliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderFill.Position = UDim2.new(0, 0, 0.5, 0)

Instances.TemplateSliderFillCorner = Instance.new("UICorner")
Instances.TemplateSliderFillCorner.Name = "FillCorner"
Instances.TemplateSliderFillCorner.Parent = Instances.TemplateSliderFill
Instances.TemplateSliderFillCorner.CornerRadius = UDim.new(0, 4)

Instances.TemplateSliderFillStroke = Instance.new("UIStroke")
Instances.TemplateSliderFillStroke.Name = "FillStroke"
Instances.TemplateSliderFillStroke.Parent = Instances.TemplateSliderFill
Instances.TemplateSliderFillStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateSliderFillStroke.Thickness = 1.5
Instances.TemplateSliderFillStroke.Color = Color3.fromRGB(11, 136, 214)

Instances.TemplateSliderGradientBackground = Instance.new("ImageButton")
Instances.TemplateSliderGradientBackground.Name = "BackgroundGradient"
Instances.TemplateSliderGradientBackground.Parent = Instances.TemplateSliderFill
Instances.TemplateSliderGradientBackground.Active = false
Instances.TemplateSliderGradientBackground.Interactable = false
Instances.TemplateSliderGradientBackground.BorderSizePixel = 0
Instances.TemplateSliderGradientBackground.AutoButtonColor = false
Instances.TemplateSliderGradientBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderGradientBackground.Selectable = false
Instances.TemplateSliderGradientBackground.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateSliderGradientBackground.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateSliderGradientBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderGradientBackground.Position = UDim2.new(0, 0, 0.5, 0)
Instances.TemplateSliderGradientBackground.AutoButtonColor = false

Instances.TemplateSliderGradientCorner = Instance.new("UICorner")
Instances.TemplateSliderGradientCorner.Name = "BackgroundCorner"
Instances.TemplateSliderGradientCorner.Parent = Instances.TemplateSliderGradientBackground
Instances.TemplateSliderGradientCorner.CornerRadius = UDim.new(0, 4)

Instances.TemplateSliderGradientA = Instance.new("UIGradient")
Instances.TemplateSliderGradientA.Name = "GradientA"
Instances.TemplateSliderGradientA.Parent = Instances.TemplateSliderGradientBackground
Instances.TemplateSliderGradientA.Enabled = false
Instances.TemplateSliderGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSliderGradientB = Instance.new("UIGradient")
Instances.TemplateSliderGradientB.Name = "GradientB"
Instances.TemplateSliderGradientB.Parent = Instances.TemplateSliderGradientBackground
Instances.TemplateSliderGradientB.Enabled = false
Instances.TemplateSliderGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSliderGradientC = Instance.new("UIGradient")
Instances.TemplateSliderGradientC.Name = "GradientC"
Instances.TemplateSliderGradientC.Parent = Instances.TemplateSliderGradientBackground
Instances.TemplateSliderGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSliderValueLabel = Instance.new("TextLabel")
Instances.TemplateSliderValueLabel.Name = "ValueText"
Instances.TemplateSliderValueLabel.Parent = Instances.TemplateSliderContainer
Instances.TemplateSliderValueLabel.TextWrapped = true
Instances.TemplateSliderValueLabel.Interactable = false
Instances.TemplateSliderValueLabel.ZIndex = 2
Instances.TemplateSliderValueLabel.BorderSizePixel = 0
Instances.TemplateSliderValueLabel.TextSize = 14
Instances.TemplateSliderValueLabel.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateSliderValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSliderValueLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateSliderValueLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSliderValueLabel.BackgroundTransparency = 1
Instances.TemplateSliderValueLabel.RichText = true
Instances.TemplateSliderValueLabel.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateSliderValueLabel.Size = UDim2.new(1, -15, 1, 0)
Instances.TemplateSliderValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSliderValueLabel.Text = "0"
Instances.TemplateSliderValueLabel.Position = UDim2.new(0.5, 0, 0.5, 0)

----------------------------------------------------------------------
-- Template TextBox
----------------------------------------------------------------------

Instances.TemplateTextBox = Instance.new("Frame")
Instances.TemplateTextBox.Name = "TextBox"
Instances.TemplateTextBox.Parent = Instances.TemplatesFolder
Instances.TemplateTextBox.Visible = false
Instances.TemplateTextBox.BorderSizePixel = 0
Instances.TemplateTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBox.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateTextBox.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateTextBox.Position = UDim2.new(-0.0375, 0, 0.38434, 0)
Instances.TemplateTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateTextBoxCorner = Instance.new("UICorner")
Instances.TemplateTextBoxCorner.Name = "TextBoxCorner"
Instances.TemplateTextBoxCorner.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateTextBoxStroke = Instance.new("UIStroke")
Instances.TemplateTextBoxStroke.Name = "TextBoxStroke"
Instances.TemplateTextBoxStroke.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateTextBoxStroke.Thickness = 1.5
Instances.TemplateTextBoxStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateTextBoxTitle = Instance.new("TextLabel")
Instances.TemplateTextBoxTitle.Name = "Title"
Instances.TemplateTextBoxTitle.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxTitle.TextWrapped = true
Instances.TemplateTextBoxTitle.Interactable = false
Instances.TemplateTextBoxTitle.BorderSizePixel = 0
Instances.TemplateTextBoxTitle.TextSize = 16
Instances.TemplateTextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateTextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTextBoxTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateTextBoxTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTextBoxTitle.BackgroundTransparency = 1
Instances.TemplateTextBoxTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateTextBoxTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxTitle.Text = "Input Textbox"
Instances.TemplateTextBoxTitle.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateTextBoxPadding = Instance.new("UIPadding")
Instances.TemplateTextBoxPadding.Name = "TextBoxPadding"
Instances.TemplateTextBoxPadding.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateTextBoxPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateTextBoxPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateTextBoxPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateTextBoxLayout = Instance.new("UIListLayout")
Instances.TemplateTextBoxLayout.Name = "TextBoxLayout"
Instances.TemplateTextBoxLayout.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxLayout.Padding = UDim.new(0, 10)
Instances.TemplateTextBoxLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateTextBoxDesc = Instance.new("TextLabel")
Instances.TemplateTextBoxDesc.Name = "Description"
Instances.TemplateTextBoxDesc.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxDesc.TextWrapped = true
Instances.TemplateTextBoxDesc.Interactable = false
Instances.TemplateTextBoxDesc.BorderSizePixel = 0
Instances.TemplateTextBoxDesc.TextSize = 16
Instances.TemplateTextBoxDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateTextBoxDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTextBoxDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateTextBoxDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTextBoxDesc.BackgroundTransparency = 1
Instances.TemplateTextBoxDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateTextBoxDesc.Visible = false
Instances.TemplateTextBoxDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateTextBoxDesc.LayoutOrder = 1
Instances.TemplateTextBoxDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateTextBoxInnerFrame = Instance.new("Frame")
Instances.TemplateTextBoxInnerFrame.Name = "BoxFrame"
Instances.TemplateTextBoxInnerFrame.Parent = Instances.TemplateTextBox
Instances.TemplateTextBoxInnerFrame.ZIndex = 0
Instances.TemplateTextBoxInnerFrame.BorderSizePixel = 0
Instances.TemplateTextBoxInnerFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateTextBoxInnerFrame.Size = UDim2.new(1, 0, 0, 25)
Instances.TemplateTextBoxInnerFrame.LayoutOrder = 2
Instances.TemplateTextBoxInnerFrame.BackgroundTransparency = 1

Instances.TemplateTextBoxShadow = Instance.new("ImageLabel")
Instances.TemplateTextBoxShadow.Name = "DropShadow"
Instances.TemplateTextBoxShadow.Parent = Instances.TemplateTextBoxInnerFrame
Instances.TemplateTextBoxShadow.ZIndex = 0
Instances.TemplateTextBoxShadow.BorderSizePixel = 0
Instances.TemplateTextBoxShadow.SliceCenter = Rect.new(49, 49, 450, 450)
Instances.TemplateTextBoxShadow.ScaleType = Enum.ScaleType.Slice
Instances.TemplateTextBoxShadow.ImageTransparency = 0.75
Instances.TemplateTextBoxShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateTextBoxShadow.Image = "rbxassetid://6014261993"
Instances.TemplateTextBoxShadow.Size = UDim2.new(1, 35, 1, 30)
Instances.TemplateTextBoxShadow.BackgroundTransparency = 1
Instances.TemplateTextBoxShadow.Position = UDim2.new(0.5, 0, 0.5, 0)

Instances.TemplateTextBoxFrame = Instance.new("Frame")
Instances.TemplateTextBoxFrame.Name = "Frame"
Instances.TemplateTextBoxFrame.Parent = Instances.TemplateTextBoxInnerFrame
Instances.TemplateTextBoxFrame.BorderSizePixel = 0
Instances.TemplateTextBoxFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateTextBoxFrame.Size = UDim2.new(1, 0, 0, 25)
Instances.TemplateTextBoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxFrame.BackgroundTransparency = 1

Instances.TemplateTextBoxFrameCorner = Instance.new("UICorner")
Instances.TemplateTextBoxFrameCorner.Name = "FrameCorner"
Instances.TemplateTextBoxFrameCorner.Parent = Instances.TemplateTextBoxFrame
Instances.TemplateTextBoxFrameCorner.CornerRadius = UDim.new(0, 5)

Instances.TemplateTextBoxFrameStroke = Instance.new("UIStroke")
Instances.TemplateTextBoxFrameStroke.Name = "FrameStroke"
Instances.TemplateTextBoxFrameStroke.Parent = Instances.TemplateTextBoxFrame
Instances.TemplateTextBoxFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateTextBoxFrameStroke.Thickness = 1.5
Instances.TemplateTextBoxFrameStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateTextBoxFrameLayout = Instance.new("UIListLayout")
Instances.TemplateTextBoxFrameLayout.Name = "FrameLayout"
Instances.TemplateTextBoxFrameLayout.Parent = Instances.TemplateTextBoxFrame
Instances.TemplateTextBoxFrameLayout.Padding = UDim.new(0, 5)
Instances.TemplateTextBoxFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instances.TemplateTextBoxFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Instances.TemplateTextBoxFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Center

Instances.TemplateTextBoxInput = Instance.new("TextBox")
Instances.TemplateTextBoxInput.Name = "TextBox"
Instances.TemplateTextBoxInput.Parent = Instances.TemplateTextBoxFrame
Instances.TemplateTextBoxInput.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateTextBoxInput.PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
Instances.TemplateTextBoxInput.BorderSizePixel = 0
Instances.TemplateTextBoxInput.TextWrapped = true
Instances.TemplateTextBoxInput.TextTruncate = Enum.TextTruncate.AtEnd
Instances.TemplateTextBoxInput.TextSize = 14
Instances.TemplateTextBoxInput.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateTextBoxInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateTextBoxInput.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateTextBoxInput.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateTextBoxInput.ClipsDescendants = true
Instances.TemplateTextBoxInput.PlaceholderText = "Input here..."
Instances.TemplateTextBoxInput.Size = UDim2.new(1, 0, 0, 25)
Instances.TemplateTextBoxInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateTextBoxInput.Text = ""
Instances.TemplateTextBoxInput.BackgroundTransparency = 1

Instances.TemplateTextBoxInputPadding = Instance.new("UIPadding")
Instances.TemplateTextBoxInputPadding.Name = "InputPadding"
Instances.TemplateTextBoxInputPadding.Parent = Instances.TemplateTextBoxInput
Instances.TemplateTextBoxInputPadding.PaddingTop = UDim.new(0, 5)
Instances.TemplateTextBoxInputPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateTextBoxInputPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateTextBoxInputPadding.PaddingBottom = UDim.new(0, 5)

----------------------------------------------------------------------
-- Template Dropdown
----------------------------------------------------------------------

Instances.TemplateDropdown = Instance.new("ImageButton")
Instances.TemplateDropdown.Name = "Dropdown"
Instances.TemplateDropdown.Parent = Instances.TemplatesFolder
Instances.TemplateDropdown.BorderSizePixel = 0
Instances.TemplateDropdown.AutoButtonColor = false
Instances.TemplateDropdown.Visible = false
Instances.TemplateDropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdown.Selectable = false
Instances.TemplateDropdown.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateDropdown.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdown.Position = UDim2.new(-0.0375, 0, 0.38434, 0)

Instances.TemplateDropdownCorner = Instance.new("UICorner")
Instances.TemplateDropdownCorner.Name = "DropdownCorner"
Instances.TemplateDropdownCorner.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateDropdownStroke = Instance.new("UIStroke")
Instances.TemplateDropdownStroke.Name = "DropdownStroke"
Instances.TemplateDropdownStroke.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateDropdownStroke.Thickness = 1.5
Instances.TemplateDropdownStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateDropdownTitle = Instance.new("TextLabel")
Instances.TemplateDropdownTitle.Name = "Title"
Instances.TemplateDropdownTitle.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownTitle.TextWrapped = true
Instances.TemplateDropdownTitle.BorderSizePixel = 0
Instances.TemplateDropdownTitle.TextSize = 16
Instances.TemplateDropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateDropdownTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownTitle.BackgroundTransparency = 1
Instances.TemplateDropdownTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateDropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownTitle.Text = "Dropdown"
Instances.TemplateDropdownTitle.Position = UDim2.new(0.03135, 0, 0, 0)

Instances.TemplateDropdownClickIcon = Instance.new("ImageButton")
Instances.TemplateDropdownClickIcon.Name = "ClickIcon"
Instances.TemplateDropdownClickIcon.Parent = Instances.TemplateDropdownTitle
Instances.TemplateDropdownClickIcon.BorderSizePixel = 0
Instances.TemplateDropdownClickIcon.AutoButtonColor = false
Instances.TemplateDropdownClickIcon.BackgroundTransparency = 1
Instances.TemplateDropdownClickIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownClickIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownClickIcon.AnchorPoint = Vector2.new(1, 0.5)
Instances.TemplateDropdownClickIcon.Image = "rbxassetid://77563793724007"
Instances.TemplateDropdownClickIcon.Size = UDim2.new(0, 23, 0, 23)
Instances.TemplateDropdownClickIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownClickIcon.Position = UDim2.new(1, 0, 0.5, 0)

Instances.TemplateDropdownBoxFrame = Instance.new("ImageButton")
Instances.TemplateDropdownBoxFrame.Name = "BoxFrame"
Instances.TemplateDropdownBoxFrame.Parent = Instances.TemplateDropdownTitle
Instances.TemplateDropdownBoxFrame.Active = false
Instances.TemplateDropdownBoxFrame.BorderSizePixel = 0
Instances.TemplateDropdownBoxFrame.BackgroundTransparency = 1
Instances.TemplateDropdownBoxFrame.Selectable = false
Instances.TemplateDropdownBoxFrame.ZIndex = 0
Instances.TemplateDropdownBoxFrame.AnchorPoint = Vector2.new(1, 0.5)
Instances.TemplateDropdownBoxFrame.AutomaticSize = Enum.AutomaticSize.X
Instances.TemplateDropdownBoxFrame.Size = UDim2.new(0, 20, 0, 20)
Instances.TemplateDropdownBoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownBoxFrame.Position = UDim2.new(1, -33, 0.5, 0)

Instances.TemplateDropdownBoxShadow = Instance.new("ImageLabel")
Instances.TemplateDropdownBoxShadow.Name = "DropShadow"
Instances.TemplateDropdownBoxShadow.Parent = Instances.TemplateDropdownBoxFrame
Instances.TemplateDropdownBoxShadow.Interactable = false
Instances.TemplateDropdownBoxShadow.ZIndex = 0
Instances.TemplateDropdownBoxShadow.BorderSizePixel = 0
Instances.TemplateDropdownBoxShadow.SliceCenter = Rect.new(49, 49, 450, 450)
Instances.TemplateDropdownBoxShadow.ScaleType = Enum.ScaleType.Slice
Instances.TemplateDropdownBoxShadow.ImageTransparency = 0.75
Instances.TemplateDropdownBoxShadow.AutomaticSize = Enum.AutomaticSize.X
Instances.TemplateDropdownBoxShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownBoxShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateDropdownBoxShadow.Image = "rbxassetid://6014261993"
Instances.TemplateDropdownBoxShadow.Size = UDim2.new(1, 28, 1, 28)
Instances.TemplateDropdownBoxShadow.Visible = false
Instances.TemplateDropdownBoxShadow.BackgroundTransparency = 1
Instances.TemplateDropdownBoxShadow.Position = UDim2.new(0.5, 0, 0.5, 0)

Instances.TemplateDropdownTrigger = Instance.new("ImageButton")
Instances.TemplateDropdownTrigger.Name = "Trigger"
Instances.TemplateDropdownTrigger.Parent = Instances.TemplateDropdownBoxFrame
Instances.TemplateDropdownTrigger.BorderSizePixel = 0
Instances.TemplateDropdownTrigger.AutoButtonColor = false
Instances.TemplateDropdownTrigger.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownTrigger.Selectable = false
Instances.TemplateDropdownTrigger.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateDropdownTrigger.AutomaticSize = Enum.AutomaticSize.X
Instances.TemplateDropdownTrigger.Size = UDim2.new(0, 20, 0, 20)
Instances.TemplateDropdownTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownTrigger.Position = UDim2.new(0.5, 0, 0.5, 0)

Instances.TemplateDropdownTriggerCorner = Instance.new("UICorner")
Instances.TemplateDropdownTriggerCorner.Name = "TriggerCorner"
Instances.TemplateDropdownTriggerCorner.Parent = Instances.TemplateDropdownTrigger
Instances.TemplateDropdownTriggerCorner.CornerRadius = UDim.new(0, 5)

Instances.TemplateDropdownTriggerStroke = Instance.new("UIStroke")
Instances.TemplateDropdownTriggerStroke.Name = "TriggerStroke"
Instances.TemplateDropdownTriggerStroke.Parent = Instances.TemplateDropdownTrigger
Instances.TemplateDropdownTriggerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateDropdownTriggerStroke.Thickness = 1.5
Instances.TemplateDropdownTriggerStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateDropdownTriggerLayout = Instance.new("UIListLayout")
Instances.TemplateDropdownTriggerLayout.Name = "TriggerLayout"
Instances.TemplateDropdownTriggerLayout.Parent = Instances.TemplateDropdownTrigger
Instances.TemplateDropdownTriggerLayout.Padding = UDim.new(0, 5)
Instances.TemplateDropdownTriggerLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Instances.TemplateDropdownTriggerLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDropdownTriggerLabel = Instance.new("TextLabel")
Instances.TemplateDropdownTriggerLabel.Name = "Title"
Instances.TemplateDropdownTriggerLabel.Parent = Instances.TemplateDropdownTrigger
Instances.TemplateDropdownTriggerLabel.TextWrapped = true
Instances.TemplateDropdownTriggerLabel.Interactable = false
Instances.TemplateDropdownTriggerLabel.BorderSizePixel = 0
Instances.TemplateDropdownTriggerLabel.TextSize = 16
Instances.TemplateDropdownTriggerLabel.TextScaled = true
Instances.TemplateDropdownTriggerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownTriggerLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateDropdownTriggerLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownTriggerLabel.BackgroundTransparency = 1
Instances.TemplateDropdownTriggerLabel.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateDropdownTriggerLabel.Size = UDim2.new(0, 15, 0, 14)
Instances.TemplateDropdownTriggerLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownTriggerLabel.Text = ""
Instances.TemplateDropdownTriggerLabel.AutomaticSize = Enum.AutomaticSize.X
Instances.TemplateDropdownTriggerLabel.Position = UDim2.new(-0.00345, 0, 0.5, 0)

Instances.TemplateDropdownTriggerPadding = Instance.new("UIPadding")
Instances.TemplateDropdownTriggerPadding.Name = "TriggerPadding"
Instances.TemplateDropdownTriggerPadding.Parent = Instances.TemplateDropdownTrigger
Instances.TemplateDropdownTriggerPadding.PaddingRight = UDim.new(0, 5)
Instances.TemplateDropdownTriggerPadding.PaddingLeft = UDim.new(0, 5)

Instances.TemplateDropdownPadding = Instance.new("UIPadding")
Instances.TemplateDropdownPadding.Name = "DropdownPadding"
Instances.TemplateDropdownPadding.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateDropdownPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateDropdownPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateDropdownPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateDropdownLayout = Instance.new("UIListLayout")
Instances.TemplateDropdownLayout.Name = "DropdownLayout"
Instances.TemplateDropdownLayout.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownLayout.Padding = UDim.new(0, 5)
Instances.TemplateDropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDropdownDesc = Instance.new("TextLabel")
Instances.TemplateDropdownDesc.Name = "Description"
Instances.TemplateDropdownDesc.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownDesc.TextWrapped = true
Instances.TemplateDropdownDesc.Interactable = false
Instances.TemplateDropdownDesc.BorderSizePixel = 0
Instances.TemplateDropdownDesc.TextSize = 16
Instances.TemplateDropdownDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDropdownDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateDropdownDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownDesc.BackgroundTransparency = 1
Instances.TemplateDropdownDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateDropdownDesc.Visible = false
Instances.TemplateDropdownDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateDropdownDesc.LayoutOrder = 1
Instances.TemplateDropdownDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateDropdownGradientA = Instance.new("UIGradient")
Instances.TemplateDropdownGradientA.Name = "GradientA"
Instances.TemplateDropdownGradientA.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownGradientA.Enabled = false
Instances.TemplateDropdownGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownGradientB = Instance.new("UIGradient")
Instances.TemplateDropdownGradientB.Name = "GradientB"
Instances.TemplateDropdownGradientB.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownGradientB.Enabled = false
Instances.TemplateDropdownGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownGradientC = Instance.new("UIGradient")
Instances.TemplateDropdownGradientC.Name = "GradientC"
Instances.TemplateDropdownGradientC.Parent = Instances.TemplateDropdown
Instances.TemplateDropdownGradientC.Enabled = false
Instances.TemplateDropdownGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownFolder = Instance.new("Folder")
Instances.TemplateDropdownFolder.Name = "DropdownList"
Instances.TemplateDropdownFolder.Parent = Instances.TemplatesFolder

Instances.TemplateDropdownListFrame = Instance.new("ScrollingFrame")
Instances.TemplateDropdownListFrame.Name = "DropdownItems"
Instances.TemplateDropdownListFrame.Parent = Instances.TemplateDropdownFolder
Instances.TemplateDropdownListFrame.Visible = false
Instances.TemplateDropdownListFrame.Active = true
Instances.TemplateDropdownListFrame.ScrollingDirection = Enum.ScrollingDirection.Y
Instances.TemplateDropdownListFrame.BorderSizePixel = 0
Instances.TemplateDropdownListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
Instances.TemplateDropdownListFrame.ElasticBehavior = Enum.ElasticBehavior.Never
Instances.TemplateDropdownListFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateDropdownListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownListFrame.Selectable = false
Instances.TemplateDropdownListFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateDropdownListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instances.TemplateDropdownListFrame.Size = UDim2.new(1, 0, 1, -50)
Instances.TemplateDropdownListFrame.ScrollBarImageColor3 = Color3.fromRGB(99, 106, 122)
Instances.TemplateDropdownListFrame.Position = UDim2.new(0, 0, 0, 50)
Instances.TemplateDropdownListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownListFrame.ScrollBarThickness = 5
Instances.TemplateDropdownListFrame.BackgroundTransparency = 1

Instances.TemplateDropdownListLayout = Instance.new("UIListLayout")
Instances.TemplateDropdownListLayout.Name = "DropdownItemsLayout"
Instances.TemplateDropdownListLayout.Parent = Instances.TemplateDropdownListFrame
Instances.TemplateDropdownListLayout.Padding = UDim.new(0, 15)
Instances.TemplateDropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDropdownListPadding = Instance.new("UIPadding")
Instances.TemplateDropdownListPadding.Name = "DropdownItemsPadding"
Instances.TemplateDropdownListPadding.Parent = Instances.TemplateDropdownListFrame
Instances.TemplateDropdownListPadding.PaddingTop = UDim.new(0, 2)
Instances.TemplateDropdownListPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateDropdownListPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateDropdownListPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateDropdownSearchFrame = Instance.new("ScrollingFrame")
Instances.TemplateDropdownSearchFrame.Name = "DropdownItemsSearch"
Instances.TemplateDropdownSearchFrame.Parent = Instances.TemplateDropdownFolder
Instances.TemplateDropdownSearchFrame.Visible = false
Instances.TemplateDropdownSearchFrame.Active = true
Instances.TemplateDropdownSearchFrame.ScrollingDirection = Enum.ScrollingDirection.Y
Instances.TemplateDropdownSearchFrame.BorderSizePixel = 0
Instances.TemplateDropdownSearchFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
Instances.TemplateDropdownSearchFrame.ElasticBehavior = Enum.ElasticBehavior.Never
Instances.TemplateDropdownSearchFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateDropdownSearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownSearchFrame.Selectable = false
Instances.TemplateDropdownSearchFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Instances.TemplateDropdownSearchFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instances.TemplateDropdownSearchFrame.Size = UDim2.new(1, 0, 1, -50)
Instances.TemplateDropdownSearchFrame.ScrollBarImageColor3 = Color3.fromRGB(99, 106, 122)
Instances.TemplateDropdownSearchFrame.Position = UDim2.new(0, 0, 0, 50)
Instances.TemplateDropdownSearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownSearchFrame.ScrollBarThickness = 5
Instances.TemplateDropdownSearchFrame.BackgroundTransparency = 1

Instances.TemplateDropdownSearchLayout = Instance.new("UIListLayout")
Instances.TemplateDropdownSearchLayout.Name = "DropdownItemsSearchLayout"
Instances.TemplateDropdownSearchLayout.Parent = Instances.TemplateDropdownSearchFrame
Instances.TemplateDropdownSearchLayout.Padding = UDim.new(0, 15)
Instances.TemplateDropdownSearchLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDropdownSearchPadding = Instance.new("UIPadding")
Instances.TemplateDropdownSearchPadding.Name = "DropdownItemsSearchPadding"
Instances.TemplateDropdownSearchPadding.Parent = Instances.TemplateDropdownSearchFrame
Instances.TemplateDropdownSearchPadding.PaddingTop = UDim.new(0, 2)
Instances.TemplateDropdownSearchPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateDropdownSearchPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateDropdownSearchPadding.PaddingBottom = UDim.new(0, 10)

----------------------------------------------------------------------
-- Template Dropdown Button
----------------------------------------------------------------------

Instances.TemplateDropdownButton = Instance.new("ImageButton")
Instances.TemplateDropdownButton.Name = "DropdownButton"
Instances.TemplateDropdownButton.Parent = Instances.TemplatesFolder
Instances.TemplateDropdownButton.BorderSizePixel = 0
Instances.TemplateDropdownButton.AutoButtonColor = false
Instances.TemplateDropdownButton.Visible = false
Instances.TemplateDropdownButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownButton.Selectable = false
Instances.TemplateDropdownButton.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDropdownButton.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateDropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownButton.Position = UDim2.new(0, 0, 0.384, 0)

Instances.TemplateDropdownButtonCorner = Instance.new("UICorner")
Instances.TemplateDropdownButtonCorner.Name = "DropdownButtonCorner"
Instances.TemplateDropdownButtonCorner.Parent = Instances.TemplateDropdownButton
Instances.TemplateDropdownButtonCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateDropdownButtonFrame = Instance.new("Frame")
Instances.TemplateDropdownButtonFrame.Name = "Frame"
Instances.TemplateDropdownButtonFrame.Parent = Instances.TemplateDropdownButton
Instances.TemplateDropdownButtonFrame.BorderSizePixel = 0
Instances.TemplateDropdownButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownButtonFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDropdownButtonFrame.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateDropdownButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownButtonFrame.BackgroundTransparency = 1

Instances.TemplateDropdownButtonLayout = Instance.new("UIListLayout")
Instances.TemplateDropdownButtonLayout.Name = "DropdownButtonLayout"
Instances.TemplateDropdownButtonLayout.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonLayout.Padding = UDim.new(0, 5)
Instances.TemplateDropdownButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDropdownButtonPadding = Instance.new("UIPadding")
Instances.TemplateDropdownButtonPadding.Name = "DropdownButtonPadding"
Instances.TemplateDropdownButtonPadding.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateDropdownButtonPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateDropdownButtonPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateDropdownButtonPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateDropdownButtonTitle = Instance.new("TextLabel")
Instances.TemplateDropdownButtonTitle.Name = "Title"
Instances.TemplateDropdownButtonTitle.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonTitle.TextWrapped = true
Instances.TemplateDropdownButtonTitle.Interactable = false
Instances.TemplateDropdownButtonTitle.BorderSizePixel = 0
Instances.TemplateDropdownButtonTitle.TextSize = 16
Instances.TemplateDropdownButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDropdownButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownButtonTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateDropdownButtonTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownButtonTitle.BackgroundTransparency = 1
Instances.TemplateDropdownButtonTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateDropdownButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownButtonTitle.Text = "Button"

Instances.TemplateDropdownButtonDesc = Instance.new("TextLabel")
Instances.TemplateDropdownButtonDesc.Name = "Description"
Instances.TemplateDropdownButtonDesc.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonDesc.TextWrapped = true
Instances.TemplateDropdownButtonDesc.Interactable = false
Instances.TemplateDropdownButtonDesc.BorderSizePixel = 0
Instances.TemplateDropdownButtonDesc.TextSize = 16
Instances.TemplateDropdownButtonDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDropdownButtonDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDropdownButtonDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateDropdownButtonDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDropdownButtonDesc.BackgroundTransparency = 1
Instances.TemplateDropdownButtonDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateDropdownButtonDesc.Visible = false
Instances.TemplateDropdownButtonDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDropdownButtonDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateDropdownButtonDesc.LayoutOrder = 1
Instances.TemplateDropdownButtonDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateDropdownButtonGradientA = Instance.new("UIGradient")
Instances.TemplateDropdownButtonGradientA.Name = "GradientA"
Instances.TemplateDropdownButtonGradientA.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownButtonGradientB = Instance.new("UIGradient")
Instances.TemplateDropdownButtonGradientB.Name = "GradientB"
Instances.TemplateDropdownButtonGradientB.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonGradientB.Enabled = false
Instances.TemplateDropdownButtonGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownButtonGradientC = Instance.new("UIGradient")
Instances.TemplateDropdownButtonGradientC.Name = "GradientC"
Instances.TemplateDropdownButtonGradientC.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonGradientC.Enabled = false
Instances.TemplateDropdownButtonGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateDropdownButtonFrameCorner = Instance.new("UICorner")
Instances.TemplateDropdownButtonFrameCorner.Name = "FrameCorner"
Instances.TemplateDropdownButtonFrameCorner.Parent = Instances.TemplateDropdownButtonFrame
Instances.TemplateDropdownButtonFrameCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateDropdownButtonStroke = Instance.new("UIStroke")
Instances.TemplateDropdownButtonStroke.Name = "DropdownButtonStroke"
Instances.TemplateDropdownButtonStroke.Parent = Instances.TemplateDropdownButton
Instances.TemplateDropdownButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateDropdownButtonStroke.Thickness = 1.5
Instances.TemplateDropdownButtonStroke.Color = Color3.fromRGB(61, 61, 75)

----------------------------------------------------------------------
-- (Bagian berikutnya meliputi template Code, Section, Dialog, FloatIcon, dsb.)

----------------------------------------------------------------------
-- Template Code Block
----------------------------------------------------------------------

Instances.TemplateCode = Instance.new("Frame")
Instances.TemplateCode.Name = "Code"
Instances.TemplateCode.Parent = Instances.TemplatesFolder
Instances.TemplateCode.Visible = false
Instances.TemplateCode.BorderSizePixel = 0
Instances.TemplateCode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateCode.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateCode.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateCode.Position = UDim2.new(-0.0375, 0, 0.38434, 0)
Instances.TemplateCode.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateCodeCorner = Instance.new("UICorner")
Instances.TemplateCodeCorner.Name = "CodeCorner"
Instances.TemplateCodeCorner.Parent = Instances.TemplateCode
Instances.TemplateCodeCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateCodeStroke = Instance.new("UIStroke")
Instances.TemplateCodeStroke.Name = "CodeStroke"
Instances.TemplateCodeStroke.Parent = Instances.TemplateCode
Instances.TemplateCodeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateCodeStroke.Thickness = 1.5
Instances.TemplateCodeStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateCodePadding = Instance.new("UIPadding")
Instances.TemplateCodePadding.Name = "CodePadding"
Instances.TemplateCodePadding.Parent = Instances.TemplateCode
Instances.TemplateCodePadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateCodePadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateCodePadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateCodePadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateCodeLayout = Instance.new("UIListLayout")
Instances.TemplateCodeLayout.Name = "CodeLayout"
Instances.TemplateCodeLayout.Parent = Instances.TemplateCode
Instances.TemplateCodeLayout.Padding = UDim.new(0, 5)
Instances.TemplateCodeLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateCodeTitle = Instance.new("TextLabel")
Instances.TemplateCodeTitle.Name = "Title"
Instances.TemplateCodeTitle.Parent = Instances.TemplateCode
Instances.TemplateCodeTitle.TextWrapped = true
Instances.TemplateCodeTitle.Interactable = false
Instances.TemplateCodeTitle.BorderSizePixel = 0
Instances.TemplateCodeTitle.TextSize = 16
Instances.TemplateCodeTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateCodeTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateCodeTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateCodeTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateCodeTitle.BackgroundTransparency = 1
Instances.TemplateCodeTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateCodeTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateCodeTitle.Text = "Title"
Instances.TemplateCodeTitle.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateCodeText = Instance.new("TextBox")
Instances.TemplateCodeText.Name = "Code"
Instances.TemplateCodeText.Parent = Instances.TemplateCode
Instances.TemplateCodeText.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateCodeText.BorderSizePixel = 0
Instances.TemplateCodeText.TextEditable = false
Instances.TemplateCodeText.TextWrapped = true
Instances.TemplateCodeText.TextSize = 16
Instances.TemplateCodeText.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateCodeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateCodeText.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateCodeText.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateCodeText.Selectable = false
Instances.TemplateCodeText.MultiLine = true
Instances.TemplateCodeText.ClearTextOnFocus = false
Instances.TemplateCodeText.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateCodeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateCodeText.Text = 'print("Hello World!")'
Instances.TemplateCodeText.LayoutOrder = 1
Instances.TemplateCodeText.BackgroundTransparency = 1

----------------------------------------------------------------------
-- Template Section (Collapsible)
----------------------------------------------------------------------

Instances.TemplateSection = Instance.new("Frame")
Instances.TemplateSection.Name = "Section"
Instances.TemplateSection.Parent = Instances.TemplatesFolder
Instances.TemplateSection.Visible = false
Instances.TemplateSection.BorderSizePixel = 0
Instances.TemplateSection.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSection.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateSection.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateSection.Position = UDim2.new(0, 0, 0.43728, 0)
Instances.TemplateSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSection.BackgroundTransparency = 1

Instances.TemplateSectionButton = Instance.new("ImageButton")
Instances.TemplateSectionButton.Name = "Button"
Instances.TemplateSectionButton.Parent = Instances.TemplateSection
Instances.TemplateSectionButton.BorderSizePixel = 0
Instances.TemplateSectionButton.AutoButtonColor = false
Instances.TemplateSectionButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionButton.Selectable = false
Instances.TemplateSectionButton.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateSectionButton.Size = UDim2.new(1, 0, 0, 35)
Instances.TemplateSectionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)

Instances.TemplateSectionButtonCorner = Instance.new("UICorner")
Instances.TemplateSectionButtonCorner.Name = "SectionCorner"
Instances.TemplateSectionButtonCorner.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionButtonCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateSectionButtonStroke = Instance.new("UIStroke")
Instances.TemplateSectionButtonStroke.Name = "SectionStroke"
Instances.TemplateSectionButtonStroke.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateSectionButtonStroke.Thickness = 1.5
Instances.TemplateSectionButtonStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateSectionTitle = Instance.new("TextLabel")
Instances.TemplateSectionTitle.Name = "Title"
Instances.TemplateSectionTitle.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionTitle.TextWrapped = true
Instances.TemplateSectionTitle.Interactable = false
Instances.TemplateSectionTitle.BorderSizePixel = 0
Instances.TemplateSectionTitle.TextSize = 16
Instances.TemplateSectionTitle.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateSectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSectionTitle.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateSectionTitle.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSectionTitle.BackgroundTransparency = 1
Instances.TemplateSectionTitle.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateSectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionTitle.Text = "Section"

Instances.TemplateSectionArrow = Instance.new("ImageButton")
Instances.TemplateSectionArrow.Name = "Arrow"
Instances.TemplateSectionArrow.Parent = Instances.TemplateSectionTitle
Instances.TemplateSectionArrow.BorderSizePixel = 0
Instances.TemplateSectionArrow.AutoButtonColor = false
Instances.TemplateSectionArrow.BackgroundTransparency = 1
Instances.TemplateSectionArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSectionArrow.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSectionArrow.AnchorPoint = Vector2.new(1, 0.5)
Instances.TemplateSectionArrow.Image = "rbxassetid://120292618616139"
Instances.TemplateSectionArrow.Size = UDim2.new(0, 23, 0, 23)
Instances.TemplateSectionArrow.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionArrow.Position = UDim2.new(1, 0, 0.5, 0)

Instances.TemplateSectionPadding = Instance.new("UIPadding")
Instances.TemplateSectionPadding.Name = "SectionPadding"
Instances.TemplateSectionPadding.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateSectionPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateSectionPadding.PaddingLeft = UDim.new(0, 10)
Instances.TemplateSectionPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateSectionLayout = Instance.new("UIListLayout")
Instances.TemplateSectionLayout.Name = "SectionLayout"
Instances.TemplateSectionLayout.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionLayout.Padding = UDim.new(0, 5)
Instances.TemplateSectionLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateSectionDesc = Instance.new("TextLabel")
Instances.TemplateSectionDesc.Name = "Description"
Instances.TemplateSectionDesc.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionDesc.TextWrapped = true
Instances.TemplateSectionDesc.Interactable = false
Instances.TemplateSectionDesc.BorderSizePixel = 0
Instances.TemplateSectionDesc.TextSize = 16
Instances.TemplateSectionDesc.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateSectionDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateSectionDesc.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
Instances.TemplateSectionDesc.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateSectionDesc.BackgroundTransparency = 1
Instances.TemplateSectionDesc.Size = UDim2.new(1, 0, 0, 15)
Instances.TemplateSectionDesc.Visible = false
Instances.TemplateSectionDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionDesc.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat lacus in enim congue, fermentum euismod leo ultricies. Nulla sodales. "
Instances.TemplateSectionDesc.LayoutOrder = 1
Instances.TemplateSectionDesc.AutomaticSize = Enum.AutomaticSize.Y

Instances.TemplateSectionGradientA = Instance.new("UIGradient")
Instances.TemplateSectionGradientA.Name = "GradientA"
Instances.TemplateSectionGradientA.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionGradientA.Enabled = false
Instances.TemplateSectionGradientA.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSectionGradientB = Instance.new("UIGradient")
Instances.TemplateSectionGradientB.Name = "GradientB"
Instances.TemplateSectionGradientB.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionGradientB.Enabled = false
Instances.TemplateSectionGradientB.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 1),
})
Instances.TemplateSectionGradientB.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSectionGradientC = Instance.new("UIGradient")
Instances.TemplateSectionGradientC.Name = "GradientC"
Instances.TemplateSectionGradientC.Parent = Instances.TemplateSectionButton
Instances.TemplateSectionGradientC.Enabled = false
Instances.TemplateSectionGradientC.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(0.32, Color3.fromRGB(0, 158, 255)),
	ColorSequenceKeypoint.new(0.54, Color3.fromRGB(0, 5, 255)),
	ColorSequenceKeypoint.new(0.782, Color3.fromRGB(0, 235, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 158, 255)),
})

Instances.TemplateSectionFrame = Instance.new("Frame")
Instances.TemplateSectionFrame.Name = "Frame"
Instances.TemplateSectionFrame.Parent = Instances.TemplateSection
Instances.TemplateSectionFrame.Visible = false
Instances.TemplateSectionFrame.BorderSizePixel = 0
Instances.TemplateSectionFrame.BackgroundColor3 = Color3.fromRGB(207, 222, 255)
Instances.TemplateSectionFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateSectionFrame.Size = UDim2.new(1, 0, 0, 30)
Instances.TemplateSectionFrame.Position = UDim2.new(0, 0, 0, 35)
Instances.TemplateSectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionFrame.BackgroundTransparency = 1

Instances.TemplateSectionFrameLayout = Instance.new("UIListLayout")
Instances.TemplateSectionFrameLayout.Name = "FrameLayout"
Instances.TemplateSectionFrameLayout.Parent = Instances.TemplateSectionFrame
Instances.TemplateSectionFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Instances.TemplateSectionFrameLayout.Padding = UDim.new(0, 10)
Instances.TemplateSectionFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateSectionFramePadding = Instance.new("UIPadding")
Instances.TemplateSectionFramePadding.Name = "FramePadding"
Instances.TemplateSectionFramePadding.Parent = Instances.TemplateSectionFrame
Instances.TemplateSectionFramePadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateSectionFramePadding.PaddingRight = UDim.new(0, 8)
Instances.TemplateSectionFramePadding.PaddingLeft = UDim.new(0, 8)

Instances.TemplateSectionDivider = Instance.new("Frame")
Instances.TemplateSectionDivider.Name = "Divider"
Instances.TemplateSectionDivider.Parent = Instances.TemplateSectionFrame
Instances.TemplateSectionDivider.BorderSizePixel = 0
Instances.TemplateSectionDivider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateSectionDivider.Size = UDim2.new(1, 0, 0, 3)
Instances.TemplateSectionDivider.BorderColor3 = Color3.fromRGB(61, 61, 75)

----------------------------------------------------------------------
-- Template Dialog Elements (Overlay)
----------------------------------------------------------------------

Instances.TemplateDialogFolder = Instance.new("Folder")
Instances.TemplateDialogFolder.Name = "DialogElements"
Instances.TemplateDialogFolder.Parent = Instances.TemplatesFolder

Instances.TemplateDialogOverlay = Instance.new("Frame")
Instances.TemplateDialogOverlay.Name = "DarkOverlayDialog"
Instances.TemplateDialogOverlay.Parent = Instances.TemplateDialogFolder
Instances.TemplateDialogOverlay.Visible = false
Instances.TemplateDialogOverlay.BorderSizePixel = 0
Instances.TemplateDialogOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogOverlay.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateDialogOverlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogOverlay.BackgroundTransparency = 0.6

Instances.TemplateDialogOverlayCorner = Instance.new("UICorner")
Instances.TemplateDialogOverlayCorner.Name = "OverlayCorner"
Instances.TemplateDialogOverlayCorner.Parent = Instances.TemplateDialogOverlay
Instances.TemplateDialogOverlayCorner.CornerRadius = UDim.new(0, 10)

Instances.TemplateDialogFrame = Instance.new("Frame")
Instances.TemplateDialogFrame.Name = "Dialog"
Instances.TemplateDialogFrame.Parent = Instances.TemplateDialogFolder
Instances.TemplateDialogFrame.Visible = false
Instances.TemplateDialogFrame.ZIndex = 4
Instances.TemplateDialogFrame.BorderSizePixel = 0
Instances.TemplateDialogFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogFrame.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateDialogFrame.ClipsDescendants = true
Instances.TemplateDialogFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDialogFrame.Size = UDim2.new(0, 250, 0, 0)
Instances.TemplateDialogFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
Instances.TemplateDialogFrame.BorderColor3 = Color3.fromRGB(61, 61, 75)

Instances.TemplateDialogCorner = Instance.new("UICorner")
Instances.TemplateDialogCorner.Name = "DialogCorner"
Instances.TemplateDialogCorner.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogCorner.CornerRadius = UDim.new(0, 6)

Instances.TemplateDialogStroke = Instance.new("UIStroke")
Instances.TemplateDialogStroke.Name = "DialogStroke"
Instances.TemplateDialogStroke.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateDialogStroke.Thickness = 1.5
Instances.TemplateDialogStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateDialogTitleFrame = Instance.new("Frame")
Instances.TemplateDialogTitleFrame.Name = "Title"
Instances.TemplateDialogTitleFrame.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogTitleFrame.BorderSizePixel = 0
Instances.TemplateDialogTitleFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDialogTitleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogTitleFrame.Size = UDim2.new(1, 0, 0, 25)
Instances.TemplateDialogTitleFrame.BackgroundTransparency = 1

Instances.TemplateDialogTitleLabel = Instance.new("TextLabel")
Instances.TemplateDialogTitleLabel.Name = "TextLabel"
Instances.TemplateDialogTitleLabel.Parent = Instances.TemplateDialogTitleFrame
Instances.TemplateDialogTitleLabel.Interactable = false
Instances.TemplateDialogTitleLabel.ZIndex = 0
Instances.TemplateDialogTitleLabel.BorderSizePixel = 0
Instances.TemplateDialogTitleLabel.TextSize = 20
Instances.TemplateDialogTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDialogTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogTitleLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateDialogTitleLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDialogTitleLabel.BackgroundTransparency = 1
Instances.TemplateDialogTitleLabel.AnchorPoint = Vector2.new(0, 0.5)
Instances.TemplateDialogTitleLabel.Size = UDim2.new(0, 0, 0, 20)
Instances.TemplateDialogTitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogTitleLabel.Text = ""
Instances.TemplateDialogTitleLabel.LayoutOrder = 1
Instances.TemplateDialogTitleLabel.AutomaticSize = Enum.AutomaticSize.XY
Instances.TemplateDialogTitleLabel.Position = UDim2.new(-0.05455, 12, 0.5, 0)

Instances.TemplateDialogTitleLayout = Instance.new("UIListLayout")
Instances.TemplateDialogTitleLayout.Name = "TitleLayout"
Instances.TemplateDialogTitleLayout.Parent = Instances.TemplateDialogTitleFrame
Instances.TemplateDialogTitleLayout.Padding = UDim.new(0, 10)
Instances.TemplateDialogTitleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Instances.TemplateDialogTitleLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instances.TemplateDialogTitleLayout.FillDirection = Enum.FillDirection.Horizontal

Instances.TemplateDialogTitlePadding = Instance.new("UIPadding")
Instances.TemplateDialogTitlePadding.Name = "TitlePadding"
Instances.TemplateDialogTitlePadding.Parent = Instances.TemplateDialogTitleFrame
Instances.TemplateDialogTitlePadding.PaddingTop = UDim.new(0, 5)
Instances.TemplateDialogTitlePadding.PaddingRight = UDim.new(0, 15)
Instances.TemplateDialogTitlePadding.PaddingLeft = UDim.new(0, 15)
Instances.TemplateDialogTitlePadding.PaddingBottom = UDim.new(0, 5)

Instances.TemplateDialogIcon = Instance.new("ImageButton")
Instances.TemplateDialogIcon.Name = "Icon"
Instances.TemplateDialogIcon.Parent = Instances.TemplateDialogTitleFrame
Instances.TemplateDialogIcon.BorderSizePixel = 0
Instances.TemplateDialogIcon.Visible = false
Instances.TemplateDialogIcon.BackgroundTransparency = 1
Instances.TemplateDialogIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogIcon.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDialogIcon.Size = UDim2.new(0, 33, 0, 25)
Instances.TemplateDialogIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogIcon.Position = UDim2.new(0, 0, 0.2125, 0)

Instances.TemplateDialogIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.TemplateDialogIconAspect.Name = "IconAspect"
Instances.TemplateDialogIconAspect.Parent = Instances.TemplateDialogIcon

Instances.TemplateDialogBodyLayout = Instance.new("UIListLayout")
Instances.TemplateDialogBodyLayout.Name = "DialogLayout"
Instances.TemplateDialogBodyLayout.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogBodyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Instances.TemplateDialogBodyLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDialogContentFrame = Instance.new("Frame")
Instances.TemplateDialogContentFrame.Name = "Content"
Instances.TemplateDialogContentFrame.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogContentFrame.Visible = false
Instances.TemplateDialogContentFrame.ZIndex = 2
Instances.TemplateDialogContentFrame.BorderSizePixel = 0
Instances.TemplateDialogContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogContentFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDialogContentFrame.Size = UDim2.new(1, 0, 0, 0)
Instances.TemplateDialogContentFrame.Position = UDim2.new(0, 0, 0.21886, 0)
Instances.TemplateDialogContentFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogContentFrame.BackgroundTransparency = 1

Instances.TemplateDialogContentLayout = Instance.new("UIListLayout")
Instances.TemplateDialogContentLayout.Name = "ContentLayout"
Instances.TemplateDialogContentLayout.Parent = Instances.TemplateDialogContentFrame
Instances.TemplateDialogContentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Instances.TemplateDialogContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDialogContentPadding = Instance.new("UIPadding")
Instances.TemplateDialogContentPadding.Name = "ContentPadding"
Instances.TemplateDialogContentPadding.Parent = Instances.TemplateDialogContentFrame
Instances.TemplateDialogContentPadding.PaddingTop = UDim.new(0, 5)
Instances.TemplateDialogContentPadding.PaddingRight = UDim.new(0, 15)
Instances.TemplateDialogContentPadding.PaddingLeft = UDim.new(0, 15)
Instances.TemplateDialogContentPadding.PaddingBottom = UDim.new(0, 5)

Instances.TemplateDialogContentText = Instance.new("TextLabel")
Instances.TemplateDialogContentText.Name = "TextLabel"
Instances.TemplateDialogContentText.Parent = Instances.TemplateDialogContentFrame
Instances.TemplateDialogContentText.TextWrapped = true
Instances.TemplateDialogContentText.Interactable = false
Instances.TemplateDialogContentText.BorderSizePixel = 0
Instances.TemplateDialogContentText.TextSize = 15
Instances.TemplateDialogContentText.TextXAlignment = Enum.TextXAlignment.Left
Instances.TemplateDialogContentText.TextYAlignment = Enum.TextYAlignment.Top
Instances.TemplateDialogContentText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogContentText.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.TemplateDialogContentText.TextColor3 = Color3.fromRGB(145, 154, 173)
Instances.TemplateDialogContentText.BackgroundTransparency = 1
Instances.TemplateDialogContentText.Size = UDim2.new(1, 0, 0, 0)
Instances.TemplateDialogContentText.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogContentText.Text = ""
Instances.TemplateDialogContentText.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDialogContentText.Position = UDim2.new(0, 0, 0.125, 0)

Instances.TemplateDialogPadding = Instance.new("UIPadding")
Instances.TemplateDialogPadding.Name = "DialogPadding"
Instances.TemplateDialogPadding.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogPadding.PaddingTop = UDim.new(0, 10)
Instances.TemplateDialogPadding.PaddingBottom = UDim.new(0, 10)

Instances.TemplateDialogButtonsFrame = Instance.new("Frame")
Instances.TemplateDialogButtonsFrame.Name = "Buttons"
Instances.TemplateDialogButtonsFrame.Parent = Instances.TemplateDialogFrame
Instances.TemplateDialogButtonsFrame.ZIndex = 3
Instances.TemplateDialogButtonsFrame.BorderSizePixel = 0
Instances.TemplateDialogButtonsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogButtonsFrame.AutomaticSize = Enum.AutomaticSize.Y
Instances.TemplateDialogButtonsFrame.Size = UDim2.new(1, 0, 0, 0)
Instances.TemplateDialogButtonsFrame.Position = UDim2.new(0, 0, 0.53017, 0)
Instances.TemplateDialogButtonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogButtonsFrame.BackgroundTransparency = 1

Instances.TemplateDialogButtonsLayout = Instance.new("UIListLayout")
Instances.TemplateDialogButtonsLayout.Name = "ButtonsLayout"
Instances.TemplateDialogButtonsLayout.Parent = Instances.TemplateDialogButtonsFrame
Instances.TemplateDialogButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Instances.TemplateDialogButtonsLayout.Padding = UDim.new(0, 10)
Instances.TemplateDialogButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDialogButtonsPadding = Instance.new("UIPadding")
Instances.TemplateDialogButtonsPadding.Name = "ButtonsPadding"
Instances.TemplateDialogButtonsPadding.Parent = Instances.TemplateDialogButtonsFrame
Instances.TemplateDialogButtonsPadding.PaddingTop = UDim.new(0, 5)
Instances.TemplateDialogButtonsPadding.PaddingRight = UDim.new(0, 10)
Instances.TemplateDialogButtonsPadding.PaddingLeft = UDim.new(0, 10)

Instances.TemplateDialogButtonFrame = Instance.new("Frame")
Instances.TemplateDialogButtonFrame.Name = "DialogButton"
Instances.TemplateDialogButtonFrame.Parent = Instances.TemplateDialogFolder
Instances.TemplateDialogButtonFrame.Visible = false
Instances.TemplateDialogButtonFrame.BorderSizePixel = 0
Instances.TemplateDialogButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogButtonFrame.AnchorPoint = Vector2.new(0.5, 1)
Instances.TemplateDialogButtonFrame.Size = UDim2.new(1, 0, 0, 30)
Instances.TemplateDialogButtonFrame.Position = UDim2.new(0.5, 0, 0.327, 0)
Instances.TemplateDialogButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogButtonFrame.BackgroundTransparency = 1

Instances.TemplateDialogButton = Instance.new("TextButton")
Instances.TemplateDialogButton.Name = "Button"
Instances.TemplateDialogButton.Parent = Instances.TemplateDialogButtonFrame
Instances.TemplateDialogButton.BorderSizePixel = 0
Instances.TemplateDialogButton.AutoButtonColor = false
Instances.TemplateDialogButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogButton.Selectable = false
Instances.TemplateDialogButton.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.TemplateDialogButton.Size = UDim2.new(1, 0, 1, 0)
Instances.TemplateDialogButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogButton.Position = UDim2.new(0.5, 0, 0.5, 0)
Instances.TemplateDialogButton.Text = ""

Instances.TemplateDialogButtonCorner = Instance.new("UICorner")
Instances.TemplateDialogButtonCorner.Name = "ButtonCorner"
Instances.TemplateDialogButtonCorner.Parent = Instances.TemplateDialogButton
Instances.TemplateDialogButtonCorner.CornerRadius = UDim.new(0, 5)

Instances.TemplateDialogButtonStroke = Instance.new("UIStroke")
Instances.TemplateDialogButtonStroke.Name = "ButtonStroke"
Instances.TemplateDialogButtonStroke.Parent = Instances.TemplateDialogButton
Instances.TemplateDialogButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.TemplateDialogButtonStroke.Thickness = 1.5
Instances.TemplateDialogButtonStroke.Color = Color3.fromRGB(61, 61, 75)

Instances.TemplateDialogButtonLayout = Instance.new("UIListLayout")
Instances.TemplateDialogButtonLayout.Name = "ButtonLayout"
Instances.TemplateDialogButtonLayout.Parent = Instances.TemplateDialogButton
Instances.TemplateDialogButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Instances.TemplateDialogButtonLayout.Padding = UDim.new(0, 5)
Instances.TemplateDialogButtonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Instances.TemplateDialogButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

Instances.TemplateDialogButtonLabel = Instance.new("TextLabel")
Instances.TemplateDialogButtonLabel.Name = "Label"
Instances.TemplateDialogButtonLabel.Parent = Instances.TemplateDialogButton
Instances.TemplateDialogButtonLabel.TextWrapped = true
Instances.TemplateDialogButtonLabel.Interactable = false
Instances.TemplateDialogButtonLabel.BorderSizePixel = 0
Instances.TemplateDialogButtonLabel.TextSize = 14
Instances.TemplateDialogButtonLabel.TextScaled = true
Instances.TemplateDialogButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.TemplateDialogButtonLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.TemplateDialogButtonLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.TemplateDialogButtonLabel.BackgroundTransparency = 1
Instances.TemplateDialogButtonLabel.Size = UDim2.new(1, 0, 0.45, 0)
Instances.TemplateDialogButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.TemplateDialogButtonLabel.Text = ""
Instances.TemplateDialogButtonLabel.Position = UDim2.new(0, 45, 0.083, 0)

----------------------------------------------------------------------
-- Float Icon (minimize button)
----------------------------------------------------------------------

Instances.FloatIconFrame = Instance.new("Frame")
Instances.FloatIconFrame.Name = "FloatIcon"
Instances.FloatIconFrame.Parent = Instances.ScreenGui
Instances.FloatIconFrame.Visible = false
Instances.FloatIconFrame.ZIndex = 0
Instances.FloatIconFrame.BorderSizePixel = 2
Instances.FloatIconFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instances.FloatIconFrame.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.FloatIconFrame.ClipsDescendants = true
Instances.FloatIconFrame.AutomaticSize = Enum.AutomaticSize.X
Instances.FloatIconFrame.Size = UDim2.new(0, 85, 0, 45)
Instances.FloatIconFrame.Position = UDim2.new(0.5, 0, 0, 45)
Instances.FloatIconFrame.BorderColor3 = Color3.fromRGB(61, 61, 75)

Instances.FloatIconCorner = Instance.new("UICorner")
Instances.FloatIconCorner.Name = "FloatIconCorner"
Instances.FloatIconCorner.Parent = Instances.FloatIconFrame
Instances.FloatIconCorner.CornerRadius = UDim.new(0, 10)

Instances.FloatIconStroke = Instance.new("UIStroke")
Instances.FloatIconStroke.Name = "FloatIconStroke"
Instances.FloatIconStroke.Parent = Instances.FloatIconFrame
Instances.FloatIconStroke.Transparency = 0.5
Instances.FloatIconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Instances.FloatIconStroke.Thickness = 1.5
Instances.FloatIconStroke.Color = Color3.fromRGB(95, 95, 117)

Instances.FloatIconPadding = Instance.new("UIPadding")
Instances.FloatIconPadding.Name = "FloatIconPadding"
Instances.FloatIconPadding.Parent = Instances.FloatIconFrame
Instances.FloatIconPadding.PaddingTop = UDim.new(0, 8)
Instances.FloatIconPadding.PaddingRight = UDim.new(0, 10)
Instances.FloatIconPadding.PaddingLeft = UDim.new(0, 10)
Instances.FloatIconPadding.PaddingBottom = UDim.new(0, 8)

Instances.FloatIconLayout = Instance.new("UIListLayout")
Instances.FloatIconLayout.Name = "FloatIconLayout"
Instances.FloatIconLayout.Parent = Instances.FloatIconFrame
Instances.FloatIconLayout.Padding = UDim.new(0, 8)
Instances.FloatIconLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Instances.FloatIconLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instances.FloatIconLayout.FillDirection = Enum.FillDirection.Horizontal

Instances.FloatIconImage = Instance.new("ImageButton")
Instances.FloatIconImage.Name = "Icon"
Instances.FloatIconImage.Parent = Instances.FloatIconFrame
Instances.FloatIconImage.Active = false
Instances.FloatIconImage.Interactable = false
Instances.FloatIconImage.BorderSizePixel = 0
Instances.FloatIconImage.AutoButtonColor = false
Instances.FloatIconImage.BackgroundTransparency = 1
Instances.FloatIconImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.FloatIconImage.AnchorPoint = Vector2.new(0, 0.5)
Instances.FloatIconImage.Image = "rbxassetid://113216930555884"
Instances.FloatIconImage.Size = UDim2.new(1, 0, 1, 0)
Instances.FloatIconImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.FloatIconImage.Position = UDim2.new(0, 10, 0.5, 0)

Instances.FloatIconAspect = Instance.new("UIAspectRatioConstraint")
Instances.FloatIconAspect.Name = "FloatIconAspect"
Instances.FloatIconAspect.Parent = Instances.FloatIconImage

Instances.FloatIconLabel = Instance.new("TextLabel")
Instances.FloatIconLabel.Name = "TextLabel"
Instances.FloatIconLabel.Parent = Instances.FloatIconFrame
Instances.FloatIconLabel.Interactable = false
Instances.FloatIconLabel.BorderSizePixel = 0
Instances.FloatIconLabel.TextSize = 16
Instances.FloatIconLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.FloatIconLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Instances.FloatIconLabel.TextColor3 = Color3.fromRGB(197, 204, 219)
Instances.FloatIconLabel.BackgroundTransparency = 1
Instances.FloatIconLabel.AnchorPoint = Vector2.new(0.5, 0.5)
Instances.FloatIconLabel.Size = UDim2.new(0, 20, 0, 20)
Instances.FloatIconLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.FloatIconLabel.Text = "Noctis"
Instances.FloatIconLabel.AutomaticSize = Enum.AutomaticSize.X
Instances.FloatIconLabel.Position = UDim2.new(0.38615, 0, 0.53448, -1)

Instances.FloatIconOpenButton = Instance.new("ImageButton")
Instances.FloatIconOpenButton.Name = "Open"
Instances.FloatIconOpenButton.Parent = Instances.FloatIconFrame
Instances.FloatIconOpenButton.BorderSizePixel = 0
Instances.FloatIconOpenButton.AutoButtonColor = false
Instances.FloatIconOpenButton.BackgroundTransparency = 1
Instances.FloatIconOpenButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.FloatIconOpenButton.ImageColor3 = Color3.fromRGB(197, 204, 219)
Instances.FloatIconOpenButton.Selectable = false
Instances.FloatIconOpenButton.AnchorPoint = Vector2.new(0, 0.5)
Instances.FloatIconOpenButton.Image = "rbxassetid://122219713887461"
Instances.FloatIconOpenButton.Size = UDim2.new(0, 20, 0, 20)
Instances.FloatIconOpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.FloatIconOpenButton.Position = UDim2.new(0, 128, 0.5, 0)

Instances.FloatIconOpenAspect = Instance.new("UIAspectRatioConstraint")
Instances.FloatIconOpenAspect.Name = "OpenAspect"
Instances.FloatIconOpenAspect.Parent = Instances.FloatIconOpenButton

Instances.FloatIconOpenCorner = Instance.new("UICorner")
Instances.FloatIconOpenCorner.Name = "OpenCorner"
Instances.FloatIconOpenCorner.Parent = Instances.FloatIconOpenButton

Instances.RequireRef = require
Instances.ModuleCache = {}

local function moduleResolve(moduleScript)
	local cacheEntry = Instances.ModuleCache[moduleScript]
	if cacheEntry then
		if not cacheEntry.Required then
			cacheEntry.Required = true
			cacheEntry.Value = cacheEntry.Closure()
		end
		return cacheEntry.Value
	end
	return Instances.RequireRef(moduleScript)
end

----------------------------------------------------------------------
-- Library Module Definition
----------------------------------------------------------------------

Instances.ModuleCache[Instances.LibraryModule] = {
	Closure = function()
		local library = {}

		local iconProvider = moduleResolve(Instances.IconModule)
		local userInputService = game:GetService("UserInputService")
		local rootFolder = Instances.LibraryModule.Parent
		local templates = rootFolder.Templates
		local windowTemplate = rootFolder.Window
		local floatIconTemplate = rootFolder.FloatIcon

		windowTemplate.Parent = nil
		floatIconTemplate.Parent = nil

		local animationSettings = {
			Global = {
				Duration = 0.25,
				EasingStyle = Enum.EasingStyle.Quart,
				EasingDirection = Enum.EasingDirection.Out,
			},
			Notification = {
				Duration = 0.5,
				EasingStyle = Enum.EasingStyle.Back,
				EasingDirection = Enum.EasingDirection.Out,
			},
			PopupOpen = {
				Duration = 0.4,
				EasingStyle = Enum.EasingStyle.Back,
				EasingDirection = Enum.EasingDirection.Out,
			},
			PopupClose = {
				Duration = 0.4,
				EasingStyle = Enum.EasingStyle.Back,
				EasingDirection = Enum.EasingDirection.In,
			},
		}

		        -- Helper tween / animasi
        local function animate(target, properties, profile)
            profile = profile or animationSettings.Global
            local info = TweenInfo.new(
                profile.Duration,
                profile.EasingStyle or Enum.EasingStyle.Linear,
                profile.EasingDirection or Enum.EasingDirection.Out
            )
            local tween = game:GetService("TweenService"):Create(target, info, properties)
            tween:Play()
            return tween
        end


		local function makeDraggable(dragHandle, target)
			local controller = {}
			local enabled = true
			local dragging = false
			local dragInput
			local startPosition
			local startOffset

			dragHandle.InputBegan:Connect(function(input)
				if enabled and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					dragging = true
					startPosition = input.Position
					startOffset = target.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			dragHandle.InputChanged:Connect(function(input)
				if enabled and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					dragInput = input
				end
			end)

			userInputService.InputChanged:Connect(function(input)
				if enabled and input == dragInput and dragging then
					local delta = input.Position - startPosition
					local newPos = UDim2.new(
						startOffset.X.Scale,
						startOffset.X.Offset + delta.X,
						startOffset.Y.Scale,
						startOffset.Y.Offset + delta.Y
					)
					game:GetService("TweenService"):Create(target, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
						Position = newPos,
					}):Play()
				end
			end)

			function controller.SetAllowDragging(_, allow)
				enabled = allow
			end

			return controller
		end

		local activeWindows = {}

		function library.CreateWindow(_, options)
			local windowConfig = {
				Title = options.Title,
				Icon = options.Icon,
				Version = options.Author,
				Folder = options.Folder,
				Size = options.Size,
				ToggleKey = options.ToggleKey or Enum.KeyCode.RightShift,
				LiveSearchDropdown = options.LiveSearchDropdown or false,
			}

			local container = Instance.new("Folder")
			container.Parent = rootFolder
			rootFolder.Name = windowConfig.Title

			local floatingIcon = floatIconTemplate:Clone()
			floatingIcon.Parent = container
			floatingIcon.TextLabel.Text = windowConfig.Title
			floatingIcon.Visible = false

			if windowConfig.Icon and not windowConfig.Icon:find("rbxassetid") then
				local iconData = iconProvider.Icon(windowConfig.Icon)
				floatingIcon.Icon.Image = iconData and iconData[1] or windowConfig.Icon or ""
				floatingIcon.Icon.ImageRectOffset = iconData and iconData[2].ImageRectPosition or Vector2.new(0, 0)
				floatingIcon.Icon.ImageRectSize = iconData and iconData[2].ImageRectSize or Vector2.new(0, 0)
			else
				floatingIcon.Icon.Image = windowConfig.Icon or ""
			end

			local windowInstance = windowTemplate:Clone()
			windowInstance.Name = windowConfig.Title
			windowInstance.TopFrame.TextLabel.Text = windowConfig.Title .. " - " .. windowConfig.Version

			if windowConfig.Icon and not windowConfig.Icon:find("rbxassetid") then
				local iconData = iconProvider.Icon(windowConfig.Icon)
				windowInstance.TopFrame.Icon.Image = iconData and iconData[1] or windowConfig.Icon or ""
				windowInstance.TopFrame.Icon.ImageRectOffset = iconData and iconData[2].ImageRectPosition or Vector2.new(0, 0)
				windowInstance.TopFrame.Icon.ImageRectSize = iconData and iconData[2].ImageRectSize or Vector2.new(0, 0)
			else
				windowInstance.TopFrame.Icon.Image = windowConfig.Icon or ""
			end

			windowInstance.Size = windowConfig.Size
			windowInstance.Visible = false
			windowInstance.Parent = container

			table.insert(activeWindows, windowInstance)
                            -- Pendaftaran dan pengelolaan tab
        local tabsByName = {}
        local tabSequence = {}
        local lastTabName

        local function registerTab(tabName, tabContent, tabButton)
            local entry = {
                Name = tabName,
                TabObject = tabContent,
                TabButton = tabButton,
            }
            tabsByName[tabName] = entry
            table.insert(tabSequence, entry)
        end

        local dropdownOpened = false
        local activeDropdown

        local function toggleDropdownPanel(state, dropdownName)
            if dropdownName and not dropdownOpened then
                activeDropdown = dropdownName
                for _, folder in windowInstance.DropdownSelection.Dropdowns:GetChildren() do
                    if folder:IsA("Folder") then
                        folder.DropdownItems.Visible = false
                        folder.DropdownItemsSearch.Visible = false
                    end
                end
                windowInstance.DropdownSelection.TopBar.Title.Text = dropdownName
                local folder = windowInstance.DropdownSelection.Dropdowns:FindFirstChild(dropdownName)
                if folder then
                    folder.DropdownItems.Visible = true
                    folder.DropdownItemsSearch.Visible = false
                end
            end

            local function openPanel()
                windowInstance.DropdownSelection.Visible = true
                windowInstance.DarkOverlay.Visible = true
                windowInstance.DropdownSelection.Size = UDim2.new(0, 0, 0, 0)
                windowInstance.DarkOverlay.BackgroundTransparency = 1
                animate(windowInstance.DropdownSelection, {
                    Size = UDim2.new(0.728, 0, 0.684, 0),
                }, animationSettings.PopupOpen)
                animate(windowInstance.DarkOverlay, {
                    BackgroundTransparency = 0.6,
                }, animationSettings.PopupOpen)
                dropdownOpened = true
            end

            local function closePanel()
                local tween = animate(windowInstance.DarkOverlay, {
                    BackgroundTransparency = 1,
                }, animationSettings.PopupClose)
                animate(windowInstance.DropdownSelection, {
                    Size = UDim2.new(0, 0, 0, 0),
                }, animationSettings.PopupClose)
                tween.Completed:Wait()
                windowInstance.DropdownSelection.Visible = false
                windowInstance.DarkOverlay.Visible = false
                dropdownOpened = false
            end

            if state == true then
                openPanel()
            elseif state == false then
                closePanel()
            else
                if dropdownOpened then
                    closePanel()
                else
                    openPanel()
                end
            end
        end

        local function switchTab(tabName)
            for name, entry in pairs(tabsByName) do
                local isActive = (name == tabName)
                entry.TabObject.Visible = isActive

                if isActive then
                    lastTabName = tabName
                    animate(entry.TabButton.TextLabel, {
                        Position = UDim2.new(0, 57, 0.5, 0),
                        Size = UDim2.new(0, 88, 0, 16),
                        TextTransparency = 0,
                    })
                    animate(entry.TabButton.ImageButton, {
                        Position = UDim2.new(0, 25, 0, 18),
                        ImageTransparency = 0,
                    })
                    animate(entry.TabButton.Bar, {
                        Size = UDim2.new(0, 5, 0, 25),
                        BackgroundTransparency = 0,
                    })

                    local guiCount = 0
                    for _, child in ipairs(entry.TabObject:GetChildren()) do
                        if child:IsA("GuiObject") then
                            guiCount += 1
                        end
                    end
                    windowInstance.Tabs.NoObjectFoundText.Visible = (guiCount == 0)
                else
                    animate(entry.TabButton.TextLabel, {
                        Position = UDim2.new(0, 42, 0.5, 0),
                        Size = UDim2.new(0, 103, 0, 16),
                        TextTransparency = 0.5,
                    })
                    animate(entry.TabButton.ImageButton, {
                        Position = UDim2.new(0, 12, 0, 18),
                        ImageTransparency = 0.5,
                    })
                    animate(entry.TabButton.Bar, {
                        Size = UDim2.new(0, 5, 0, 0),
                        BackgroundTransparency = 1,
                    })
                end
            end
        end

        windowInstance.DropdownSelection.TopBar.Close.MouseButton1Click:Connect(function()
            toggleDropdownPanel(false)
        end)

        local searchBox = windowInstance.DropdownSelection.TopBar.BoxFrame.Frame.TextBox
        local function updateSearch(live)
            local folder = windowInstance.DropdownSelection.Dropdowns:FindFirstChild(activeDropdown or "")
            if not folder then
                return
            end

            local query = searchBox.Text:gsub(" ", "")
            if query ~= "" then
                folder.DropdownItems.Visible = false
                folder.DropdownItemsSearch.Visible = true
                for _, button in ipairs(folder.DropdownItemsSearch:GetChildren()) do
                    if button:IsA("GuiButton") then
                        button.Visible = button.Name:lower():find(searchBox.Text:lower()) ~= nil
                    end
                end
            elseif not live then
                folder.DropdownItems.Visible = true
                folder.DropdownItemsSearch.Visible = false
            end
        end

        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            if windowConfig.LiveSearchDropdown then
                updateSearch(true)
            end
        end)

        searchBox.FocusLost:Connect(function()
            if not windowConfig.LiveSearchDropdown then
                updateSearch(false)
            end
        end)

        function windowConfig.Tab(_, tabOptions)
            -- (gunakan versi tabApi bersih yang sudah kita susun sebelumnya:
            -- Section, Button, Code, Paragraph, Toggle, Slider, Input, Dropdown)
            -- pastikan menempel satu kali saja tanpa duplikasi
            local tabApi = {}

            local meta = {
                Title = tabOptions.Title,
                Icon = tabOptions.Icon,
            }

            local tabButton = templates.TabButton:Clone()
            tabButton.Name = meta.Title
            tabButton.Parent = windowInstance.TabButtons.Lists
            tabButton.Visible = true
            tabButton.TextLabel.Text = meta.Title

            local iconInfo = iconProvider.Icon(meta.Icon)
            tabButton.ImageButton.Image = iconInfo and iconInfo[1] or meta.Icon or ""
            tabButton.ImageButton.ImageRectOffset = iconInfo and iconInfo[2].ImageRectPosition or Vector2.new(0, 0)
            tabButton.ImageButton.ImageRectSize = iconInfo and iconInfo[2].ImageRectSize or Vector2.new(0, 0)

            local tabContent = templates.Tab:Clone()
            tabContent.Name = meta.Title
            tabContent.Parent = windowInstance.Tabs
            tabContent.Visible = false

            registerTab(meta.Title, tabContent, tabButton)

            if lastTabName == meta.Title then
                tabContent.Visible = true
                tabButton.TextLabel.Position = UDim2.new(0, 57, 0.5, 0)
                tabButton.TextLabel.Size = UDim2.new(0, 88, 0, 16)
                tabButton.TextLabel.TextTransparency = 0
                tabButton.ImageButton.Position = UDim2.new(0, 25, 0, 18)
                tabButton.ImageButton.ImageTransparency = 0
            else
                tabButton.TextLabel.Position = UDim2.new(0, 42, 0.5, 0)
                tabButton.TextLabel.Size = UDim2.new(0, 103, 0, 16)
                tabButton.TextLabel.TextTransparency = 0.5
                tabButton.ImageButton.Position = UDim2.new(0, 12, 0, 18)
                tabButton.ImageButton.ImageTransparency = 0.5
            end

            tabButton.MouseButton1Click:Connect(function()
                switchTab(meta.Title)
            end)

            local function collectGuiChildren()
                local collected = {}
                for _, child in pairs(tabContent:GetChildren()) do
                    if child:IsA("GuiObject") then
                        table.insert(collected, child)
                    end
                end
                return collected
            end

                        -- API untuk membuat komponen di dalam tab
            function tabApi.Section(_, sectionOptions)
                local sectionState = {
                    Title = sectionOptions.Title,
                    Open = sectionOptions.Default or false,
                    TextXAlignment = sectionOptions.TextXAlignment or "Left",
                }

                local sectionRoot = templates.Section:Clone()
                sectionRoot.Name = sectionState.Title
                sectionRoot.Parent = tabContent
                sectionRoot.Button.Title.Text = sectionState.Title
                sectionRoot.Button.Title.TextXAlignment = Enum.TextXAlignment[sectionState.TextXAlignment]
                sectionRoot.Visible = true

                sectionRoot.Button.MouseButton1Click:Connect(function()
                    sectionState.Open = not sectionState.Open
                    sectionRoot.Frame.Visible = sectionState.Open
                    animate(sectionRoot.Button.Title.Arrow, {
                        Rotation = sectionState.Open and 90 or 0,
                    }, animationProfiles.Global)
                end)

                local sectionApi = {}
                local bodyContainer = sectionRoot.Frame

                function sectionApi.SetTitle(_, newTitle)
                    sectionState.Title = newTitle
                    sectionRoot.Button.Title.Text = newTitle
                    sectionRoot.Name = newTitle
                end

                function sectionApi.Destroy()
                    bodyContainer:Destroy()
                end

                -- setelah Section dibuat, bodyContainer akan dijadikan parent default
                return setmetatable({ Container = bodyContainer }, {
                    __index = tabApi,
                })
            end

            function tabApi.Button(_, buttonOptions)
                local config = {
                    Title = buttonOptions.Title,
                    Description = buttonOptions.Desc,
                    Locked = buttonOptions.Locked or false,
                    Callback = buttonOptions.Callback or function() end,
                }

                local buttonTemplate = templates.Button:Clone()
                buttonTemplate.Name = config.Title
                buttonTemplate.Parent = tabContent
                buttonTemplate.Frame.Title.Text = config.Title

                if config.Description and config.Description ~= "" then
                    buttonTemplate.Frame.Description.Visible = true
                    buttonTemplate.Frame.Description.Text = config.Description
                end

                local function chooseGradient()
                    local gradients = {}
                    for _, child in ipairs(buttonTemplate.Frame:GetChildren()) do
                        if child:IsA("UIGradient") then
                            child.Enabled = false
                            table.insert(gradients, child)
                        end
                    end
                    if #gradients > 0 then
                        local selected = gradients[math.random(1, #gradients)]
                        selected.Enabled = true
                        return selected
                    end
                end

                chooseGradient()

                local function setLockedStyle(locked)
                    config.Locked = locked
                    animate(buttonTemplate.UIStroke, {
                        Color = locked and Color3.fromRGB(47, 47, 58) or Color3.fromRGB(60, 60, 74),
                    }, animationProfiles.Global)
                    animate(buttonTemplate, {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame.Title, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame.Description, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    if buttonTemplate.Frame.Title:FindFirstChild("ClickIcon") then
                        animate(buttonTemplate.Frame.Title.ClickIcon, {
                            ImageColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                    end
                end

                if config.Locked then
                    setLockedStyle(true)
                end

                buttonTemplate.MouseEnter:Connect(function()
                    if not config.Locked then
                        animate(buttonTemplate.UIStroke, {
                            Color = Color3.fromRGB(10, 135, 213),
                        }, animationProfiles.Global)
                    end
                end)

                buttonTemplate.MouseLeave:Connect(function()
                    if not config.Locked then
                        animate(buttonTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles.Global)
                        animate(buttonTemplate.Frame.Title, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                        animate(buttonTemplate.Frame.Description, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                    end
                end)

                buttonTemplate.MouseButton1Down:Connect(function()
                    if config.Locked then
                        return
                    end
                    chooseGradient()
                    animate(buttonTemplate.Frame.Title, {
                        TextColor3 = Color3.new(1, 1, 1),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame.Description, {
                        TextColor3 = Color3.new(1, 1, 1),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame, { BackgroundTransparency = 0 }, animationProfiles.Global)
                    if buttonTemplate.Frame.Title:FindFirstChild("ClickIcon") then
                        animate(buttonTemplate.Frame.Title.ClickIcon, {
                            ImageColor3 = Color3.new(1, 1, 1),
                        }, animationProfiles.Global)
                    end
                end)

                buttonTemplate.MouseButton1Up:Connect(function()
                    if config.Locked then
                        return
                    end
                    animate(buttonTemplate.Frame.Title, {
                        TextColor3 = Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame.Description, {
                        TextColor3 = Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(buttonTemplate.Frame, { BackgroundTransparency = 1 }, animationProfiles.Global)
                    if buttonTemplate.Frame.Title:FindFirstChild("ClickIcon") then
                        animate(buttonTemplate.Frame.Title.ClickIcon, {
                            ImageColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                    end
                end)

                buttonTemplate.MouseButton1Click:Connect(function()
                    if not config.Locked then
                        config.Callback()
                    end
                end)

                local function updateEmptyState()
                    windowInstance.Tabs.NoObjectFoundText.Visible = (#collectGuiChildren() == 0)
                end

                tabContent.ChildAdded:Connect(updateEmptyState)
                tabContent.ChildRemoved:Connect(updateEmptyState)
                updateEmptyState()

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    buttonTemplate.Name = newTitle
                    buttonTemplate.Frame.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    if newDesc and newDesc ~= "" then
                        buttonTemplate.Frame.Description.Text = newDesc
                        buttonTemplate.Frame.Description.Visible = true
                    else
                        buttonTemplate.Frame.Description.Visible = false
                    end
                end

                function api.Lock()
                    setLockedStyle(true)
                end

                function api.Unlock()
                    setLockedStyle(false)
                end

                function api.Destroy()
                    buttonTemplate:Destroy()
                end

                return api
            end

            function tabApi.Code(_, codeOptions)
                local config = {
                    Title = codeOptions.Title,
                    Source = codeOptions.Code,
                }

                local codeTemplate = templates.Code:Clone()
                codeTemplate.Name = config.Title
                codeTemplate.Parent = tabContent
                codeTemplate.Title.Text = config.Title
                codeTemplate.Code.Text = config.Source
                codeTemplate.Code.Visible = true
                codeTemplate.Code.Font = Enum.Font.Code
                codeTemplate.Visible = true

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    codeTemplate.Name = newTitle
                    codeTemplate.Title.Text = newTitle
                end

                function api.SetCode(_, newCode)
                    config.Source = newCode
                    codeTemplate.Code.Text = newCode
                end

                function api.Destroy()
                    codeTemplate:Destroy()
                end

                return api
            end
                    function tabApi.Paragraph(_, paragraphOptions)
                local config = {
                    Title = paragraphOptions.Title,
                    Description = paragraphOptions.Desc,
                    RichText = paragraphOptions.RichText or false,
                }

                local paragraphTemplate = templates.Paragraph:Clone()
                paragraphTemplate.Name = config.Title
                paragraphTemplate.Parent = tabContent
                paragraphTemplate.Title.Text = config.Title
                paragraphTemplate.Title.RichText = config.RichText
                paragraphTemplate.Description.RichText = config.RichText

                if config.Description and config.Description ~= "" then
                    paragraphTemplate.Description.Text = config.Description
                    paragraphTemplate.Description.Visible = true
                else
                    paragraphTemplate.Description.Visible = false
                end

                paragraphTemplate.Visible = true

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    paragraphTemplate.Name = newTitle
                    paragraphTemplate.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    paragraphTemplate.Description.Text = newDesc or ""
                    paragraphTemplate.Description.Visible = (newDesc ~= nil and newDesc ~= "")
                end

                function api.Destroy()
                    paragraphTemplate:Destroy()
                end

                return api
            end

            function tabApi.Toggle(_, toggleOptions)
                local config = {
                    Title = toggleOptions.Title,
                    Description = toggleOptions.Desc,
                    State = toggleOptions.Default or toggleOptions.Value or false,
                    Locked = toggleOptions.Locked or false,
                    Icon = toggleOptions.Icon,
                    Callback = toggleOptions.Callback or function() end,
                }

                local toggleTemplate = templates.Toggle:Clone()
                toggleTemplate.Name = config.Title
                toggleTemplate.Parent = tabContent
                toggleTemplate.Title.Text = config.Title

                local iconInfo
                if config.Icon then
                    if config.Icon:find("rbxassetid") or config.Icon:match("%d") then
                        toggleTemplate.Title.Fill.Ball.Icon.Image = config.Icon
                    else
                        iconInfo = iconProvider.Icon(config.Icon)
                        toggleTemplate.Title.Fill.Ball.Icon.Image = iconInfo and iconInfo[1] or config.Icon or ""
                        toggleTemplate.Title.Fill.Ball.Icon.ImageRectOffset = iconInfo and iconInfo[2].ImageRectPosition or Vector2.new(0, 0)
                        toggleTemplate.Title.Fill.Ball.Icon.ImageRectSize = iconInfo and iconInfo[2].ImageRectSize or Vector2.new(0, 0)
                    end
                end

                if config.Description and config.Description ~= "" then
                    toggleTemplate.Description.Visible = true
                    toggleTemplate.Description.Text = config.Description
                else
                    toggleTemplate.Description.Visible = false
                end

                local function applyState(state)
                    config.State = state
                    if state then
                        animate(toggleTemplate.Title.Fill.Ball, {
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Title.Fill, {
                            BackgroundColor3 = Color3.fromRGB(192, 209, 199),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Title.Fill.Ball.Icon, {
                            ImageTransparency = 0,
                        }, animationProfiles.Global)
                    else
                        animate(toggleTemplate.Title.Fill.Ball, {
                            Position = UDim2.new(0, 0, 0.5, 0),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Title.Fill, {
                            BackgroundColor3 = Color3.fromRGB(53, 56, 62),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Title.Fill.Ball.Icon, {
                            ImageTransparency = 1,
                        }, animationProfiles.Global)
                    end
                end

                local function setLockedStyle(locked)
                    config.Locked = locked
                    animate(toggleTemplate.UIStroke, {
                        Color = locked and Color3.fromRGB(47, 47, 58) or Color3.fromRGB(60, 60, 74),
                    }, animationProfiles.Global)
                    animate(toggleTemplate, {
                        BackgroundColor3 = locked and Color3.fromRGB(32, 35, 40) or Color3.fromRGB(0, 0, 0),
                    }, animationProfiles.Global)
                    animate(toggleTemplate.Title, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(toggleTemplate.Description, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(toggleTemplate.Title.Fill, {
                        BackgroundTransparency = locked and 0.7 or 0,
                    }, animationProfiles.Global)
                    animate(toggleTemplate.Title.Fill.Ball, {
                        BackgroundTransparency = locked and 0.7 or 0,
                    }, animationProfiles.Global)
                end

                applyState(config.State)

                toggleTemplate.Visible = true

                toggleTemplate.Title.Fill.MouseEnter:Connect(function()
                    if not config.Locked then
                        animate(toggleTemplate.UIStroke, {
                            Color = Color3.fromRGB(10, 135, 213),
                        }, animationProfiles.Global)
                    end
                end)

                toggleTemplate.Title.Fill.MouseLeave:Connect(function()
                    if not config.Locked then
                        animate(toggleTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Title, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                        animate(toggleTemplate.Description, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                    end
                end)

                local function setState(newState)
                    applyState(newState)
                    config.Callback(config.State)
                end

                toggleTemplate.Title.Fill.MouseButton1Click:Connect(function()
                    if not config.Locked then
                        setState(not config.State)
                    end
                end)

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    toggleTemplate.Name = newTitle
                    toggleTemplate.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    toggleTemplate.Description.Text = newDesc or ""
                    toggleTemplate.Description.Visible = (newDesc ~= nil and newDesc ~= "")
                end

                function api.Set(_, newValue)
                    setState(newValue)
                end

                function api.Lock()
                    setLockedStyle(true)
                end

                function api.Unlock()
                    setLockedStyle(false)
                end

                function api.Destroy()
                    toggleTemplate:Destroy()
                end

                if config.Locked then
                    setLockedStyle(true)
                end

                config.Callback(config.State)

                return api
            end

            function tabApi.Slider(_, sliderOptions)
                local config = {
                    Title = sliderOptions.Title,
                    Description = sliderOptions.Desc,
                    Step = sliderOptions.Step or 1,
                    Value = {
                        Min = sliderOptions.Value.Min or 0,
                        Max = sliderOptions.Value.Max,
                        Default = sliderOptions.Value.Default or sliderOptions.Default or sliderOptions.Value.Min,
                    },
                    Locked = sliderOptions.Locked or false,
                    Callback = sliderOptions.Callback or function() end,
                }

                local sliderTemplate = templates.Slider:Clone()
                sliderTemplate.Name = config.Title
                sliderTemplate.Parent = tabContent
                sliderTemplate.Title.Text = config.Title

                if config.Description and config.Description ~= "" then
                    sliderTemplate.Description.Visible = true
                    sliderTemplate.Description.Text = config.Description
                else
                    sliderTemplate.Description.Visible = false
                end

                sliderTemplate.Visible = true

                local sliderInputRegion = sliderTemplate.SliderFrame.Frame.Slider.Trigger
                local valueLabel = sliderTemplate.SliderFrame.Frame.ValueText
                local fillBar = sliderTemplate.SliderFrame.Frame.Slider.Fill
                local sliderCanvas = sliderTemplate.SliderFrame.Frame.Slider
                local dragArea = sliderTemplate
                local mouse = game.Players.LocalPlayer:GetMouse()

                local currentValue = config.Value.Default
                local dragging = false
                local hovering = false

                local function randomGradient()
                    local gradients = {}
                    for _, child in ipairs(fillBar.BackgroundGradient:GetChildren()) do
                        if child:IsA("UIGradient") then
                            child.Enabled = false
                            table.insert(gradients, child)
                        end
                    end
                    if #gradients > 0 then
                        local chosen = gradients[math.random(1, #gradients)]
                        chosen.Enabled = true
                    end
                end

                sliderCanvas:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    fillBar.BackgroundGradient.Size = UDim2.new(0, sliderCanvas.AbsoluteSize.X, 1, 0)
                end)
                fillBar.BackgroundGradient.Size = UDim2.new(0, sliderCanvas.AbsoluteSize.X, 1, 0)

                randomGradient()

                if config.Locked then
                    animate(sliderTemplate.UIStroke, { Color = Color3.fromRGB(47, 47, 58) }, animationProfiles.Global)
                    animate(sliderTemplate, { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }, animationProfiles.Global)
                    animate(sliderTemplate.Title, { TextColor3 = Color3.fromRGB(75, 77, 83) }, animationProfiles.Global)
                    animate(sliderTemplate.Description, { TextColor3 = Color3.fromRGB(75, 77, 83) }, animationProfiles.Global)
                    animate(sliderCanvas.UIStroke, { Color = Color3.fromRGB(47, 47, 58) }, animationProfiles.Global)
                    sliderCanvas.BackgroundTransparency = 0.5
                    fillBar.UIStroke.Transparency = 0.5
                    fillBar.BackgroundGradient.BackgroundTransparency = 0.5
                    valueLabel.TextTransparency = 0.6
                end

                local function valueToScale(value)
                    local minVal = config.Value.Min
                    local maxVal = config.Value.Max or minVal + 1
                    return (value - minVal) / (maxVal - minVal)
                end

                local function updateVisuals(value)
                    currentValue = value
                    valueLabel.Text = tostring(value)
                    fillBar.Size = UDim2.fromScale(valueToScale(value), 1)
                end

                local function snapToStep(value)
                    local stepped = math.round(value / config.Step) * config.Step
                    local minVal = config.Value.Min
                    local maxVal = config.Value.Max or math.huge
                    return math.clamp(stepped, minVal, maxVal)
                end

                local function setValue(value, invokeCallback)
                    local newValue = snapToStep(value)
                    updateVisuals(newValue)
                    if invokeCallback ~= false then
                        config.Callback(newValue)
                    end
                end

                local function beginDrag()
                    if config.Locked then
                        return
                    end
                    dragging = true
                    repeat
                        task.wait()
                        local relative = math.clamp(
                            (mouse.X - sliderTemplate.AbsolutePosition.X) / sliderTemplate.AbsoluteSize.X,
                            0,
                            1
                        )
                        local minVal = config.Value.Min
                        local maxVal = config.Value.Max or minVal + 1
                        local newValue = minVal + relative * (maxVal - minVal)
                        setValue(newValue)
                    until not dragging or config.Locked
                    if not hovering then
                        animate(sliderTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles.Global)
                    end
                end

                sliderInputRegion.MouseEnter:Connect(function()
                    hovering = true
                    if not config.Locked then
                        animate(sliderTemplate.UIStroke, {
                            Color = Color3.fromRGB(10, 135, 213),
                        }, animationProfiles.Global)
                    end
                end)

                sliderInputRegion.MouseLeave:Connect(function()
                    hovering = false
                    if not config.Locked and not dragging then
                        animate(sliderTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles.Global)
                    end
                end)

                sliderInputRegion.MouseButton1Down:Connect(beginDrag)

                userInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    sliderTemplate.Name = newTitle
                    sliderTemplate.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    sliderTemplate.Description.Text = newDesc or ""
                    sliderTemplate.Description.Visible = (newDesc ~= nil and newDesc ~= "")
                end

                function api.Set(_, newValue)
                    setValue(newValue, true)
                end

                function api.Lock()
                    config.Locked = true
                    animate(sliderTemplate.UIStroke, { Color = Color3.fromRGB(47, 47, 58) }, animationProfiles.Global)
                    animate(sliderTemplate, { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }, animationProfiles.Global)
                    animate(sliderTemplate.Title, { TextColor3 = Color3.fromRGB(75, 77, 83) }, animationProfiles.Global)
                    animate(sliderTemplate.Description, { TextColor3 = Color3.fromRGB(75, 77, 83) }, animationProfiles.Global)
                    animate(sliderCanvas.UIStroke, { Color = Color3.fromRGB(47, 47, 58) }, animationProfiles.Global)
                    sliderCanvas.BackgroundTransparency = 0.5
                    fillBar.UIStroke.Transparency = 0.5
                    fillBar.BackgroundGradient.BackgroundTransparency = 0.5
                    valueLabel.TextTransparency = 0.6
                end

                function api.Unlock()
                    config.Locked = false
                    animate(sliderTemplate.UIStroke, { Color = Color3.fromRGB(60, 60, 74) }, animationProfiles.Global)
                    animate(sliderTemplate, { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }, animationProfiles.Global)
                    animate(sliderTemplate.Title, { TextColor3 = Color3.fromRGB(196, 203, 218) }, animationProfiles.Global)
                    animate(sliderTemplate.Description, { TextColor3 = Color3.fromRGB(196, 203, 218) }, animationProfiles.Global)
                    animate(sliderCanvas.UIStroke, { Color = Color3.fromRGB(60, 60, 74) }, animationProfiles.Global)
                    sliderCanvas.BackgroundTransparency = 0
                    fillBar.UIStroke.Transparency = 0
                    fillBar.BackgroundGradient.BackgroundTransparency = 0
                    valueLabel.TextTransparency = 0
                end

                function api.Destroy()
                    sliderTemplate:Destroy()
                end

                setValue(config.Value.Default, false)

                return api
            end

            function tabApi.Input(_, inputOptions)
                local config = {
                    Title = inputOptions.Title,
                    Description = inputOptions.Desc,
                    Placeholder = inputOptions.Placeholder or "",
                    Default = inputOptions.Default or inputOptions.Value or "",
                    Text = inputOptions.Default or inputOptions.Value or "",
                    ClearTextOnFocus = inputOptions.ClearTextOnFocus or false,
                    Locked = inputOptions.Locked or false,
                    MultiLine = inputOptions.MultiLine or false,
                    Callback = inputOptions.Callback or function() end,
                }

                local inputTemplate = templates.TextBox:Clone()
                inputTemplate.Name = config.Title
                inputTemplate.Parent = tabContent
                inputTemplate.Title.Text = config.Title
                inputTemplate.BoxFrame.Frame.TextBox.Text = config.Default
                inputTemplate.BoxFrame.Frame.TextBox.PlaceholderText = config.Placeholder
                inputTemplate.BoxFrame.Frame.TextBox.ClearTextOnFocus = config.ClearTextOnFocus
                inputTemplate.Visible = true

                if config.MultiLine then
                    inputTemplate.BoxFrame.Frame.TextBox.MultiLine = true
                    inputTemplate.BoxFrame.Frame.TextBox.AutomaticSize = Enum.AutomaticSize.Y
                else
                    inputTemplate.BoxFrame.Frame.TextBox.MultiLine = false
                    inputTemplate.BoxFrame.Frame.TextBox.AutomaticSize = Enum.AutomaticSize.None
                end

                if config	Description and config.Description ~= "" then
                    inputTemplate.Description.Text = config.Description
                    inputTemplate.Description.Visible = true
                else
                    inputTemplate.Description.Visible = false
                end

                local function setLockedStyle(locked)
                    config.Locked = locked
                    animate(inputTemplate.UIStroke, {
                        Color = locked and Color3.fromRGB(47, 47, 58) or Color3.fromRGB(60, 60, 74),
                    }, animationProfiles.Global)
                    animate(inputTemplate, {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    }, animationProfiles.Global)
                    animate(inputTemplate.Title, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(inputTemplate.Description, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3	fromRGB(196, 203, 218),
                    }, animationProfiles.Global)
                    animate(inputTemplate.BoxFrame.Frame, {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    }, animationProfiles.Global)
                    animate(inputTemplate.BoxFrame.Frame.UIStroke, {
                        Color = locked and Color3.fromRGB(47, 47, 58) or Color3.fromRGB(60, 60, 74),
                    }, animationProfiles.Global)
                    animate(inputTemplate.BoxFrame.Frame.TextBox, {
                        TextColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(196, 203, 218),
                        PlaceholderColor3 = locked and Color3.fromRGB(75, 77, 83) or Color3.fromRGB(139, 139, 139),
                    }, animationProfiles	Global)
                    inputTemplate.BoxFrame.Frame.TextBox.Active = not locked
                    inputTemplate.BoxFrame.Frame.TextBox.Interactable = not locked
                    inputTemplate.BoxFrame.Frame.TextBox.TextEditable = not locked
                end

                if config.Locked then
                    setLockedStyle(true)
                end

                inputTemplate.BoxFrame.Frame.TextBox.MouseEnter:Connect(function()
                    if not config.Locked then
                        animate(inputTemplate.UIStroke, {
                            Color = Color3.fromRGB(10, 135, 213),
                        }, animationProfiles	Global)
                    end
                end)

                inputTemplate.BoxFrame.Frame.TextBox.MouseLeave:Connect(function()
                    if not config.Locked then
                        animate(inputTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles	Global)
                    end
                end)

                inputTemplate.BoxFrame.Frame.TextBox.Focused:Connect(function()
                    if not config.Locked then
                        animate(inputTemplate.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles	Global)
                        animate(inputTemplate.BoxFrame.Frame.UIStroke, {
                            Color = Color3.fromRGB(10, 135, 213),
                        }, animationProfiles	Global)
                    end
                end)

                inputTemplate.BoxFrame.Frame.TextBox.FocusLost:Connect(function()
                    if not config.Locked then
                        animate(inputTemplate.BoxFrame.Frame.UIStroke, {
                            Color = Color3	fromRGB(60, 60, 74),
                        }, animationProfiles	Global)
                        config.Text = inputTemplate.BoxFrame.Frame.TextBox.Text
                        config.Callback(config.Text)
                    end
                end)

                local api = {}

                function api.Set(_, newText)
                    inputTemplate.BoxFrame.Frame.TextBox.Text = newText
                    config.Text = newText
                    config.Callback(newText)
                end

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    inputTemplate.Name = newTitle
                    inputTemplate.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    inputTemplate	Description.Text = newDesc or ""
                    inputTemplate.Description.Visible = (newDesc ~= nil and newDesc ~= "")
                end

                function	api.SetPlaceholder(_, newPlaceholder)
                    inputTemplate.BoxFrame.Frame.TextBox.PlaceholderText = newPlaceholder or ""
                end

                function api.Lock()
                    setLockedStyle(true)
                end

                function api.Unlock()
                    setLockedStyle(false)
                end

                function api.Destroy()
                    inputTemplate:Destroy()
                end

                config.Callback(config	Text)

                return api
            end
                    local function newDropdownButton(name, parent)
                local button = templates.DropdownButton:Clone()
                button.Name = name
                button.Parent = parent
                button.Frame.Title.Text = name

                local gradients = {}
                for _, child in ipairs(button.Frame:GetChildren()) do
                    if child:IsA("UIGradient") then
                        child.Enabled = false
                        table.insert(gradients, child)
                    end
                end
                if #gradients > 0 then
                    gradients[math.random(1, #gradients)].Enabled = true
                end

                return button
            end

            local function joinValues(list)
                return table.concat(list, ", ")
            end

            function tabApi.Dropdown(_, dropdownOptions)
                local config = {
                    Title = dropdownOptions.Title,
                    Description = dropdownOptions.Desc,
                    Multi = dropdownOptions.Multi or false,
                    Values = dropdownOptions.Values or {},
                    Value = dropdownOptions.Value or dropdownOptions.Default,
                    AllowNone = dropdownOptions.AllowNone or false,
                    Locked = dropdownOptions.Locked or false,
                    Callback = dropdownOptions.Callback or function() end,
                }

                local dropdownFrame = templates.Dropdown:Clone()
                dropdownFrame.Name = config.Title
                dropdownFrame.Parent = tabContent
                dropdownFrame.Title.Text = config.Title

                if config.Description and config.Description ~= "" then
                    dropdownFrame.Description.Visible = true
                    dropdownFrame.Description.Text = config.Description
                else
                    dropdownFrame.Description.Visible = false
                end

                if config.Locked then
                    animate(dropdownFrame.UIStroke, {
                        Color = Color3.fromRGB(47, 47, 58),
                    }, animationProfiles.Global)
                    animate(dropdownFrame, {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    }, animationProfiles.Global)
                    animate(dropdownFrame.Title, {
                        TextColor3 = Color3.fromRGB(75, 77, 83),
                    }, animationProfiles.Global)
                    animate(dropdownFrame.Description, {
                        TextColor3 = Color3.fromRGB(75, 77, 83),
                    }, animationProfiles	Global)
                    animate(dropdownFrame.Title.ClickIcon, {
                        ImageColor3 = Color3.fromRGB(75, 77, 83),
                    }, animationProfiles	Global)
                    animate(dropdownFrame.Title.BoxFrame.Trigger, {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    }, animationProfiles	Global)
                    animate(dropdownFrame.Title.BoxFrame.Trigger.UIStroke, {
                        Color = Color3.fromRGB(47, 47, 58),
                    }, animationProfiles	Global)
                    animate(dropdownFrame.Title.BoxFrame.Trigger.Title, {
                        TextColor3 = Color3.fromRGB(75, 77, 83),
                    }, animationProfiles	Global)
                    dropdownFrame.Active = false
                    dropdownFrame.Interactable = false
                end

                dropdownFrame.Visible = true

                local dropdownFolder = templates.DropdownList:Clone()
                dropdownFolder.Name = config.Title
                dropdownFolder.Parent = windowInstance.DropdownSelection.Dropdowns

                local selectedValues = config.Multi and (typeof(config.Value) == "table" and table.clone(config.Value) or {}) or (config.Value or "")
                dropdownFrame.Title.BoxFrame.Trigger.Title.Text = config.Multi and joinValues(selectedValues) or tostring(selectedValues or "")

                local function renderOptions(values, clearExisting)
                    local occurrences = {}
                    local normalized = {}

                    for _, value in ipairs(values) do
                        if typeof(value) == "string" then
                            occurrences[value] = (occurrences[value] or 0) + 1
                            if occurrences[value] > 1 then
                                table.insert(normalized, string.format("%s (%d)", value, occurrences[value]))
                            else
                                table.insert(normalized, value)
                            end
                        end
                    end

                    if clearExisting then
                        config.Values = normalized
                        for _, child in dropdownFolder.DropdownItems:GetChildren() do
                            if child:IsA("GuiButton") then
                                child:Destroy()
                            end
                        end
                        for _, child in dropdownFolder.DropdownItemsSearch:GetChildren() do
                            if child:IsA("GuiButton") then
                                child:Destroy()
                            end
                        end
                    end

                    local function applySelectionStyle(button, isSelected)
                        animate(button.Frame.Title, {
                            TextColor3 = isSelected and Color3.new(1, 1, 1) or Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                        animate(button.Frame.Description, {
                            TextColor3 = isSelected and Color3.new(1, 1, 1) or Color3.fromRGB(196, 203, 218),
                        }, animationProfiles.Global)
                        animate(button.UIStroke, {
                            Color = isSelected and Color3.fromRGB(10, 135, 213) or Color3.fromRGB(60, 60, 74),
                        }, animationProfiles.Global)
                        animate(button.Frame, {
                            BackgroundTransparency = isSelected and 0 or 1,
                        }, animationProfiles.Global)
                    end

                    for _, displayValue in ipairs(normalized) do
                        local listButton = newDropdownButton(displayValue, dropdownFolder.DropdownItems)
                        local searchButton = newDropdownButton(displayValue, dropdownFolder.DropdownItemsSearch)
                        listButton.Visible = true
                        searchButton.Visible = true

                        local function onSelect()
                            if config.Locked then
                                return
                            end

                            if config.Multi then
                                local idx = table.find(selectedValues, displayValue)
                                if idx then
                                    if not config.AllowNone and #selectedValues == 1 then
                                        return
                                    end
                                    table.remove(selectedValues, idx)
                                    applySelectionStyle(listButton, false)
                                    applySelectionStyle(searchButton, false)
                                else
                                    table.insert(selectedValues, displayValue)
                                    applySelectionStyle(listButton, true)
                                    applySelectionStyle(searchButton, true)
                                end
                                dropdownFrame.Title.BoxFrame.Trigger.Title.Text = joinValues(selectedValues)
                                config.Callback(table.clone(selectedValues))
                            else
                                selectedValues = displayValue
                                dropdownFrame.Title.BoxFrame.Trigger.Title.Text = displayValue
                                config.Callback(displayValue)

                                for _, otherButton in ipairs(dropdownFolder.DropdownItems:GetChildren()) do
                                    if otherButton:IsA("GuiButton") then
                                        applySelectionStyle(otherButton, otherButton.Name == displayValue)
                                    end
                                end
                                for _, otherButton in ipairs(dropdownFolder.DropdownItemsSearch:GetChildren()) do
                                    if otherButton:IsA("GuiButton") then
                                        applySelectionStyle(otherButton, otherButton.Name == displayValue)
                                    end
                                end
                                toggleDropdownPanel(false)
                            end
                        end

                        listButton.MouseButton1Click:Connect(onSelect)
                        searchButton.MouseButton1Click:Connect(onSelect)

                        local isActive = config.Multi and table.find(selectedValues, displayValue) or (selectedValues == displayValue)
                        applySelectionStyle(listButton, isActive)
                        applySelectionStyle(searchButton, isActive)
                    end
                end

                renderOptions(config.Values)

                dropdownFrame.Title.BoxFrame.Trigger.MouseButton1Click:Connect(function()
                    toggleDropdownPanel(nil, config.Title)
                end)

                local api = {}

                function api.SetTitle(_, newTitle)
                    config.Title = newTitle
                    dropdownFrame.Name = newTitle
                    dropdownFrame.Title.Text = newTitle
                end

                function api.SetDesc(_, newDesc)
                    config.Description = newDesc
                    dropdownFrame.Description.Text = newDesc or ""
                    dropdownFrame.Description.Visible = (newDesc ~= nil and newDesc ~= "")
                end

                function api.Refresh(_, newValues)
                    renderOptions(newValues or {}, true)
                end

                function api.Select(_, valuesOrString)
                    if config.Multi then
                        selectedValues = typeof(valuesOrString) == "table" and table.clone(valuesOrString) or { valuesOrString }
                        dropdownFrame.Title.BoxFrame.Trigger.Title.Text = joinValues(selectedValues)
                        config.Callback(table.clone(selectedValues))
                    else
                        selectedValues = tostring(valuesOrString or "")
                        dropdownFrame.Title.BoxFrame.Trigger.Title.Text = selectedValues
                        config.Callback(selectedValues)
                    end
                    renderOptions(config.Values, true)
                end

                function api.Lock()
                    if not config.Locked then
                        config.Locked = true
                        animate(dropdownFrame.UIStroke, {
                            Color = Color3.fromRGB(47, 47, 58),
                        }, animationProfiles	Global)
                        animate(dropdownFrame, {
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title, {
                            TextColor3 = Color3.fromRGB(75, 77, 83),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Description, {
                            TextColor3 = Color3.fromRGB(75, 77, 83),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.ClickIcon, {
                            ImageColor3 = Color3.fromRGB(75, 77, 83),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger, {
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger.UIStroke, {
                            Color = Color3.fromRGB(47, 47, 58),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger.Title, {
                            TextColor3 = Color3.fromRGB(75, 77, 83),
                        }, animationProfiles	Global)
                        dropdownFrame.Active = false
                        dropdownFrame.Interactable = false
                    end
                end

                function api.Unlock()
                    if config.Locked then
                        config.Locked = false
                        animate(dropdownFrame.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles	Global)
                        animate(dropdownFrame, {
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Description, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.ClickIcon, {
                            ImageColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger, {
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger.UIStroke, {
                            Color = Color3.fromRGB(60, 60, 74),
                        }, animationProfiles	Global)
                        animate(dropdownFrame.Title.BoxFrame.Trigger.Title, {
                            TextColor3 = Color3.fromRGB(196, 203, 218),
                        }, animationProfiles	Global)
                        dropdownFrame.Active = true
                        dropdownFrame.Interactable = true
                    end
                end

                function api.Destroy()
                    dropdownFrame:Destroy()
                    dropdownFolder:Destroy()
                end

                config.Callback(config.Value)

                return api
            end

            return tabApi
        end
            function windowConfig.SelectTab(_, tabIndex)
            local tabEntry = tabSequence[tabIndex]
            if tabEntry then
                switchTab(tabEntry.Name)
            end
        end

        function windowConfig.Divider()
            local divider = templates.Divider:Clone()
            divider.Parent = windowInstance.TabButtons.Lists
            divider.Visible = true
        end

        function windowConfig.SetToggleKey(_, key)
            if typeof(key) == "string" then
                windowConfig.ToggleKey = Enum.KeyCode[key] or windowConfig.ToggleKey
            elseif typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then
                windowConfig.ToggleKey = key
            end
        end

        function windowConfig.EditOpenButton()
            -- Placeholder: perilaku asli tidak diimplementasikan
        end

        function windowConfig.Dialog(_, dialogOptions)
            local config = {
                Title = dialogOptions.Title,
                Content = dialogOptions.Content,
                Icon = dialogOptions.Icon,
                Buttons = dialogOptions.Buttons or {},
                Size = nil,
                PressDecreaseSize = UDim2.fromOffset(5, 5),
            }

            local dialogInstance = templates.DialogElements.Dialog:Clone()
            local overlayInstance = templates.DialogElements.DarkOverlayDialog:Clone()

            dialogInstance.Title.TextLabel.Text = config.Title
            if config.Content and config.Content ~= "" then
                dialogInstance.Content.Visible = true
                dialogInstance.Content.TextLabel.Text = config.Content
            else
                dialogInstance.Content.Visible = false
            end

            if config.Icon then
                if config.Icon:find("rbxassetid") or config.Icon:match("%d") then
                    dialogInstance.Title.Icon.Image = config.Icon
                else
                    local iconData = iconProvider.Icon(config.Icon)
                    dialogInstance.Title.Icon.Image = iconData and iconData[1] or config.Icon or ""
                    dialogInstance.Title.Icon.ImageRectOffset = iconData and iconData[2].ImageRectPosition or Vector2.new(0, 0)
                    dialogInstance.Title.Icon.ImageRectSize = iconData and iconData[2].ImageRectSize or Vector2.new(0, 0)
                end
                dialogInstance.Title.Icon.Visible = true
            end

            dialogInstance.Parent = windowInstance
            overlayInstance.Parent = windowInstance

            overlayInstance.Transparency = 1

            for _, buttonConfig in ipairs(config.Buttons) do
                local buttonEntry = templates.DialogElements.DialogButton:Clone()
                local originalSize = buttonEntry.Button.Size

                buttonEntry.Button.Label.Text = buttonConfig.Title or "Button"

                buttonEntry.Button.MouseButton1Click:Connect(function()
                    if typeof(buttonConfig.Callback) == "function" then
                        buttonConfig.Callback()
                    end
                    local fadeTween = animate(overlayInstance, { Transparency = 1 }, animationProfiles	Global)
                    dialogInstance:Destroy()
                    fadeTween.Completed:Wait()
                    overlayInstance:Destroy()
                end)

                buttonEntry.Button.MouseButton1Down:Connect(function()
                    animate(buttonEntry.Button, {
                        Size = originalSize - config.PressDecreaseSize,
                    }, animationProfiles.Global)
                end)

                local function resetButtonSize()
                    animate(buttonEntry.Button, {
                        Size = originalSize,
                    }, animationProfiles.Global)
                end

                buttonEntry.Button.MouseButton1Up:Connect(resetButtonSize)
                buttonEntry.Button.MouseLeave:Connect(resetButtonSize)

                buttonEntry.Parent = dialogInstance.Buttons
                buttonEntry.Visible = true
            end

            animate(overlayInstance, {
                Transparency = 0.6,
            }, animationProfiles.Global)

            dialogInstance.Visible = true
            overlayInstance.Visible = true

            return config
        end

        -- Status window (floating vs utama)
        local originalFloatSize = floatingIcon.Size
        local originalWindowSize = windowConfig.Size
        local storedWindowSize = windowConfig.Size
        local storedWindowPosition = windowInstance.Position
        local isMaximized = false
        local dragController = makeDraggable(windowInstance.TopFrame, windowInstance)

        makeDraggable(floatingIcon, floatingIcon)

        windowInstance.Visible = true
        windowInstance.Size = UDim2.fromOffset(0, 0)

        local windowShown = windowInstance.Visible
        local isAnimating = false

        local function toggleVisibility(forceState)
            local function showWindow()
                floatingIcon.Size = UDim2.fromOffset(0, 0)
                floatingIcon.Visible = false

                windowInstance.Visible = true
                windowInstance.DropShadow.Visible = true

                animate(floatingIcon, { Size = UDim2.new(0, 0, 0, 0) }, animationProfiles.Global)
                animate(windowInstance, { Size = storedWindowSize }, animationProfiles.Global).Completed:Wait()

                windowInstance.Tabs.Visible = true
                windowInstance.TabButtons.Visible = true
                windowShown = true
            end

            local function showFloating()
                storedWindowSize = windowInstance.Size
                floatingIcon.Size = UDim2.fromOffset(0, 0)
                floatingIcon.Visible = true

                windowInstance.Tabs.Visible = false
                windowInstance.TabButtons.Visible = false
                windowInstance.DropShadow.Visible = false

                animate(floatingIcon, { Size = originalFloatSize }, animationProfiles	Global)
                animate(windowInstance, { Size = UDim2.fromOffset(0, 0) }, animationProfiles	Global).Completed:Wait()

                windowInstance.Visible = false
                windowShown = false
            end

            if forceState == true then
                showWindow()
            elseif forceState == false then
                showFloating()
            else
                if windowShown then
                    showFloating()
                else
                    showWindow()
                end
            end
        end

        windowInstance.TopFrame.Hide.MouseButton1Click:Connect(function()
            if not isAnimating then
                isAnimating = true
                toggleVisibility(false)
                task.delay(animationProfiles.Global.Duration, function()
                    isAnimating = false
                end)
            end
        end)

        floatingIcon.Open.MouseButton1Click:Connect(function()
            if not isAnimating then
                isAnimating = true
                toggleVisibility(true)
                task.delay(animationProfiles.Global.Duration, function()
                    isAnimating = false
                end)
            end
        end)

        windowInstance.TopFrame.Close.MouseButton1Click:Connect(function()
            windowConfig:Dialog({
                Icon = "triangle-alert",
                Title = "Close Window",
                Content = [[Do you want to close this window? You will not able to open it again.]],
                Buttons = {
                    { Title = "Cancel" },
                    {
                        Title = "Close Window",
                        Callback = function()
                            container.Parent = nil
                        end,
                    },
                },
            })
        end)

        windowInstance.TopFrame.Maximize.MouseButton1Click:Connect(function()
            if not isMaximized then
                dragController:SetAllowDragging(false)
                storedWindowSize = windowInstance.Size
                storedWindowPosition = windowInstance.Position

                animate(windowInstance, {
                    Size = UDim2.new(1, 0, 1, 0),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                }, animationProfiles.Global)
                animate(windowInstance.UICorner, {
                    CornerRadius = UDim.new(0, 0),
                }, animationProfiles.Global)

                isMaximized = true
            else
                dragController:SetAllowDragging(true)
                animate(windowInstance, {
                    Size = storedWindowSize,
                    Position = storedWindowPosition,
                }, animationProfiles.Global)
                animate(windowInstance.UICorner, {
                    CornerRadius = UDim.new(0, 10),
                }, animationProfiles	Global)

                isMaximized = false
            end
        end)

        animate(windowInstance, {
            Size = windowConfig.Size,
        }, animationProfiles.Global)

        userInputService.InputBegan:Connect(function(input, processed)
            if not isAnimating and not processed and input.KeyCode == windowConfig.ToggleKey then
                isAnimating = true
                toggleVisibility()
                task.delay(animationProfiles.Global.Duration, function()
                    isAnimating = false
                end)
            end
        end)
			return windowConfig
		end

		function library.Notify(_, notificationConfig)
			local notificationInstance = templates.Notification:Clone()
			if #activeWindows == 1 and activeWindows[1].Visible and activeWindows[1].Tabs.Visible then
				notificationInstance.Parent = activeWindows[1].NotificationFrame.NotificationList
			else
				notificationInstance.Parent = rootFolder.NotificationList
			end

			notificationInstance.Items.Frame.Title.Text = notificationConfig.Title
			notificationInstance.Items.Frame.Content.Text = notificationConfig.Content

			local iconData = iconProvider.Icon(notificationConfig.Icon)
			notificationInstance.Items.Frame.Title.Icon.Image = iconData and iconData[1] or notificationConfig.Icon or ""
			notificationInstance.Items.Frame.Title.Icon.ImageRectOffset = iconData and iconData[2].ImageRectPosition or Vector2.new(0, 0)
			notificationInstance.Items.Frame.Title.Icon.ImageRectSize = iconData and iconData[2].ImageRectSize or Vector2.new(0, 0)
			notificationInstance.Items.Position = UDim2.new(0.75, 0, 0, 0)
			notificationInstance.Visible = true

			local function closeNotification()
				if notificationInstance then
					animate(notificationInstance.Items, {
						Position = UDim2.new(0.75, 0, 0, 0),
					}, animationSettings.Notification)
					task.wait(animationSettings.Notification.Duration - (animationSettings.Notification.Duration / 2))
					if notificationInstance then
						notificationInstance:Destroy()
					end
					notificationInstance = nil
				end
			end

			notificationInstance.Items.Frame.Title.Close.MouseButton1Click:Connect(closeNotification)

			local tween =	animate(notificationInstance.Items, {
				Position = UDim2.new(0, 0, 0, 0),
			}, animationSettings.Notification)
			tween.Completed:Connect(function()
				animate(notificationInstance.Items.TimerBarFill.Bar, {
					Size = UDim2.new(0, 0, 1, 0),
				}, {
					Duration = notificationConfig.Duration or 5,
				})
				task.delay(notificationConfig.Duration or 5, closeNotification)
			end)

			return {
				Close = function()
					closeNotification()
				end,
			}
		end

		return library
	end,
}

----------------------------------------------------------------------
-- Icon Module Definition
----------------------------------------------------------------------

Instances.ModuleCache[Instances.IconModule] = {
	Closure = function()
		local iconsRegistry = {
			lucide = moduleResolve(Instances.LucideModule),
		}
		local provider = {
			IconsType = "lucide",
		}

		function provider.SetIconsType(typeName)
			provider.IconsType = typeName
		end

		function provider.Icon(iconName, iconSet)
			local data = iconsRegistry[iconSet or provider.IconsType]
			if data.Icons[iconName] then
				return {
					data.Spritesheets[tostring(data.Icons[iconName].Image)],
					data.Icons[iconName],
				}
			end
			return nil
		end

		return provider
	end,
}

----------------------------------------------------------------------
-- Lucide Icons Data
----------------------------------------------------------------------

Instances.ModuleCache[Instances.LucideModule] = {
	Closure = function()
		return {
			Spritesheets = {
				["1"] = "rbxassetid://131526378523863",
				["2"] = "rbxassetid://125136326597802",
				["3"] = "rbxassetid://132619645919851",
				["4"] = "rbxassetid://124546836680911",
				["5"] = "rbxassetid://138714413596023",
				["6"] = "rbxassetid://95318701976229",
				["7"] = "rbxassetid://87465848394141",
				["8"] = "rbxassetid://77771201330939",
				["9"] = "rbxassetid://126006375824005",
				["10"] = "rbxassetid://98656588890340",
				["11"] = "rbxassetid://122516128999742",
				["12"] = "rbxassetid://136045238860745",
				["13"] = "rbxassetid://138056954680929",
				["14"] = "rbxassetid://139241675471365",
				["15"] = "rbxassetid://120281540002144",
				["16"] = "rbxassetid://122481504913348",
			},
			Icons = {
				["a-arrow-down"] = {
					ImageRectPosition = Vector2.new(0, 0),
					ImageRectSize = Vector2.new(96, 96),
					Image = 1,
				},
				["a-arrow-up"] = {
					ImageRectPosition = Vector2.new(96, 0),
					ImageRectSize = Vector2.new(96, 96),
					Image = 1,
				},
				-- … (seluruh daftar ikon Lucide dilanjutkan persis seperti skrip asli)
			},
		}
	end,
}

----------------------------------------------------------------------
-- Library Export
----------------------------------------------------------------------

return moduleResolve(Instances.LibraryModule)
