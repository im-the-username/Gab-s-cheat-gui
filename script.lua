-- ====================== OPERATION RAGE ======================
-- made by gabrieltod112
-- Owner UserId: 2320681142

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

local StarterGui = game:GetService("StarterGui")
local success, content = pcall(function()
	return game:GetService("Players"):GetUserThumbnailAsync(2320681142, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)
StarterGui:SetCore("SendNotification", {
	Title = "Owner",
	Text = "Gabrieltod112",
	Icon = success and content or "",
	Duration = 6
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")

-- ==================== OWNER SYSTEM ====================
local OWNER_USER_ID = 2320681142
local isOwner = LocalPlayer.UserId == OWNER_USER_ID

-- Unique marker so the owner can detect other people using the script
local MARKER_NAME = "OperationRage_Client_Marker"

-- Plant the marker (everyone who runs the script does this)
local function plantMarker()
	local pg = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
	if not pg:FindFirstChild(MARKER_NAME) then
		local marker = Instance.new("Folder")
		marker.Name = MARKER_NAME
		marker.Parent = pg
	end
end
plantMarker()

-- Check if a player is running Operation Rage
local function isUsingScript(player)
	if not player then return false end
	local pg = player:FindFirstChild("PlayerGui")
	if pg and pg:FindFirstChild(MARKER_NAME) then
		return true
	end
	return false
end

-- ==================== NDS ====================
local NDS_PLACE_IDS = {
	[189707] = true,
}

local function isNDS()
	return NDS_PLACE_IDS[game.PlaceId] == true
end

-- ==================== CONFIG ====================
local ConfigFolder = "OperationRage"
local ConfigFile = ConfigFolder .. "/settings.json"

local DefaultSettings = {
	ToggleKey = "RightControl",
	NDS_DontPrompt = false,
	NDS_AutoLoad = false
}

local Settings = table.clone(DefaultSettings)

local function saveSettings()
	pcall(function()
		if not isfolder(ConfigFolder) then
			makefolder(ConfigFolder)
		end
		writefile(ConfigFile, HttpService:JSONEncode(Settings))
	end)
end

local function loadSettings()
	pcall(function()
		if isfile(ConfigFile) then
			local data = HttpService:JSONDecode(readfile(ConfigFile))
			for k, v in pairs(data) do
				Settings[k] = v
			end
		end
	end)
end

loadSettings()

-- ==================== MUSIC LIBRARY ====================
local MusicLibrary = {
	{Name = "Raining Tacos", ID = 142376088},
	{Name = "Crab Rave", ID = 5410086218},
	{Name = "Whatcha Say", ID = 168208965},
	{Name = "God's Plan - Drake", ID = 1665926924},
	{Name = "Stronger - Kanye", ID = 136209425},
	{Name = "Tokyo Drift", ID = 1837015626},
	{Name = "Stadium Rave (SpongeBob)", ID = 1846368080},
	{Name = "Spooky Scary Skeletons", ID = 138081566},
	{Name = "Gangsta's Paradise", ID = 6070263388},
	{Name = "Smooth Criminal", ID = 4883181281},
	{Name = "Without Me - Eminem", ID = 6689996382},
	{Name = "Intergalactic", ID = 131603357},
	{Name = "Black and Yellow", ID = 139235100},
	{Name = "Moves Like Jagger", ID = 291895335},
	{Name = "Jenny", ID = 170103636},
	{Name = "Let's Get It Started", ID = 138134680},
	{Name = "Claire De Lune", ID = 1838457617},
	{Name = "Happy Song", ID = 1843404009},
	{Name = "Squid Game Theme", ID = 7535587224},
	{Name = "Sandstorm", ID = 166562385},
	{Name = "Never Gonna Give You Up", ID = 507443984},
	{Name = "Thunderstruck", ID = 146961487},
	{Name = "Baby Shark", ID = 614018503},
	{Name = "Gangnam Style", ID = 1293544985},
	{Name = "Bohemian Rhapsody", ID = 4587240503},
	{Name = "Rasputin", ID = 5512350519},
	{Name = "Take On Me", ID = 4606705490},
	{Name = "Believer", ID = 2389193148},
	{Name = "Levitating", ID = 6606223785},
	{Name = "Bad Habits", ID = 7202579511},
	{Name = "In The End", ID = 3018974408},
	{Name = "Smells Like Teen Spirit", ID = 3495593580},
	{Name = "Pokerap", ID = 152381839},
	{Name = "Team Fortress 2", ID = 166378555},
	{Name = "Mii Channel", ID = 143666548},
	{Name = "GTA San Andreas", ID = 4571975095},
	{Name = "Moonlight Sonata", ID = 445023353},
	{Name = "Fur Elise", ID = 450051032},
	{Name = "Chill Jazz", ID = 1845341094},
	{Name = "Lo-Fi Chill", ID = 9043887091},
	{Name = "Running", ID = 1843436418},
	{Name = "Get Hyper", ID = 138855854},
	{Name = "Trumpets", ID = 146237847},
	{Name = "Wooden Bear", ID = 1844397736},
	{Name = "Ooh Kill Em", ID = 139222895},
	{Name = "Domo23", ID = 8757702532},
	{Name = "Shiawase", ID = 5409360995},
	{Name = "Poolside", ID = 9046863253},
	{Name = "Horror", ID = 9039981149},
	{Name = "All Star", ID = 166560754},
	{Name = "Nyan Cat", ID = 142292308},
	{Name = "Numb - Linkin Park", ID = 368199310},
	{Name = "Bring Me To Life", ID = 547303549},
	{Name = "We Will Rock You", ID = 333449748},
	{Name = "Enter Sandman", ID = 2565757094},
	{Name = "Paint It Black", ID = 6828176320},
	{Name = "Highway to Hell", ID = 4728058875},
	{Name = "Dynamite - BTS", ID = 6257627378},
	{Name = "Butter - BTS", ID = 6844912719},
	{Name = "Money - LISA", ID = 7551431783},
	{Name = "God Is A Woman", ID = 2071829884},
	{Name = "Say So", ID = 521116871},
	{Name = "Industry Baby", ID = 7253841629},
	{Name = "Sunflower", ID = 2698664996},
	{Name = "Viva La Vida", ID = 170173180},
	{Name = "Chop Suey", ID = 4556134799},
	{Name = "This Is America", ID = 2062482384},
	{Name = "Lean On", ID = 606299326},
	{Name = "Royals", ID = 412314152},
	{Name = "Natural - Imagine Dragons", ID = 2173344520},
	{Name = "What's Up Danger", ID = 3106151105},
	{Name = "Hallelujah", ID = 241864564},
	{Name = "Let It Go", ID = 189105508},
	{Name = "Applause", ID = 130964099},
	{Name = "Milkshake", ID = 321199908},
	{Name = "Soft Jazz", ID = 926493242},
	{Name = "Toccata & Fugue", ID = 564238335},
}

local currentSound = nil
local isPlaying = false
local currentVol = 0.5
local currentSpeed = 1

local function playSong(id)
	if currentSound then
		currentSound:Stop()
		currentSound:Destroy()
	end
	currentSound = Instance.new("Sound")
	currentSound.SoundId = "rbxassetid://" .. tostring(id)
	currentSound.Volume = currentVol
	currentSound.PlaybackSpeed = currentSpeed
	currentSound.Looped = true
	currentSound.Parent = SoundService
	currentSound:Play()
	isPlaying = true
end

local function stopSong()
	if currentSound then
		currentSound:Stop()
		currentSound:Destroy()
		currentSound = nil
	end
	isPlaying = false
end

-- ==================== PRESET ====================
local function runNDSPreset()
	local scripts = {
		{name = "Touch fling", url = "https://pastebin.com/raw/LgZwZ7ZB"},
		{name = "Kilaskis multi fling", url = "https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"},
		{name = "anti stuff", url = "https://raw.githubusercontent.com/OMNIMANRUSSIA/NDS-OMNIMAN-GOD-TOUCH-FLING-ANTISIT-ANTIBANG/main/main.lua"},
		{name = "Flight anims", url = "https://obj.wearedevs.net/197198/scripts/invincible%20flight%20animation.lua"},
		{name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
	}
	for _, s in ipairs(scripts) do
		task.spawn(function()
			local ok, err = pcall(function()
				loadstring(game:HttpGet(s.url, true))()
			end)
			if not ok then
				warn("[NDS Preset] " .. s.name .. " failed: " .. tostring(err))
			end
		end)
		task.wait(0.4)
	end
end

-- ==================== OWNER KILL ====================
local function attemptKill(targetPlayer)
	if not targetPlayer or not targetPlayer.Character then return end
	local char = targetPlayer.Character
	local hum = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")

	if hum then
		pcall(function()
			hum.Health = 0
		end)
	end

	if hrp then
		pcall(function()
			hrp.Velocity = Vector3.new(0, 9999, 0)
			hrp.RotVelocity = Vector3.new(9999, 9999, 9999)
		end)
	end
end

-- ==================== UI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OperationRage"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 480, 0, 340)
Main.Position = UDim2.new(0.5, -250, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(140, 25, 25)
Main.BackgroundTransparency = 0.18
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255, 80, 80)
Stroke.Thickness = 1.4
Stroke.Transparency = 0.3

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.BackgroundColor3 = Color3.fromRGB(110, 15, 15)
TitleBar.BackgroundTransparency = 0.15
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(110, 15, 15)
TitleFix.BackgroundTransparency = 0.15
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Operation Rage  |  made by gabrieltod112"
Title.TextColor3 = Color3.fromRGB(255, 230, 230)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 26)
MinimizeBtn.Position = UDim2.new(1, -70, 0, 6)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.Parent = TitleBar
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 26)
CloseBtn.Position = UDim2.new(1, -38, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 260, 0, 120)
ConfirmFrame.Position = UDim2.new(0.5, -130, 0.5, -60)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(100, 15, 15)
ConfirmFrame.BackgroundTransparency = 0.1
ConfirmFrame.Visible = false
ConfirmFrame.ZIndex = 50
ConfirmFrame.Parent = ScreenGui
Instance.new("UICorner", ConfirmFrame).CornerRadius = UDim.new(0, 10)

local ConfirmStroke = Instance.new("UIStroke", ConfirmFrame)
ConfirmStroke.Color = Color3.fromRGB(255, 80, 80)
ConfirmStroke.Thickness = 1.5

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, -20, 0, 50)
ConfirmText.Position = UDim2.new(0, 10, 0, 15)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "Are you sure you want to close\nOperation Rage?"
ConfirmText.TextColor3 = Color3.fromRGB(255, 230, 230)
ConfirmText.Font = Enum.Font.GothamMedium
ConfirmText.TextSize = 14
ConfirmText.ZIndex = 51
ConfirmText.Parent = ConfirmFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 100, 0, 32)
YesBtn.Position = UDim2.new(0, 20, 1, -45)
YesBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
YesBtn.Text = "Yes"
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextSize = 14
YesBtn.ZIndex = 51
YesBtn.Parent = ConfirmFrame
Instance.new("UICorner", YesBtn).CornerRadius = UDim.new(0, 6)

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 100, 0, 32)
NoBtn.Position = UDim2.new(1, -120, 1, -45)
NoBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
NoBtn.Text = "No"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextSize = 14
NoBtn.ZIndex = 51
NoBtn.Parent = ConfirmFrame
Instance.new("UICorner", NoBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = true
end)
YesBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
NoBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = false
end)

