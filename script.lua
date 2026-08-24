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
			if entered == "hellofavfuzzy's" then
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
if not getgenv().Network then
getgenv().Network = {
BaseParts = {},
Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424),
}
local Network = getgenv().Network
Network.RetainPart = function(Part)
if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
if not table.find(Network.BaseParts, Part) then
table.insert(Network.BaseParts, Part)
Part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
Part.CanCollide = false
end
end
end
local function EnablePartControl()
LocalPlayer.ReplicationFocus = Workspace
RunService.Heartbeat:Connect(function()
sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
for _, Part in pairs(Network.BaseParts) do
if Part:IsDescendantOf(Workspace) then
Part.Velocity = Network.Velocity
end
end
end)
end
EnablePartControl()
end
local function ForcePart(v)
if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
for _, x in next, v:GetChildren() do
if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
x:Destroy()
end
end
if v:FindFirstChild("Attachment") then v:FindFirstChild("Attachment"):Destroy() end
if v:FindFirstChild("AlignPosition") then v:FindFirstChild("AlignPosition"):Destroy() end
if v:FindFirstChild("Torque") then v:FindFirstChild("Torque"):Destroy() end
v.CanCollide = false
local Torque = Instance.new("Torque", v)
Torque.Torque = Vector3.new(100000,100000,100000)
local AlignPosition = Instance.new("AlignPosition", v)
local Attachment2 = Instance.new("Attachment", v)
Torque.Attachment0 = Attachment2
AlignPosition.MaxForce = 99999999999999999
AlignPosition.MaxVelocity = math.huge
AlignPosition.Responsiveness = 200
AlignPosition.Attachment0 = Attachment2
AlignPosition.Attachment1 = Attachment1
end
end
local function playSound(soundId)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://"..soundId
sound.Parent = SoundService
sound:Play()
sound.Ended:Connect(function() sound:Destroy() end)
end
playSound("2865227271")
-- ==================== UI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GabsRingUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 460)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(40, 40, 40)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 42)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "gab's Rings v1"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.Position = UDim2.new(1, -36, 0, 7)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = TitleBar
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 140, 0, 34)
ToggleButton.Position = UDim2.new(0, 15, 0, 55)
ToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ToggleButton.Text = "Your Ring • Off"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamMedium
ToggleButton.TextSize = 13
ToggleButton.Parent = MainFrame
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton
local LocalSphereButton = Instance.new("TextButton")
LocalSphereButton.Size = UDim2.new(0, 140, 0, 34)
LocalSphereButton.Position = UDim2.new(0, 165, 0, 55)
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
LocalSphereButton.Text = "Triangle • Off"
LocalSphereButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LocalSphereButton.Font = Enum.Font.GothamMedium
LocalSphereButton.TextSize = 13
LocalSphereButton.Parent = MainFrame
local LocalSphereCorner = Instance.new("UICorner")
LocalSphereCorner.CornerRadius = UDim.new(0, 8)
LocalSphereCorner.Parent = LocalSphereButton
local RadiusFrame = Instance.new("Frame")
RadiusFrame.Size = UDim2.new(0, 290, 0, 58)
RadiusFrame.Position = UDim2.new(0.5, -145, 0, 100)
RadiusFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
RadiusFrame.BorderSizePixel = 0
RadiusFrame.Parent = MainFrame
local RadiusFrameCorner = Instance.new("UICorner")
RadiusFrameCorner.CornerRadius = UDim.new(0, 8)
RadiusFrameCorner.Parent = RadiusFrame
local DecreaseRadius = Instance.new("TextButton")
DecreaseRadius.Size = UDim2.new(0, 42, 0, 28)
DecreaseRadius.Position = UDim2.new(0, 8, 0, 6)
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DecreaseRadius.Text = "−"
DecreaseRadius.TextColor3 = Color3.fromRGB(220, 220, 220)
DecreaseRadius.Font = Enum.Font.GothamBold
DecreaseRadius.TextSize = 18
DecreaseRadius.Parent = RadiusFrame
local DecreaseCorner = Instance.new("UICorner")
DecreaseCorner.CornerRadius = UDim.new(0, 6)
DecreaseCorner.Parent = DecreaseRadius
local IncreaseRadius = Instance.new("TextButton")
IncreaseRadius.Size = UDim2.new(0, 42, 0, 28)
IncreaseRadius.Position = UDim2.new(1, -50, 0, 6)
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
IncreaseRadius.Text = "+"
IncreaseRadius.TextColor3 = Color3.fromRGB(220, 220, 220)
IncreaseRadius.Font = Enum.Font.GothamBold
IncreaseRadius.TextSize = 18
IncreaseRadius.Parent = RadiusFrame
local IncreaseCorner = Instance.new("UICorner")
IncreaseCorner.CornerRadius = UDim.new(0, 6)
IncreaseCorner.Parent = IncreaseRadius
local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0, 140, 0, 28)
RadiusDisplay.Position = UDim2.new(0.5, -70, 0, 6)
RadiusDisplay.BackgroundTransparency = 1
RadiusDisplay.Text = "Radius: 50"
RadiusDisplay.TextColor3 = Color3.fromRGB(230, 230, 230)
RadiusDisplay.Font = Enum.Font.GothamMedium
RadiusDisplay.TextSize = 14
RadiusDisplay.Parent = RadiusFrame
local LocalPartsLabel = Instance.new("TextLabel")
LocalPartsLabel.Size = UDim2.new(1, 0, 0, 20)
LocalPartsLabel.Position = UDim2.new(0, 0, 0, 34)
LocalPartsLabel.BackgroundTransparency = 1
LocalPartsLabel.Text = "Parts: 0"
LocalPartsLabel.TextColor3 = Color3.fromRGB(140, 200, 140)
LocalPartsLabel.Font = Enum.Font.Gotham
LocalPartsLabel.TextSize = 13
LocalPartsLabel.Parent = RadiusFrame
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0, 290, 0, 1)
Divider.Position = UDim2.new(0.5, -145, 0, 172)
Divider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame
local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0, 290, 0, 18)
TargetLabel.Position = UDim2.new(0.5, -145, 0, 180)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "Target Player (less parts on normal ring)"
TargetLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
TargetLabel.Font = Enum.Font.GothamMedium
TargetLabel.TextSize = 12
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = MainFrame
local NameBox = Instance.new("TextBox")
NameBox.Size = UDim2.new(0, 290, 0, 32)
NameBox.Position = UDim2.new(0.5, -145, 0, 202)
NameBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
NameBox.Text = ""
NameBox.PlaceholderText = "Enter player name..."
NameBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
NameBox.TextColor3 = Color3.fromRGB(240, 240, 240)
NameBox.Font = Enum.Font.Gotham
NameBox.TextSize = 14
NameBox.ClearTextOnFocus = false
NameBox.Parent = MainFrame
local NameBoxCorner = Instance.new("UICorner")
NameBoxCorner.CornerRadius = UDim.new(0, 8)
NameBoxCorner.Parent = NameBox
local NameBoxStroke = Instance.new("UIStroke")
NameBoxStroke.Color = Color3.fromRGB(50, 50, 50)
NameBoxStroke.Thickness = 1
NameBoxStroke.Parent = NameBox
local TargetToggle = Instance.new("TextButton")
TargetToggle.Size = UDim2.new(0, 140, 0, 34)
TargetToggle.Position = UDim2.new(0, 15, 0, 244)
TargetToggle.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
TargetToggle.Text = "Target Ring • Off"
TargetToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetToggle.Font = Enum.Font.GothamMedium
TargetToggle.TextSize = 13
TargetToggle.Parent = MainFrame
local TargetToggleCorner = Instance.new("UICorner")
TargetToggleCorner.CornerRadius = UDim.new(0, 8)
TargetToggleCorner.Parent = TargetToggle
local TargetSphereButton = Instance.new("TextButton")
TargetSphereButton.Size = UDim2.new(0, 140, 0, 34)
TargetSphereButton.Position = UDim2.new(0, 165, 0, 244)
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
TargetSphereButton.Text = "Triangle • Off"
TargetSphereButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetSphereButton.Font = Enum.Font.GothamMedium
TargetSphereButton.TextSize = 13
TargetSphereButton.Parent = MainFrame
local TargetSphereCorner = Instance.new("UICorner")
TargetSphereCorner.CornerRadius = UDim.new(0, 8)
TargetSphereCorner.Parent = TargetSphereButton
local TargetRadiusFrame = Instance.new("Frame")
TargetRadiusFrame.Size = UDim2.new(0, 290, 0, 58)
TargetRadiusFrame.Position = UDim2.new(0.5, -145, 0, 290)
TargetRadiusFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
TargetRadiusFrame.BorderSizePixel = 0
TargetRadiusFrame.Parent = MainFrame
local TargetRadiusFrameCorner = Instance.new("UICorner")
TargetRadiusFrameCorner.CornerRadius = UDim.new(0, 8)
TargetRadiusFrameCorner.Parent = TargetRadiusFrame
local TargetDecrease = Instance.new("TextButton")
TargetDecrease.Size = UDim2.new(0, 42, 0, 28)
TargetDecrease.Position = UDim2.new(0, 8, 0, 6)
TargetDecrease.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TargetDecrease.Text = "−"
TargetDecrease.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetDecrease.Font = Enum.Font.GothamBold
TargetDecrease.TextSize = 18
TargetDecrease.Parent = TargetRadiusFrame
local TargetDecreaseCorner = Instance.new("UICorner")
TargetDecreaseCorner.CornerRadius = UDim.new(0, 6)
TargetDecreaseCorner.Parent = TargetDecrease
local TargetIncrease = Instance.new("TextButton")
TargetIncrease.Size = UDim2.new(0, 42, 0, 28)
TargetIncrease.Position = UDim2.new(1, -50, 0, 6)
TargetIncrease.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TargetIncrease.Text = "+"
TargetIncrease.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetIncrease.Font = Enum.Font.GothamBold
TargetIncrease.TextSize = 18
TargetIncrease.Parent = TargetRadiusFrame
local TargetIncreaseCorner = Instance.new("UICorner")
TargetIncreaseCorner.CornerRadius = UDim.new(0, 6)
TargetIncreaseCorner.Parent = TargetIncrease
local TargetRadiusDisplay = Instance.new("TextLabel")
TargetRadiusDisplay.Size = UDim2.new(0, 140, 0, 28)
TargetRadiusDisplay.Position = UDim2.new(0.5, -70, 0, 6)
TargetRadiusDisplay.BackgroundTransparency = 1
TargetRadiusDisplay.Text = "Radius: 50"
TargetRadiusDisplay.TextColor3 = Color3.fromRGB(230, 230, 230)
TargetRadiusDisplay.Font = Enum.Font.GothamMedium
TargetRadiusDisplay.TextSize = 14
TargetRadiusDisplay.Parent = TargetRadiusFrame
local TargetPartsLabel = Instance.new("TextLabel")
TargetPartsLabel.Size = UDim2.new(1, 0, 0, 20)
TargetPartsLabel.Position = UDim2.new(0, 0, 0, 34)
TargetPartsLabel.BackgroundTransparency = 1
TargetPartsLabel.Text = "Parts: 0"
TargetPartsLabel.TextColor3 = Color3.fromRGB(200, 160, 100)
TargetPartsLabel.Font = Enum.Font.Gotham
TargetPartsLabel.TextSize = 13
TargetPartsLabel.Parent = TargetRadiusFrame
local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -24)
Watermark.BackgroundTransparency = 1
Watermark.Text = "gabs super ring v1"
Watermark.TextColor3 = Color3.fromRGB(90, 90, 90)
Watermark.Font = Enum.Font.Gotham
Watermark.TextSize = 12
Watermark.Parent = MainFrame
local dragging, dragInput, dragStart, startPos
local minimized = false
local originalSize = MainFrame.Size
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
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
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
MinimizeButton.MouseButton1Click:Connect(function()
minimized = not minimized
if minimized then
MainFrame.Size = UDim2.new(0, 320, 0, 42)
for _, child in pairs(MainFrame:GetChildren()) do
if child ~= TitleBar and child ~= MinimizeButton then
child.Visible = false
end
end
MinimizeButton.Text = "+"
else
MainFrame.Size = originalSize
for _, child in pairs(MainFrame:GetChildren()) do
child.Visible = true
end
MinimizeButton.Text = "−"
end
end)
local radius = 50
local height = 100
local rotationSpeed = 0.5
local attractionStrength = 1000
local ringPartsEnabled = false
local localSphereEnabled = false
local targetRadius = 50
local targetRingEnabled = false
local targetSphereEnabled = false
local targetPlayer = nil
local targetHeight = 100
local targetRotationSpeed = 0.5
local targetAttractionStrength = 1000
local parts = {}
local localPartsCount = 0
local targetPartsCount = 0
local lastLocalTriCount = 30
local lastTargetTriCount = 30
local function RetainPart(part)
if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(Workspace) then
if part:IsDescendantOf(LocalPlayer.Character) then return false end
part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
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
for _, part in pairs(Workspace:GetDescendants()) do addPart(part) end
Workspace.DescendantAdded:Connect(addPart)
Workspace.DescendantRemoving:Connect(removePart)
local function isLocalPart(index, total)
if not targetRingEnabled and not targetSphereEnabled then
return true
end
if not ringPartsEnabled and not localSphereEnabled then
return false
end
if ringPartsEnabled and targetRingEnabled and not localSphereEnabled and not targetSphereEnabled then
return index <= math.floor(total * 0.75)
end
if localSphereEnabled then return true end
if targetSphereEnabled then return false end
return index <= math.floor(total * 0.75)
end
RunService.Heartbeat:Connect(function()
localPartsCount = 0
if not ringPartsEnabled and not localSphereEnabled then
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
local a1 = baseAngle
local a2 = baseAngle + 2.09439510239
local a3 = baseAngle + 4.18879020479
local p1 = Vector3.new(center.X + math.cos(a1) * r, center.Y, center.Z + math.sin(a1) * r)
local p2 = Vector3.new(center.X + math.cos(a2) * r, center.Y, center.Z + math.sin(a2) * r)
local p3 = Vector3.new(center.X + math.cos(a3) * r, center.Y, center.Z + math.sin(a3) * r)
local edges = {{p1, p2},{p2, p3},{p3, p1}}
for i, part in ipairs(parts) do
if part.Parent and not part.Anchored and isLocalPart(i, total) then
triCounter = triCounter + 1
local pos = part.Position
local angle = math.atan2(pos.Z - center.Z, pos.X - center.X)
local newAngle = angle + math.rad(rotationSpeed)
local targetPos
if localSphereEnabled then
local edgeIndex = ((triCounter - 1) % 3) + 1
local partsPerEdge = math.max(1, math.floor(lastLocalTriCount / 3))
local idxOnEdge = math.floor((triCounter - 1) / 3)
local t = (idxOnEdge % partsPerEdge) / partsPerEdge
local from = edges[edgeIndex][1]
local to = edges[edgeIndex][2]
targetPos = from:Lerp(to, t)
else
local dist = (Vector3.new(pos.X, center.Y, pos.Z) - center).Magnitude
targetPos = Vector3.new(
center.X + math.cos(newAngle) * math.min(r, dist),
center.Y + (height * math.abs(math.sin((pos.Y - center.Y)/height))),
center.Z + math.sin(newAngle) * math.min(r, dist)
)
end
local dir = (targetPos - part.Position)
if dir.Magnitude > 0.01 then
part.Velocity = dir.Unit * attractionStrength
end
localPartsCount = localPartsCount + 1
end
end
lastLocalTriCount = math.max(3, localPartsCount)
LocalPartsLabel.Text = "Parts: " .. localPartsCount
end)
RunService.Heartbeat:Connect(function()
targetPartsCount = 0
if (not targetRingEnabled and not targetSphereEnabled) or not targetPlayer then
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
local a1 = baseAngle
local a2 = baseAngle + 2.09439510239
local a3 = baseAngle + 4.18879020479
local p1 = Vector3.new(center.X + math.cos(a1) * r, center.Y, center.Z + math.sin(a1) * r)
local p2 = Vector3.new(center.X + math.cos(a2) * r, center.Y, center.Z + math.sin(a2) * r)
local p3 = Vector3.new(center.X + math.cos(a3) * r, center.Y, center.Z + math.sin(a3) * r)
local edges = {{p1, p2},{p2, p3},{p3, p1}}
for i, part in ipairs(parts) do
if part.Parent and not part.Anchored and not isLocalPart(i, total) then
if part:IsDescendantOf(char) then continue end
triCounter = triCounter + 1
local pos = part.Position
local angle = math.atan2(pos.Z - center.Z, pos.X - center.X)
local newAngle = angle + math.rad(targetRotationSpeed)
local targetPos
if targetSphereEnabled then
local edgeIndex = ((triCounter - 1) % 3) + 1
local partsPerEdge = math.max(1, math.floor(lastTargetTriCount / 3))
local idxOnEdge = math.floor((triCounter - 1) / 3)
local t = (idxOnEdge % partsPerEdge) / partsPerEdge
local from = edges[edgeIndex][1]
local to = edges[edgeIndex][2]
targetPos = from:Lerp(to, t)
else
local dist = (Vector3.new(pos.X, center.Y, pos.Z) - center).Magnitude
targetPos = Vector3.new(
center.X + math.cos(newAngle) * math.min(r, dist),
center.Y + (targetHeight * math.abs(math.sin((pos.Y - center.Y)/targetHeight))),
center.Z + math.sin(newAngle) * math.min(r, dist)
)
end
local dir = (targetPos - part.Position)
if dir.Magnitude > 0.01 then
part.Velocity = dir.Unit * targetAttractionStrength
end
targetPartsCount = targetPartsCount + 1
end
end
lastTargetTriCount = math.max(3, targetPartsCount)
TargetPartsLabel.Text = "Parts: " .. targetPartsCount
end)
ToggleButton.MouseButton1Click:Connect(function()
ringPartsEnabled = not ringPartsEnabled
if ringPartsEnabled then
ToggleButton.Text = "Your Ring • On"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
if localSphereEnabled then
localSphereEnabled = false
LocalSphereButton.Text = "Triangle • Off"
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
end
else
ToggleButton.Text = "Your Ring • Off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
end
playSound("12221967")
end)
LocalSphereButton.MouseButton1Click:Connect(function()
if targetSphereEnabled then
targetSphereEnabled = false
TargetSphereButton.Text = "Triangle • Off"
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
end
localSphereEnabled = not localSphereEnabled
if localSphereEnabled then
LocalSphereButton.Text = "Triangle • On"
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(80, 80, 180)
ringPartsEnabled = true
ToggleButton.Text = "Your Ring • On"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
else
LocalSphereButton.Text = "Triangle • Off"
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
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
local function findPlayer(name)
if not name or name == "" then return nil end
name = string.lower(name)
for _, plr in pairs(Players:GetPlayers()) do
if string.find(string.lower(plr.Name), name, 1, true) or string.find(string.lower(plr.DisplayName), name, 1, true) then
return plr
end
end
return nil
end
TargetToggle.MouseButton1Click:Connect(function()
local found = findPlayer(NameBox.Text)
if not found then
StarterGui:SetCore("SendNotification", {Title = "Target Ring", Text = "Player not found!", Duration = 3})
playSound("12221967")
return
end
targetPlayer = found
targetRingEnabled = not targetRingEnabled
if targetRingEnabled then
TargetToggle.Text = "Target Ring • On"
TargetToggle.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
if targetSphereEnabled then
targetSphereEnabled = false
TargetSphereButton.Text = "Triangle • Off"
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
end
StarterGui:SetCore("SendNotification", {Title = "Target Ring", Text = "Ringing: " .. found.Name, Duration = 3})
else
TargetToggle.Text = "Target Ring • Off"
TargetToggle.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
targetPlayer = nil
end
playSound("12221967")
end)
TargetSphereButton.MouseButton1Click:Connect(function()
local found = findPlayer(NameBox.Text)
if not found then
StarterGui:SetCore("SendNotification", {Title = "Target Triangle", Text = "Player not found!", Duration = 3})
playSound("12221967")
return
end
if localSphereEnabled then
localSphereEnabled = false
LocalSphereButton.Text = "Triangle • Off"
LocalSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
end
targetPlayer = found
targetSphereEnabled = not targetSphereEnabled
if targetSphereEnabled then
TargetSphereButton.Text = "Triangle • On"
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(80, 80, 180)
targetRingEnabled = true
TargetToggle.Text = "Target Ring • On"
TargetToggle.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
StarterGui:SetCore("SendNotification", {Title = "Target Triangle", Text = "Triangle on: " .. found.Name, Duration = 3})
else
TargetSphereButton.Text = "Triangle • Off"
TargetSphereButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
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
NameBox.FocusLost:Connect(function()
if (targetRingEnabled or targetSphereEnabled) and NameBox.Text ~= "" then
local found = findPlayer(NameBox.Text)
if found then
targetPlayer = found
StarterGui:SetCore("SendNotification", {Title = "Target", Text = "Now targeting: " .. found.Name, Duration = 2})
end
end
end)
local userId = Players:GetUserIdFromNameAsync("Gabrieltod112")
local content = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
StarterGui:SetCore("SendNotification", {
Title = "gabs super ring v1",
Text = "Loaded successfully",
Icon = content,
Duration = 5
})
StarterGui:SetCore("SendNotification", {
Title = "Credits",
Text = "Gabrieltod112",
Icon = content,
Duration = 5
})
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
