--[[
    Dark Themed Tabbed GUI
    Tabs: Home | NDS | Doors | MM2 | Credits
]]

local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- ==========================================
-- CONSOLE ASCII ART (original NDS)
-- ==========================================
print([[
@@@@@@@@@@%%%*%@@@@@@@@@@@@@@@@@@@@@@@%#:*@%@@@@@@@@@@@@@@@@@@@@@@@@%%%%@@@@@@@@
@@@@@@@@%%%%@@@@@@%@@@@@@@@@@@@@@@@@@@*. .@@@@@@@@@@#@@@@@@@@@@@@@@@@@%%*=:+@@@@
@@@@@@@%%%*@%@@@@@@@@@@@@@@@@@@@@@@%%=    +@@@#@@@@@@@@@@@@@@@@@@@@@#=.    +@@@@
@@@@@%%%*%@@@@@@@@@@@= +@@@@@@@@@@@%=      #@@@@@@@@@@@@@@@@@@@@%+:        +%@@@
@@@@%%%%@@@@@@%#@@%-:+=.@@@@@@@@@@%-       .%@@@@@@@@@@@@@@@@%=.           -%%@@
@@%%%%-..*@@@@@@#.:#@@# @@@@@@@@@@-         -@@@@@@@@@@@@@%+:          --  .*%%%
@%%%#=.%%::*@@@@@-.%@@@ *@@@@@@@@=           =@@@@@@@@@%+:          .:=:-   :%%%
%%%%% #@%@# -%#@@@# =@@-:@@@@@@@=             -%@@@@@*:            :=:::-    *@%
@@@@-:@@@@%@* :@@@@@-.%# %@@@@@+          .... .*@@#:            .=-::::=    -@@
@@@@ #@@@@@@@@*::%%@@* + *@@*@*.   :-:.          .+:            --::::::=.   :@@
@@@% @@@@@@@@@@@*::#%%*. :@@@#..--:.                          .=-:::::::=.   :%@
@@@# @@@@@@@@@@@@%*.-%@@- %@%: ...::                         .-:::::::::-:   :%@
@@@% **#####**%%%%%%* =@@ #@-   .-                           :-:::::::::-:   :@@
@@@@%#%@%%%%#*=-:.   .. *@@+   =.                               -=--::::-.   -@@
@@@@@@@@@@@@@@@@@@@@@@%*@@%: .===.                                 =::::=.   =@@
@@@@@@@@@@@@@@@@@@@@@@@@@@#  -.-.                                 -:::::=.  .#@@
@@@@@@@%##@@@@@@@@@@@@@@@@+    -                                   ::-:--   -@@@
@@@@@@@@@%=.:+#@@@@@@@@@@@-   :.                                     -:-   .#@@@
@@@@%@@@@@@+   .+@@@@%@@=*=   =    .               :-=+=.            -=   .*@@@@
@@@@@@@@@@@%:     +@@%:+*.    = -. +++=          -  :+++++               :#@@@@@
@@@@@@@@@@@@-      .*@=.:=:   =   .++++             -+++++.             ----+#@@
@@@@@@@@@@@%:        == ..-:=::.  :++++.            -+++++.            .:= =@@@@
@@@@@@@@@@@*          .   .:=.--  :++++.            -+++++.        ...::.=+@@@@@
@@@@@@@@@@%-                :: =  .+++=             :++++=              -#@@@@@@
@@@@@@@@@@=             :===:. -     .                                 =@@@@@@@@
@@@@@@@@@*. ....:      ..-:    :.                                    :+%%%%@@@@@
@@@@@@@@%::. ::..-- ::----:-   -    .--.                                .-@@@@@@
@@@@@@@@-.: =.    -+:-.   ::=-:-                                       :*@@@@@@@
@@@@@@@=..- =  ...:+=:..   ==*-:-.                                   :+#@@@@@@@@
@@@@@@*.::=.=-::::.==::::::-*%%%%#+:          .                   .:+#%##%%@@@@@
@@@@@#- -..=.=....-=-....:==**#%%%%%#+-.    ..                 .-+#%%%%%%%%@@@@@
@@@@@- ::   -:.::.   .--:.-=. :+#%%%%%%%#*++=====++++*+-.  -+##%%%%%%%%%%%%@@@@@
@@@@+  --:..:+           :=.   -+%%%%%%%%%%%@@@@%%%%%%%%%#####%%%%%@@@%%%%%@@@@@
@@@*=. .=...:-  .::....:..-::::==##%%%%##%@@%%%#####%%%%%@@@%%%%@@@%+%%%%%%%#@@@
@@%:.-  :-:-:  -:       ::-:.:-:*@%####%%%#########%%%%@@%%%%%@@%%%*:=%%@@@*-=@@
@@=.  =       =.  ..... .:-    +%@%%###%%%%%%####%%%%%%%%%%@@%%####++-=+*#+=#-#@
%*.    .:    :-:::::::::::-. .*%%%@@%#####%%%%%%%%%%%%%%@@%%%####++=+*#####%#%@@
%-.      :   --::::::......::#%%%#%@@%%#####%%%%%%%%%@@%%%%%%####*+=+**#++#*%@@@
#:.      .:  :-.....::-:.:-=%@%%####%%@@@%%%%%@@@@@%%%%%%%@@@%###+++=++++++#%@@@
#:.       .:  ::::::.:--. -#@@%%%######%%%@@@@%%%%%####%%%%@#==+###*=#####%%%@@@
%:..        :         =:  +%@@%%%%%%#####***+++++=+**###%%@@=*%+=##++######%@@@@
@+..        :         -.  :*@@%%%%%%#*+:  :---:         .-+##+**-*#=*#%%%%%%@@@@
@@+....     =               :*#%%#%*:--  =.   -:.             :+#-#-%%%%%%%@@@@@
@@@*:......:-               :#%%%%%*.:: ::   =.                -*#*%%%%%%%@@@@@@
thanks for using my script -gab :3
]])

-- ==========================================
-- DYNAMIC CHARACTER HEADSHOT
-- ==========================================
local playerFaceIcon = "rbxassetid://109251560"
local thumbnailSuccess, contentUrl, isReady = pcall(function()
	return Players:GetUserThumbnailAsync(
		localPlayer.UserId,
		Enum.ThumbnailType.HeadShot,
		Enum.ThumbnailSize.Size420x420
	)
end)
if thumbnailSuccess and isReady then
	playerFaceIcon = contentUrl
end

-- ==========================================
-- NOTIFICATIONS
-- ==========================================
StarterGui:SetCore("SendNotification", {
	Title = "this script was made by",
	Text = "Gabrieltod112.",
	Duration = 5,
	Icon = playerFaceIcon
})
task.wait(1)
StarterGui:SetCore("SendNotification", {
	Title = "Thanks for using my script ",
	Text = "-Your favourite furry Gab !",
	Duration = 5
})

local isFriend = false
pcall(function()
	isFriend = localPlayer:IsFriendsWith(4983050167) or localPlayer.Name == "Gabrieltod112"
end)
if isFriend then
	task.wait(0)
	StarterGui:SetCore("SendNotification", {
		Title = "Hello friend!",
		Text = "How are you doing?",
		Duration = 5
	})
end
task.wait(0)

local choiceBindable = Instance.new("BindableFunction")
choiceBindable.OnInvoke = function(buttonText)
	if buttonText == "Yes" then
		setclipboard("https://discord.gg/GHMF7JeBGU")
		StarterGui:SetCore("SendNotification", {
			Title = "Link Copied!",
			Text = "Paste it into your browser (Ctrl+V) to join.",
			Duration = 4
		})
	end
end
StarterGui:SetCore("SendNotification", {
	Title = "Join Our Discord",
	Text = "Would you like to join our community server?",
	Duration = 15,
	Button1 = "Yes",
	Button2 = "No",
	Callback = choiceBindable
})

-- ==========================================
-- MAIN DARK GUI
-- ==========================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DarkTabbedGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local success, result = pcall(function()
	return gethui and gethui() or game:GetService("CoreGui")
end)

if success and result then
	screenGui.Parent = result
else
	screenGui.Parent = playerGui  -- fallback
end


local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 460, 0, 520)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.Active = true
main.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(45, 45, 55)
mainStroke.Thickness = 1.5
mainStroke.Parent = main

local accent = Instance.new("Frame")
accent.Size = UDim2.new(1, 0, 0, 3)
accent.BackgroundColor3 = Color3.fromRGB(120, 70, 255)
accent.BorderSizePixel = 0
accent.Parent = main
local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(0, 14)
accentCorner.Parent = accent

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 14)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 16)
titleFix.Position = UDim2.new(0, 0, 1, -16)
titleFix.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0, 16, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Gab's Script Hub"
titleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -44, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

closeBtn.MouseEnter:Connect(function()
	TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180, 40, 50)}):Play()
end)
closeBtn.MouseLeave:Connect(function()
	TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 48)}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Dragging
local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)
titleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- ==========================================
-- TAB BAR
-- ==========================================
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -24, 0, 40)
tabBar.Position = UDim2.new(0, 12, 0, 56)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabBar

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -24, 1, -110)
contentContainer.Position = UDim2.new(0, 12, 0, 104)
contentContainer.BackgroundTransparency = 1
contentContainer.ClipsDescendants = true
contentContainer.Parent = main

local tabs = {
	{Name = "Home", Color = Color3.fromRGB(90, 140, 255)},
	{Name = "NDS", Color = Color3.fromRGB(160, 70, 255)},
	{Name = "Doors", Color = Color3.fromRGB(255, 100, 80)},
	{Name = "MM2", Color = Color3.fromRGB(40, 180, 90)},
	{Name = "Credits", Color = Color3.fromRGB(255, 180, 60)}
}

local tabButtons = {}
local tabContents = {}
local currentTab = nil

