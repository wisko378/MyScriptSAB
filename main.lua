-- [[ GG HUB - CODEX OPTIMIZED VERSION ]] --
local lp = game:GetService("Players").LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")

-- Nettoyage de sécurité
if PlayerGui:FindFirstChild("GG_Hub_V4") then 
    PlayerGui.GG_Hub_V4:Destroy() 
end

-- Création de l'interface avec protection Codex
local sg = Instance.new("ScreenGui")
sg.Name = "GG_Hub_V4"
sg.Parent = PlayerGui
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [ LE RESTE DU CODE DE TON MENU CI-DESSOUS ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 350, 0, 450)
Main.Position = UDim2.new(0.5, -175, 0.5, -225)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true -- Pour pouvoir le bouger avec la souris sur MuMu

local UIStroke = Instance.new("UIStroke", Main)
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
Instance.new("UICorner", Main)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "GG HUB PREMIUM - ACTIVE"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Instance.new("UICorner", Title)

-- [ AJOUTE TES BOUTONS ICI COMME DANS LA VERSION PRÉCÉDENTE ]
-- ... (Je te laisse remettre tes sélecteurs de Trait/Mutation ici)

print("GG HUB V4 LOADED SUCCESSFULLY")