local minimized = false
local originalSize = Main.Size
MinimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		Main:TweenSize(UDim2.new(0, 480, 0, 38), "Out", "Quad", 0.25, true)
		MinimizeBtn.Text = "+"
	else
		Main:TweenSize(originalSize, "Out", "Quad", 0.25, true)
		MinimizeBtn.Text = "−"
	end
end)

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 110, 1, -38)
TabFrame.Position = UDim2.new(0, 0, 0, 38)
TabFrame.BackgroundColor3 = Color3.fromRGB(100, 12, 12)
TabFrame.BackgroundTransparency = 0.25
TabFrame.BorderSizePixel = 0
TabFrame.Parent = Main

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -120, 1, -50)
Content.Position = UDim2.new(0, 115, 0, 45)
Content.BackgroundTransparency = 1
Content.Parent = Main

local function createTabButton(name, order)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 34)
	btn.Position = UDim2.new(0, 5, 0, 8 + (order - 1) * 40)
	btn.BackgroundColor3 = Color3.fromRGB(160, 35, 35)
	btn.BackgroundTransparency = 0.3
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 230, 230)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 13
	btn.Parent = TabFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
	return btn
end

local MiscTabBtn = createTabButton("Misc", 1)
local OPTabBtn = createTabButton("OP", 2)
local OtherTabBtn = createTabButton("Other Games", 3)