local function createTabButton(tabData)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 82, 0, 36)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
	btn.Text = tabData.Name
	btn.TextColor3 = Color3.fromRGB(180, 180, 200)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = false
	btn.Parent = tabBar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(50, 50, 60)
	stroke.Thickness = 1
	stroke.Parent = btn
	return btn
end

local function switchTab(name)
	if currentTab == name then return end
	currentTab = name
	for tabName, content in pairs(tabContents) do
		content.Visible = (tabName == name)
	end
	for tabName, btn in pairs(tabButtons) do
		local isActive = (tabName == name)
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = isActive and Color3.fromRGB(40, 40, 52) or Color3.fromRGB(30, 30, 38),
			TextColor3 = isActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 200)
		}):Play()
	end
end

for _, tabData in ipairs(tabs) do
	local btn = createTabButton(tabData)
	tabButtons[tabData.Name] = btn

	local content = Instance.new("ScrollingFrame")
	content.Name = tabData.Name
	content.Size = UDim2.new(1, 0, 1, 0)
	content.BackgroundTransparency = 1
	content.BorderSizePixel = 0
	content.ScrollBarThickness = 4
	content.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
	content.CanvasSize = UDim2.new(0, 0, 0, 0)
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y
	content.Visible = false
	content.Parent = contentContainer

	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0, 10)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Parent = content

	local pad = Instance.new("UIPadding")
	pad.PaddingTop = UDim.new(0, 4)
	pad.PaddingBottom = UDim.new(0, 12)
	pad.Parent = content

	tabContents[tabData.Name] = content
	btn.MouseButton1Click:Connect(function()
		switchTab(tabData.Name)
	end)
end

-- ==========================================
-- HOME TAB
-- ==========================================
do
	local home = tabContents["Home"]
	local welcome = Instance.new("TextLabel")
	welcome.Size = UDim2.new(1, 0, 0, 40)
	welcome.BackgroundTransparency = 1
	welcome.Text = "Welcome to the Hub"
	welcome.TextColor3 = Color3.fromRGB(240, 240, 255)
	welcome.TextSize = 22
	welcome.Font = Enum.Font.GothamBold
	welcome.TextXAlignment = Enum.TextXAlignment.Left
	welcome.Parent = home

	local desc = Instance.new("TextLabel")
	desc.Size = UDim2.new(1, 0, 0, 80)
	desc.BackgroundTransparency = 1
	desc.Text = "Im back Guys... and have updated my gui.. also have made my own private super ring it does require a key tough. the key only gab owns and foxy."
	desc.TextColor3 = Color3.fromRGB(160, 160, 180)
	desc.TextSize = 14
	desc.Font = Enum.Font.Gotham
	desc.TextWrapped = true
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.Parent = home
end

-- ==========================================
-- NDS TAB (unchanged from previous)
-- ==========================================
do
	local nds = tabContents["NDS"]

	local function createNDSButton(name, callback, specialColor)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -8, 0, 42)
		btn.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
		btn.Text = name
		btn.TextColor3 = Color3.fromRGB(240, 240, 255)
		btn.TextSize = 14
		btn.Font = Enum.Font.GothamBold
		btn.AutoButtonColor = false
		btn.Parent = nds

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 9)
		corner.Parent = btn

		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 1.5
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Parent = btn
		stroke.Color = specialColor or Color3.fromRGB(55, 55, 70)

		btn.MouseEnter:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(48, 48, 60)}):Play()
		end)
		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(32, 32, 40)}):Play()
		end)
		btn.MouseButton1Click:Connect(callback)
		return btn
	end

	local header1 = Instance.new("TextLabel")
	header1.Size = UDim2.new(1, 0, 0, 26)
	header1.BackgroundTransparency = 1
	header1.Text = "  PAGE 1"
	header1.TextColor3 = Color3.fromRGB(160, 100, 255)
	header1.TextSize = 13
	header1.Font = Enum.Font.GothamBold
	header1.TextXAlignment = Enum.TextXAlignment.Left
	header1.Parent = nds

	createNDSButton("Touch fling", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB", true))()
		end)
		if not s then warn("Touch Fling: " .. tostring(e)) end
	end)

	createNDSButton("Infinite Yield", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end)
		if not s then warn("Infinite Yield: " .. tostring(e)) end
	end)

	createNDSButton("Kilaskis multi fling", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
		end)
		if not s then warn("Kilaskis: " .. tostring(e)) end
	end)

	createNDSButton("Flight anims", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://obj.wearedevs.net/197198/scripts/invincible%20flight%20animation.lua"))()
		end)
		if not s then warn("Flight anims: " .. tostring(e)) end
	end)

	createNDSButton("anti stuff", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/OMNIMANRUSSIA/NDS-OMNIMAN-GOD-TOUCH-FLING-ANTISIT-ANTIBANG/main/main.lua"))()
		end)
		if not s then warn("anti stuff: " .. tostring(e)) end
	end)

	local header2 = Instance.new("TextLabel")
	header2.Size = UDim2.new(1, 0, 0, 26)
	header2.BackgroundTransparency = 1
	header2.Text = "  PAGE 2"
	header2.TextColor3 = Color3.fromRGB(160, 100, 255)
	header2.TextSize = 13
	header2.Font = Enum.Font.GothamBold
	header2.TextXAlignment = Enum.TextXAlignment.Left
	header2.Parent = nds

	createNDSButton("Drop kick (buggy)", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/gsm231/Fe-DropKick/refs/heads/main/V0.1"))()
		end)
		if not s then warn("Drop kick: " .. tostring(e)) end
	end)

	createNDSButton("Super ring v5 lukas", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/Super-ring-V5/refs/heads/main/By%20lukas!!"))()
		end)
		if not s then warn("Super ring v5: " .. tostring(e)) end
	end)

	createNDSButton("gab's aimbot", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/gab-s-aimbot/refs/heads/main/Aimbot.lua"))()
		end)
		if not s then warn("gab's aimbot: " .. tostring(e)) end
	end, Color3.fromRGB(255, 40, 40))

	createNDSButton("supering by foxy9694", function()
		local s, e = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/northernline23/Super-ring-parts-V1/refs/heads/main/script.lua"))()
		end)
		if not s then warn("supering: " .. tostring(e)) end
	end, Color3.fromRGB(255, 130, 20))

	-- gabs super ring (key protected - key never displayed)
	createNDSButton("gabs super ring", function()
		local keyGui = Instance.new("ScreenGui")
		keyGui.Name = "KeyPrompt"
		keyGui.ResetOnSpawn = false
		keyGui.Parent = playerGui

		local keyFrame = Instance.new("Frame")
		keyFrame.Size = UDim2.new(0, 300, 0, 140)
		keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		keyFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
		keyFrame.BorderSizePixel = 0
		keyFrame.Parent = keyGui

		local kc = Instance.new("UICorner")
		kc.CornerRadius = UDim.new(0, 12)
		kc.Parent = keyFrame

		local ks = Instance.new("UIStroke")
		ks.Color = Color3.fromRGB(120, 70, 255)
		ks.Thickness = 1.5
		ks.Parent = keyFrame

		local keyTitle = Instance.new("TextLabel")
		keyTitle.Size = UDim2.new(1, 0, 0, 36)
		keyTitle.BackgroundTransparency = 1
		keyTitle.Text = "Enter Access Key"
		keyTitle.TextColor3 = Color3.fromRGB(240, 240, 255)
		keyTitle.Font = Enum.Font.GothamBold
		keyTitle.TextSize = 16
		keyTitle.Parent = keyFrame

		local keyBox = Instance.new("TextBox")
		keyBox.Size = UDim2.new(0, 260, 0, 34)
		keyBox.Position = UDim2.new(0.5, -130, 0, 42)
		keyBox.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
		keyBox.Text = ""
		keyBox.PlaceholderText = "Key..."
		keyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
		keyBox.TextColor3 = Color3.fromRGB(240, 240, 255)
		keyBox.Font = Enum.Font.Gotham
		keyBox.TextSize = 14
		keyBox.ClearTextOnFocus = false
		keyBox.Parent = keyFrame
		local kbc = Instance.new("UICorner")
		kbc.CornerRadius = UDim.new(0, 8)
		kbc.Parent = keyBox

		local submit = Instance.new("TextButton")
		submit.Size = UDim2.new(0, 120, 0, 32)
		submit.Position = UDim2.new(0.5, -130, 0, 90)
		submit.BackgroundColor3 = Color3.fromRGB(80, 50, 180)
		submit.Text = "Unlock"
		submit.TextColor3 = Color3.fromRGB(255, 255, 255)
		submit.Font = Enum.Font.GothamBold
		submit.TextSize = 14
		submit.Parent = keyFrame
		local sc = Instance.new("UICorner")
		sc.CornerRadius = UDim.new(0, 8)
		sc.Parent = submit

		local cancel = Instance.new("TextButton")
		cancel.Size = UDim2.new(0, 120, 0, 32)
		cancel.Position = UDim2.new(0.5, 10, 0, 90)
		cancel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
		cancel.Text = "Cancel"
		cancel.TextColor3 = Color3.fromRGB(220, 220, 230)
		cancel.Font = Enum.Font.GothamBold
		cancel.TextSize = 14
		cancel.Parent = keyFrame
		local cc = Instance.new("UICorner")
		cc.CornerRadius = UDim.new(0, 8)
		cc.Parent = cancel

		cancel.MouseButton1Click:Connect(function()
			keyGui:Destroy()
		end)


-- if you are snooping around the code to just find the key fuck you.
		submit.MouseButton1Click:Connect(function()
			local entered = keyBox.Text
			if entered == "" then
				keyGui:Destroy()
				local success, err = pcall(function()
					-- Full gabs super ring code is already embedded in previous version
					-- For brevity in this response the loadstring remains the same as last time
					loadstring([[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
local Attachment1 = Instance.new("Attachment", Part)
-- Network (won't fight shapes anymore)
if not getgenv().Network then
	getgenv().Network = {
		BaseParts = {},
		Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424),
		Active = true,
	}
	local Network = getgenv().Network
	Network.RetainPart = function(p)
		if typeof(p) == "Instance" and p:IsA("BasePart") and p:IsDescendantOf(Workspace) then
			if not table.find(Network.BaseParts, p) then
				table.insert(Network.BaseParts, p)
				p.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
				p.CanCollide = false
			end
		end
	end
	RunService.Heartbeat:Connect(function()
		sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
		LocalPlayer.ReplicationFocus = Workspace
		if not Network.Active then return end
		for _, p in pairs(Network.BaseParts) do
			if p:IsDescendantOf(Workspace) then
				p.Velocity = Network.Velocity
			end
		end
	end)
end
local function playSound(id)
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://" .. id
	s.Parent = SoundService
	s:Play()
	s.Ended:Connect(function() s:Destroy() end)
end
playSound("2865227271")

-- ==================== UI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GabsRingUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 310, 0, 680)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -340)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 18)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", MainFrame)
stroke.Color = Color3.fromRGB(38, 38, 42)
stroke.Thickness = 1.2

-- Title
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 44)
TitleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 14)

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 16)
TitleFix.Position = UDim2.new(0, 0, 1, -16)
TitleFix.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "gab's Rings  •  v1.5"
Title.TextColor3 = Color3.fromRGB(245, 245, 245)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -38, 0, 7)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(210, 210, 210)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 20
MinimizeButton.Parent = TitleBar
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 8)

