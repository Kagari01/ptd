



    local Players = game:service('Players')
    local VirtualUser = game:service('VirtualUser')

    -- Đợi cho đến khi LocalPlayer được khởi tạo
    while not Players.LocalPlayer do
        wait()
    end

    local player = Players.LocalPlayer

    -- Kết nối sự kiện Idled
    player.Idled:connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)





local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nah",
    SubTitle = "by kagari1314",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    AP = Window:AddTab({ Title = "Auto Place", Icon = "" }),
    PA = Window:AddTab({ Title = "Play Again", Icon = ""}),
    AJ = Window:AddTab({ Title = "Auto Join", Icon = ""}),
    GP = Window:AddTab({ Title = "GamePlay", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }),

    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options


--AUTO VOTE
local difficulties = {"Easy", "Medium", "Hard", "Nightmare"}

local DifficultyDropdown = Tabs.Main:AddDropdown("DifficultyDropdown", {
    Title = "Auto Vote",
    Values = difficulties,
    Multi = false,
    Default = 1,
})

DifficultyDropdown:OnChanged(function(Value)
    local args = {
        [1] = Value
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("VotingService"):WaitForChild("RF"):WaitForChild("Vote"):InvokeServer(unpack(args))
end)

--AUTO SPEED
local autoSpeed = false
local AutoSpeedToggle = Tabs.Main:AddToggle("AutoSpeed", {Title = "Auto Speed", Default = false })

AutoSpeedToggle:OnChanged(function()
    autoSpeed = Options.AutoSpeed.Value
    if autoSpeed then
        task.spawn(function()
            while autoSpeed do
                local speedVoteLabel = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.SpeedVote:FindFirstChild("Value")
                if speedVoteLabel and speedVoteLabel.Text == "(0/1)" then
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("WaveService"):WaitForChild("RF"):WaitForChild("SpeedUp"):InvokeServer()
                end
                wait(1)
            end
        end)
    end
end)



--AUTO SKIP
local autoSkip = false
local AutoSkipToggle = Tabs.Main:AddToggle("AutoSkip", {Title = "Auto Skip", Default = false })

AutoSkipToggle:OnChanged(function()
    autoSkip = Options.AutoSkip.Value
    if autoSkip then
        task.spawn(function()
            while autoSkip do
                local autoSkipLabel = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.GameInfo.AutoSkip:FindFirstChild("TextLabel")
                if autoSkipLabel and autoSkipLabel.Text == "Auto Skip (0/1)" then
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("WaveService"):WaitForChild("RF"):WaitForChild("AutoSkip"):InvokeServer()
                end
                wait(1) 
            end
        end)
    end
end)



-- Toggle để tắt/bật Notify
local notifyToggle = false
local NotifyToggle = Tabs.Main:AddToggle("Toggle Notify", { Title = "Disable Text", Default = false })

NotifyToggle:OnChanged(function()
    notifyToggle = NotifyToggle.Value
end)

task.spawn(function()
    while true do
        -- Kiểm tra xem Notify có tồn tại trong PlayerGui không
        local notify = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notify")
        
        if notify then
            -- Bật hoặc tắt Notify dựa trên trạng thái của notifyToggle
            notify.Enabled = not notifyToggle
            if notifyToggle then
                print("Notify is OFF")
            else
                print("Notify is ON")
            end
        else
            print("Notify không tìm thấy!")
        end
        wait(10)
    end
end)



--AUTO UPGRADE
local autoUpgrade = false

local AutoUpgradeToggle = Tabs.Main:AddToggle("Auto Upgrade", { Title = "Auto Upgrade Units", Default = false })

local function upgradeUnits()
    while autoUpgrade do
        local placedUnitsFolder = workspace:WaitForChild("Game"):WaitForChild("Map"):WaitForChild("PlacedUnits")      
        for _, unit in pairs(placedUnitsFolder:GetChildren()) do
            local args = {
                [1] = unit 
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("UpgradeUnit"):InvokeServer(unpack(args))
        end 
        wait(2)
    end
end

AutoUpgradeToggle:OnChanged(function()
    autoUpgrade = AutoUpgradeToggle.Value
    if autoUpgrade then
        print("Auto Upgrade ON")
        spawn(upgradeUnits)
    else
        print("Auto Upgrade OFF")
    end
end)












--                                AUTO PLACE   OK OK

--          BAY MARINE
local autoPlaceBayMarine = false
local AutoPlaceToggleBayMarine = Tabs.AP:AddToggle("AutoPlace1", { Title = "Auto Place BAYMARINE", Default = false })

AutoPlaceToggleBayMarine:OnChanged(function()
    autoPlaceBayMarine = AutoPlaceToggleBayMarine.Value
    if autoPlaceBayMarine then
        task.spawn(function()
            while autoPlaceBayMarine do
                local args = {
                    [1] = "Enderguy",
                    [2] = CFrame.new(-13088.9463, 600.461731, -445.565674, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                wait(1)
            end
        end)
    end
end)




--               UNDERWORLD
local autoPlace = false
local AutoPlaceToggle = Tabs.AP:AddToggle("AutoPlace2", { Title = "Auto Place UNDERWORLD", Default = false })

AutoPlaceToggle:OnChanged(function()
    autoPlace = AutoPlaceToggle.Value
    if autoPlace then
        task.spawn(function() 
            while autoPlace do
                local args = {
                    [1] = "Enderguy",
                    [2] = CFrame.new(-14638.2470703125, 607.412109375, -2261.645751953125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                -- Gửi yêu cầu đặt đơn vị
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))                
                local args = {
                    [1] = "Chronos",
                    [2] = CFrame.new(-14638.2470703125, 607.412109375, -2261.645751953125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                -- Gửi yêu cầu đặt đơn vị
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))                
                local args = {
                    [1] = "Inferno Lantern",
                    [2] = CFrame.new(-14638.2470703125, 607.412109375, -2261.645751953125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                -- Gửi yêu cầu đặt đơn vị
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))                
                local args = {
                    [1] = "Ice Princess",
                    [2] = CFrame.new(-14638.2470703125, 607.412109375, -2261.645751953125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                -- Gửi yêu cầu đặt đơn vị
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))                

                wait(1) -- Thay đổi thời gian chờ nếu cần (1 giây giữa các lần đặt đơn vị)
            end
        end)
    end
end)



--         DEATH VALLYEY 
local autoPlace = false
local AutoPlaceToggle = Tabs.AP:AddToggle("AutoPlace3", { Title = "Auto Place DEATHVALLYEY", Default = false })

AutoPlaceToggle:OnChanged(function()
    autoPlace = AutoPlaceToggle.Value
    if autoPlace then
        task.spawn(function()
            while autoPlace do
                local args = {
                    [1] = "Chronos",
                    [2] = CFrame.new(-13163.6083984375, 676.3262939453125, -2072.604248046875, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                wait(1) -- Thay đổi thời gian chờ nếu cần (1 giây giữa các lần đặt đơn vị)
            end
        end)
    end
end)


--                   KINGDOM
local autoPlace = false
local AutoPlaceToggle = Tabs.AP:AddToggle("AutoPlace4", { Title = "Auto Place KINGDOM", Default = false })

AutoPlaceToggle:OnChanged(function()
    autoPlace = AutoPlaceToggle.Value
    if autoPlace then
        task.spawn(function()
            while autoPlace do
                local args = {
                    [1] = "Enderguy",
                    [2] = CFrame.new(-13052.408203125, 551.4434814453125, 697.202392578125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Chronos",
                    [2] = CFrame.new(-13052.408203125, 551.4434814453125, 697.202392578125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Inferno Lantern",
                    [2] = CFrame.new(-13052.408203125, 551.4434814453125, 697.202392578125, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Ice Princess",
                    [2] = CFrame.new(-13036.1914, 551.803894, 684.296326)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))

               wait(1) -- Thay đổi thời gian chờ nếu cần (1 giây giữa các lần đặt đơn vị)
            end
        end)
    end
end)




--          HALLOWEN
local autoPlace = false
local AutoPlaceToggle = Tabs.AP:AddToggle("AutoPlace5", { Title = "Auto Place HALLOWEN", Default = false })

AutoPlaceToggle:OnChanged(function()
    autoPlace = AutoPlaceToggle.Value
    if autoPlace then
        task.spawn(function()
            while autoPlace do
                local args = {
                    [1] = "Chronos",
                    [2] = CFrame.new(-13160.0166015625, 587.1895751953125, 2885.959228515625, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                wait(1) -- Thay đổi thời gian chờ nếu cần (1 giây giữa các lần đặt đơn vị)
            end
        end)
    end
end)










-- PLAY AGAIN

-- BAY MARINE
local autoPlayAgain_BayMarine = false
local AutoPlayAgainToggle_BayMarine = Tabs.PA:AddToggle("AutoPlayAgain_BayMarine", {Title = "Bay Marine", Default = false})

AutoPlayAgainToggle_BayMarine:OnChanged(function()
    autoPlayAgain_BayMarine = Options.AutoPlayAgain_BayMarine.Value
    if autoPlayAgain_BayMarine then
        task.spawn(function()
            while autoPlayAgain_BayMarine do
                local resultsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Frames.Results
                if resultsFrame and resultsFrame.Visible then
                    local args = {
                        [1] = "Bay Marine-3",
                        [2] = "Bay Marine",
                        [3] = "Repeat"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))                                   
                end
                wait(1)
            end
        end)
    end
end)


-- UNDERWORLD
local autoPlayAgain_Underworld = false
local AutoPlayAgainToggle_Underworld = Tabs.PA:AddToggle("AutoPlayAgain_Underworld", {Title = "Underworld", Default = false})

AutoPlayAgainToggle_Underworld:OnChanged(function()
    autoPlayAgain_Underworld = Options.AutoPlayAgain_Underworld.Value
    if autoPlayAgain_Underworld then
        task.spawn(function()
            while autoPlayAgain_Underworld do
                local resultsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Frames.Results
                if resultsFrame and resultsFrame.Visible then
                    local args = {
                        [1] = "Underworld-3",
                        [2] = "Underworld",
                        [3] = "Repeat"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                end
                wait(1)
            end
        end)
    end
end)


-- DEATH VALLEY
local autoPlayAgain_DeathValley = false
local AutoPlayAgainToggle_DeathValley = Tabs.PA:AddToggle("AutoPlayAgain_DeathValley", {Title = "Death Valley", Default = false})

AutoPlayAgainToggle_DeathValley:OnChanged(function()
    autoPlayAgain_DeathValley = Options.AutoPlayAgain_DeathValley.Value
    if autoPlayAgain_DeathValley then
        task.spawn(function()
            while autoPlayAgain_DeathValley do
                local resultsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Frames.Results
                if resultsFrame and resultsFrame.Visible then
                    local args = {
                        [1] = "Death Valley-3",
                        [2] = "Death Valley",
                        [3] = "Repeat"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                end
                wait(1)
            end
        end)
    end
end)


-- KINGDOM
local autoPlayAgain_Kingdom = false
local AutoPlayAgainToggle_Kingdom = Tabs.PA:AddToggle("AutoPlayAgain_Kingdom", {Title = "Kingdom", Default = false})

AutoPlayAgainToggle_Kingdom:OnChanged(function()
    autoPlayAgain_Kingdom = Options.AutoPlayAgain_Kingdom.Value
    if autoPlayAgain_Kingdom then
        task.spawn(function()
            while autoPlayAgain_Kingdom do
                local resultsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Frames.Results
                if resultsFrame and resultsFrame.Visible then
                    local args = {
                        [1] = "Kingdom-3",
                        [2] = "Kingdom",
                        [3] = "Repeat"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                end
                wait(1)
            end
        end)
    end
end)


-- HALLOWEEN
local autoPlayAgain_Halloween = false
local AutoPlayAgainToggle_Halloween = Tabs.PA:AddToggle("AutoPlayAgain_Halloween", {Title = "Halloween", Default = false})

AutoPlayAgainToggle_Halloween:OnChanged(function()
    autoPlayAgain_Halloween = Options.AutoPlayAgain_Halloween.Value
    if autoPlayAgain_Halloween then
        task.spawn(function()
            while autoPlayAgain_Halloween do
                local resultsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Frames.Results
                if resultsFrame and resultsFrame.Visible then
                    local args = {
                        [1] = "Haunted Graveyard-3",
                        [2] = "Haunted Graveyard",
                        [3] = "Repeat"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                end
                wait(1)
            end
        end)
    end
end)







--AUTO JOIN
-- Toggle cho Bay Marine
local autoJoinBayMarine = false
local BayMarineToggle = Tabs.AJ:AddToggle("AutoJoinBayMarine", {Title = "Auto Join Bay Marine", Default = false})

BayMarineToggle:OnChanged(function()
    autoJoinBayMarine = Options.AutoJoinBayMarine.Value
    if autoJoinBayMarine then
        task.spawn(function()
            while autoJoinBayMarine do
                if workspace:FindFirstChild("Lobby") then
                    local args = {
                        [1] = "Bay Marine-3",
                        [2] = "Bay Marine",
                        [3] = "Repeat"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                    print("Auto joined Bay Marine!")
                else
                    print("Lobby not found, stopping Bay Marine script.")
                    break
                end
                wait(5)
            end
        end)
    end
end)

-- Toggle cho Underworld
local autoJoinUnderworld = false
local UnderworldToggle = Tabs.AJ:AddToggle("AutoJoinUnderworld", {Title = "Auto Join Underworld", Default = false})

UnderworldToggle:OnChanged(function()
    autoJoinUnderworld = Options.AutoJoinUnderworld.Value
    if autoJoinUnderworld then
        task.spawn(function()
            while autoJoinUnderworld do
                if workspace:FindFirstChild("Lobby") then
                    local args = {
                        [1] = "Underworld-3",
                        [2] = "Underworld",
                        [3] = "Repeat"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                    print("Auto joined Underworld!")
                else
                    print("Lobby not found, stopping Underworld script.")
                    break
                end
                wait(5)
            end
        end)
    end
end)

-- Toggle cho Death Valley
local autoJoinDeathValley = false
local DeathValleyToggle = Tabs.AJ:AddToggle("AutoJoinDeathValley", {Title = "Auto Join Death Valley", Default = false})

DeathValleyToggle:OnChanged(function()
    autoJoinDeathValley = Options.AutoJoinDeathValley.Value
    if autoJoinDeathValley then
        task.spawn(function()
            while autoJoinDeathValley do
                if workspace:FindFirstChild("Lobby") then
                    local args = {
                        [1] = "Death Valley-3",
                        [2] = "Death Valley",
                        [3] = "Repeat"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                    print("Auto joined Death Valley!")
                else
                    print("Lobby not found, stopping Death Valley script.")
                    break
                end
                wait(5)
            end
        end)
    end
end)

-- Toggle cho Kingdom
local autoJoinKingdom = false
local KingdomToggle = Tabs.AJ:AddToggle("AutoJoinKingdom", {Title = "Auto Join Kingdom", Default = false})

KingdomToggle:OnChanged(function()
    autoJoinKingdom = Options.AutoJoinKingdom.Value
    if autoJoinKingdom then
        task.spawn(function()
            while autoJoinKingdom do
                if workspace:FindFirstChild("Lobby") then
                    local args = {
                        [1] = "Kingdom-3",
                        [2] = "Kingdom",
                        [3] = "Repeat"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                    print("Auto joined Kingdom!")
                else
                    print("Lobby not found, stopping Kingdom script.")
                    break
                end
                wait(5)
            end
        end)
    end
end)

-- Toggle cho Halloween
local autoJoinHalloween = false
local HalloweenToggle = Tabs.AJ:AddToggle("AutoJoinHalloween", {Title = "Auto Join Halloween", Default = false})

HalloweenToggle:OnChanged(function()
    autoJoinHalloween = Options.AutoJoinHalloween.Value
    if autoJoinHalloween then
        task.spawn(function()
            while autoJoinHalloween do
                if workspace:FindFirstChild("Lobby") then
                    local args = {
                        [1] = "Haunted Graveyard-3",
                        [2] = "Haunted Graveyard",
                        [3] = "Repeat"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ElevatorService"):WaitForChild("RF"):WaitForChild("Join"):InvokeServer(unpack(args))
                    print("Auto joined Halloween!")
                else
                    print("Lobby not found, stopping Halloween script.")
                    break
                end
                wait(5)
            end
        end)
    end
end)






--        GAMEPLAY


-- AUTO KILL
local function getPlacedUnitsNames()
    local names = {}
    local seen = {} 

    local placedUnitsFolder = game.Workspace.Game.Map.PlacedUnits
    for _, model in ipairs(placedUnitsFolder:GetChildren()) do
        if model:IsA("Model") then
            local modelName = model.Name
            if not seen[modelName] then 
                seen[modelName] = true 
                table.insert(names, modelName)
            end
        end
    end

    return names
end

local replicatedStorage = game:GetService("ReplicatedStorage")
local waveService = replicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("WaveService")

local autoKill1, autoKill2, autoKill3, autoKill4 = false, false, false, false

local function sendUnitAbilityRequest(unitName)
    local unitModel = workspace:WaitForChild("Game"):WaitForChild("Map"):WaitForChild("PlacedUnits"):WaitForChild(unitName)
    
    if unitModel then
        local enemiesFolder = workspace:WaitForChild("Game"):WaitForChild("Map"):WaitForChild("Enemies")
        if enemiesFolder then
            for _, enemy in pairs(enemiesFolder:GetChildren()) do
                if enemy:IsA("Model") then
                    local spawnedAttribute = enemy:GetAttribute("Spawned")
                    if spawnedAttribute ~= nil then
                        local args = {
                            [1] = unitModel,                  
                            [2] = spawnedAttribute,           
                            [3] = enemy.Name                
                        }

                        waveService.RE.UnitAbilityRequest:FireServer(unpack(args))
                    end
                end
            end
        else
            print("Không tìm thấy folder Enemies.")
        end
    else
        print("Không tìm thấy model với tên: " .. unitName)
    end
end

-- Tạo Dropdowns cho từng Auto Kill
local dropdownValues = getPlacedUnitsNames()

local Dropdown1 = Tabs.GP:AddDropdown("Dropdown1", {
    Title = "Select Unit 1",
    Values = dropdownValues,
    Multi = false,
    Default = "Enderguy",
})
if #dropdownValues > 0 then
    Dropdown1:SetValue(dropdownValues[1])
end

local Dropdown2 = Tabs.GP:AddDropdown("Dropdown2", {
    Title = "Select Unit 2",
    Values = dropdownValues,
    Multi = false,
    Default = "Chronos",
})
if #dropdownValues > 0 then
    Dropdown2:SetValue(dropdownValues[1])
end

local Dropdown3 = Tabs.GP:AddDropdown("Dropdown3", {
    Title = "Select Unit 3",
    Values = dropdownValues,
    Multi = false,
    Default = "Inferno Lantern",
})
if #dropdownValues > 0 then
    Dropdown3:SetValue(dropdownValues[1])
end

local Dropdown4 = Tabs.GP:AddDropdown("Dropdown4", {
    Title = "Select Unit 4",
    Values = dropdownValues,
    Multi = false,
    Default = "Ice Princess",
})
if #dropdownValues > 0 then
    Dropdown4:SetValue(dropdownValues[1])
end

-- Tạo các nút Refresh cho Dropdown
Tabs.GP:AddButton({
    Title = "Refresh Unit 1",
    Description = "",
    Callback = function()
        local newValues = getPlacedUnitsNames()
        Dropdown1:SetValues(newValues)
        if #newValues > 0 then
            Dropdown1:SetValue(newValues[1])
        else
            Dropdown1:SetValue(nil)
        end        
    end
})

Tabs.GP:AddButton({
    Title = "Refresh Unit 2",
    Description = "",
    Callback = function()
        local newValues = getPlacedUnitsNames()
        Dropdown2:SetValues(newValues)
        if #newValues > 0 then
            Dropdown2:SetValue(newValues[1])
        else
            Dropdown2:SetValue(nil)
        end        
    end
})

Tabs.GP:AddButton({
    Title = "Refresh Unit 3",
    Description = "",
    Callback = function()
        local newValues = getPlacedUnitsNames()
        Dropdown3:SetValues(newValues)
        if #newValues > 0 then
            Dropdown3:SetValue(newValues[1])
        else
            Dropdown3:SetValue(nil)
        end        
    end
})

Tabs.GP:AddButton({
    Title = "Refresh Unit 4",
    Description = "",
    Callback = function()
        local newValues = getPlacedUnitsNames()
        Dropdown4:SetValues(newValues)
        if #newValues > 0 then
            Dropdown4:SetValue(newValues[1])
        else
            Dropdown4:SetValue(nil)
        end        
    end
})
local AutoKillToggle1 = Tabs.GP:AddToggle("AutoKill1", { Title = "Auto Kill 1", Default = false })
local AutoKillToggle2 = Tabs.GP:AddToggle("AutoKill2", { Title = "Auto Kill 2", Default = false })
local AutoKillToggle3 = Tabs.GP:AddToggle("AutoKill3", { Title = "Auto Kill 3", Default = false })
local AutoKillToggle4 = Tabs.GP:AddToggle("AutoKill4", { Title = "Auto Kill 4", Default = false })

local function autoKillHandler(toggle, dropdown, toggleValue)
    toggle:OnChanged(function()
        toggleValue = toggle.Value
        if toggleValue then
            local dropdownValue = dropdown.Value
            while toggleValue do
                sendUnitAbilityRequest(dropdownValue)
                wait(0) 
            end
        end
    end)
end

-- Gán xử lý cho các toggle và dropdown tương ứng
autoKillHandler(AutoKillToggle1, Dropdown1, autoKill1)
autoKillHandler(AutoKillToggle2, Dropdown2, autoKill2)
autoKillHandler(AutoKillToggle3, Dropdown3, autoKill3)
autoKillHandler(AutoKillToggle4, Dropdown4, autoKill4)







--             MISC


-- Toggle Auto Claim All Gift
local autoClaimAllGift = false
local AutoClaimAllGiftToggle = Tabs.Misc:AddToggle("AutoClaimAllGift", {Title = "Auto Claim All Gifts", Default = false})
AutoClaimAllGiftToggle:OnChanged(function()
    autoClaimAllGift = AutoClaimAllGiftToggle.Value
    if autoClaimAllGift then
        task.spawn(function()
            while autoClaimAllGift do
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                local giftsContent = playerGui.MainUI.Frames.Gifts.Main.Foreground.Content
                for i = 1, 9 do
                    local giftButtonLabel = giftsContent[tostring(i)].Main.Button.Main.Content.Button.TextLabel

                    if giftButtonLabel and giftButtonLabel.Text == "CLAIM" then
                        local args = {
                            [1] = i 
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GiftsService"):WaitForChild("RF"):WaitForChild("Claim"):InvokeServer(unpack(args))
                    end
                end

                wait(100)
            end
        end)
    end
end)



--AUTO RECONNECT
local autoReconnectEnabled = false
local autoReconnectThread
local function autoReconnect()
    while autoReconnectEnabled do
        repeat task.wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
        local lp = game:GetService('Players').LocalPlayer
        local po = game.CoreGui.RobloxPromptGui.promptOverlay
        local ts = game:GetService('TeleportService')            
        po.ChildAdded:Connect(function(a)
            if a.Name == 'ErrorPrompt' then
                repeat
                    ts:Teleport(15939808257) --ID GAME
                    task.wait(2)
                until not autoReconnectEnabled 
            end
        end)
        
        task.wait(10) 
    end
end
local AutoReconnectToggle = Tabs.Misc:AddToggle("AutoReconnectToggle", {
    Title = "Auto Reconnect",
    Default = false
})
AutoReconnectToggle:OnChanged(function(isEnabled)
    autoReconnectEnabled = isEnabled
    if autoReconnectEnabled then
        autoReconnectThread = coroutine.create(autoReconnect)
        coroutine.resume(autoReconnectThread)
    else
        if autoReconnectThread and coroutine.status(autoReconnectThread) == "suspended" then
            coroutine.yield(autoReconnectThread)
        end
    end
end)

--WEBHOOK
local HttpService = game:GetService("HttpService")
local Webhook_URL = "" -- Webhook mặc định trống

-- Thêm input cho người chơi nhập URL webhook
local WebhookInput = Tabs.Misc:AddInput("WebhookInput", {
    Title = "Webhook URL",
    Default = "",
    Placeholder = "Nhập URL webhook",
    Numeric = false, -- Cho phép nhập chuỗi
    Finished = true, -- Gọi callback khi nhấn Enter
    Callback = function(Value)
        Webhook_URL = Value -- Cập nhật giá trị Webhook_URL
    end
})


-- Lấy tên người chơi
local function getPlayerName()
    local player = game:GetService("Players").LocalPlayer
    return player.Name
end
-- Lấy số lượng Gold hiện tại
local function getCurrentGold()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Hotbar.Currency["Coins/Money"].Label.Text
end
-- Lấy số lượng Gem hiện tại
local function getCurrentGem()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Hotbar.Currency.Gems.Label.Text
end
--gold sau reward
local function getGoldReward()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.Foreground.PlayerStats.Rewards.Foreground.Reward.Text
end
--exp sau reward
local function getExpReward()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.Foreground.PlayerStats.MapIcon.Stats.EXP.Value.Text
end
-- Lấy Level mà không lấy chữ
local function getLevel()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Hotbar.Main.Level.Main.LevelLabel.Text
end
--Exp
local function getExp()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Hotbar.Main.Level.Main.ExpLabel.Text
end
--roundtime
local function roundTime()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.Foreground.GameStats.Time.Text
end
--victory
local function victoryorDef()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.TitleBanner.Label1.Text

end
--map name
local function nameMap()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.Foreground.GameStats.MapName.Text

end
--do kho 
local function doKho()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.Frames.Results.Main.Foreground.GameStats.Difficulty.Text

end
--wave
local function wave()
    local player = game:GetService("Players").LocalPlayer
    return player.PlayerGui.MainUI.GameInfo.Wave.Text
end

local function sendRequest(requestFunction)
    local playerName = getPlayerName()
    local currentGold = getCurrentGold()
    local currentGem = getCurrentGem()
    local goldReward = getGoldReward()
    local expReward = getExpReward()
    local levelUp = getLevel()
    local expUp = getExp()
    local roundtime = roundTime()
    local victory = victoryorDef()
    local namemap = nameMap()
    local dokho = doKho()
    local wave = wave()


    local jsonBody = HttpService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Pixel Tower Defense", 
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {{
                ["name"] = "User:  " .. "||" .. playerName .. "||",
                ["value"] = "",
                ["inline"] = false  -- Hiển thị trên dòng riêng
            }, {
                ["name"] = "" .. levelUp .. "\n" .. expUp,
                ["value"] = "",  
                ["inline"] = false  -- Hiển thị trên dòng riêng
            }, {
                ["name"] = "Player Stats",
                ["value"] = "Gold: " .. currentGold .. "\nGem: " .. currentGem,
                ["inline"] = true  -- Hiển thị bên trái
            }, {
                ["name"] = "Rewards",
                ["value"] = "+" .. goldReward .. "\n" .. expReward,
                ["inline"] = true  -- Hiển thị bên phải
            },{
                ["name"] = "Match Info",
                ["value"] = roundtime .. " - " .. wave .. "\n" .. victory .. "\n" .. namemap .. " - " .. dokho,
                ["inline"] = false,
            }}
        }}
    })

    local response = requestFunction({
        Url = Webhook_URL,
        Method = "POST",
        Headers = {
            ['Content-Type'] = "application/json"
        },
        Body = jsonBody
    })

    print("Response Status Code: ", response.StatusCode)
    print("Response Body: ", response.Body)
end

local function monitorRoundOver()
    local player = game:GetService("Players").LocalPlayer
    local roundOverFrame = player.PlayerGui.MainUI.Frames.Results
    local debounce = false
    roundOverFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if roundOverFrame.Visible and not debounce then
            debounce = true
            wait(3)
            local requestFunction = (syn and syn.request) or (http_request) or (request)
            if requestFunction then
                sendRequest(requestFunction)
            else
                warn("Không có chức năng yêu cầu HTTP khả dụng.")
            end
            wait(1)
            debounce = false
        end
    end)
end

-- Bắt đầu theo dõi
monitorRoundOver()


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