local OwnerTabBtn = nil
if isOwner then
	OwnerTabBtn = createTabButton("Owner", 4)
end

local function createPage()
	local page = Instance.new("ScrollingFrame")
	page.Size = UDim2.new(1, 0, 1, 0)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
	page.CanvasSize = UDim2.new(0, 0, 0, 0)
	page.Visible = false
	page.Parent = Content
	return page
end

local MiscPage = createPage()
local OPPage = createPage()
local OtherPage = createPage()
local OwnerPage = isOwner and createPage() or nil

local function showPage(page)
	MiscPage.Visible = false
	OPPage.Visible = false
	OtherPage.Visible = false
	if OwnerPage then OwnerPage.Visible = false end
	page.Visible = true
end

MiscTabBtn.MouseButton1Click:Connect(function() showPage(MiscPage) end)
OPTabBtn.MouseButton1Click:Connect(function() showPage(OPPage) end)
OtherTabBtn.MouseButton1Click:Connect(function() showPage(OtherPage) end)
if OwnerTabBtn then
	OwnerTabBtn.MouseButton1Click:Connect(function() showPage(OwnerPage) end)
end
showPage(MiscPage)

local function addButton(parent, name, callback, y)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 34)
	btn.Position = UDim2.new(0, 5, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(170, 40, 40)
	btn.BackgroundTransparency = 0.25
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 240, 240)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 13
	btn.Parent = parent
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
	btn.MouseButton1Click:Connect(function()
		local s, e = pcall(callback)
		if not s then warn(name .. ": " .. tostring(e)) end
	end)
	return y + 40
end

-- MISC
local y = 8
y = addButton(MiscPage, "Touch fling", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB", true))()
end, y)
y = addButton(MiscPage, "Kilaskis multi fling", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
end, y)
y = addButton(MiscPage, "Flight anims", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/197198/scripts/invincible%20flight%20animation.lua"))()
end, y)
y = addButton(MiscPage, "anti stuff", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/OMNIMANRUSSIA/NDS-OMNIMAN-GOD-TOUCH-FLING-ANTISIT-ANTIBANG/main/main.lua"))()
end, y)
y = addButton(MiscPage, "Drop kick (buggy)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gsm231/Fe-DropKick/refs/heads/main/V0.1"))()
end, y)
y = addButton(MiscPage, "Infinite Yield", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end, y)
MiscPage.CanvasSize = UDim2.new(0, 0, 0, y + 10)