-- ========== SCROLLABLE CONTENT ==========
local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -44)
Content.Position = UDim2.new(0, 0, 0, 44)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
Content.CanvasSize = UDim2.new(0, 0, 0, 540)
Content.ScrollingDirection = Enum.ScrollingDirection.Y
Content.Parent = MainFrame

-- LOCAL
local LocalLabel = Instance.new("TextLabel")
LocalLabel.Size = UDim2.new(1, -30, 0, 16)
LocalLabel.Position = UDim2.new(0, 15, 0, 8)
LocalLabel.BackgroundTransparency = 1
LocalLabel.Text = "LOCAL"
LocalLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
LocalLabel.Font = Enum.Font.GothamBold
LocalLabel.TextSize = 11
LocalLabel.TextXAlignment = Enum.TextXAlignment.Left
LocalLabel.Parent = Content

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 280, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -140, 0, 28)
ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
ToggleButton.Text = "Your Ring  •  Off"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamMedium
ToggleButton.TextSize = 13
ToggleButton.Parent = Content
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 8)

local LocalSphereButton = Instance.new("TextButton")
LocalSphereButton.Size = UDim2.new(0, 135, 0, 30)
LocalSphereButton.Position = UDim2.new(0, 15, 0, 64)
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
LocalSphereButton.Text = "Triangle  •  Off"
LocalSphereButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LocalSphereButton.Font = Enum.Font.GothamMedium
LocalSphereButton.TextSize = 13
LocalSphereButton.Parent = Content
Instance.new("UICorner", LocalSphereButton).CornerRadius = UDim.new(0, 8)

local LocalSquareButton = Instance.new("TextButton")
LocalSquareButton.Size = UDim2.new(0, 135, 0, 30)
LocalSquareButton.Position = UDim2.new(0, 160, 0, 64)
LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
LocalSquareButton.Text = "Square  •  Off"
LocalSquareButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LocalSquareButton.Font = Enum.Font.GothamMedium
LocalSquareButton.TextSize = 13
LocalSquareButton.Parent = Content
Instance.new("UICorner", LocalSquareButton).CornerRadius = UDim.new(0, 8)

local CursorButton = Instance.new("TextButton")
CursorButton.Size = UDim2.new(0, 280, 0, 30)
CursorButton.Position = UDim2.new(0.5, -140, 0, 100)
CursorButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
CursorButton.Text = "Cursor Follow  •  Off"
CursorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CursorButton.Font = Enum.Font.GothamMedium
CursorButton.TextSize = 13
CursorButton.Parent = Content
Instance.new("UICorner", CursorButton).CornerRadius = UDim.new(0, 8)

-- Local Radius
local RadiusFrame = Instance.new("Frame")
RadiusFrame.Size = UDim2.new(0, 280, 0, 48)
RadiusFrame.Position = UDim2.new(0.5, -140, 0, 136)
RadiusFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
RadiusFrame.BorderSizePixel = 0
RadiusFrame.Parent = Content
Instance.new("UICorner", RadiusFrame).CornerRadius = UDim.new(0, 9)

local DecreaseRadius = Instance.new("TextButton")
DecreaseRadius.Size = UDim2.new(0, 40, 0, 24)
DecreaseRadius.Position = UDim2.new(0, 8, 0, 5)
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
DecreaseRadius.Text = "−"
DecreaseRadius.TextColor3 = Color3.fromRGB(230, 230, 230)
DecreaseRadius.Font = Enum.Font.GothamBold
DecreaseRadius.TextSize = 18
DecreaseRadius.Parent = RadiusFrame
Instance.new("UICorner", DecreaseRadius).CornerRadius = UDim.new(0, 7)

local IncreaseRadius = Instance.new("TextButton")
IncreaseRadius.Size = UDim2.new(0, 40, 0, 24)
IncreaseRadius.Position = UDim2.new(1, -48, 0, 5)
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
IncreaseRadius.Text = "+"
IncreaseRadius.TextColor3 = Color3.fromRGB(230, 230, 230)
IncreaseRadius.Font = Enum.Font.GothamBold
IncreaseRadius.TextSize = 18
IncreaseRadius.Parent = RadiusFrame
Instance.new("UICorner", IncreaseRadius).CornerRadius = UDim.new(0, 7)

local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0, 140, 0, 24)
RadiusDisplay.Position = UDim2.new(0.5, -70, 0, 5)
RadiusDisplay.BackgroundTransparency = 1
RadiusDisplay.Text = "Radius: 50"
RadiusDisplay.TextColor3 = Color3.fromRGB(235, 235, 235)
RadiusDisplay.Font = Enum.Font.GothamMedium
RadiusDisplay.TextSize = 14
RadiusDisplay.Parent = RadiusFrame

local LocalPartsLabel = Instance.new("TextLabel")
LocalPartsLabel.Size = UDim2.new(1, 0, 0, 16)
LocalPartsLabel.Position = UDim2.new(0, 0, 0, 30)
LocalPartsLabel.BackgroundTransparency = 1
LocalPartsLabel.Text = "Parts: 0"
LocalPartsLabel.TextColor3 = Color3.fromRGB(120, 200, 140)
LocalPartsLabel.Font = Enum.Font.Gotham
LocalPartsLabel.TextSize = 12
LocalPartsLabel.Parent = RadiusFrame

-- SUPER TEXT
local TextDivider = Instance.new("Frame")
TextDivider.Size = UDim2.new(0, 280, 0, 1)
TextDivider.Position = UDim2.new(0.5, -140, 0, 196)
TextDivider.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
TextDivider.BorderSizePixel = 0
TextDivider.Parent = Content

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -30, 0, 16)
TextLabel.Position = UDim2.new(0, 15, 0, 206)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "SUPER TEXT"
TextLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 11
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Content

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 280, 0, 28)
TextBox.Position = UDim2.new(0.5, -140, 0, 226)
TextBox.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
TextBox.Text = "GABS"
TextBox.PlaceholderText = "Type text here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
TextBox.TextColor3 = Color3.fromRGB(240, 240, 240)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.ClearTextOnFocus = false
TextBox.Parent = Content
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local TextToggle = Instance.new("TextButton")
TextToggle.Size = UDim2.new(0, 280, 0, 28)
TextToggle.Position = UDim2.new(0.5, -140, 0, 260)
TextToggle.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
TextToggle.Text = "Super Text  •  Off"
TextToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
TextToggle.Font = Enum.Font.GothamMedium
TextToggle.TextSize = 13
TextToggle.Parent = Content
Instance.new("UICorner", TextToggle).CornerRadius = UDim.new(0, 8)

-- Pixel Size controls
local PixelFrame = Instance.new("Frame")
PixelFrame.Size = UDim2.new(0, 280, 0, 40)
PixelFrame.Position = UDim2.new(0.5, -140, 0, 294)
PixelFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
PixelFrame.BorderSizePixel = 0
PixelFrame.Parent = Content
Instance.new("UICorner", PixelFrame).CornerRadius = UDim.new(0, 8)

local DecreasePixel = Instance.new("TextButton")
DecreasePixel.Size = UDim2.new(0, 40, 0, 24)
DecreasePixel.Position = UDim2.new(0, 8, 0, 8)
DecreasePixel.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
DecreasePixel.Text = "−"
DecreasePixel.TextColor3 = Color3.fromRGB(230, 230, 230)
DecreasePixel.Font = Enum.Font.GothamBold
DecreasePixel.TextSize = 18
DecreasePixel.Parent = PixelFrame
Instance.new("UICorner", DecreasePixel).CornerRadius = UDim.new(0, 7)

local IncreasePixel = Instance.new("TextButton")
IncreasePixel.Size = UDim2.new(0, 40, 0, 24)
IncreasePixel.Position = UDim2.new(1, -48, 0, 8)
IncreasePixel.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
IncreasePixel.Text = "+"
IncreasePixel.TextColor3 = Color3.fromRGB(230, 230, 230)
IncreasePixel.Font = Enum.Font.GothamBold
IncreasePixel.TextSize = 18
IncreasePixel.Parent = PixelFrame
Instance.new("UICorner", IncreasePixel).CornerRadius = UDim.new(0, 7)

local PixelDisplay = Instance.new("TextLabel")
PixelDisplay.Size = UDim2.new(0, 140, 0, 24)
PixelDisplay.Position = UDim2.new(0.5, -70, 0, 8)
PixelDisplay.BackgroundTransparency = 1
PixelDisplay.Text = "Pixel Size: 4.5"
PixelDisplay.TextColor3 = Color3.fromRGB(235, 235, 235)
PixelDisplay.Font = Enum.Font.GothamMedium
PixelDisplay.TextSize = 13
PixelDisplay.Parent = PixelFrame

