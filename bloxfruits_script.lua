--// Blox Fruits Professional Script (No Key) \\--
--// Safe & Optimized for Delta Executor \\--

repeat wait() until game:IsLoaded()  -- Ensures the game is fully loaded

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Safe Teleport Function
local function teleportTo(position)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local tween = TweenService:Create(
            LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(1, Enum.EasingStyle.Linear),
            {CFrame = position}
        )
        tween:Play()
    end
end

-- Auto-Farm (Safe & Optimized)
local function autoFarm()
    while true do
        wait(1)  -- Prevents overload
        
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                teleportTo(enemy.HumanoidRootPart.CFrame)
                
                -- Attack enemy safely
                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
                
                wait(0.2)
            end
        end
    end
end

-- GUI for Execution
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Library/main.lua"))()
local Window = Library:CreateWindow("Blox Fruits Script")
local MainTab = Window:CreateTab("Main")

MainTab:CreateButton("Start Auto-Farm", autoFarm)