-- OP
y = 8
y = addButton(OPPage, "Super ring v5 lukas", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/Super-ring-V5/refs/heads/main/By%20lukas!!"))()
end, y)
y = addButton(OPPage, "GABS SUPER RING", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/meow.lua/refs/heads/main/meow1.lua"))()
end, y)
y = addButton(OPPage, "supering by foxy9694", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/northernline23/Super-ring-parts-V1/refs/heads/main/script.lua"))()
end, y)
OPPage.CanvasSize = UDim2.new(0, 0, 0, y + 10)

-- OTHER
y = 8
y = addButton(OtherPage, "gab's aimbot", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/gab-s-aimbot/refs/heads/main/Aimbot.lua"))()
end, y)
y = addButton(OtherPage, "Doors Script", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/gab-s-doors-script/refs/heads/main/script.lua"))()
end, y)
OtherPage.CanvasSize = UDim2.new(0, 0, 0, y + 10)

-- ==================== OWNER PAGE (only visible to owner) ====================
if isOwner and OwnerPage then
	local ownerY = 8

	local OwnerLabel = Instance.new("TextLabel")
	OwnerLabel.Size = UDim2.new(1, -10, 0, 28)
	OwnerLabel.Position = UDim2.new(0, 5, 0, ownerY)
	OwnerLabel.BackgroundTransparency = 1
	OwnerLabel.Text = "Users running Operation Rage:"
	OwnerLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
	OwnerLabel.Font = Enum.Font.GothamBold
	OwnerLabel.TextSize = 13
	OwnerLabel.TextXAlignment = Enum.TextXAlignment.Left
	OwnerLabel.Parent = OwnerPage
	ownerY = ownerY + 32

	local function refreshOwnerList()
		-- Clear old buttons
		for _, child in pairs(OwnerPage:GetChildren()) do
			if child:IsA("TextButton") and child.Name == "DetectedUserBtn" then
				child:Destroy()
			end
		end

		local yPos = ownerY
		local foundAny = false

		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and isUsingScript(plr) then
				foundAny = true
				local btn = Instance.new("TextButton")
				btn.Name = "DetectedUserBtn"
				btn.Size = UDim2.new(1, -10, 0, 32)
				btn.Position = UDim2.new(0, 5, 0, yPos)
				btn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
				btn.BackgroundTransparency = 0.2
				btn.Text = "Kill: " .. plr.DisplayName .. " (@" .. plr.Name .. ")"
				btn.TextColor3 = Color3.fromRGB(255, 240, 240)
				btn.Font = Enum.Font.GothamMedium
				btn.TextSize = 12
				btn.Parent = OwnerPage
				Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)

				btn.MouseButton1Click:Connect(function()
					attemptKill(plr)
				end)
				yPos = yPos + 38
			end
		end

		if not foundAny then
			local noneLabel = Instance.new("TextLabel")
			noneLabel.Name = "DetectedUserBtn"
			noneLabel.Size = UDim2.new(1, -10, 0, 30)
			noneLabel.Position = UDim2.new(0, 5, 0, yPos)
			noneLabel.BackgroundTransparency = 1
			noneLabel.Text = "No other users detected"
			noneLabel.TextColor3 = Color3.fromRGB(200, 160, 160)
			noneLabel.Font = Enum.Font.Gotham
			noneLabel.TextSize = 13
			noneLabel.Parent = OwnerPage
			yPos = yPos + 35
		end

		OwnerPage.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
	end

	refreshOwnerList()

	-- Auto refresh every few seconds
	task.spawn(function()
		while task.wait(3) do
			if OwnerPage and OwnerPage.Parent then
				refreshOwnerList()
			else
				break
			end
		end
	end)

	Players.PlayerAdded:Connect(function()
		task.wait(1)
		refreshOwnerList()
	end)
	Players.PlayerRemoving:Connect(refreshOwnerList)
end

-- Player Info
local function truncate(str, max)
	if #str <= max then return str end
	return string.sub(str, 1, max - 2) .. ".."
end

local PlayerInfo = Instance.new("Frame")
PlayerInfo.Size = UDim2.new(0, 190, 0, 54)
PlayerInfo.Position = UDim2.new(0, 12, 1, -66)
PlayerInfo.BackgroundColor3 = Color3.fromRGB(90, 15, 15)
PlayerInfo.BackgroundTransparency = 0.25
PlayerInfo.BorderSizePixel = 0
PlayerInfo.Parent = Main
Instance.new("UICorner", PlayerInfo).CornerRadius = UDim.new(0, 10)

local AvatarBtn = Instance.new("ImageButton")
AvatarBtn.Size = UDim2.new(0, 40, 0, 40)
AvatarBtn.Position = UDim2.new(0, 7, 0.5, -20)
AvatarBtn.BackgroundTransparency = 1
AvatarBtn.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
AvatarBtn.Parent = PlayerInfo
Instance.new("UICorner", AvatarBtn).CornerRadius = UDim.new(1, 0)

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, -55, 0, 20)
NameLabel.Position = UDim2.new(0, 52, 0, 8)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = truncate(LocalPlayer.DisplayName, 14)
NameLabel.TextColor3 = Color3.fromRGB(255, 230, 230)
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 13
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.Parent = PlayerInfo