-- TARGET
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0, 280, 0, 1)
Divider.Position = UDim2.new(0.5, -140, 0, 346)
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
Divider.BorderSizePixel = 0
Divider.Parent = Content

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(1, -30, 0, 16)
TargetLabel.Position = UDim2.new(0, 15, 0, 356)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "TARGET"
TargetLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
TargetLabel.Font = Enum.Font.GothamBold
TargetLabel.TextSize = 11
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = Content

local NameBox = Instance.new("TextBox")
NameBox.Size = UDim2.new(0, 280, 0, 28)
NameBox.Position = UDim2.new(0.5, -140, 0, 376)
NameBox.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
NameBox.Text = ""
NameBox.PlaceholderText = "Enter player name..."
NameBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
NameBox.TextColor3 = Color3.fromRGB(240, 240, 240)
NameBox.Font = Enum.Font.Gotham
NameBox.TextSize = 14
NameBox.ClearTextOnFocus = false
NameBox.Parent = Content
Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0, 8)

local TargetToggle = Instance.new("TextButton")
TargetToggle.Size = UDim2.new(0, 280, 0, 28)
TargetToggle.Position = UDim2.new(0.5, -140, 0, 410)
TargetToggle.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
TargetToggle.Text = "Target Ring  •  Off"
TargetToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetToggle.Font = Enum.Font.GothamMedium
TargetToggle.TextSize = 13
TargetToggle.Parent = Content
Instance.new("UICorner", TargetToggle).CornerRadius = UDim.new(0, 8)

local TargetSphereButton = Instance.new("TextButton")
TargetSphereButton.Size = UDim2.new(0, 135, 0, 28)
TargetSphereButton.Position = UDim2.new(0, 15, 0, 444)
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
TargetSphereButton.Text = "Triangle  •  Off"
TargetSphereButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetSphereButton.Font = Enum.Font.GothamMedium
TargetSphereButton.TextSize = 13
TargetSphereButton.Parent = Content
Instance.new("UICorner", TargetSphereButton).CornerRadius = UDim.new(0, 8)

local TargetSquareButton = Instance.new("TextButton")
TargetSquareButton.Size = UDim2.new(0, 135, 0, 28)
TargetSquareButton.Position = UDim2.new(0, 160, 0, 444)
TargetSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
TargetSquareButton.Text = "Square  •  Off"
TargetSquareButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetSquareButton.Font = Enum.Font.GothamMedium
TargetSquareButton.TextSize = 13
TargetSquareButton.Parent = Content
Instance.new("UICorner", TargetSquareButton).CornerRadius = UDim.new(0, 8)

local TargetRadiusFrame = Instance.new("Frame")
TargetRadiusFrame.Size = UDim2.new(0, 280, 0, 48)
TargetRadiusFrame.Position = UDim2.new(0.5, -140, 0, 480)
TargetRadiusFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
TargetRadiusFrame.BorderSizePixel = 0
TargetRadiusFrame.Parent = Content
Instance.new("UICorner", TargetRadiusFrame).CornerRadius = UDim.new(0, 9)

local TargetDecrease = Instance.new("TextButton")
TargetDecrease.Size = UDim2.new(0, 40, 0, 24)
TargetDecrease.Position = UDim2.new(0, 8, 0, 5)
TargetDecrease.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
TargetDecrease.Text = "−"
TargetDecrease.TextColor3 = Color3.fromRGB(230, 230, 230)
TargetDecrease.Font = Enum.Font.GothamBold
TargetDecrease.TextSize = 18
TargetDecrease.Parent = TargetRadiusFrame
Instance.new("UICorner", TargetDecrease).CornerRadius = UDim.new(0, 7)

local TargetIncrease = Instance.new("TextButton")
TargetIncrease.Size = UDim2.new(0, 40, 0, 24)
TargetIncrease.Position = UDim2.new(1, -48, 0, 5)
TargetIncrease.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
TargetIncrease.Text = "+"
TargetIncrease.TextColor3 = Color3.fromRGB(230, 230, 230)
TargetIncrease.Font = Enum.Font.GothamBold
TargetIncrease.TextSize = 18
TargetIncrease.Parent = TargetRadiusFrame
Instance.new("UICorner", TargetIncrease).CornerRadius = UDim.new(0, 7)

local TargetRadiusDisplay = Instance.new("TextLabel")
TargetRadiusDisplay.Size = UDim2.new(0, 140, 0, 24)
TargetRadiusDisplay.Position = UDim2.new(0.5, -70, 0, 5)
TargetRadiusDisplay.BackgroundTransparency = 1
TargetRadiusDisplay.Text = "Radius: 50"
TargetRadiusDisplay.TextColor3 = Color3.fromRGB(235, 235, 235)
TargetRadiusDisplay.Font = Enum.Font.GothamMedium
TargetRadiusDisplay.TextSize = 14
TargetRadiusDisplay.Parent = TargetRadiusFrame

local TargetPartsLabel = Instance.new("TextLabel")
TargetPartsLabel.Size = UDim2.new(1, 0, 0, 16)
TargetPartsLabel.Position = UDim2.new(0, 0, 0, 30)
TargetPartsLabel.BackgroundTransparency = 1
TargetPartsLabel.Text = "Parts: 0"
TargetPartsLabel.TextColor3 = Color3.fromRGB(210, 160, 100)
TargetPartsLabel.Font = Enum.Font.Gotham
TargetPartsLabel.TextSize = 12
TargetPartsLabel.Parent = TargetRadiusFrame

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 16)
Watermark.Position = UDim2.new(0, 0, 0, 540)
Watermark.BackgroundTransparency = 1
Watermark.Text = "gabs super ring v1.5"
Watermark.TextColor3 = Color3.fromRGB(80, 80, 90)
Watermark.Font = Enum.Font.Gotham
Watermark.TextSize = 11
Watermark.Parent = Content

-- ========== RESIZE GRIP ==========
local ResizeGrip = Instance.new("TextButton")
ResizeGrip.Name = "ResizeGrip"
ResizeGrip.Size = UDim2.new(0, 18, 0, 18)
ResizeGrip.Position = UDim2.new(1, -18, 1, -18)
ResizeGrip.BackgroundColor3 = Color3.fromRGB(50, 50, 58)
ResizeGrip.BorderSizePixel = 0
ResizeGrip.Text = ""
ResizeGrip.AutoButtonColor = false
ResizeGrip.ZIndex = 10
ResizeGrip.Parent = MainFrame
Instance.new("UICorner", ResizeGrip).CornerRadius = UDim.new(0, 4)

local gripDots = Instance.new("TextLabel")
gripDots.Size = UDim2.new(1, 0, 1, 0)
gripDots.BackgroundTransparency = 1
gripDots.Text = "⋱"
gripDots.TextColor3 = Color3.fromRGB(140, 140, 150)
gripDots.Font = Enum.Font.GothamBold
gripDots.TextSize = 14
gripDots.Parent = ResizeGrip

-- Drag + Minimize + Resize
local dragging, dragInput, dragStart, startPos
local resizing = false
local resizeStart, startSize
local minimized = false
local originalSize = MainFrame.Size

local MIN_WIDTH = 280
local MIN_HEIGHT = 200
local MAX_WIDTH = 500
local MAX_HEIGHT = 900

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Resize logic
ResizeGrip.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizing = true
		resizeStart = input.Position
		startSize = MainFrame.Size
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				resizing = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - resizeStart
		local newWidth = math.clamp(startSize.X.Offset + delta.X, MIN_WIDTH, MAX_WIDTH)
		local newHeight = math.clamp(startSize.Y.Offset + delta.Y, MIN_HEIGHT, MAX_HEIGHT)
		MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
	end
end)

MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		MainFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 44)
		Content.Visible = false
		ResizeGrip.Visible = false
		MinimizeButton.Text = "+"
	else
		MainFrame.Size = originalSize
		Content.Visible = true
		ResizeGrip.Visible = true
		MinimizeButton.Text = "−"
	end
	playSound("12221967")
end)

