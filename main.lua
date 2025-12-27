-- [[ GG HUB MASTER - PRO DUPE & CUSTOMIZER ]]
local lp = game.Players.LocalPlayer
local Net = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net")
local Grab = Net:WaitForChild("RE/StealService/Grab")
local Deliver = Net:WaitForChild("RE/StealService/DeliverySteal")

-- Tables de données (Inspirées du Trax Spawner)
local BrainrotList = {"Dragon Cannelloni", "Skibidi", "Fanum Tax", "Sigma", "Rizzler"}
local TraitList = {"10B", "Rainbow", "Golden", "Shiny", "Strawberry"}
local MutationList = {"YinYang", "Giant", "Frozen", "Fire", "None"}

local selBR, selTR, selMT = BrainrotList[1], TraitList[1], MutationList[1]

-- Interface
if lp.PlayerGui:FindFirstChild("TraxStyle") then lp.PlayerGui.TraxStyle:Destroy() end
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "TraxStyle"

local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 300, 0, 380)
Main.Position = UDim2.new(0.5, -150, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Instance.new("UICorner", Main)

local function CreateBtn(txt, y, list, isAction)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = isAction and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(30, 30, 35)
    btn.Text = isAction and txt or (txt .. ": " .. list[1])
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)

    if not isAction then
        local idx = 1
        btn.MouseButton1Click:Connect(function()
            idx = idx + 1
            if idx > #list then idx = 1 end
            btn.Text = txt .. ": " .. list[idx]
            if txt:find("Brainrot") then selBR = list[idx]
            elseif txt:find("Trait") then selTR = list[idx]
            else selMT = list[idx] end
        end)
    else
        btn.MouseButton1Click:Connect(function()
            local tool = lp.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:SetAttribute("Trait", selTR)
                tool:SetAttribute("Mutation", selMT)
                Grab:FireServer("Place", tonumber(tool.Name) or 1)
                task.wait(2.35)
                Deliver:FireServer()
                task.wait(0.1)
                Grab:FireServer("Grab", tool.Name)
            end
        end)
    end
end

-- Menus et Bouton Dupe
CreateBtn("Brainrot", 50, BrainrotList, false)
CreateBtn("Trait", 100, TraitList, false)
CreateBtn("Mutation", 150, MutationList, false)
CreateBtn("💎 DUPLICATE ITEM", 220, nil, true)

-- Tuto
local L = Instance.new("TextLabel", Main)
L.Size = UDim2.new(0.9, 0, 0, 60)
L.Position = UDim2.new(0.05, 0, 0, 270)
L.Text = "1. Tiens l'objet\n2. Clique sur Duplicate\n3. Attends 2.35s sans bouger"
L.TextColor3 = Color3.fromRGB(0, 255, 150)
L.BackgroundTransparency = 1
L.TextSize = 12