local UserLabel = Instance.new("TextLabel")
UserLabel.Size = UDim2.new(1, -55, 0, 16)
UserLabel.Position = UDim2.new(0, 52, 0, 28)
UserLabel.BackgroundTransparency = 1
UserLabel.Text = "@" .. truncate(LocalPlayer.Name, 12)
UserLabel.TextColor3 = Color3.fromRGB(220, 160, 160)
UserLabel.Font = Enum.Font.Gotham
UserLabel.TextSize = 12
UserLabel.TextXAlignment = Enum.TextXAlignment.Left
UserLabel.Parent = PlayerInfo

-- ==================== SETTINGS ====================
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Size = UDim2.new(0, 340, 0, 480)
SettingsFrame.Position = UDim2.new(0.5, 20, 0.5, -240)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(100, 15, 15)
SettingsFrame.BackgroundTransparency = 0.12
SettingsFrame.Visible = false
SettingsFrame.ZIndex = 40
SettingsFrame.Parent = ScreenGui
Instance.new("UICorner", SettingsFrame).CornerRadius = UDim.new(0, 10)

local SettingsStroke = Instance.new("UIStroke", SettingsFrame)
SettingsStroke.Color = Color3.fromRGB(255, 80, 80)
SettingsStroke.Thickness = 1.4

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Size = UDim2.new(1, 0, 0, 36)
SettingsTitle.BackgroundColor3 = Color3.fromRGB(80, 10, 10)
SettingsTitle.BackgroundTransparency = 0.2
SettingsTitle.Text = "  Settings"
SettingsTitle.TextColor3 = Color3.fromRGB(255, 230, 230)
SettingsTitle.Font = Enum.Font.GothamBold
SettingsTitle.TextSize = 15
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingsTitle.ZIndex = 41
SettingsTitle.Parent = SettingsFrame
Instance.new("UICorner", SettingsTitle).CornerRadius = UDim.new(0, 10)

local SettingsClose = Instance.new("TextButton")
SettingsClose.Size = UDim2.new(0, 28, 0, 24)
SettingsClose.Position = UDim2.new(1, -34, 0, 6)
SettingsClose.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
SettingsClose.Text = "X"
SettingsClose.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsClose.Font = Enum.Font.GothamBold
SettingsClose.TextSize = 13
SettingsClose.ZIndex = 42
SettingsClose.Parent = SettingsFrame
Instance.new("UICorner", SettingsClose).CornerRadius = UDim.new(0, 6)

SettingsClose.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = false
end)

local KeybindLabel = Instance.new("TextLabel")
KeybindLabel.Size = UDim2.new(1, -20, 0, 18)
KeybindLabel.Position = UDim2.new(0, 12, 0, 45)
KeybindLabel.BackgroundTransparency = 1
KeybindLabel.Text = "Toggle Menu Keybind:"
KeybindLabel.TextColor3 = Color3.fromRGB(255, 220, 220)
KeybindLabel.Font = Enum.Font.GothamMedium
KeybindLabel.TextSize = 12
KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
KeybindLabel.ZIndex = 41
KeybindLabel.Parent = SettingsFrame

local KeybindBtn = Instance.new("TextButton")
KeybindBtn.Size = UDim2.new(1, -24, 0, 28)
KeybindBtn.Position = UDim2.new(0, 12, 0, 65)
KeybindBtn.BackgroundColor3 = Color3.fromRGB(150, 35, 35)
KeybindBtn.Text = Settings.ToggleKey
KeybindBtn.TextColor3 = Color3.fromRGB(255, 240, 240)
KeybindBtn.Font = Enum.Font.GothamBold
KeybindBtn.TextSize = 13
KeybindBtn.ZIndex = 41
KeybindBtn.Parent = SettingsFrame
Instance.new("UICorner", KeybindBtn).CornerRadius = UDim.new(0, 6)

local listening = false
KeybindBtn.MouseButton1Click:Connect(function()
	if listening then return end
	listening = true
	KeybindBtn.Text = "Press any key..."
	local conn
	conn = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.UserInputType == Enum.UserInputType.Keyboard then
			Settings.ToggleKey = input.KeyCode.Name
			KeybindBtn.Text = Settings.ToggleKey
			saveSettings()
			listening = false
			conn:Disconnect()
		end
	end)
end)

local NDSStatusLabel = Instance.new("TextLabel")
NDSStatusLabel.Size = UDim2.new(1, -20, 0, 32)
NDSStatusLabel.Position = UDim2.new(0, 12, 0, 100)
NDSStatusLabel.BackgroundTransparency = 1
NDSStatusLabel.Text = ""
NDSStatusLabel.TextColor3 = Color3.fromRGB(255, 210, 210)
NDSStatusLabel.Font = Enum.Font.Gotham
NDSStatusLabel.TextSize = 12
NDSStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
NDSStatusLabel.TextYAlignment = Enum.TextYAlignment.Top
NDSStatusLabel.ZIndex = 41
NDSStatusLabel.Parent = SettingsFrame