-- ==================== LOGIC ====================
local radius = 50
local height = 100
local rotationSpeed = 0.5
local attractionStrength = 1000
local ringPartsEnabled = false
local localSphereEnabled = false
local localSquareEnabled = false
local targetRadius = 50
local targetRingEnabled = false
local targetSphereEnabled = false
local targetSquareEnabled = false
local targetPlayer = nil
local targetHeight = 100
local targetRotationSpeed = 0.5
local targetAttractionStrength = 1000
local cursorRingEnabled = false
local cursorOrbitRadius = 5.2
local cursorRotationSpeed = 1.6
local cursorAttraction = 420
local maxCursorDistance = 200
local minDistanceFromSelf = 10
-- Super Text
local textEnabled = false
local textString = "GABS"
local textPixelSize = 4.5
local textHeightOffset = 11
local textFrontOffset = -17
local textAttraction = 1300
local parts = {}
local localPartsCount = 0
local targetPartsCount = 0
local lastLocalTriCount = 30
local lastTargetTriCount = 30
local mouse = LocalPlayer:GetMouse()
-- Font
local Font = {
	[" "] = {"00000","00000","00000","00000","00000","00000","00000"},
	["A"] = {"01110","10001","10001","11111","10001","10001","10001"},
	["B"] = {"11110","10001","10001","11110","10001","10001","11110"},
	["C"] = {"01110","10001","10000","10000","10000","10001","01110"},
	["D"] = {"11110","10001","10001","10001","10001","10001","11110"},
	["E"] = {"11111","10000","10000","11110","10000","10000","11111"},
	["F"] = {"11111","10000","10000","11110","10000","10000","10000"},
	["G"] = {"01110","10001","10000","10111","10001","10001","01110"},
	["H"] = {"10001","10001","10001","11111","10001","10001","10001"},
	["I"] = {"01110","00100","00100","00100","00100","00100","01110"},
	["J"] = {"00111","00010","00010","00010","00010","10010","01100"},
	["K"] = {"10001","10010","10100","11000","10100","10010","10001"},
	["L"] = {"10000","10000","10000","10000","10000","10000","11111"},
	["M"] = {"10001","11011","10101","10001","10001","10001","10001"},
	["N"] = {"10001","11001","10101","10011","10001","10001","10001"},
	["O"] = {"01110","10001","10001","10001","10001","10001","01110"},
	["P"] = {"11110","10001","10001","11110","10000","10000","10000"},
	["Q"] = {"01110","10001","10001","10001","10101","10010","01101"},
	["R"] = {"11110","10001","10001","11110","10100","10010","10001"},
	["S"] = {"01111","10000","10000","01110","00001","00001","11110"},
	["T"] = {"11111","00100","00100","00100","00100","00100","00100"},
	["U"] = {"10001","10001","10001","10001","10001","10001","01110"},
	["V"] = {"10001","10001","10001","10001","10001","01010","00100"},
	["W"] = {"10001","10001","10001","10001","10101","11011","10001"},
	["X"] = {"10001","10001","01010","00100","01010","10001","10001"},
	["Y"] = {"10001","10001","01010","00100","00100","00100","00100"},
	["Z"] = {"11111","00001","00010","00100","01000","10000","11111"},
	["0"] = {"01110","10001","10011","10101","11001","10001","01110"},
	["1"] = {"00100","01100","00100","00100","00100","00100","01110"},
	["2"] = {"01110","10001","00001","00010","00100","01000","11111"},
	["3"] = {"01110","10001","00001","00110","00001","10001","01110"},
	["4"] = {"00010","00110","01010","10010","11111","00010","00010"},
	["5"] = {"11111","10000","11110","00001","00001","10001","01110"},
	["6"] = {"01110","10000","10000","11110","10001","10001","01110"},
	["7"] = {"11111","00001","00010","00100","01000","01000","01000"},
	["8"] = {"01110","10001","10001","01110","10001","10001","01110"},
	["9"] = {"01110","10001","10001","01111","00001","00001","01110"},
}
local function getTextPoints(str)
	str = string.upper(tostring(str or ""))
	local points = {}
	local cursorX = 0
	local gap = 1.5
	for i = 1, #str do
		local char = string.sub(str, i, i)
		local rows = Font[char] or Font[" "]
		for row = 1, 7 do
			local line = rows[row]
			for col = 1, 5 do
				if string.sub(line, col, col) == "1" then
					local x = (cursorX + (col - 1)) * textPixelSize
					local y = (7 - row) * textPixelSize
					table.insert(points, Vector3.new(x, y, 0))
				end
			end
		end
		cursorX = cursorX + 5 + gap
	end
	if #points > 0 then
		local minX, maxX = math.huge, -math.huge
		for _, p in ipairs(points) do
			minX = math.min(minX, p.X)
			maxX = math.max(maxX, p.X)
		end
		local mid = (minX + maxX) / 2
		for i, p in ipairs(points) do
			points[i] = Vector3.new(p.X - mid, p.Y, 0)
		end
	end
	return points
end
local currentTextPoints = getTextPoints(textString)
TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	textString = TextBox.Text
	currentTextPoints = getTextPoints(textString)
end)
local function RetainPart(part)
	if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(Workspace) then
		if part:IsDescendantOf(LocalPlayer.Character) then return false end
		part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		part.CanCollide = false
		return true
	end
	return false
end
local function addPart(part)
	if RetainPart(part) and not table.find(parts, part) then
		table.insert(parts, part)
	end
end
local function removePart(part)
	local idx = table.find(parts, part)
	if idx then table.remove(parts, idx) end
end
for _, p in pairs(Workspace:GetDescendants()) do addPart(p) end
Workspace.DescendantAdded:Connect(addPart)
Workspace.DescendantRemoving:Connect(removePart)
local function anyShapeActive()
	return textEnabled or ringPartsEnabled or localSphereEnabled or localSquareEnabled
		or cursorRingEnabled or targetRingEnabled or targetSphereEnabled or targetSquareEnabled
end
RunService.Heartbeat:Connect(function()
	getgenv().Network.Active = not anyShapeActive()
end)
local function isLocalPart(index, total)
	if cursorRingEnabled or textEnabled then return true end
	if not targetRingEnabled and not targetSphereEnabled and not targetSquareEnabled then return true end
	if not ringPartsEnabled and not localSphereEnabled and not localSquareEnabled then return false end
	if ringPartsEnabled and targetRingEnabled and not localSphereEnabled and not localSquareEnabled
		and not targetSphereEnabled and not targetSquareEnabled then
		return index <= math.floor(total * 0.75)
	end
	if localSphereEnabled or localSquareEnabled then return true end
	if targetSphereEnabled or targetSquareEnabled then return false end
	return index <= math.floor(total * 0.75)
