local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- ==========================================
-- DYNAMIC CHARACTER HEADSHOT FETCHING
-- ==========================================
local playerFaceIcon = "rbxassetid://109251560" -- Fallback to your old icon if fetch fails
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
-- NOTIFICATION SEQUENCE
-- ==========================================
StarterGui:SetCore("SendNotification", {
    Title = "this script was made by",
    Text = "Gabrieltod112.",
    Duration = 5,
    Icon = playerFaceIcon -- Displays the running player's avatar face!
}) 

task.wait(5)

StarterGui:SetCore("SendNotification", {
    Title = "Thanks for using my script ",
    Text = "-Your favourite furry Gab !",
    Duration = 5
})

-- CHECK FOR FRIENDSHIP STATUS WITH GABRIELTOD112
local isFriend = false
pcall(function()
    -- 4983050167 is the UserId for "Gabrieltod112". We check against the ID directly for stability.
    isFriend = localPlayer:IsFriendsWith(4983050167) or localPlayer.Name == "Gabrieltod112"
end)

if isFriend then
    task.wait(5) -- Wait for the previous notification to clear
    StarterGui:SetCore("SendNotification", {
        Title = "Hello friend!",
        Text = "How are you doing?",
        Duration = 5
    })
end

task.wait(3)

local choiceBindable = Instance.new("BindableFunction")
choiceBindable.OnInvoke = function(buttonText)
    if buttonText == "Yes" then
        setclipboard("https://discord.gg/GHMF7JeBGU") -- Direct copy link
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
-- MAIN INTERFACE WINDOW
-- ==========================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GabScriptBetaUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Menu Window
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 310) -- Kept slim and clean
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
frame.BorderSizePixel = 0 
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Rounded corners for the main window frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12) 
frameCorner.Parent = frame

-- Diagonal gradient rotation
local uiGradient = Instance.new("UIGradient")
uiGradient.Rotation = 45 
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(200, 30, 30)),   -- Red at top-left
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(90, 20, 140))    -- Deep Purple at bottom-right
})
uiGradient.Parent = frame

-- Title Header Text
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -90, 0, 40) 
textLabel.Position = UDim2.new(0, 10, 0, 5)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Gabrieltod112's Nds script  gui (beta)" 
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 12 
textLabel.TextWrapped = true 
textLabel.Font = Enum.Font.GothamBold
textLabel.Parent = frame

-- Close Button [X]
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 75, 0, 25)
closeButton.Position = UDim2.new(1, -85, 0, 8) 
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.Text = "Bai BAII"
    closeButton.BackgroundColor3 = Color3.fromRGB(190, 0, 0)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ==========================================
-- PAGE MANAGEMENT SYSTEM
-- ==========================================
local currentPage = 1
local totalPages = 2

-- Invisible folders to keep buttons isolated by page
local page1Folder = Instance.new("Folder")
page1Folder.Name = "Page1"
page1Folder.Parent = frame

local page2Folder = Instance.new("Folder")
page2Folder.Name = "Page2"
page2Folder.Parent = frame

-- Helper function to generate standardized rounded script buttons quickly
local function createScriptButton(name, positionY, targetPageFolder, callbackFunction)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 310, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, positionY)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    btn.BackgroundTransparency = 0.25 
    btn.BorderSizePixel = 0 
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = targetPageFolder -- Attached directly to page folder
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8) 
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end)
    btn.MouseButton1Click:Connect(callbackFunction)
    return btn
end

-- Function to handle visual layout page flips smoothly
local function updatePageVisibility()
    if currentPage == 1 then
        page1Folder.Parent = frame
        page2Folder.Parent = nil
    elseif currentPage == 2 then
        page1Folder.Parent = nil
        page2Folder.Parent = frame
    end
end

-- ==========================================
-- PAGE NAVIGATION BUTTONS
-- ==========================================
-- Previous Page Button
local prevButton = Instance.new("TextButton")
prevButton.Size = UDim2.new(0, 80, 0, 25)
prevButton.Position = UDim2.new(0, 20, 1, -35)
prevButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
prevButton.BackgroundTransparency = 0.3
prevButton.Text = "< Prev"
prevButton.TextColor3 = Color3.fromRGB(255, 255, 255)
prevButton.TextSize = 12
prevButton.Font = Enum.Font.GothamBold
prevButton.Parent = frame