local function updateNDSStatus()
	if Settings.NDS_DontPrompt and Settings.NDS_AutoLoad then
		NDSStatusLabel.Text = "NDS Preset: Auto-loading every time"
	elseif Settings.NDS_DontPrompt and not Settings.NDS_AutoLoad then
		NDSStatusLabel.Text = "NDS Preset: Never prompt / disabled"
	else
		NDSStatusLabel.Text = "NDS Preset: Will ask every time"
	end
end
updateNDSStatus()

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Size = UDim2.new(1, -20, 0, 36)
StatsLabel.Position = UDim2.new(0, 12, 0, 135)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "FPS: --\nPing: -- ms"
StatsLabel.TextColor3 = Color3.fromRGB(255, 210, 210)
StatsLabel.Font = Enum.Font.GothamMedium
StatsLabel.TextSize = 13
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextYAlignment = Enum.TextYAlignment.Top
StatsLabel.ZIndex = 41
StatsLabel.Parent = SettingsFrame

-- Music Player
local MusicTitle = Instance.new("TextLabel")
MusicTitle.Size = UDim2.new(1, -20, 0, 18)
MusicTitle.Position = UDim2.new(0, 12, 0, 175)
MusicTitle.BackgroundTransparency = 1
MusicTitle.Text = "Music Player (Client-sided only)"
MusicTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
MusicTitle.Font = Enum.Font.GothamBold
MusicTitle.TextSize = 12
MusicTitle.TextXAlignment = Enum.TextXAlignment.Left
MusicTitle.ZIndex = 41
MusicTitle.Parent = SettingsFrame

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -24, 0, 26)
SearchBox.Position = UDim2.new(0, 12, 0, 195)
SearchBox.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
SearchBox.PlaceholderText = "Search song or paste Audio ID..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 240, 240)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 12
SearchBox.ClearTextOnFocus = false
SearchBox.ZIndex = 41
SearchBox.Parent = SettingsFrame
Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 5)

local SongList = Instance.new("ScrollingFrame")
SongList.Size = UDim2.new(1, -24, 0, 110)
SongList.Position = UDim2.new(0, 12, 0, 226)
SongList.BackgroundColor3 = Color3.fromRGB(50, 15, 15)
SongList.BackgroundTransparency = 0.3
SongList.BorderSizePixel = 0
SongList.ScrollBarThickness = 4
SongList.ZIndex = 41
SongList.Parent = SettingsFrame
Instance.new("UICorner", SongList).CornerRadius = UDim.new(0, 5)

local function refreshSongList(filter)
	for _, child in pairs(SongList:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local yPos = 3
	filter = string.lower(filter or "")
	for _, song in ipairs(MusicLibrary) do
		if filter == "" or string.find(string.lower(song.Name), filter) or string.find(tostring(song.ID), filter) then
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, -8, 0, 22)
			btn.Position = UDim2.new(0, 4, 0, yPos)
			btn.BackgroundColor3 = Color3.fromRGB(140, 35, 35)
			btn.Text = "  " .. song.Name
			btn.TextColor3 = Color3.fromRGB(255, 240, 240)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 11
			btn.TextXAlignment = Enum.TextXAlignment.Left
			btn.ZIndex = 42
			btn.Parent = SongList
			Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
			btn.MouseButton1Click:Connect(function()
				playSong(song.ID)
			end)
			yPos = yPos + 25
		end
	end
	SongList.CanvasSize = UDim2.new(0, 0, 0, yPos + 4)
end

refreshSongList("")
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	refreshSongList(SearchBox.Text)
end)

local PlayBtn = Instance.new("TextButton")
PlayBtn.Size = UDim2.new(0, 70, 0, 26)
PlayBtn.Position = UDim2.new(0, 12, 0, 345)
PlayBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 60)
PlayBtn.Text = "Play"
PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayBtn.Font = Enum.Font.GothamBold
PlayBtn.TextSize = 12
PlayBtn.ZIndex = 41
PlayBtn.Parent = SettingsFrame
Instance.new("UICorner", PlayBtn).CornerRadius = UDim.new(0, 5)

local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(0, 70, 0, 26)
StopBtn.Position = UDim2.new(0, 90, 0, 345)
StopBtn.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
StopBtn.Text = "Stop"
StopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopBtn.Font = Enum.Font.GothamBold
StopBtn.TextSize = 12
StopBtn.ZIndex = 41
StopBtn.Parent = SettingsFrame
Instance.new("UICorner", StopBtn).CornerRadius = UDim.new(0, 5)

PlayBtn.MouseButton1Click:Connect(function()
	if currentSound then
		if isPlaying then
			currentSound:Pause()
			isPlaying = false
			PlayBtn.Text = "Play"
		else
			currentSound:Resume()
			isPlaying = true
			PlayBtn.Text = "Pause"
		end
	else
		local id = tonumber(SearchBox.Text)
		if id then
			playSong(id)
			PlayBtn.Text = "Pause"
		end
	end
end)

StopBtn.MouseButton1Click:Connect(function()
	stopSong()
	PlayBtn.Text = "Play"
end)