end
-- LOCAL HEARTBEAT
RunService.Heartbeat:Connect(function()
	localPartsCount = 0
	-- Super Text
	if textEnabled then
		local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		local pts = currentTextPoints
		local count = #pts
		if count == 0 then
			LocalPartsLabel.Text = "Parts: 0"
			return
		end
		local baseCF = hrp.CFrame * CFrame.new(0, textHeightOffset, textFrontOffset)
		for i, part in ipairs(parts) do
			if part.Parent and not part.Anchored then
				local idx = ((i - 1) % count) + 1
				local localPos = pts[idx]
				-- tiny spread so parts don't perfectly stack
				local spread = 0.4
				local ox = ((i * 17) % 100) / 100 * spread - spread/2
				local oy = ((i * 31) % 100) / 100 * spread - spread/2
				local oz = ((i * 47) % 100) / 100 * spread - spread/2
				local targetPos = (baseCF * CFrame.new(localPos + Vector3.new(ox, oy, oz))).Position
				local dir = targetPos - part.Position
				local mag = dir.Magnitude
				if mag > 0.1 then
					part.Velocity = dir.Unit * math.min(textAttraction, mag * 28)
				else
					part.Velocity = Vector3.zero
				end
				localPartsCount += 1
			end
		end
		LocalPartsLabel.Text = "Parts: " .. localPartsCount
		return
	end
	-- Cursor
	if cursorRingEnabled then
		local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		local mousePos = mouse.Hit.Position
		local center = mousePos
		local offset = center - hrp.Position
		if offset.Magnitude > maxCursorDistance then
			center = hrp.Position + offset.Unit * maxCursorDistance
		end
		local selfOffset = center - hrp.Position
		if selfOffset.Magnitude < minDistanceFromSelf then
			center = hrp.Position + (selfOffset.Magnitude > 0.1 and selfOffset.Unit or Vector3.new(1,0,0)) * minDistanceFromSelf
		end
		local baseAngle = tick() * cursorRotationSpeed
		for i, part in ipairs(parts) do
			if part.Parent and not part.Anchored then
				local angle = baseAngle + i * 0.37
				local targetPos = Vector3.new(
					center.X + math.cos(angle) * cursorOrbitRadius,
					center.Y + 1.2,
					center.Z + math.sin(angle) * cursorOrbitRadius
				)
				local dir = targetPos - part.Position
				if dir.Magnitude > 0.08 then
					part.Velocity = dir.Unit * math.min(cursorAttraction, dir.Magnitude * 18)
				end
				localPartsCount += 1
			end
		end
		LocalPartsLabel.Text = "Parts: " .. localPartsCount
		return
	end
	if not ringPartsEnabled and not localSphereEnabled and not localSquareEnabled then
		LocalPartsLabel.Text = "Parts: 0"
		return
	end
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local center = hrp.Position
	local total = #parts
	local r = radius
	local triCounter = 0
	local baseAngle = tick() * rotationSpeed * 2
	local a1, a2, a3 = baseAngle, baseAngle + 2.0944, baseAngle + 4.1888
	local p1 = Vector3.new(center.X + math.cos(a1)*r, center.Y, center.Z + math.sin(a1)*r)
	local p2 = Vector3.new(center.X + math.cos(a2)*r, center.Y, center.Z + math.sin(a2)*r)
	local p3 = Vector3.new(center.X + math.cos(a3)*r, center.Y, center.Z + math.sin(a3)*r)
	local triEdges = {{p1,p2},{p2,p3},{p3,p1}}
	local s1,s2,s3,s4 = baseAngle, baseAngle+1.5708, baseAngle+3.1416, baseAngle+4.7124
	local sp1 = Vector3.new(center.X + math.cos(s1)*r, center.Y, center.Z + math.sin(s1)*r)
	local sp2 = Vector3.new(center.X + math.cos(s2)*r, center.Y, center.Z + math.sin(s2)*r)
	local sp3 = Vector3.new(center.X + math.cos(s3)*r, center.Y, center.Z + math.sin(s3)*r)
	local sp4 = Vector3.new(center.X + math.cos(s4)*r, center.Y, center.Z + math.sin(s4)*r)
	local squareEdges = {{sp1,sp2},{sp2,sp3},{sp3,sp4},{sp4,sp1}}
	for i, part in ipairs(parts) do
		if part.Parent and not part.Anchored and isLocalPart(i, total) then
			triCounter += 1
			local pos = part.Position
			local angle = math.atan2(pos.Z - center.Z, pos.X - center.X)
			local newAngle = angle + math.rad(rotationSpeed)
			local targetPos
			if localSphereEnabled then
				local edgeIndex = ((triCounter-1) % 3) + 1
				local partsPerEdge = math.max(1, math.floor(lastLocalTriCount / 3))
				local idxOnEdge = math.floor((triCounter-1) / 3)
				local t = (idxOnEdge % partsPerEdge) / partsPerEdge
				targetPos = triEdges[edgeIndex][1]:Lerp(triEdges[edgeIndex][2], t)
			elseif localSquareEnabled then
				local edgeIndex = ((triCounter-1) % 4) + 1
				local partsPerEdge = math.max(1, math.floor(lastLocalTriCount / 4))
				local idxOnEdge = math.floor((triCounter-1) / 4)
				local t = (idxOnEdge % partsPerEdge) / partsPerEdge
				targetPos = squareEdges[edgeIndex][1]:Lerp(squareEdges[edgeIndex][2], t)
			else
				local dist = (Vector3.new(pos.X, center.Y, pos.Z) - center).Magnitude
				targetPos = Vector3.new(
					center.X + math.cos(newAngle) * math.min(r, dist),
					center.Y + (height * math.abs(math.sin((pos.Y - center.Y)/height))),
					center.Z + math.sin(newAngle) * math.min(r, dist)
				)
			end
			local dir = targetPos - part.Position
			if dir.Magnitude > 0.01 then
				part.Velocity = dir.Unit * attractionStrength
			end
			localPartsCount += 1
		end
	end
	lastLocalTriCount = math.max(3, localPartsCount)
	LocalPartsLabel.Text = "Parts: " .. localPartsCount
end)
-- TARGET HEARTBEAT
RunService.Heartbeat:Connect(function()
	targetPartsCount = 0
	if cursorRingEnabled or textEnabled then return end
	if (not targetRingEnabled and not targetSphereEnabled and not targetSquareEnabled) or not targetPlayer then
		TargetPartsLabel.Text = "Parts: 0"
		return
	end
	local char = targetPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local center = hrp.Position
	local total = #parts
	local r = targetRadius
	local triCounter = 0
	local baseAngle = tick() * targetRotationSpeed * 2
	local a1,a2,a3 = baseAngle, baseAngle+2.0944, baseAngle+4.1888
	local p1 = Vector3.new(center.X+math.cos(a1)*r, center.Y, center.Z+math.sin(a1)*r)
	local p2 = Vector3.new(center.X+math.cos(a2)*r, center.Y, center.Z+math.sin(a2)*r)
	local p3 = Vector3.new(center.X+math.cos(a3)*r, center.Y, center.Z+math.sin(a3)*r)
	local triEdges = {{p1,p2},{p2,p3},{p3,p1}}
	local s1,s2,s3,s4 = baseAngle, baseAngle+1.5708, baseAngle+3.1416, baseAngle+4.7124
	local sp1 = Vector3.new(center.X+math.cos(s1)*r, center.Y, center.Z+math.sin(s1)*r)
	local sp2 = Vector3.new(center.X+math.cos(s2)*r, center.Y, center.Z+math.sin(s2)*r)
	local sp3 = Vector3.new(center.X+math.cos(s3)*r, center.Y, center.Z+math.sin(s3)*r)
	local sp4 = Vector3.new(center.X+math.cos(s4)*r, center.Y, center.Z+math.sin(s4)*r)
	local squareEdges = {{sp1,sp2},{sp2,sp3},{sp3,sp4},{sp4,sp1}}
	for i, part in ipairs(parts) do
		if part.Parent and not part.Anchored and not isLocalPart(i, total) then
			if part:IsDescendantOf(char) then continue end
			triCounter += 1
			local pos = part.Position
			local angle = math.atan2(pos.Z-center.Z, pos.X-center.X)
			local newAngle = angle + math.rad(targetRotationSpeed)
			local targetPos
			if targetSphereEnabled then
				local edgeIndex = ((triCounter-1)%3)+1
				local partsPerEdge = math.max(1, math.floor(lastTargetTriCount/3))
				local idxOnEdge = math.floor((triCounter-1)/3)
				local t = (idxOnEdge % partsPerEdge) / partsPerEdge
				targetPos = triEdges[edgeIndex][1]:Lerp(triEdges[edgeIndex][2], t)
			elseif targetSquareEnabled then
				local edgeIndex = ((triCounter-1)%4)+1
				local partsPerEdge = math.max(1, math.floor(lastTargetTriCount/4))
				local idxOnEdge = math.floor((triCounter-1)/4)
				local t = (idxOnEdge % partsPerEdge) / partsPerEdge
				targetPos = squareEdges[edgeIndex][1]:Lerp(squareEdges[edgeIndex][2], t)
			else
				local dist = (Vector3.new(pos.X,center.Y,pos.Z)-center).Magnitude
				targetPos = Vector3.new(
					center.X + math.cos(newAngle)*math.min(r,dist),
					center.Y + (targetHeight * math.abs(math.sin((pos.Y-center.Y)/targetHeight))),
					center.Z + math.sin(newAngle)*math.min(r,dist)
				)
			end
			local dir = targetPos - part.Position
			if dir.Magnitude > 0.01 then
				part.Velocity = dir.Unit * targetAttractionStrength
			end
			targetPartsCount += 1
		end
	end
	lastTargetTriCount = math.max(3, targetPartsCount)
	TargetPartsLabel.Text = "Parts: " .. targetPartsCount
end)
-- ==================== BUTTONS ====================
local function turnOffLocalShapes()
	ringPartsEnabled = false
	localSphereEnabled = false
	localSquareEnabled = false
	cursorRingEnabled = false
	ToggleButton.Text = "Your Ring  •  Off"
	ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
	LocalSphereButton.Text = "Triangle  •  Off"
	LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	LocalSquareButton.Text = "Square  •  Off"
	LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	CursorButton.Text = "Cursor Follow  •  Off"
	CursorButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
end
TextToggle.MouseButton1Click:Connect(function()
	textEnabled = not textEnabled
	if textEnabled then
		turnOffLocalShapes()
		TextToggle.Text = "Super Text  •  On"
		TextToggle.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
	else
		TextToggle.Text = "Super Text  •  Off"
		TextToggle.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
	end
	playSound("12221967")
end)
ToggleButton.MouseButton1Click:Connect(function()
	if cursorRingEnabled or textEnabled then return end
	ringPartsEnabled = not ringPartsEnabled
	if ringPartsEnabled then
		ToggleButton.Text = "Your Ring  •  On"
		ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
		localSphereEnabled = false
		LocalSphereButton.Text = "Triangle  •  Off"
		LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
		localSquareEnabled = false
		LocalSquareButton.Text = "Square  •  Off"
		LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	else
		ToggleButton.Text = "Your Ring  •  Off"
		ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
	end
	playSound("12221967")
end)
LocalSphereButton.MouseButton1Click:Connect(function()
	if cursorRingEnabled or textEnabled then return end
	if targetSphereEnabled then
		targetSphereEnabled = false
		TargetSphereButton.Text = "Triangle  •  Off"
		TargetSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	end
	localSquareEnabled = false
	LocalSquareButton.Text = "Square  •  Off"
	LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	localSphereEnabled = not localSphereEnabled
	if localSphereEnabled then
		LocalSphereButton.Text = "Triangle  •  On"
		LocalSphereButton.BackgroundColor3 = Color3.fromRGB(75, 75, 170)
		ringPartsEnabled = true
		ToggleButton.Text = "Your Ring  •  On"
		ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
	else
		LocalSphereButton.Text = "Triangle  •  Off"
		LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	end
	playSound("12221967")
end)
LocalSquareButton.MouseButton1Click:Connect(function()
	if cursorRingEnabled or textEnabled then return end
	if targetSquareEnabled then
		targetSquareEnabled = false
		TargetSquareButton.Text = "Square  •  Off"
		TargetSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	end
	localSphereEnabled = false
	LocalSphereButton.Text = "Triangle  •  Off"
	LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	localSquareEnabled = not localSquareEnabled
	if localSquareEnabled then
		LocalSquareButton.Text = "Square  •  On"
		LocalSquareButton.BackgroundColor3 = Color3.fromRGB(110, 70, 180)
		ringPartsEnabled = true
		ToggleButton.Text = "Your Ring  •  On"
		ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
	else
		LocalSquareButton.Text = "Square  •  Off"
		LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	end
	playSound("12221967")
end)
CursorButton.MouseButton1Click:Connect(function()
	if textEnabled then return end
	cursorRingEnabled = not cursorRingEnabled
	if cursorRingEnabled then
		turnOffLocalShapes()
		cursorRingEnabled = true
		radius = 200
		RadiusDisplay.Text = "Radius: 200"
		CursorButton.Text = "Cursor Follow  •  On"
		CursorButton.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
	else
		CursorButton.Text = "Cursor Follow  •  Off"
		CursorButton.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
	end
	playSound("12221967")
end)
DecreaseRadius.MouseButton1Click:Connect(function()
	radius = math.max(0, radius - 5)
	RadiusDisplay.Text = "Radius: " .. radius
	playSound("12221967")
end)
IncreaseRadius.MouseButton1Click:Connect(function()
	radius = math.min(10000, radius + 5)
	RadiusDisplay.Text = "Radius: " .. radius
	playSound("12221967")
end)
-- Pixel size controls
DecreasePixel.MouseButton1Click:Connect(function()
	textPixelSize = math.max(1.5, textPixelSize - 0.5)
	PixelDisplay.Text = "Pixel Size: " .. string.format("%.1f", textPixelSize)
	currentTextPoints = getTextPoints(textString)
	playSound("12221967")
end)
IncreasePixel.MouseButton1Click:Connect(function()
	textPixelSize = math.min(12, textPixelSize + 0.5)
	PixelDisplay.Text = "Pixel Size: " .. string.format("%.1f", textPixelSize)
	currentTextPoints = getTextPoints(textString)
	playSound("12221967")
end)
local function findPlayer(name)
	if not name or name == "" then return nil end
	name = string.lower(name)
	for _, plr in pairs(Players:GetPlayers()) do
		if string.find(string.lower(plr.Name), name, 1, true)
			or string.find(string.lower(plr.DisplayName), name, 1, true) then
			return plr
		end
	end
	return nil