local prevCorner = Instance.new("UICorner")
prevCorner.CornerRadius = UDim.new(0, 6)
prevCorner.Parent = prevButton

prevButton.MouseButton1Click:Connect(function()
    if currentPage > 1 then
        currentPage = currentPage - 1
        updatePageVisibility()
    end
end)

-- Next Page Button
local nextButton = Instance.new("TextButton")
nextButton.Size = UDim2.new(0, 80, 0, 25)
nextButton.Position = UDim2.new(1, -100, 1, -35)
nextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
nextButton.BackgroundTransparency = 0.3
nextButton.Text = "Next >"
nextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
nextButton.TextSize = 12
nextButton.Font = Enum.Font.GothamBold
nextButton.Parent = frame

local nextCorner = Instance.new("UICorner")
nextCorner.CornerRadius = UDim.new(0, 6)
nextCorner.Parent = nextButton

nextButton.MouseButton1Click:Connect(function()
    if currentPage < totalPages then
        currentPage = currentPage + 1
        updatePageVisibility()
    end
end)

-- ==========================================
-- PAGE 1 BUTTONS
-- ==========================================
createScriptButton("Touch fling", 60, page1Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB", true))()
    end)
    if not success then warn("Failed to run Touch Fling: " .. tostring(err)) end
end)

createScriptButton("Infinite Yield", 105, page1Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    if not success then warn("Failed to run Infinite Yield: " .. tostring(err)) end
end)

createScriptButton("Kilaskis multi fling", 150, page1Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
    end)
    if not success then warn("Failed to run Kilaskis multi fling: " .. tostring(err)) end
end)

createScriptButton("Flight anims", 195, page1Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/197198/scripts/invincible%20flight%20animation.lua"))()
    end)
    if not success then warn("Failed to run Flight anims: " .. tostring(err)) end
end)

createScriptButton("anti stuff", 240, page1Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OMNIMANRUSSIA/NDS-OMNIMAN-GOD-TOUCH-FLING-ANTISIT-ANTIBANG/main/main.lua"))()
    end)
    if not success then warn("Failed to run anti stuff: " .. tostring(err)) end
end)

-- ==========================================
-- PAGE 2 BUTTONS
-- ==========================================
createScriptButton("Drop kick(buggy)", 60, page2Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gsm231/Fe-DropKick/refs/heads/main/V0.1"))()
    end)
    if not success then warn("Failed to run Drop kick: " .. tostring(err)) end
end)

createScriptButton("Super ring v5 lukas", 105, page2Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/Super-ring-V5/refs/heads/main/By%20lukas!!"))()
    end)
    if not success then warn("Failed to run Super ring v5 lukas: " .. tostring(err)) end
end)

-- gab's aimbot Button (Red Border)
local aimbotBtn = createScriptButton("gab's aimbot", 150, page2Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/im-the-username/gab-s-aimbot/refs/heads/main/Aimbot.lua"))()
    end)
    if not success then warn("Failed to run gab's aimbot: " .. tostring(err)) end
end)

local redStroke = Instance.new("UIStroke")
redStroke.Name = "AimbotBorder"
redStroke.Color = Color3.fromRGB(255, 30, 30)
redStroke.Thickness = 2
redStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
redStroke.Parent = aimbotBtn

-- Added supering by foxy9694 Button (Orange Border)
local superRingBtn = createScriptButton("supering by foxy9694", 195, page2Folder, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/northernline23/Super-ring-parts-V1/refs/heads/main/script.lua"))()
    end)
    if not success then warn("Failed to run supering by foxy9694: " .. tostring(err)) end
end)

local orangeStroke = Instance.new("UIStroke")
orangeStroke.Name = "SuperRingBorder"
orangeStroke.Color = Color3.fromRGB(255, 120, 0) -- Pure Orange
orangeStroke.Thickness = 2
orangeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
orangeStroke.Parent = superRingBtn

-- Set default layout view state
updatePageVisibility()