local VolLabel = Instance.new("TextLabel")
VolLabel.Size = UDim2.new(0, 70, 0, 20)
VolLabel.Position = UDim2.new(0, 175, 0, 348)
VolLabel.BackgroundTransparency = 1
VolLabel.Text = "Vol: 50%"
VolLabel.TextColor3 = Color3.fromRGB(230, 200, 200)
VolLabel.Font = Enum.Font.Gotham
VolLabel.TextSize = 12
VolLabel.ZIndex = 41
VolLabel.Parent = SettingsFrame

local VolDown = Instance.new("TextButton")
VolDown.Size = UDim2.new(0, 26, 0, 22)
VolDown.Position = UDim2.new(0, 250, 0, 347)
VolDown.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
VolDown.Text = "-"
VolDown.TextColor3 = Color3.fromRGB(255, 255, 255)
VolDown.Font = Enum.Font.GothamBold
VolDown.ZIndex = 41
VolDown.Parent = SettingsFrame
Instance.new("UICorner", VolDown).CornerRadius = UDim.new(0, 4)

local VolUp = Instance.new("TextButton")
VolUp.Size = UDim2.new(0, 26, 0, 22)
VolUp.Position = UDim2.new(0, 282, 0, 347)
VolUp.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
VolUp.Text = "+"
VolUp.TextColor3 = Color3.fromRGB(255, 255, 255)
VolUp.Font = Enum.Font.GothamBold
VolUp.ZIndex = 41
VolUp.Parent = SettingsFrame
Instance.new("UICorner", VolUp).CornerRadius = UDim.new(0, 4)

VolDown.MouseButton1Click:Connect(function()
	currentVol = math.clamp(currentVol - 0.1, 0, 1)
	if currentSound then currentSound.Volume = currentVol end
	VolLabel.Text = "Vol: " .. math.floor(currentVol * 100) .. "%"
end)

VolUp.MouseButton1Click:Connect(function()
	currentVol = math.clamp(currentVol + 0.1, 0, 1)
	if currentSound then currentSound.Volume = currentVol end
	VolLabel.Text = "Vol: " .. math.floor(currentVol * 100) .. "%"
end)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 80, 0, 20)
SpeedLabel.Position = UDim2.new(0, 12, 0, 380)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed: 1.0x"
SpeedLabel.TextColor3 = Color3.fromRGB(230, 200, 200)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 12
SpeedLabel.ZIndex = 41
SpeedLabel.Parent = SettingsFrame

local SpeedDown = Instance.new("TextButton")
SpeedDown.Size = UDim2.new(0, 26, 0, 22)
SpeedDown.Position = UDim2.new(0, 100, 0, 378)
SpeedDown.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
SpeedDown.Text = "-"
SpeedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedDown.Font = Enum.Font.GothamBold
SpeedDown.ZIndex = 41
SpeedDown.Parent = SettingsFrame
Instance.new("UICorner", SpeedDown).CornerRadius = UDim.new(0, 4)

local SpeedUp = Instance.new("TextButton")
SpeedUp.Size = UDim2.new(0, 26, 0, 22)
SpeedUp.Position = UDim2.new(0, 132, 0, 378)
SpeedUp.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
SpeedUp.Text = "+"
SpeedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedUp.Font = Enum.Font.GothamBold
SpeedUp.ZIndex = 41
SpeedUp.Parent = SettingsFrame
Instance.new("UICorner", SpeedUp).CornerRadius = UDim.new(0, 4)

SpeedDown.MouseButton1Click:Connect(function()
	currentSpeed = math.clamp(currentSpeed - 0.1, 0.5, 2)
	if currentSound then currentSound.PlaybackSpeed = currentSpeed end
	SpeedLabel.Text = "Speed: " .. string.format("%.1f", currentSpeed) .. "x"
end)

SpeedUp.MouseButton1Click:Connect(function()
	currentSpeed = math.clamp(currentSpeed + 0.1, 0.5, 2)
	if currentSound then currentSound.PlaybackSpeed = currentSpeed end
	SpeedLabel.Text = "Speed: " .. string.format("%.1f", currentSpeed) .. "x"
end)

-- Linked position + dragging
local function updateSettingsPosition()
	if SettingsFrame.Visible then
		SettingsFrame.Position = UDim2.new(0, Main.AbsolutePosition.X + Main.AbsoluteSize.X + 12, 0, Main.AbsolutePosition.Y)
	end
end

local statsConnection
AvatarBtn.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = not SettingsFrame.Visible
	if SettingsFrame.Visible then
		updateSettingsPosition()
		updateNDSStatus()
		statsConnection = RunService.RenderStepped:Connect(function()
			local fps = math.floor(1 / RunService.RenderStepped:Wait())
			local ping = 0
			pcall(function()
				ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
			end)
			StatsLabel.Text = "FPS: " .. fps .. "\nPing: " .. ping .. " ms"
		end)
	else
		if statsConnection then
			statsConnection:Disconnect()
			statsConnection = nil
		end
	end
end)

local dragging = false
local dragStart, startMainPos, startSettingsPos

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startMainPos = Main.Position
		startSettingsPos = SettingsFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