end
TargetToggle.MouseButton1Click:Connect(function()
	local found = targetPlayer or findPlayer(NameBox.Text)
	if not found then
		StarterGui:SetCore("SendNotification", {Title="Target Ring", Text="Player not found!", Duration=3})
		playSound("12221967")
		return
	end
	targetPlayer = found
	targetRingEnabled = not targetRingEnabled
	if targetRingEnabled then
		TargetToggle.Text = "Target Ring  •  On"
		TargetToggle.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
		targetSphereEnabled = false
		TargetSphereButton.Text = "Triangle  •  Off"
		TargetSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
		targetSquareEnabled = false
		TargetSquareButton.Text = "Square  •  Off"
		TargetSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
		StarterGui:SetCore("SendNotification", {Title="Target Ring", Text="Ringing: "..found.DisplayName, Duration=3})
	else
		TargetToggle.Text = "Target Ring  •  Off"
		TargetToggle.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
		targetPlayer = nil
	end
	playSound("12221967")
end)
TargetSphereButton.MouseButton1Click:Connect(function()
	local found = targetPlayer or findPlayer(NameBox.Text)
	if not found then
		StarterGui:SetCore("SendNotification", {Title="Target Triangle", Text="Player not found!", Duration=3})
		playSound("12221967")
		return
	end
	if localSphereEnabled then
		localSphereEnabled = false
		LocalSphereButton.Text = "Triangle  •  Off"
		LocalSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	end
	targetSquareEnabled = false
	TargetSquareButton.Text = "Square  •  Off"
	TargetSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	targetPlayer = found
	targetSphereEnabled = not targetSphereEnabled
	if targetSphereEnabled then
		TargetSphereButton.Text = "Triangle  •  On"
		TargetSphereButton.BackgroundColor3 = Color3.fromRGB(75, 75, 170)
		targetRingEnabled = true
		TargetToggle.Text = "Target Ring  •  On"
		TargetToggle.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
		StarterGui:SetCore("SendNotification", {Title="Target Triangle", Text="Triangle on: "..found.DisplayName, Duration=3})
	else
		TargetSphereButton.Text = "Triangle  •  Off"
		TargetSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	end
	playSound("12221967")
end)
TargetSquareButton.MouseButton1Click:Connect(function()
	local found = targetPlayer or findPlayer(NameBox.Text)
	if not found then
		StarterGui:SetCore("SendNotification", {Title="Target Square", Text="Player not found!", Duration=3})
		playSound("12221967")
		return
	end
	if localSquareEnabled then
		localSquareEnabled = false
		LocalSquareButton.Text = "Square  •  Off"
		LocalSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	end
	targetSphereEnabled = false
	TargetSphereButton.Text = "Triangle  •  Off"
	TargetSphereButton.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
	targetPlayer = found
	targetSquareEnabled = not targetSquareEnabled
	if targetSquareEnabled then
		TargetSquareButton.Text = "Square  •  On"
		TargetSquareButton.BackgroundColor3 = Color3.fromRGB(110, 70, 180)
		targetRingEnabled = true
		TargetToggle.Text = "Target Ring  •  On"
		TargetToggle.BackgroundColor3 = Color3.fromRGB(40, 155, 70)
		StarterGui:SetCore("SendNotification", {Title="Target Square", Text="Square on: "..found.DisplayName, Duration=3})
	else
		TargetSquareButton.Text = "Square  •  Off"
		TargetSquareButton.BackgroundColor3 = Color3.fromRGB(70, 50, 110)
	end
	playSound("12221967")
end)
TargetDecrease.MouseButton1Click:Connect(function()
	targetRadius = math.max(0, targetRadius - 5)
	TargetRadiusDisplay.Text = "Radius: " .. targetRadius
	playSound("12221967")
end)
TargetIncrease.MouseButton1Click:Connect(function()
	targetRadius = math.min(10000, targetRadius + 5)
	TargetRadiusDisplay.Text = "Radius: " .. targetRadius
	playSound("12221967")
end)
-- Notifications
pcall(function()
	local userId = Players:GetUserIdFromNameAsync("Gabrieltod112")
	local content = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	StarterGui:SetCore("SendNotification", {
		Title = "gabs super ring v1.5",
		Text = "All modes + Super Text + Pixel Size",
		Icon = content,
		Duration = 5
	})
end)
]])()
				end)
				if not success then
					warn("gabs super ring failed: " .. tostring(err))
				end
			else
				StarterGui:SetCore("SendNotification", {
					Title = "Access Denied",
					Text = "Invalid key.",
					Duration = 3
				})
			end
		end)
	end, Color3.fromRGB(180, 60, 255))
end

-- ==========================================
-- DOORS TAB
-- ==========================================
do
	local doors = tabContents["Doors"]

	local info = Instance.new("TextLabel")
	info.Size = UDim2.new(1, 0, 0, 50)
	info.BackgroundTransparency = 1
	info.Text = "Gabrieltod112's Doors Script\n(ESP, Fullbright, Speed, Delete Screech/Halt, Anti Eyes, Third Person, etc.)"
	info.TextColor3 = Color3.fromRGB(200, 200, 220)
	info.TextSize = 14
	info.Font = Enum.Font.Gotham
	info.TextWrapped = true
	info.TextXAlignment = Enum.TextXAlignment.Left
	info.Parent = doors

	local loadBtn = Instance.new("TextButton")
	loadBtn.Size = UDim2.new(1, -8, 0, 48)
	loadBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 40)
	loadBtn.Text = "Load Doors Script (Rayfield)"
	loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	loadBtn.TextSize = 15
	loadBtn.Font = Enum.Font.GothamBold
	loadBtn.AutoButtonColor = false
	loadBtn.Parent = doors

	local lc = Instance.new("UICorner")
	lc.CornerRadius = UDim.new(0, 10)
	lc.Parent = loadBtn

	loadBtn.MouseEnter:Connect(function()
		TweenService:Create(loadBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(220, 80, 50)}):Play()
	end)
	loadBtn.MouseLeave:Connect(function()
		TweenService:Create(loadBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180, 60, 40)}):Play()
	end)

	loadBtn.MouseButton1Click:Connect(function()
		loadBtn.Text = "Loading..."
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/gab-s-doors-script/refs/heads/main/script.lua"))()
		end)
		if success then
			loadBtn.Text = "Loaded!"
			StarterGui:SetCore("SendNotification", {
				Title = "Doors Script",
				Text = "Loaded successfully",
				Duration = 4
			})
		else
			loadBtn.Text = "Failed – check console"
			warn("Doors script error: " .. tostring(err))
		end
		task.wait(2)
		loadBtn.Text = "Load Doors Script (Rayfield)"
	end)
end

-- ==========================================
-- MM2 TAB (NEW)
-- ==========================================
do
	local mm2 = tabContents["MM2"]

	local info = Instance.new("TextLabel")
	info.Size = UDim2.new(1, 0, 0, 60)
	info.BackgroundTransparency = 1
	info.Text = "Gab's MM2 Gui\nPlayer ESP (Murderer/Sheriff/Innocent)\nGun Drop ESP • WalkSpeed • Teleport\nTouch Fling auto-runs"
	info.TextColor3 = Color3.fromRGB(200, 200, 220)
	info.TextSize = 14
	info.Font = Enum.Font.Gotham
	info.TextWrapped = true
	info.TextXAlignment = Enum.TextXAlignment.Left
	info.Parent = mm2

	local loadBtn = Instance.new("TextButton")
	loadBtn.Size = UDim2.new(1, -8, 0, 48)
	loadBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
	loadBtn.Text = "Load MM2 Script (Rayfield)"
	loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	loadBtn.TextSize = 15
	loadBtn.Font = Enum.Font.GothamBold
	loadBtn.AutoButtonColor = false
	loadBtn.Parent = mm2

	local lc = Instance.new("UICorner")
	lc.CornerRadius = UDim.new(0, 10)
	lc.Parent = loadBtn

	loadBtn.MouseEnter:Connect(function()
		TweenService:Create(loadBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(50, 190, 100)}):Play()
	end)
	loadBtn.MouseLeave:Connect(function()
		TweenService:Create(loadBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 160, 80)}):Play()
	end)

	loadBtn.MouseButton1Click:Connect(function()
		loadBtn.Text = "Loading..."
		local success, err = pcall(function()
			-- Full MM2 script
			loadstring([[
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB", true))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
	Name = "Gab's mm2 Gui",
	Icon = 0,
	LoadingTitle = "Loadddingg Miguels....",
	LoadingSubtitle = "Gab's MM2",
	Theme = "Default",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "GabsMM2",
		FileName = "Config"
	},
	Discord = {
		Enabled = true,
		Invite = "4uvWh8uzZH",
		RememberJoins = true
	},
	KeySystem = false
})

local PlayerESPEnabled = false
local GunESPEnabled = false
local SelectedPlayer = nil
local TeleportToPlayer = false
local CurrentWalkSpeed = 16

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "GabsMM2_ESP"
ESPFolder.Parent = CoreGui

local PlayerHighlights = {}
local GunHighlight = nil

local function getRole(player)
	if not player or not player.Character then return "Innocent" end
	local char = player.Character
	local backpack = player:FindFirstChild("Backpack")
	if char:FindFirstChild("Knife") or (backpack and backpack:FindFirstChild("Knife")) then
		return "Murderer"
	end
	if char:FindFirstChild("Gun") or (backpack and backpack:FindFirstChild("Gun")) then
		return "Sheriff"
	end
	return "Innocent"
end

local function getRoleColor(role)
	if role == "Murderer" then
		return Color3.fromRGB(255, 40, 40)
	elseif role == "Sheriff" then
		return Color3.fromRGB(40, 120, 255)
	else
		return Color3.fromRGB(255, 255, 255)
	end
end

local function clearPlayerESP()
	for _, hl in pairs(PlayerHighlights) do
		if hl and hl.Parent then hl:Destroy() end
	end
	PlayerHighlights = {}
end

local function updatePlayerESP()
	if not PlayerESPEnabled then
		clearPlayerESP()
		return
	end
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local role = getRole(player)
			local color = getRoleColor(role)
			local existing = PlayerHighlights[player]
			if not existing or not existing.Parent then
				local highlight = Instance.new("Highlight")
				highlight.Name = player.Name .. "_ESP"
				highlight.Adornee = player.Character
				highlight.FillTransparency = 0.55
				highlight.OutlineTransparency = 0
				highlight.FillColor = color
				highlight.OutlineColor = color
				highlight.Parent = ESPFolder
				PlayerHighlights[player] = highlight

				local billboard = Instance.new("BillboardGui")
				billboard.Name = "NameTag"
				billboard.Adornee = player.Character:FindFirstChild("Head") or player.Character.HumanoidRootPart
				billboard.Size = UDim2.new(0, 200, 0, 50)
				billboard.StudsOffset = Vector3.new(0, 2.5, 0)
				billboard.AlwaysOnTop = true
				billboard.Parent = highlight

				local text = Instance.new("TextLabel")
				text.Size = UDim2.new(1, 0, 1, 0)
				text.BackgroundTransparency = 1
				text.Text = player.Name .. " [" .. role .. "]"
				text.TextColor3 = color
				text.TextStrokeTransparency = 0.3
				text.Font = Enum.Font.GothamBold
				text.TextSize = 14
				text.Parent = billboard
			else
				existing.FillColor = color
				existing.OutlineColor = color
				local billboard = existing:FindFirstChild("NameTag")
				if billboard and billboard:FindFirstChild("TextLabel") then
					billboard.TextLabel.Text = player.Name .. " [" .. role .. "]"
					billboard.TextLabel.TextColor3 = color
				end
				if existing.Adornee ~= player.Character then
					existing.Adornee = player.Character
				end
			end
		end
	end
	for player, hl in pairs(PlayerHighlights) do
		if not player.Parent or not player.Character then
			if hl then hl:Destroy() end
			PlayerHighlights[player] = nil
		end
	end
end

local function clearGunESP()
	if GunHighlight then
		GunHighlight:Destroy()
		GunHighlight = nil
	end
end

local function updateGunESP()
	if not GunESPEnabled then
		clearGunESP()
		return
	end
	local gunDrop = Workspace:FindFirstChild("GunDrop")
	if not gunDrop then
		for _, obj in pairs(Workspace:GetChildren()) do
			if obj:IsA("Tool") and obj.Name == "Gun" then
				gunDrop = obj
				break
			end
		end
	end
	if gunDrop then
		if not GunHighlight or not GunHighlight.Parent then
			clearGunESP()
			local highlight = Instance.new("Highlight")
			highlight.Name = "GunDropESP"
			highlight.Adornee = gunDrop
			highlight.FillColor = Color3.fromRGB(255, 200, 50)
			highlight.OutlineColor = Color3.fromRGB(255, 255, 100)
			highlight.FillTransparency = 0.35
			highlight.OutlineTransparency = 0
			highlight.Parent = ESPFolder
			GunHighlight = highlight

			local handle = gunDrop:FindFirstChild("Handle") or gunDrop:FindFirstChildWhichIsA("BasePart") or gunDrop
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "GunName"
			billboard.Adornee = handle
			billboard.Size = UDim2.new(0, 140, 0, 35)
			billboard.StudsOffset = Vector3.new(0, 1.8, 0)
			billboard.AlwaysOnTop = true
			billboard.Parent = highlight

			local text = Instance.new("TextLabel")
			text.Size = UDim2.new(1, 0, 1, 0)
			text.BackgroundTransparency = 1
			text.Text = "Sheriff Gun"
			text.TextColor3 = Color3.fromRGB(255, 255, 100)
			text.TextStrokeTransparency = 0.2
			text.Font = Enum.Font.GothamBold
			text.TextSize = 14
			text.Parent = billboard
		end
	else
		clearGunESP()
	end
end

local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateSection("Player ESP")
MiscTab:CreateButton({
	Name = "Player Highlighter (ESP)",
	Callback = function()
		PlayerESPEnabled = not PlayerESPEnabled
		if PlayerESPEnabled then
			Rayfield:Notify({
				Title = "Player ESP",
				Content = "Enabled – Murderer = Red | Sheriff = Blue | Innocent = White",
				Duration = 4
			})
		else
			clearPlayerESP()
			Rayfield:Notify({
				Title = "Player ESP",
				Content = "Disabled",
				Duration = 3
			})
		end
	end,
})

MiscTab:CreateSection("Sheriff Gun ESP")
MiscTab:CreateButton({
	Name = "Highlight Dropped Sheriff Gun",
	Callback = function()
		GunESPEnabled = not GunESPEnabled
		if GunESPEnabled then
			Rayfield:Notify({
				Title = "Gun ESP",
				Content = "Enabled – Only tracks the Sheriff's dropped gun",
				Duration = 4
			})
		else
			clearGunESP()
			Rayfield:Notify({
				Title = "Gun ESP",
				Content = "Disabled",
				Duration = 3
			})
		end
	end,
})

MiscTab:CreateSection("Movement")
MiscTab:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 200},
	Increment = 1,
	Suffix = " Speed",
	CurrentValue = 16,
	Flag = "WalkSpeed",
	Callback = function(Value)
		CurrentWalkSpeed = Value
	end,
})

task.spawn(function()
	while true do
		task.wait(3)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.WalkSpeed = CurrentWalkSpeed
		end
	end
end)

MiscTab:CreateSection("Player Teleport")
local playerNames = {}
for _, p in pairs(Players:GetPlayers()) do
	if p ~= LocalPlayer then
		table.insert(playerNames, p.Name)
	end
end

local PlayerDropdown = MiscTab:CreateDropdown({
	Name = "Select Player",
	Options = playerNames,
	CurrentOption = {playerNames[1] or "None"},
	MultipleOptions = false,
	Flag = "SelectedPlayer",
	Callback = function(Option)
		SelectedPlayer = Option[1]
	end,
})

MiscTab:CreateButton({
	Name = "Refresh Player List",
	Callback = function()
		local newList = {}
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= LocalPlayer then
				table.insert(newList, p.Name)
			end
		end
		PlayerDropdown:Refresh(newList)
		Rayfield:Notify({
			Title = "Player List",
			Content = "Refreshed!",
			Duration = 2
		})
	end,
})

MiscTab:CreateToggle({
	Name = "Teleport Inside Selected Player",
	CurrentValue = false,
	Flag = "TPToggle",
	Callback = function(Value)
		TeleportToPlayer = Value
		if Value then
			Rayfield:Notify({
				Title = "Teleport",
				Content = "Now teleporting inside: " .. (SelectedPlayer or "None"),
				Duration = 3
			})
		end
	end,
})

task.spawn(function()
	while true do
		task.wait(0.1)
		if TeleportToPlayer and SelectedPlayer then
			local target = Players:FindFirstChild(SelectedPlayer)
			if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				local char = LocalPlayer.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
				end
			end
		end
	end
end)

local InfoTab = Window:CreateTab("Info", 4483362458)
InfoTab:CreateSection("Controls")
InfoTab:CreateParagraph({
	Title = "How to Toggle the UI",
	Content = "Press the key K on your keyboard to show or hide the entire menu at any time."
})
InfoTab:CreateSection("Custom Info")
InfoTab:CreateParagraph({
	Title = "Info",
	Content = "this script is currently in beta ... also touch fling script auto executes beacuse you will need it in order to fling."
})

task.spawn(function()
	while true do
		task.wait(0.4)
		if PlayerESPEnabled then
			updatePlayerESP()
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(0.8)
		if GunESPEnabled then
			updateGunESP()
		end
	end
end)

Players.PlayerRemoving:Connect(function(player)
	if PlayerHighlights[player] then
		PlayerHighlights[player]:Destroy()
		PlayerHighlights[player] = nil
	end
end)

local uiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.K then
		uiVisible = not uiVisible
		for _, gui in pairs(CoreGui:GetChildren()) do
			if gui:IsA("ScreenGui") and (gui.Name:find("Rayfield") or gui:FindFirstChild("Main") or gui:FindFirstChild("Window")) then
				gui.Enabled = uiVisible
			end
		end
		if gethui then
			for _, gui in pairs(gethui():GetChildren()) do
				if gui:IsA("ScreenGui") and (gui.Name:find("Rayfield") or gui:FindFirstChild("Main")) then
					gui.Enabled = uiVisible
				end
			end
		end
	end
end)

Rayfield:Notify({
	Title = "Gab's mm2 Gui",
	Content = "Loaded! Press K to toggle the menu.",
	Duration = 5
})
Rayfield:LoadConfiguration()
]])()
		end)
		if success then
			loadBtn.Text = "Loaded!"
			StarterGui:SetCore("SendNotification", {
				Title = "MM2 Script",
				Text = "Loaded successfully – Press K to toggle",
				Duration = 4
			})
		else
			loadBtn.Text = "Failed – check console"
			warn("MM2 script error: " .. tostring(err))
		end
		task.wait(2)
		loadBtn.Text = "Load MM2 Script (Rayfield)"
	end)
end

-- ==========================================
-- CREDITS TAB
-- ==========================================
do
	local credits = tabContents["Credits"]
	local lines = {
		"Original NDS + Doors + MM2 scripts by Gabrieltod112",
		"Dark tabbed GUI redesign",
		"gabs super ring key protected",
		"",
		"Discord: discord.gg/GHMF7JeBGU"
	}
	for _, text in ipairs(lines) do
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 0, 24)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = Color3.fromRGB(170, 170, 190)
		label.TextSize = 14
		label.Font = Enum.Font.Gotham
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = credits
	end
end

switchTab("NDS")
print("Dark Tabbed GUI loaded! (Home | NDS | Doors | MM2 | Credits)")