SettingsTitle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startMainPos = Main.Position
		startSettingsPos = SettingsFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startMainPos.X.Scale, startMainPos.X.Offset + delta.X, startMainPos.Y.Scale, startMainPos.Y.Offset + delta.Y)
		if SettingsFrame.Visible then
			SettingsFrame.Position = UDim2.new(startSettingsPos.X.Scale, startSettingsPos.X.Offset + delta.X, startSettingsPos.Y.Scale, startSettingsPos.Y.Offset + delta.Y)
		end
	end
end)

-- NDS Prompt
local function showNDSPrompt()
	local Prompt = Instance.new("Frame")
	Prompt.Size = UDim2.new(0, 320, 0, 170)
	Prompt.Position = UDim2.new(0.5, -160, 0.5, -85)
	Prompt.BackgroundColor3 = Color3.fromRGB(100, 15, 15)
	Prompt.BackgroundTransparency = 0.1
	Prompt.ZIndex = 60
	Prompt.Parent = ScreenGui
	Instance.new("UICorner", Prompt).CornerRadius = UDim.new(0, 10)

	local pStroke = Instance.new("UIStroke", Prompt)
	pStroke.Color = Color3.fromRGB(255, 80, 80)
	pStroke.Thickness = 1.5

	local pTitle = Instance.new("TextLabel")
	pTitle.Size = UDim2.new(1, -20, 0, 50)
	pTitle.Position = UDim2.new(0, 10, 0, 12)
	pTitle.BackgroundTransparency = 1
	pTitle.Text = "Natural Disaster Survival detected!\nLoad recommended preset?"
	pTitle.TextColor3 = Color3.fromRGB(255, 230, 230)
	pTitle.Font = Enum.Font.GothamMedium
	pTitle.TextSize = 14
	pTitle.ZIndex = 61
	pTitle.Parent = Prompt

	local checkState = false
	local CheckBtn = Instance.new("TextButton")
	CheckBtn.Size = UDim2.new(0, 22, 0, 22)
	CheckBtn.Position = UDim2.new(0, 18, 0, 70)
	CheckBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	CheckBtn.Text = ""
	CheckBtn.ZIndex = 61
	CheckBtn.Parent = Prompt
	Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 4)

	local CheckLabel = Instance.new("TextLabel")
	CheckLabel.Size = UDim2.new(1, -50, 0, 22)
	CheckLabel.Position = UDim2.new(0, 48, 0, 70)
	CheckLabel.BackgroundTransparency = 1
	CheckLabel.Text = "Don't prompt me again"
	CheckLabel.TextColor3 = Color3.fromRGB(230, 200, 200)
	CheckLabel.Font = Enum.Font.Gotham
	CheckLabel.TextSize = 13
	CheckLabel.TextXAlignment = Enum.TextXAlignment.Left
	CheckLabel.ZIndex = 61
	CheckLabel.Parent = Prompt

	CheckBtn.MouseButton1Click:Connect(function()
		checkState = not checkState
		CheckBtn.BackgroundColor3 = checkState and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 60, 60)
		CheckBtn.Text = checkState and "✓" or ""
	end)

	local YesP = Instance.new("TextButton")
	YesP.Size = UDim2.new(0, 120, 0, 34)
	YesP.Position = UDim2.new(0, 20, 1, -50)
	YesP.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
	YesP.Text = "Yes, load preset"
	YesP.TextColor3 = Color3.fromRGB(255, 255, 255)
	YesP.Font = Enum.Font.GothamBold
	YesP.TextSize = 13
	YesP.ZIndex = 61
	YesP.Parent = Prompt
	Instance.new("UICorner", YesP).CornerRadius = UDim.new(0, 6)

	local NoP = Instance.new("TextButton")
	NoP.Size = UDim2.new(0, 120, 0, 34)
	NoP.Position = UDim2.new(1, -140, 1, -50)
	NoP.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
	NoP.Text = "No thanks"
	NoP.TextColor3 = Color3.fromRGB(255, 255, 255)
	NoP.Font = Enum.Font.GothamBold
	NoP.TextSize = 13
	NoP.ZIndex = 61
	NoP.Parent = Prompt
	Instance.new("UICorner", NoP).CornerRadius = UDim.new(0, 6)

	YesP.MouseButton1Click:Connect(function()
		if checkState then
			Settings.NDS_DontPrompt = true
			Settings.NDS_AutoLoad = true
			saveSettings()
		end
		Prompt:Destroy()
		runNDSPreset()
	end)

	NoP.MouseButton1Click:Connect(function()
		if checkState then
			Settings.NDS_DontPrompt = true
			Settings.NDS_AutoLoad = false
			saveSettings()
		end
		Prompt:Destroy()
	end)
end

task.spawn(function()
	task.wait(1.2)
	if isNDS() then
		if Settings.NDS_DontPrompt then
			if Settings.NDS_AutoLoad then
				runNDSPreset()
			end
		else
			showNDSPrompt()
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode.Name == Settings.ToggleKey then
		Main.Visible = not Main.Visible
		if not Main.Visible then
			SettingsFrame.Visible = false
			ConfirmFrame.Visible = false
		end
	end
end)
