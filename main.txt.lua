local remote = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t")
local selectedPlayer = nil

local mensagens = {
    "",
    "",
    "N",
    "NE",
    "NEY",
    "NEYM",
    "NEYMA",
    "NEYMAR",
    "NEYMAR HU",
    "NEYMAR HUB ",
    "NEYMAR HUB B",
    "NEYMAR HUB BR",
    "NEYMAR HUB BRO",
    "NEYMAR HUB BROO",
    "NEYMAR HUB BROOK",
    "NEYMAR HUB BROOKH",
    "NEYMAR HUB BROOKHA",
    "NEYMAR HUB BROOKHAV",
    "NEYMAR HUB BROOKHAVE",
    "NEYMAR HUB BROOKHAVEN",
    "NEYMAR HUB BROOKHAVEN",
    "NEYMAR HUB BROOKHAVEN",
}


for _, mensagem in ipairs(mensagens) do
    remote:FireServer("RolePlayBio", mensagem)
    wait(0.1)
end

local Libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/cubodegelo1116/ui/refs/heads/main/ui"))()

Libary:SetTheme("PeachPuff")

workspace.FallenPartsDestroyHeight = -math.huge



local Window = Libary:MakeWindow({
    Title = "NEYMAR HUB",
    SubTitle = "        BROOKHAVEN RP| by NEYMAR HUB",
    LoadText = "Loading NEYMAR HUB",
    Flags = "NEYMARHub_Broookhaven"
})



Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://125602848737897", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local InfoTab = Window:MakeTab({ Title = "حقوق", Icon = "rbxassetid://15309138473" })
InfoTab:AddDiscordInvite({
    Name = "نيمار||حسنين",
    Description = "NEYMAR NEYMAR",
    Logo = "rbxassetid://125602848737897",
    Invite = "تيك توكWLV27",
})
InfoTab:AddParagraph({ "NEYMAR", "NEYMARHub_Broookhaven" })
InfoTab:AddParagraph({ "NEYMARHub_Broookhaven", "NEYMAR" })

InfoTab:AddSection({ "اعادة الدخول" })
InfoTab:AddButton({
    Name = "اعادة انضمام",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

InfoTab:AddButton({
    Name = "ServerHop ",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local PlaceId = game.PlaceId

        local function serverRequest(url)
            if http_request then
                return http_request({ Url = url, Method = "GET" })
            elseif syn and syn.request then
                return syn.request({ Url = url, Method = "GET" })
            elseif fluxus and fluxus.request then
                return fluxus.request({ Url = url, Method = "GET" })
            elseif request then
                return request({ Url = url, Method = "GET" })
            else
                warn("Exploit não suporta http_request.")
                return nil
            end
        end

        local function GetServers()
            local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?limit=100"
            local data = serverRequest(url)
            if not data then return {} end

            local body = data.Body or data.body
            local decoded = HttpService:JSONDecode(body)
            local servers = {}

            for _, server in pairs(decoded.data or {}) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(servers, server.id)
                end
            end
            return servers
        end

        local servers = GetServers()
        if #servers > 0 then
            local chosen = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(PlaceId, chosen, LocalPlayer)
        else
            warn("Nenhum servidor diferente encontrado.")
        end
    end
})


InfoTab:AddSection({ "Dev Console" })
InfoTab:AddButton({
    Name = "Dev Console",
    Callback = function()
        local StarterGui = game:GetService("StarterGui")
        pcall(function()
            StarterGui:SetCore("DevConsoleVisible", true)
        end)
    end
})
-- لو تحط حقوق اخوك بروتون تكون لك اوامر مميزة
local NameTab = Window:MakeTab({ Title = "الاسماء", Icon = "rbxassetid://10747830374" })
NameTab:AddSection({ Name = "تلوين الاسم والبايو          ", Icon = "rbxassetid://10709782758" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local NameRemote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eColo1r")

local t = 0
local rainbowSpeed = 2
local nameRainbow = false
local bioRainbow = false
local nameFast = false
local bioFast = false

local function updateRainbow(dt)
    t += dt
    local speed = rainbowSpeed
    if nameFast then speed = 20 end
    local r = math.sin(t * speed) * 0.5 + 0.5
    local g = math.sin(t * speed + 2) * 0.5 + 0.5
    local b = math.sin(t * speed + 4) * 0.5 + 0.5
    local rainbow = Color3.new(r, g, b)

    if nameRainbow or nameFast then
        NameRemote:FireServer("PickingRPNameColor", rainbow)
    end
    if bioRainbow or bioFast then
        NameRemote:FireServer("PickingRPBioColor", rainbow)
    end
end

RunService.RenderStepped:Connect(function(dt)
    updateRainbow(dt)
end)
NameTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 0.1,
    Max = 1000,
    Default = 2,
    Increment = 0.1,
    Callback = function(value)
        rainbowSpeed = value
    end
})
NameTab:AddToggle({
    Name = "تلوين الاسم",
    Default = false,
    Callback = function(state)
        nameRainbow = state
    end
})
NameTab:AddToggle({
    Name = "تلوين البايو",
    Default = false,
    Callback = function(state)
        bioRainbow = state
    end
})
NameTab:AddSection({ Name = "زخرفة الاسم والبابو          ", Icon = "rbxassetid://10723345088" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eTex1t")

local selectedBio = ""
local selectedName = ""

NameTab:AddTextBox({
    Name = "اكتب شتريد في البايو هنا",
    Description = "",
    PlaceholderText = "LOC4T",
    Callback = function(Value)
        selectedBio = Value
    end
})

NameTab:AddTextBox({
    Name = "اكتب شتريد في الاسم هنا",
    Description = "",
    PlaceholderText = "LOC4T",
    Callback = function(Value)
        selectedName = Value
    end
})

local bioTypingLoop = false
local bioBackLoop = false
local nameTypingLoop = false
local nameBackLoop = false

local function AnimateLoop(remoteName, getText, reverseFlag, stateRef)
    task.spawn(function()
        while stateRef() do
            local text = getText()
            if text ~= "" then
                local buffer = ""
                for i = 1, #text do
                    if not stateRef() then return end
                    buffer = string.sub(text, 1, i)
                    Remote:FireServer(remoteName, buffer)
                    task.wait(0.1)
                end

                if reverseFlag then
                    for i = #text, 1, -1 do
                        if not stateRef() then return end
                        buffer = string.sub(text, 1, i)
                        Remote:FireServer(remoteName, buffer)
                        task.wait(0.1)
                    end
                end
            else
                task.wait(0.2)
            end
        end
    end)
end

NameTab:AddToggle({
    Name = "زخرفة البايو عادي",
    Default = false,
    Callback = function(state)
        bioTypingLoop = state
        if state then
            AnimateLoop("RolePlayBio", function() return selectedBio end, false, function() return bioTypingLoop end)
        end
    end
})

NameTab:AddToggle({
    Name = "زخرفة البايو سريع",
    Default = false,
    Callback = function(state)
        bioBackLoop = state
        if state then
            AnimateLoop("RolePlayBio", function() return selectedBio end, true, function() return bioBackLoop end)
        end
    end
})

NameTab:AddToggle({
    Name = "زخرفة الاسم عادي",
    Default = false,
    Callback = function(state)
        nameTypingLoop = state
        if state then
            AnimateLoop("RolePlayName", function() return selectedName end, false, function() return nameTypingLoop end)
        end
    end
})
NameTab:AddToggle({
    Name = "زخرفة الاسم سريع",
    Default = false,
    Callback = function(state)
        nameBackLoop = state
        if state then
            AnimateLoop("RolePlayName", function() return selectedName end, true, function() return nameBackLoop end)
        end
    end
})
NameTab:AddSection({ Name = "سبام اسماء          ", Icon = "rbxassetid://10734933966" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

local NameSpamActive = false
local SpamSpeed = 1
local Name1, Name2, Name3, Name4, Name5 = "", "", "", "", ""

NameTab:AddTextBox({ Name = "الاسم 1", Default = "", TextDisappear = true, Callback = function(v) Name1 = v end })
NameTab:AddTextBox({ Name = "الاسم 2", Default = "", TextDisappear = true, Callback = function(v) Name2 = v end })
NameTab:AddTextBox({ Name = "الاسم 3", Default = "", TextDisappear = true, Callback = function(v) Name3 = v end })
NameTab:AddTextBox({ Name = "الاسم 4", Default = "", TextDisappear = true, Callback = function(v) Name4 = v end })
NameTab:AddTextBox({ Name = "الاسم 5", Default = "", TextDisappear = true, Callback = function(v) Name5 = v end })

NameTab:AddSlider({
    Name = "سرعة سبام الاسماء",
    Min = 1,
    Max = 150,
    Default = 5,
    Increment = 1,
    Callback = function(v)
        SpamSpeed = v
    end
})
NameTab:AddToggle({
    Name = "تفعيل سبام الاسماء",
    Default = false,
    Callback = function(state)
        NameSpamActive = state
        if NameSpamActive then
            task.spawn(function()
                while NameSpamActive do
                    local names = { Name1, Name2, Name3, Name4, Name5 }
                    for _, name in ipairs(names) do
                        if not NameSpamActive then break end
                        if name ~= "" then
                            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer("RolePlayName",
                                name)
                            task.wait(1 / SpamSpeed)
                        end
                    end
                end
            end)
        end
    end
})
NameTab:AddSection({ Name = "سبام بايو          ", Icon = "rbxassetid://10734933966" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BioSpamActive = false
local Bio1, Bio2, Bio3, Bio4, Bio5 = "", "", "", "", ""
local SpamSpeed = 1

NameTab:AddTextBox({ Name = "البايو 1", Default = "", TextDisappear = true, Callback = function(v) Bio1 = v end })
NameTab:AddTextBox({ Name = "البايو 2", Default = "", TextDisappear = true, Callback = function(v) Bio2 = v end })
NameTab:AddTextBox({ Name = "البايو 3", Default = "", TextDisappear = true, Callback = function(v) Bio3 = v end })
NameTab:AddTextBox({ Name = "البايو 4", Default = "", TextDisappear = true, Callback = function(v) Bio4 = v end })
NameTab:AddTextBox({ Name = "البايو 5", Default = "", TextDisappear = true, Callback = function(v) Bio5 = v end })

NameTab:AddSlider({
    Name = "سرعة سبام البايو",
    Min = 1,
    Max = 150,
    Default = 5,
    Increase = 1,
    Callback = function(v)
        SpamSpeed = v
    end
})
NameTab:AddToggle({
    Name = "تفعيل سبام البايو",
    Default = false,
    Callback = function(state)
        BioSpamActive = state
        if state then
            task.spawn(function()
                while BioSpamActive do
                    for _, bio in ipairs({ Bio1, Bio2, Bio3, Bio4, Bio5 }) do
                        if not BioSpamActive then break end
                        if bio ~= "" then
                            pcall(function()
                                ReplicatedStorage:WaitForChild("RE")
                                    :WaitForChild("1RPNam1eTex1t")
                                    :FireServer("RolePlayBio", bio)
                            end)
                            task.wait(1 / SpamSpeed)
                        end
                    end
                end
            end)
        end
    end
})
local BodyTab = Window:MakeTab({
    Title = "اجسام",
    Icon = "rbxassetid://10734883598"
})
BodyTab:AddSection({ Name = "اجسام اولاد كاملة          ", Icon = "rbxassetid://10734943902" })
BodyTab:AddButton({
    Name = "جسم ولد طويل برجلين",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%D9%8A%D9%86"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل شبح يمنى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D9%85%D9%86%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل شبح يسرى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل مقطوعة",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D9%82%D8%B7%D9%88%D8%B9%D8%A9"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل مافيا يمنى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D8%A7%D9%81%D9%8A%D8%A7%20%D9%8A%D9%85%D9%86%D8%A9"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل مافيا  يسرى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D8%A7%D9%81%D9%8A%D8%A7%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد طويل برجل مافيا  يسرى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D8%A7%D9%81%D9%8A%D8%A7%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ولد انمي",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A7%D9%86%D9%85%D9%8A%202"))()
    end
})
BodyTab:AddButton({
    Name = "جسم مونستر مطلوب",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D9%85%D9%88%D9%86%D8%B3%D8%AA%D8%B1"))()
    end
})
BodyTab:AddButton({
    Name = "جسم مونستر تركيب مورفن",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D9%85%D9%88%D8%B1%D9%81%D9%86"))()
    end
})
BodyTab:AddButton({
    Name = "جسم ترند",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%AA%D8%B1%D9%86%D8%AF"))()
    end
})
BodyTab:AddButton({
    Name = "جسم كيوت",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D9%83%D9%8A%D9%88%D8%AA%201"))()
    end
})
BodyTab:AddSection({ Name = "اجسام بنات كاملة          ", Icon = "rbxassetid://10734943902" })
BodyTab:AddButton({
    Name = "جسم بنت طويل برجلين",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%D9%8A%D9%86"))()
    end
})
BodyTab:AddButton({
    Name = "جسم بنت طويل برجل شبح يمنى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D9%85%D9%86%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم بنت طويل برجل شبح يسرى",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D8%B4%D8%A8%D8%AD%20%D9%8A%D8%B3%D8%B1%D9%89"))()
    end
})
BodyTab:AddButton({
    Name = "جسم بنت طويل برجل مقطوعة",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%B7%D9%88%D9%8A%D9%84%20%D8%A8%D8%B1%D8%AC%D9%84%20%D9%85%D9%82%D8%B7%D9%88%D8%B9%D8%A9"))()
    end
})
BodyTab:AddButton({
    Name = "جسم بنت انمي",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Body-2/refs/heads/main/%D8%AC%D8%B3%D9%85%20%D8%A8%D9%86%D8%AA%20%D8%A7%D9%86%D9%85%D9%8A"))()
    end
})
BodyTab:AddSection({ Name = " R6 اجسام          ", Icon = "rbxassetid://10734943902" })
BodyTab:AddButton({
    Name = "R6_1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R61"))()
    end
})
BodyTab:AddButton({
    Name = "R6_2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R62"))()
    end
})
BodyTab:AddButton({
    Name = "R6_3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R63"))()
    end
})
BodyTab:AddButton({
    Name = "R6_4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R64"))()
    end
})
BodyTab:AddButton({
    Name = "R6_5",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R67"))()
    end
})
BodyTab:AddButton({
    Name = "R6_1X1X1X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6%5Cn1X1X1X1"))()
    end
})
BodyTab:AddButton({
    Name = "R6_بنت١",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6girl"))()
    end
})
BodyTab:AddButton({
    Name = "R6_بنت٢",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6girl2"))()
    end
})
BodyTab:AddButton({
    Name = "R6_بلمقلوب",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/R6/refs/heads/main/R6%D9%85%D9%82%D9%84%D9%88%D8%A8"))()
    end
})
BodyTab:AddSection({ Name = "  اجسام اقزام       ", Icon = "rbxassetid://10734943902" })
BodyTab:AddButton({
    Name = "قزم 1",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%201"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 2",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%202"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 3",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%203"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 4",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%204"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 5",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%205"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 6",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%206"))()
    end
})
BodyTab:AddButton({
    Name = "قزم 7",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/bruton-lua-sources/Mini-body/refs/heads/main/%D9%82%D8%B2%D9%85%207"))()
    end
})
local pl = game.Players.LocalPlayer
local players = {}

local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

updatePlayerList()
local TabBaby = Window:MakeTab({ Title = "اطفال تخريب", Icon = "rbxassetid://10709769732" })

local chasingplayer = nil
local players = {}
local function updatePlayerList()
    players = {}
    for _, p in pairs(game.Players:GetPlayers()) do
        table.insert(players, p.Name)
    end
    return players
end
updatePlayerList()

local playerChild = TabBaby:AddDropdown({
    Name = "اختيار اللاعب لارسال الطفل",
    Options = players,
    Default = "",
    Callback = function(selected)
        if game.Players:FindFirstChild(selected) then
            chasingplayer = selected
        else
            chasingplayer = nil
        end
    end
})

TabBaby:AddButton({
    Name = "تحديث القائمة",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if playerChild and updatedPlayers then
            pcall(function()
                playerChild:Refresh(updatedPlayers)
            end)
            if chasingplayer and not game.Players:FindFirstChild(chasingplayer) then
                chasingplayer = nil
                pcall(function()
                    playerChild:Set("")
                end)
            end
        end
    end
})

local SelectedGender = "BabyBoy"
local Genders = { { Name = "ولد", Value = "BabyBoy" }, { Name = "بنت", Value = "BabyGirl" } }

TabBaby:AddDropdown({
    Name = "اختيار الطفل",
    Options = (function()
        local opts = {}
        for _, g in ipairs(Genders) do
            table.insert(opts, g.Name)
        end
        return opts
    end)(),
    Default = Genders[1].Name,
    Callback = function(selected)
        for _, g in ipairs(Genders) do
            if g.Name == selected then
                SelectedGender = g.Value
                break
            end
        end
    end
})

TabBaby:AddButton({
    Name = "وضع الطفل اولا",
    Callback = function()
        local args = {
            [1] = "CharacterFollowSpawnPlayer",
            [2] = SelectedGender
        }
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)
        if not success then
            warn("LOC4T HUB: " .. err)
        end
    end
})

TabBaby:AddButton({
    Name = "ارسال الطفل ثانيا",
    Callback = function()
        if not chasingplayer then
            warn("LOC4T HUB")
            return
        end

        local target = chasingplayer

        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            warn("LOC4T HUB")
            return
        end

        if workspace:FindFirstChild(target) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            workspace[pl.Name].FollowCharacter.Parent = workspace[target]

            if getgenv().ChildFollowLoop then
                getgenv().ChildFollowLoop:Disconnect()
            end

            getgenv().ChildFollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local followCharacter = workspace[target]:FindFirstChild("FollowCharacter")
                local humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")

                if followCharacter and humanoidRootPart then
                    followCharacter.Torso.BodyPosition.Position = humanoidRootPart.Position
                    followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame
                end
            end)
        end
    end
})
TabBaby:AddSection({ Name = "البانج          ", Icon = "rbxassetid://10747381992" })
TabBaby:AddButton({
    Title = "بانج امامي",
    Description = "تاكد انك رسبنت الطفل",
    Callback = function()
        if not chasingplayer then
            warn("LOC4T HUB")
            return
        end

        local target = chasingplayer
        local pl = game.Players.LocalPlayer

        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            warn("LOC4T HUB")
            return
        end

        if workspace:FindFirstChild(target) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            local followCharacter = workspace[pl.Name].FollowCharacter
            local targetChar = workspace[target]
            local hrp = targetChar:FindFirstChild("HumanoidRootPart")

            if not hrp then
                warn("LOC4T HUB")
                return
            end

            local head = targetChar:FindFirstChild("Head")
            local facePos
            if head then
                facePos = head.Position + head.CFrame.LookVector * 0.1
            else
                facePos = hrp.Position + hrp.CFrame.LookVector * 0.1
            end

            followCharacter.Parent = workspace
            followCharacter:MoveTo(facePos)

            if getgenv().ChildFollowLoop then
                getgenv().ChildFollowLoop:Disconnect()
            end

            getgenv().ChildFollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                if not (targetChar and targetChar:FindFirstChild("HumanoidRootPart") and followCharacter and followCharacter:FindFirstChild("Torso")) then
                    getgenv().ChildFollowLoop:Disconnect()
                    return
                end

                local targetHRP = targetChar.HumanoidRootPart
                local headNow = targetChar:FindFirstChild("Head")
                local torso = followCharacter.Torso

                local facePosition
                if headNow then
                    facePosition = headNow.Position + headNow.CFrame.LookVector * 0.1
                else
                    facePosition = targetHRP.Position + targetHRP.CFrame.LookVector * 0.1
                end

                local pos1 = facePosition + targetHRP.CFrame.LookVector * -0.2
                local pos2 = facePosition + targetHRP.CFrame.LookVector * 2.9

                local t = tick() % 1
                local progress = math.abs(math.sin(t * math.pi))
                local newPos = pos1:Lerp(pos2, progress)

                torso.BodyPosition.Position = newPos
                torso.BodyGyro.CFrame = CFrame.lookAt(torso.Position, facePosition)
            end)
        end
    end
})
TabBaby:AddButton({
    Title = "بانج خلفي",
    Description = "تاكد انك رسبنت الطفل",
    Callback = function()
        if not chasingplayer then
            warn("LOC4T HUB")
            return
        end

        local target = chasingplayer
        local pl = game.Players.LocalPlayer

        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            warn("LOC4T HUB")
            return
        end

        if workspace:FindFirstChild(target) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            local followCharacter = workspace[pl.Name].FollowCharacter
            local targetChar = workspace[target]
            local hrp = targetChar:FindFirstChild("HumanoidRootPart")

            if not hrp then
                warn("LOC4T HUB")
                return
            end

            local backPos = hrp.Position - hrp.CFrame.LookVector * 0.1

            followCharacter.Parent = workspace
            followCharacter:MoveTo(backPos)

            if getgenv().ChildFollowLoop then
                getgenv().ChildFollowLoop:Disconnect()
            end

            getgenv().ChildFollowLoop = game:GetService("RunService").Heartbeat:Connect(function()
                if not (targetChar and targetChar:FindFirstChild("HumanoidRootPart") and followCharacter and followCharacter:FindFirstChild("Torso")) then
                    getgenv().ChildFollowLoop:Disconnect()
                    return
                end

                local targetHRP = targetChar.HumanoidRootPart
                local torso = followCharacter.Torso

                local backPosition = targetHRP.Position - targetHRP.CFrame.LookVector * 0.1

                local pos1 = backPosition - targetHRP.CFrame.LookVector * 2.8
                local pos2 = backPosition - targetHRP.CFrame.LookVector * -0.2

                local t = tick() % 1
                local progress = math.abs(math.sin(t * math.pi))
                local newPos = pos1:Lerp(pos2, progress)

                torso.BodyPosition.Position = newPos
                torso.BodyGyro.CFrame = CFrame.lookAt(torso.Position, targetHRP.Position)
            end)
        end
    end
})
TabBaby:AddSection({ Name = "من تريد تغير البانج او الارسال سوي ارجاع          ", Icon = "rbxassetid://10747384394" })
TabBaby:AddButton({
    Name = "ارجاع الطفل",
    Callback = function()
        if rawget(getgenv(), "ChildFollowLoop") then
            getgenv().ChildFollowLoop:Disconnect()
            getgenv().ChildFollowLoop = nil
        end

        local args = { [1] = "DeleteFollowCharacter" }
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)

        local args1 = { [1] = "CharacterFollowSpawnPlayer", [2] = SelectedGender }
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))
        end)
    end
})
TabBaby:AddSection({ Name = "مشاهدة اللاعب          ", Icon = "rbxassetid://10723346871" })
TabBaby:AddToggle({
    Name = "مشاهدة اللاعب",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        if Value then
            if not chasingplayer then
                warn("LOC4T HUB")
                return
            end

            if not rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(function()
                    local targetPlayer = Players:FindFirstChild(chasingplayer)
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = targetPlayer.Character.Humanoid
                    else
                        if rawget(getgenv(), "CameraConnection") then
                            getgenv().CameraConnection:Disconnect()
                            getgenv().CameraConnection = nil
                        end
                        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or
                        nil
                    end
                end)
            end
        else
            if rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end
})
local Tab4 = Window:MakeTab({ Title = "نسخ سكنات", Icon = "rbxassetid://10734952036" })
Tab4:AddSection({ Name = "          خرافي نسخ سكنات", Icon = "rbxassetid://10734952036" })
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local lastValidTarget = nil
local copyType = "ماب البيوت"
local Target = nil

local function Wear(id)
    pcall(function()
        Rep.Remotes.Wear:InvokeServer(tonumber(id))
    end)
end

local function RESETBLOCK()
    args = {
        [1] = { 0, 0, 0, 0, 0, 0 },
        [2] = "AllBlocky"
    }
    pcall(function()
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function ApplySkinToneFromUserId(userId)
    pcall(function()
        local info = Players:GetCharacterAppearanceInfoAsync(userId)
        if info.bodyColors then
            local headColor = info.bodyColors.HeadColor
            if headColor then
                Rep.Remotes.ChangeBodyColor:FireServer(tostring(headColor))
            end
        end
    end)
end

local function CopyClothing(desc)
    local items = { desc.Shirt, desc.Pants, desc.GraphicTShirt, desc.Face }
    for _, id in ipairs(items) do
        if tonumber(id) and id ~= 0 then
            Wear(id)
            task.wait(0.1)
        end
    end
end

local function CopyAccessories(desc)
    pcall(function()
        for _, v in ipairs(desc:GetAccessories(true)) do
            if v.AssetId then
                Wear(v.AssetId)
                task.wait(0.1)
            end
        end
    end)
end

local function CopyBodyParts(desc, source)
    args = {
        [1] = {
            tonumber(desc.Torso),
            tonumber(desc.RightArm),
            tonumber(desc.LeftArm),
            tonumber(desc.RightLeg),
            tonumber(desc.LeftLeg),
            tonumber(desc.Head)
        },
        [2] = source
    }
    pcall(function()
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function CopyAnimations(desc)
    local anims = {
        desc.IdleAnimation,
        desc.WalkAnimation,
        desc.RunAnimation,
        desc.JumpAnimation,
        desc.FallAnimation,
        desc.SwimAnimation
    }
    for _, animId in ipairs(anims) do
        if tonumber(animId) and animId ~= 0 then
            Wear(animId)
            task.wait(0.1)
        end
    end
end

local function CopyBrookhaven(targetPlayer)
    local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local desc = humanoid:GetAppliedDescription()
    local bodyColors = targetPlayer.Character:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        local headColor = bodyColors.HeadColor
        if headColor then
            Rep.Remotes.ChangeBodyColor:FireServer(tostring(headColor))
        end
    end

    pcall(function()
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "NEYMAR")
        CopyClothing(desc)
        CopyAnimations(desc)
    end)
end

local function CopyOriginalAvatar(userId)
    pcall(function()
        local desc = Players:GetHumanoidDescriptionFromUserId(userId)
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "NEYMAR")
        CopyClothing(desc)
        CopyAnimations(desc)
        ApplySkinToneFromUserId(userId)
    end)
end

local function findPlayerByName(partialName)
    if not partialName or partialName == "" then return nil end
    partialName = partialName:lower()

    local foundPlayers = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower():find(partialName, 1, true) then
            table.insert(foundPlayers, player)
        end
    end

    table.sort(foundPlayers, function(a, b)
        local aStart = a.Name:lower():sub(1, #partialName) == partialName
        local bStart = b.Name:lower():sub(1, #partialName) == partialName
        if aStart and not bStart then return true end
        if not aStart and bStart then return false end
        return #a.Name < #b.Name
    end)

    return foundPlayers[1]
end

Tab4:AddTextBox({
    Name = "اسم اللاعب",
    Default = "",
    Callback = function(text)
        if text == "" then
            if lastValidTarget then
                text = lastValidTarget
            else
                return
            end
        end
        local targetPlayer = findPlayerByName(text)
        if targetPlayer then
            Target = targetPlayer
            lastValidTarget = targetPlayer.Name
        end
    end
})

Tab4:AddDropdown({
    Name = "طريقة النسخ",
    Options = { "ماب البيوت", "سكن لاساسي" },
    Callback = function(option)
        copyType = option
    end
})

Tab4:AddButton({
    Name = "نسخ",
    Callback = function()
        if not Target then return end
        if copyType == "ماب البيوت" then
            CopyBrookhaven(Target)
        else
            CopyOriginalAvatar(Target.UserId)
        end
    end
})
Tab4:AddSection({ Name = "           نسخ سكنات", Icon = "rbxassetid://10734952036" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

local Dropdown = Tab4:AddDropdown({
    Name = "اختيار لاعب",
    Options = GetPlayerNames(),
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)
Tab4:AddButton({
    Name = "نسخ",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                local LDesc = LHumanoid:GetAppliedDescription()

                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})
local ToolTab = Window:MakeTab({ Title = "تخريب ادوات من بروتون", Icon = "rbxassetid://10723416652" })
ToolTab:AddSection({ Name = "تخريب بادوات الصندوق          ", Icon = "rbxassetid://10709782582" })
ToolTab:AddButton({
    Name = "اضغط لتاخذ الصندوق",
    Callback = function()
        local args = {
            [1] = "PickingTools",
            [2] = "PropMaker"
        }

        game:GetService("ReplicatedStorage")
            .RE
            :FindFirstChild("1Too1l")
            :InvokeServer(unpack(args))
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil
local FlingConnection = nil
local BringConnection = nil
local KillConnection = nil

local function getPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local DropdownPlayer = ToolTab:AddDropdown({
    Name = "اختيار اللاعب",
    Description = "",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player_select",
    Callback = function(name)
        if name and name ~= "" then
            SelectedPlayer = Players:FindFirstChild(name)
        else
            SelectedPlayer = nil
        end
    end
})

local function UpdatePlayers()
    DropdownPlayer:Set(getPlayerNames())
end

ToolTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        UpdatePlayers()
    end
})

Players.PlayerAdded:Connect(UpdatePlayers)
Players.PlayerRemoving:Connect(UpdatePlayers)
UpdatePlayers()

local propCache = {}
local lastCacheUpdate = 0

local function GetMyProps()
    if tick() - lastCacheUpdate < 0.5 and #propCache > 0 then
        return propCache
    end
    propCache = {}
    local workspaceCom = workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return propCache end
    local myName = LocalPlayer.Name
    for _, folder in ipairs(workspaceCom:GetChildren()) do
        for _, prop in ipairs(folder:GetChildren()) do
            if (prop.Name:find(myName) or prop.Name:find("Prop" .. myName)) and prop:FindFirstChild("SetCurrentCFrame") then
                table.insert(propCache, prop)
            end
        end
    end
    lastCacheUpdate = tick()
    return propCache
end

local function TeleportProps(cf)
    for _, prop in ipairs(GetMyProps()) do
        task.spawn(function()
            pcall(function()
                prop.SetCurrentCFrame:InvokeServer(cf)
            end)
        end)
    end
end

local function ClearAllProps()
    pcall(function()
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllProps")
    end)
end

ToolTab:AddToggle({
    Name = "فلنق بالاداة",
    Default = false,
    Callback = function(v)
        if FlingConnection then
            FlingConnection:Disconnect()
            FlingConnection = nil
        end
        if v and SelectedPlayer then
            local wasSitting = false
            FlingConnection = RunService.Heartbeat:Connect(function()
                local c = SelectedPlayer.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                local h = c and c:FindFirstChild("Humanoid")
                if not r or not h then return end
                if h.Sit then
                    if not wasSitting then
                        wasSitting = true
                        TeleportProps(CFrame.new(1082537, 81322368, -4719626))
                        task.delay(1.5, ClearAllProps)
                    end
                else
                    wasSitting = false
                    TeleportProps(r.CFrame * CFrame.new(0, -(h.HipHeight + 2), 0))
                end
            end)
        end
    end
})

ToolTab:AddToggle({
    Name = "سحب بالاداة",
    Default = false,
    Callback = function(v)
        if BringConnection then
            BringConnection:Disconnect()
            BringConnection = nil
        end
        if v and SelectedPlayer then
            local wasSitting = false
            BringConnection = RunService.Heartbeat:Connect(function()
                local c = SelectedPlayer.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                local h = c and c:FindFirstChild("Humanoid")
                local my = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not r or not h or not my then return end
                if h.Sit then
                    if not wasSitting then
                        wasSitting = true
                        TeleportProps(my.CFrame * CFrame.new(0, 0, -3))
                        task.delay(1.5, ClearAllProps)
                    end
                else
                    wasSitting = false
                    TeleportProps(r.CFrame * CFrame.new(0, -(h.HipHeight + 2), 0))
                end
            end)
        end
    end
})

ToolTab:AddToggle({
    Name = "قتل بالاداة",
    Default = false,
    Callback = function(v)
        if KillConnection then
            KillConnection:Disconnect()
            KillConnection = nil
        end
        if v and SelectedPlayer then
            local wasSitting = false
            KillConnection = RunService.Heartbeat:Connect(function()
                local c = SelectedPlayer.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                local h = c and c:FindFirstChild("Humanoid")
                if not r or not h then return end
                if h.Sit then
                    if not wasSitting then
                        wasSitting = true
                        TeleportProps(CFrame.new(216, -1338, -477))
                        task.delay(1.5, ClearAllProps)
                    end
                else
                    wasSitting = false
                    TeleportProps(r.CFrame * CFrame.new(0, -(h.HipHeight + 2), 0))
                end
            end)
        end
    end
})
ToolTab:AddSection({ Name = "هالة ادوات عليك          ", Icon = "rbxassetid://10734950309" })
ToolTab:AddButton({
    Name = "اضغط لتاخذ الصندوق",
    Callback = function()
        local args = {
            [1] = "PickingTools",
            [2] = "PropMaker"
        }

        game:GetService("ReplicatedStorage")
            .RE
            :FindFirstChild("1Too1l")
            :InvokeServer(unpack(args))
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local auraDistance = 6
local auraSpeed = 4
local auraEnabled = false

ToolTab:AddSlider({
    Name = "بعد الهالة",
    Min = 1,
    Max = 15,
    Default = 6,
    Increase = 0.5,
    Callback = function(v)
        auraDistance = v
    end
})

ToolTab:AddSlider({
    Name = "سرعة الهالة",
    Min = 1,
    Max = 20,
    Default = 4,
    Increase = 1,
    Callback = function(v)
        auraSpeed = v
    end
})

ToolTab:AddToggle({
    Name = "فعل الهالة عليك",
    Default = false,
    Callback = function(v)
        auraEnabled = v
    end
})

task.spawn(function()
    local angle = 0

    RunService.RenderStepped:Connect(function(dt)
        if not auraEnabled then return end
        if not LocalPlayer.Character then return end

        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local folder = workspace:FindFirstChild("WorkspaceCom")
        if not folder then return end

        local propsFolder = folder:FindFirstChild("001_TrafficCones")
        if not propsFolder then return end

        angle += dt * auraSpeed

        local propIndex = 0
        for _, prop in ipairs(propsFolder:GetChildren()) do
            if prop.Name:find("Prop" .. LocalPlayer.Name) then
                propIndex += 1
                local offsetAngle = angle + (propIndex - 1) * (math.pi * 2 / #propsFolder:GetChildren())
                local x = math.cos(offsetAngle) * auraDistance
                local z = math.sin(offsetAngle) * auraDistance

                local remote = prop:FindFirstChild("SetCurrentCFrame")
                if remote then
                    pcall(function()
                        remote:InvokeServer(hrp.CFrame * CFrame.new(x, 0, z))
                    end)
                end
            end
        end
    end)
end)
ToolTab:AddSection({ Name = "هالة ادوات على لاعب          ", Icon = "rbxassetid://10734950309" })
ToolTab:AddButton({
    Name = "اضغط لتاخذ الصندوق",
    Callback = function()
        local args = {
            [1] = "PickingTools",
            [2] = "PropMaker"
        }

        game:GetService("ReplicatedStorage")
            .RE
            :FindFirstChild("1Too1l")
            :InvokeServer(unpack(args))
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local auraDistance = 6
local auraSpeed = 6
local auraRandomness = 0
local auraEnabled = false
local selectedPlayer = nil
local valor_do_nome_do_joagdor = nil

local function getPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local DropdownPlayerTab2 = ToolTab:AddDropdown({
    Name = "اختيار اللاعب",
    Description = "",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
        valor_do_nome_do_joagdor = selectedPlayerName
        if not selectedPlayerName or selectedPlayerName == "" then
            selectedPlayer = nil
        else
            selectedPlayer = Players:FindFirstChild(selectedPlayerName)
        end
    end
})

local function UptadePlayers()
    DropdownPlayerTab2:Set(getPlayerNames())
end

ToolTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        UptadePlayers()
    end
})

UptadePlayers()

ToolTab:AddSlider({
    Name = "بعد الهالة",
    Min = 1,
    Max = 20,
    Default = 6,
    Increase = 0.5,
    Callback = function(v) auraDistance = v end
})

ToolTab:AddSlider({
    Name = "عشوائية الهالة",
    Min = 0,
    Max = 5,
    Default = 0,
    Increase = 0.1,
    Callback = function(v) auraRandomness = v end
})

ToolTab:AddSlider({
    Name = "سرعة الهالة",
    Min = 1,
    Max = 30,
    Default = 6,
    Increase = 1,
    Callback = function(v) auraSpeed = v end
})

ToolTab:AddToggle({
    Name = "تفعيل هالة الادوات على اللاعب",
    Default = false,
    Callback = function(v)
        auraEnabled = v
    end
})

task.spawn(function()
    local angle = 0

    RunService.RenderStepped:Connect(function(dt)
        if not auraEnabled then return end
        if not selectedPlayer or not selectedPlayer.Character then return end

        local hrp = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local folder = workspace:FindFirstChild("WorkspaceCom")
        if not folder then return end

        local propsFolder = folder:FindFirstChild("001_TrafficCones")
        if not propsFolder then return end

        angle += dt * auraSpeed

        local propIndex = 0
        for _, prop in ipairs(propsFolder:GetChildren()) do
            if prop.Name:find("Prop" .. LocalPlayer.Name) then
                propIndex += 1
                local offsetAngle = angle + (propIndex - 1) * (math.pi * 2 / #propsFolder:GetChildren())
                local randomOffsetX = (math.random() - 0.5) * 2 * auraRandomness
                local randomOffsetZ = (math.random() - 0.5) * 2 * auraRandomness
                local x = math.cos(offsetAngle) * auraDistance + randomOffsetX
                local z = math.sin(offsetAngle) * auraDistance + randomOffsetZ

                local remote = prop:FindFirstChild("SetCurrentCFrame")
                if remote then
                    pcall(function()
                        remote:InvokeServer(hrp.CFrame * CFrame.new(x, 0, z))
                    end)
                end
            end
        end
    end)
end)
ToolTab:AddSection({ Name = "ادوات          ", Icon = "rbxassetid://10734950309" })
ToolTab:AddButton({
    Title = "طائرة شراعية",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "Glider",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "مدفع",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "Cannon",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "كرة سلة ذهبية ",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "GoldenBasketball",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "كرة مائية",
    Locked = false,
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Mango1 = ReplicatedStorage.RE["1Too1l"]
        Mango1:InvokeServer("PickingTools", "Water Balloon")
    end
})
ToolTab:AddButton({
    Title = "دبدوب ازرق",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "BlueMonkey",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "كرستال ذهبي",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "Crystal",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "كريستال اخضر",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "UraniumRod",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
ToolTab:AddButton({
    Title = "منشار",
    Locked = false,
    Callback = function()
        local args = {
            [1] = "AcceptedToolToServer",
            [2] = "Chainsaw",
            [3] = game:GetService("Players").LocalPlayer
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
})
local Tab = Window:MakeTab({ "اغاني", "music" })

Tab:AddTextBox({
    Name = "مشغل اغاني للسكيت بورد",
    Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني",
    PlaceholderText = "ادخل الكود هنا",
    Callback = function(Value)
        local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(
        args1))

        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(
        args2))
    end
})

Tab:AddTextBox({
    Name = "مشغل اغاني للبيت",
    Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني",
    PlaceholderText = "ادخل الكود هنا",
    Callback = function(Value)
        local args = {
            [1] = "PickHouseMusicText",
            [2] = input -- Use the user's input here
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
    end
})

Tab:AddTextBox({
    Name = "مشغل اغاني مجاني بدون قيمباس",
    Description = "ملاحظه: الناس تسمع فقط اول الاغنيه انت تسمعها كامله",
    PlaceholderText = "ادخل الكود هنا",
    Callback = function(Value)
        local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(
        args1))

        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(
        args2))
    end
})

local Section = Tab:AddSection({
    Name = "ملاحظه: يجب ان يكون لديك قيمباس الاغاني لتشغيل الاغاني"
})

local Section = Tab:AddSection({
    Name = "الاغاني العربية"
})

Tab:AddButton({
    Name = "ياللالي و يالالا",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "116815742960163"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اول مره حياتي تورد",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "122957821960545"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ال ما يسئل علي ماريده لا الله وياه الله وياه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "100812988870930"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "حبي طفى بلحظه جثى",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "99349482246952"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ميلي و بخصرك ميلي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "74895850882339"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "هاذي انتي من عرفك ما تغير فيكي شي | عزف عود",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "133788458900692"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "عزف عود مع كلام ما اعرفه اسمه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "93398454695410"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "لين جاني مع الايام علم و بكيت",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "70943346587828"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "يخبل يجنن كلامه مني انا ما امل",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "99391269377766"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "رسميا من قلب و رب كاريزما و فد شي ينحب",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "89189069089618"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ست البنات مصري",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "128143898719881"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "دبكه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "108761189974962"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "قرو قاردن",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1836009208"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فورتنايت ببجي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8671258578"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنيه في عالم",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "125151253990122"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "حزين",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "135308045"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "الحمدلله",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7609175072"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "جاء الليل",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "132182002773837"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "السلام عليكم",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7038667176"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "صدام",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8273849195"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ويه ويه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1164198099"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "حبيبي شنو في",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7657178494"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "مصري حب",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "93620598835551"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "عراقي حزين",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "80039364766636"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "دبكه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "76698985299412"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ازعاج",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "4776398821"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ضراط",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "4809574295"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "عزف عود",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "114157294180725"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "عزف عود 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "104085669063530"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "يمني وين الوفاء",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "116150415085902"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "حزينه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "132378395114388"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سعودي حزين",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "99123490695024"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اه ياحلو",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "93620598835551"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "تعالي عند دادي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7984027399"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ابو علي حسن و حسين",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "98224127892587"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنيه سوريه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "98640789490482"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "خليجي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "127593500790634"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "رعب",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1848748988"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سبونج بوب",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "2396797933"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنيه عربيه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1836685799"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اوو",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "93123670572331"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ناني",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8842446965"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

local Section = Tab:AddSection({
    Name = "قران كريم"
})

Tab:AddButton({
    Name = "هذا خلق الله فاروني ماءا خلق الذي من دونه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "79912080084074"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سوره الفلق",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "86911769585232"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "لإيلاف قريش",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "133272041755020"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سوره الإخلاص",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "88269497623993"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "و السماء و الطارق",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "90593176828958"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "قران",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1836685929"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "و توبوا الى الله",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "4711690175"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اذان",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "1836685873"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

local Section = Tab:AddSection({
    Name = "سب"
})

Tab:AddButton({
    Name = "صوت اهات",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8107899910"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سب 1",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8701632845"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سب 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "671399328"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سب 3",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "6536444735"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سب 4",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "5849978429"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "سب 5",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا دقيقه للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7942547789"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

local Section = Tab:AddSection({
    Name = "اغاني اجنبيه"
})

Tab:AddButton({
    Name = "DeathBed",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "76463442516219"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "underMy Skin",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "76145067114930"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Tt - Twice",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "136694442832658"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Black Pink",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "113887644073284"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Rare UnLeak",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "79117388043755"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "I Carti",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "95660636199460"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Fuck Love",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "105663787518318"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "XhDCyeuej",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "127356583789936"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Rare Unleakkk 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "118767914595173"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Soulless",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "75806444139457"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Pk Ro paris",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "84543400636750"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Hypperdrop",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "78527071535561"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Drain Lieu",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "73154534382655"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Delicuentir",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "112808748111965"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Mistal Fiscorder",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "73743664006156"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Motagem Dimens",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "75038862482887"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "Sab boy",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "85857498059894"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "urue",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "117088145279665"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "LargR Friees",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "84882252466318"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

local Section = Tab:AddSection({
    Name = "اغاني فونك"
})

Tab:AddButton({
    Name = "بافو بافو",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "106317184644394"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك نادر",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "98677515506006"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "88505573152008"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "افخم فونك",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "17647322226"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك غضب",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "115859025716354"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك 5×30",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "73966367524216"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك عالمي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "76578817848504"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك تيك توك",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "93218265275853"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك ممتاز",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "102402883551679"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك روسي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "103066073385622"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك برازيلي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "75038862482887"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك هندي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "91301048841024"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك جهنمي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "96527800313172"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك اسطوري",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "115028690484951"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك التربية السيئة",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "91161894069716"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فينوم فونك",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "8086734311"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك نادر",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "4806290024"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك برازيلي 1",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "15689446096"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك برازيلي 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "111281710445018"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك دبكه",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "87968531262747"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك ايضا",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "17422156627"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك دبكه عربي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "87968531262747"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك ذس اس ثانكس",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "9058205566"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "برازيلي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "111281710445018"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك ناررر",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "73966367524216"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "14145626412"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك حزين",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "16662831858"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "فونك روسي",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "15689441943"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 1",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "15689443663"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "16190782181"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 3",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "15689448519"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 4",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7825702538"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك نادره 5",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "71517955953236"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 6",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "127084858692372"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 7",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "104541292443133"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 8",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "130607529536925"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 9",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "84733736048142"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 10",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "82680101995105"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 11",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "76603092488414"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 12",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "124958445624871"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 13",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "16662833837"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "اغنية فونك 14",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "90698302380427"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

local Section = Tab:AddSection({
    Name = "اصوات ميمز"
})

Tab:AddButton({
    Name = "ميمز 1",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "7341213035"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ميمز 2",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "6389463761"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})

Tab:AddButton({
    Name = "ميمز 3",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "تم التشغيل",
            Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل", -- ARAB TEAM
            Duration = 5,
        })

        local args = {
            [1] = "SkateBoard"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        local args = {
            [1] = "PickingScooterMusicText",
            [2] = "3007579524"
        }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
    end
})
local Tab = Window:MakeTab({ "لاق السيرفر", "bomb" })


-- Shutdown Custom Section
local Section = Tab:AddSection({
    Name = "لاق بالباص"
})

local runLag = false
local lagCoroutine

Tab:AddToggle({
    Name = "لاق باص",
    Default = false,
    Callback = function(Value)
        runLag = Value

        if runLag then
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local LocalPlayer = Players.LocalPlayer

            if not LocalPlayer then
                warn("LocalPlayer nÃ£o encontrado.")
                return
            end

            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
            if not humanoidRootPart then
                warn("HumanoidRootPart nÃ£o encontrado.")
                return
            end

            local function GetBus()
                local vehicles = workspace:FindFirstChild("Vehicles")
                if vehicles then
                    return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                end
                return nil
            end

            local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
            if not remoteEvent then
                warn("RemoteEvent 'RE' nÃ£o encontrado em ReplicatedStorage.")
                return
            end

            if not remoteEvent:FindFirstChild("1Ca1r") then
                warn("Evento filho '1Ca1r' nÃ£o encontrado dentro de 'RE'.")
                return
            end

            lagCoroutine = coroutine.wrap(function()
                while runLag do
                    local success, err = pcall(function()
                        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                        local bus = GetBus()
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end)

                    if not success then
                        warn("Erro ao executar lag loop: " .. tostring(err))
                        runLag = false
                        break
                    end

                    task.wait(0)
                end
            end)
            lagCoroutine()
        end
    end
})

-- Lag Laptop Section
local Section = Tab:AddSection({
    Name = "لاق لابتوب"
})

-- Toggle State for Lag Laptop
local toggles = { LagLaptop = false }

-- Function to Simulate Normal Click
local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

-- Function to Lag Game with Laptop
local function lagarJogoLaptop(laptopPath, maxTeleports)
    if laptopPath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagLaptop do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = laptopPath.CFrame
            clickNormally(laptopPath)
            teleportCount = teleportCount + 1
            wait(0.0001)
        end
    else
        warn("Laptop nÃ£o encontrado.")
    end
end

-- Lag Laptop Toggle
Tab:AddToggle({
    Name = "لاق لابتوب",
    Default = false,
    Callback = function(state)
        toggles.LagLaptop = state
        if state then
            local laptopPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild(
            "Laptop")
            if laptopPath then
                spawn(function()
                    lagarJogoLaptop(laptopPath, 999999999)
                end)
            else
                warn("Laptop nÃ£o encontrado.")
            end
        else
            print("Lag com Laptop desativado.")
        end
    end
})

-- Lag Laptop Paragraph
Tab:AddParagraph({
    "معلومة",
    "يبدا بعد 20 ثانية"
})

-- Lag Phone Section
local Section = Tab:AddSection({
    Name = "لاق بالهاتف"
})

-- Toggle State for Lag Phone
toggles.LagPhone = false

-- Function to Lag Game with Phone
local function lagarJogoPhone(phonePath, maxTeleports)
    if phonePath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagPhone do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = phonePath.CFrame
            clickNormally(phonePath)
            teleportCount = teleportCount + 1
            wait(0.01)
        end
    else
        warn("Telefone nÃ£o encontrado.")
    end
end

-- Lag Phone Toggle
Tab:AddToggle({
    Name = "لاق الهاتف",
    Default = false,
    Callback = function(state)
        toggles.LagPhone = state
        if state then
            local phonePath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_CommercialStores")
            :FindFirstChild("CommercialStorage1"):FindFirstChild("Store"):FindFirstChild("Tools"):FindFirstChild(
            "Iphone")
            if phonePath then
                spawn(function()
                    lagarJogoPhone(phonePath, 999999)
                end)
            else
                warn("Telefone nÃ£o encontrado.")
            end
        else
            print("Lag com Telefone desativado.")
        end
    end
})

-- Lag Phone Paragraph
Tab:AddParagraph({
    "لاق الهاتف يعطي تاثير ضعيف بعد مدة طويلة كنسلو"
})

local Section = Tab:AddSection({
    Name = "لاق القنابل انصحك بيه"
})


local BombActive = false

Tab:AddToggle({
    Name = "تفعيل لاق القنابل",
    Default = false,
    Callback = function(Value)
        if Value then
            BombActive = true

            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local RootPart = Character:WaitForChild("HumanoidRootPart")
            local WorkspaceService = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Bomb = WorkspaceService:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild(
            "GiveTools"):WaitForChild("Bomb")

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector) -- Aciona o ClickDetector da bomba
                        task.wait(0.00001)                    -- Delay mÃ­nimo para evitar travamentos
                    else
                        task.wait(0.0001)
                    end
                end
            end)

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)

                        -- Executa o FireServer com o nome do jogador
                        local args = {
                            [1] = "Bomb" .. Player.Name -- Usa o nome do jogador atual
                        }
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))
                    end
                    task.wait(1.5) -- Intervalo de 1 segundo para clique e FireServer
                end
            end)
        else
            -- Desativando a funcionalidade
            BombActive = false
        end
    end
})

Tab:AddParagraph({
    "معلومة",
    "يبدا بعد 35 ثانية"
})
local TabSund = Window:MakeTab({ Title = " اغاني مجانية", Icon = "rbxassetid://10734931596" })
TabSund:AddSection({ Name = "الاغاني متحتاح جيمباس والكل يسمعها          ", Icon = "rbxassetid://10734934132" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local musicList = {
    ["ضحكة مال سوكونا"] = "116395665143666",
    ["غوجو توسيع النطاق"] = "139787675170861",
    ["صوت فايت مزعج شوي"] = "132639404905710",
    ["صوت بنت انمي مشكوك فجد خالة عمتو"] = "109779146034241",
    ["صوت بنت انمي ثاني"] = "102993326623397",
    ["صوت اسد"] = "9126101636",
    ["صوت بنت انمي 3"] = "103430674469051",
    ["صوت انمي مزعج"] = "97551835622379",
    ["صوت سلاح فري فاير"] = "6909650402",
    ["جراني"] = "1591860354",
    ["توجي"] = "132509237694639",
    ["اوريتشيمارو "] = "135109036831389",
    ["ضحكة سونيك"] = "7337298420",
    ["ازعاج"] = "146563959",
    ["اغنية فينوم"] = "8086734311",
    ["صوت فينوم"] = "126497226413207",
    ["صوت رعد"] = "6994934244",
    ["جوجوتسو كايسن"] = "18985328962",
    ["صوت ازعاج 2"] = "94692079812822",
    ["صوت ازعاج 3"] = "89442290120460",
}

local musicOptions = {}
for name, _ in pairs(musicList) do
    table.insert(musicOptions, name)
end
table.sort(musicOptions)

local selectedMusic = ""
local soundSpeed = 1
local soundVolume = 1
local soundRange = 100
local spamToggle = false
local spamTask = nil

TabSund:AddDropdown({
    Name = "اختيار الصوت",
    Options = musicOptions,
    Default = musicOptions[1],
    Callback = function(selected)
        selectedMusic = musicList[selected]
    end
})

TabSund:AddSlider({
    Name = "سرعة الصوت",
    Min = 0.5,
    Max = 2,
    Default = 1,
    Increment = 0.05,
    Callback = function(v)
        soundSpeed = v
    end
})

TabSund:AddSlider({
    Name = "قوة الصوت",
    Min = 0,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(v)
        soundVolume = v
    end
})

TabSund:AddSlider({
    Name = "مدى الصوت",
    Min = 10,
    Max = 300,
    Default = 100,
    Increment = 5,
    Callback = function(v)
        soundRange = v
    end
})

local function playOnce()
    if selectedMusic == "" then
        if NotifyEnabled then
            redzlib:MakeNotify({ Title = "LOC4T HUB", Text = "اختار صوت اول شي", Time = 2 })
        end
        return
    end

    local audioID = selectedMusic
    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, audioID, 1)
    end

    task.wait(0.2)

    local GuinRemote = ReplicatedStorage.RE:FindFirstChild("1Gu1n")
    if not GuinRemote then return end

    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart

            task.spawn(function()
                local Sound = Instance.new("Sound")
                Sound.SoundId = "rbxassetid://" .. audioID
                Sound.Volume = soundVolume
                Sound.PlaybackSpeed = soundSpeed
                Sound.RollOffMaxDistance = soundRange
                Sound.Looped = false
                Sound.Parent = hrp
                Sound:Play()
                Sound.Ended:Connect(function()
                    Sound:Destroy()
                end)
            end)

            task.spawn(function()
                pcall(function()
                    firesignal(GuinRemote.OnClientEvent, table.unpack({
                        [1] = player,
                        [2] = hrp,
                        [3] = hrp,
                        [4] = Vector3.new(0, -1, 0),
                        [5] = Vector3.new(0, 0, 0),
                        [6] = hrp,
                        [7] = hrp,
                        [8] = audioID,
                        [9] = audioID,
                        [10] = { [1] = true },
                        [11] = { 25, Vector3.new(0.25, 0.25, soundRange), BrickColor.new("Bright yellow"), 0.25, Enum.Material.SmoothPlastic, 0.25 },
                        [12] = true,
                        [13] = false
                    }))
                end)
            end)

            task.spawn(function()
                pcall(function()
                    GuinRemote:FireServer(table.unpack({
                        [1] = hrp,
                        [2] = hrp,
                        [3] = Vector3.new(0, -1, 0),
                        [4] = Vector3.new(0, 0, 0),
                        [5] = hrp,
                        [6] = hrp,
                        [7] = audioID,
                        [8] = audioID,
                        [9] = { [1] = true },
                        [10] = { 25, Vector3.new(0.25, 0.25, soundRange), BrickColor.new("Bright yellow"), 0.25, Enum.Material.SmoothPlastic, 0.25 },
                        [11] = true,
                        [12] = false
                    }))
                end)
            end)
        end
    end

    if NotifyEnabled then
        redzlib:MakeNotify({ Title = "LOC4T HUB", Text = "تم تشغيل الصوت", Time = 2 })
    end
end
TabSund:AddButton({
    Name = "تشغيل مرة وحدة",
    Callback = function()
        playOnce()
    end
})
TabSund:AddToggle({
    Name = "سبام تشغيل",
    Default = false,
    Callback = function(v)
        spamToggle = v
        if v then
            spamTask = task.spawn(function()
                while spamToggle do
                    playOnce()
                    task.wait(1)
                end
            end)
        else
            spamToggle = false
            if spamTask then
                task.cancel(spamTask)
                spamTask = nil
            end
        end
    end
})
local FunTab = Window:MakeTab({ Title = "المتعة", Icon = "rbxassetid://10723407498" })
local Section = FunTab:AddSection({ "كتابة على لوحات السيرفر          " })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local SelectedPoster = 1
local PosterText = ""
local PosterData = {
    [1] = CFrame.new(359.589081, 57.149670, 581.226135),
    [2] = CFrame.new(-634.203247, 25.374739, 361.505646),
    [3] = CFrame.new(-238.497910, 88.514732, -549.373962)
}
local Dropdown = FunTab:AddDropdown({
    Name = "اختيار رقم اللوحة",
    Description = "",
    Options = { "لوحة 1", "لوحة 2", "لوحة 3" },
    Default = "لوحة 1",
    Flag = "poster_dropdown",
    Callback = function(Value)
        if Value == "لوحة 1" then
            SelectedPoster = 1
        elseif Value == "لوحة 2" then
            SelectedPoster = 2
        elseif Value == "لوحة 3" then
            SelectedPoster = 3
        end
    end
})
FunTab:AddTextBox({
    Name = "اكتب هنا شتريد",
    Description = "",
    PlaceholderText = "LOC4T",
    Callback = function(Value)
        PosterText = Value
    end
})
FunTab:AddButton({
    Name = "تطبيق الكتابة",
    Callback = function()
        if not PosterText or PosterText == "" then
            warn("LOC4T")
            return
        end
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local humanoidRootPart = char.HumanoidRootPart
        local originalPos = humanoidRootPart.CFrame
        humanoidRootPart.CFrame = PosterData[SelectedPoster]
        task.wait(0.8)
        local args = {
            [1] = "ReturningCommercialWords",
            [2] = SelectedPoster,
            [4] = PosterText
        }
        ReplicatedStorage.RE:FindFirstChild("1Cemeter1y"):FireServer(unpack(args))
        task.wait(0.5)
        humanoidRootPart.CFrame = originalPos
    end
})
FunTab:AddSection({ "هالة كرة تجريبي          " })
OrbitSettings = {
    Speed = 2,
    Distance = 6,
    Height = 0,
    Fling = false
}
FunTab:AddSlider({
    Name = "سرعة دوران الكرة",
    Min = 1,
    Max = 20,
    Default = 2,
    Callback = function(Value)
        OrbitSettings.Speed = Value
    end
})
FunTab:AddSlider({
    Name = "بعد الكرة",
    Min = 1,
    Max = 20,
    Default = 6,
    Callback = function(Value)
        OrbitSettings.Distance = Value
    end
})
FunTab:AddSlider({
    Name = "ارتفاع الكرة",
    Min = -10,
    Max = 10,
    Default = 0,
    Callback = function(Value)
        OrbitSettings.Height = Value
    end
})
FunTab:AddToggle({
    Name = "فعل ميزة الفلنق من يقربو عليك",
    Default = false,
    Callback = function(state)
        OrbitSettings.Fling = state
    end
})
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local localPlayer = Players.LocalPlayer
local orbitLoop
local orbitBallInstance
local orbitEnabledTouch = false
local function DestroyOrbit()
    if orbitLoop then
        orbitLoop:Disconnect()
        orbitLoop = nil
    end
    if orbitBallInstance then
        orbitBallInstance:Destroy()
        orbitBallInstance = nil
    end
end
function orbitBall(targetChar, modeName)
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player:WaitForChild("Backpack")
    local serverBalls = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_SoccerBalls")
    if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
    end
    repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")
    local ballTool = backpack:FindFirstChild("SoccerBall")
    if ballTool then ballTool.Parent = character end
    repeat task.wait() until serverBalls:FindFirstChild("Soccer" .. player.Name)
    local orb = serverBalls:FindFirstChild("Soccer" .. player.Name)
    if not orb then return end
    orb.Name = modeName
    orb.CanCollide = false
    orb.Massless = true
    orb.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)
    if orb:FindFirstChild("FlingPower") then orb.FlingPower:Destroy() end
    if OrbitSettings.Fling then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlingPower"
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.P = 9e900
        bv.Parent = orb
    end
    local loop = Instance.new("BindableEvent")
    loop.Name = modeName .. "Loop"
    loop.Parent = character
    task.spawn(function()
        while loop.Parent and orb and orb.Parent and targetChar and targetChar.Parent do
            local angle = tick() * OrbitSettings.Speed
            local offset = CFrame.new(
                math.cos(angle) * OrbitSettings.Distance,
                OrbitSettings.Height,
                math.sin(angle) * OrbitSettings.Distance
            )
            orb.CFrame = targetChar.HumanoidRootPart.CFrame * offset
            task.wait(1 / 60)
        end
    end)
end

local function StartOrbitTouch(targetCharacter)
    if not orbitEnabledTouch then return end
    DestroyOrbit()
    if not targetCharacter or not targetCharacter:FindFirstChild("HumanoidRootPart") then return end
    local ballTemplate = Workspace.WorkspaceCom["001_SoccerBalls"]:FindFirstChild("OrbitTarget")
    if not ballTemplate then return end
    orbitBallInstance = ballTemplate:Clone()
    orbitBallInstance.Name = "OrbitTargetLoop"
    orbitBallInstance.Parent = Workspace
    local angle = 0
    local radius = OrbitSettings.Distance
    local speed = OrbitSettings.Speed
    local height = OrbitSettings.Height
    orbitLoop = game:GetService("RunService").Heartbeat:Connect(function(dt)
        angle = angle + speed * dt
        local root = targetCharacter:FindFirstChild("HumanoidRootPart")
        if root then
            orbitBallInstance.Position = root.Position +
            Vector3.new(math.cos(angle) * radius, height, math.sin(angle) * radius)
        end
    end)
end
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if orbitEnabledTouch and input.UserInputType == Enum.UserInputType.Touch then
        local touchPos = input.Position
        local camera = Workspace.CurrentCamera
        local ray = camera:ScreenPointToRay(touchPos.X, touchPos.Y)
        local hitPart, hitPos = Workspace:FindPartOnRayWithIgnoreList(ray, { localPlayer.Character })
        if hitPart and hitPart.Parent then
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if hitPart:IsDescendantOf(player.Character) then
                        StartOrbitTouch(player.Character)
                        break
                    end
                end
            end
        end
    end
end)
FunTab:AddToggle({
    Name = "تفعيل هالة الكرة دون فلنق",
    Default = false,
    Callback = function(state)
        local char = localPlayer.Character
        local loop = char and char:FindFirstChild("OrbitBallLoop")
        if state then
            orbitBall(char, "OrbitBall")
        elseif loop then
            loop:Destroy()
            local orb = workspace.WorkspaceCom["001_SoccerBalls"]:FindFirstChild("OrbitBall")
            if orb then orb:Destroy() end
        end
    end
})
FunTab:AddToggle({
    Name = "المس اي لاعب لتفعيل هالة الكرة عليه",
    Default = false,
    Callback = function(state)
        orbitEnabledTouch = state
        if not state then
            DestroyOrbit()
        end
    end
})
FunTab:AddSection({ Name = "كشف اللاعبين          ", Icon = "rbxassetid://10723346959" })
local ToggleESP = false
local ESPFolder = Instance.new("Folder", workspace)
ESPFolder.Name = "BloodESP"

local function GetAccountAgeString(player)
    local days = player.AccountAge
    if days >= 365 then
        return math.floor(days / 365) .. " سنة"
    else
        return days .. " يوم"
    end
end

local function CreateBillboard(player)
    if not player.Character or not player.Character:FindFirstChild("Head") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPTag"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Adornee = player.Character.Head
    billboard.Parent = ESPFolder

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.33, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    nameLabel.TextStrokeColor3 = Color3.fromRGB(139, 0, 0)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Parent = billboard

    local ageLabel = Instance.new("TextLabel")
    ageLabel.Size = UDim2.new(1, 0, 0.33, 0)
    ageLabel.Position = UDim2.new(0, 0, 0.33, 0)
    ageLabel.BackgroundTransparency = 1
    ageLabel.Text = "عمر: " .. GetAccountAgeString(player)
    ageLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    ageLabel.TextStrokeColor3 = Color3.fromRGB(139, 0, 0)
    ageLabel.TextStrokeTransparency = 0
    ageLabel.Font = Enum.Font.Gotham
    ageLabel.TextScaled = true
    ageLabel.Parent = billboard

    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.33, 0)
    distLabel.Position = UDim2.new(0, 0, 0.66, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    distLabel.TextStrokeColor3 = Color3.fromRGB(139, 0, 0)
    distLabel.TextStrokeTransparency = 0
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextScaled = true
    distLabel.Parent = billboard

    task.spawn(function()
        while billboard.Parent and ToggleESP and player.Character and player.Character:FindFirstChild("Head") do
            local distance = (game.Players.LocalPlayer.Character.Head.Position - player.Character.Head.Position)
            .Magnitude
            distLabel.Text = "البعد: " .. math.floor(distance) .. "m"

            local glow = 0.5 + 0.5 * math.sin(tick() * 5)
            nameLabel.TextTransparency = glow * 0.5
            ageLabel.TextTransparency = glow * 0.5
            distLabel.TextTransparency = glow * 0.5

            nameLabel.TextStrokeTransparency = glow * 0.2

            task.wait(0.05)
        end
        billboard:Destroy()
    end)
end

local function EnableESP()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            CreateBillboard(player)
        end
    end

    game.Players.PlayerAdded:Connect(function(player)
        task.wait(2)
        if ToggleESP then
            CreateBillboard(player)
        end
    end)
end

local function DisableESP()
    for _, tag in ipairs(ESPFolder:GetChildren()) do
        tag:Destroy()
    end
end

FunTab:AddToggle({
    Name = "كشف اللاعبين",
    Default = false,
    Callback = function(state)
        ToggleESP = state
        if state then
            EnableESP()
        else
            DisableESP()
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ToggleHitbox = false

local HitboxFolder = Instance.new("Folder", workspace)
HitboxFolder.Name = "BloodHitboxESP"

local function CreateHitbox(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    local box = Instance.new("SelectionBox")
    box.Name = "HitboxESP"
    box.Adornee = character
    box.LineThickness = 0.15
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.SurfaceColor3 = Color3.fromRGB(255, 0, 0)
    box.SurfaceTransparency = 0.7
    box.Parent = HitboxFolder

    task.spawn(function()
        while box.Parent and ToggleHitbox and character.Parent do
            local pulse = 0.4 + 0.4 * math.sin(tick() * 8)
            box.SurfaceTransparency = pulse
            box.LineTransparency = pulse * 0.5
            task.wait(0.03)
        end
        box:Destroy()
    end)
end

local function EnableHitbox()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            CreateHitbox(player.Character)
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(char)
            task.wait(1)
            if ToggleHitbox then
                CreateHitbox(char)
            end
        end)
    end)
end

local function DisableHitbox()
    for _, v in ipairs(HitboxFolder:GetChildren()) do
        v:Destroy()
    end
end

FunTab:AddToggle({
    Name = "V2 كشف ",
    Default = false,
    Callback = function(state)
        ToggleHitbox = state
        if state then
            EnableHitbox()
        else
            DisableHitbox()
        end
    end
})

FunTab:AddSection({ Name = "سبام قوارب في البداية          ", Icon = "rbxassetid://10734941354" })
FunTab:AddToggle({
    Name = "سبام قوارب في البداية",
    Default = false,
    Callback = function(state)
        getgenv().Toggle = state

        if state then
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local RootPart = Character:WaitForChild("HumanoidRootPart")
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local molestado1 = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_CanoeCloneButton").Button

            task.spawn(function()
                while getgenv().Toggle do
                    task.wait()
                    RootPart.CFrame = molestado1.CFrame
                    task.wait(0.1)
                    fireclickdetector(molestado1:FindFirstChild("ClickDetector"))
                    task.wait(0.5)

                    local molestado2 = workspace.WorkspaceCom["001_CanoeStorage"]:FindFirstChild("Canoe")
                    if molestado2 and molestado2:FindFirstChild("VehicleSeat") then
                        repeat
                            RootPart.CFrame = molestado2.VehicleSeat.CFrame + Vector3.new(0, math.random(-1, 1), 0)
                            task.wait()
                        until Humanoid.Sit

                        task.wait(0.2)
                        RootPart.CFrame = CFrame.new(math.random(-40, 40), 4.549, math.random(-40, 40))
                        task.wait(0.2)
                        Humanoid.Sit = false
                        molestado2.Name = "CanoeMolestaHavens"
                    end
                end
            end)
        end
    end
})
FunTab:AddSection({ Name = "سبام قنابل          ", Icon = "rbxassetid://10709781460" })
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WorkspaceService = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")

local BombFolder = nil
pcall(function()
    BombFolder = WorkspaceService.WorkspaceCom["001_CriminalWeapons"].GiveTools
end)
local ExplodeRemote = nil
pcall(function()
    ExplodeRemote = ReplicatedStorage.RE["1Blo1wBomb1sServe1r"]
end)

local BombAmount = 5

FunTab:AddDropdown({
    Name = "عدد القنابل",
    Default = "5",
    Options = { "5", "10", "15", "20", "25", "30", "35", "40", "45", "50" },
    Callback = function(value)
        BombAmount = tonumber(value) or 5
    end
})

FunTab:AddButton({
    Name = "بدا سبام",
    Callback = function()
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local origin = RootPart.CFrame

        local function getBombCount()
            local cnt = 0
            if Player:FindFirstChild("Backpack") then
                for _, t in ipairs(Player.Backpack:GetChildren()) do
                    if t:IsA("Tool") and t.Name:lower():find("bomb") then
                        cnt = cnt + 1
                    end
                end
            end
            if Player.Character then
                for _, t in ipairs(Player.Character:GetChildren()) do
                    if t:IsA("Tool") and t.Name:lower():find("bomb") then
                        cnt = cnt + 1
                    end
                end
            end
            return cnt
        end

        local function collectBombs(target)
            local collected = 0
            local BombRef = BombFolder and BombFolder:FindFirstChild("Bomb")
            local attempts = 0
            while collected < target and attempts < 400 do
                attempts = attempts + 1
                if not BombRef then
                    for _, d in ipairs(workspace:GetDescendants()) do
                        if d:IsA("BasePart") and d.Name:lower():find("bomb") then
                            BombRef = d
                            break
                        end
                    end
                end

                if BombRef and RootPart then
                    pcall(function()
                        RootPart.CFrame = BombRef.CFrame + Vector3.new(0, 2, 0)
                        if BombRef:FindFirstChild("ClickDetector") then
                            fireclickdetector(BombRef.ClickDetector)
                        end
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(0.01)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)
                    end)
                end

                task.wait(0.08)
                collected = getBombCount()
            end
            return collected
        end

        local function throwBombs()
            local thrown = 0
            local tools = {}
            if Player:FindFirstChild("Backpack") then
                for _, t in ipairs(Player.Backpack:GetChildren()) do
                    if t:IsA("Tool") and t.Name:lower():find("bomb") then
                        table.insert(tools, t)
                    end
                end
            end
            if Player.Character then
                for _, t in ipairs(Player.Character:GetChildren()) do
                    if t:IsA("Tool") and t.Name:lower():find("bomb") then
                        table.insert(tools, t)
                    end
                end
            end

            for _, tool in ipairs(tools) do
                pcall(function()
                    if tool.Parent ~= Player.Character then
                        Humanoid:EquipTool(tool)
                        task.wait(0.06)
                    end
                    if type(tool.Activate) == "function" then
                        tool:Activate()
                    end
                    for i = 1, 2 do
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(0.01)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)
                    end
                    task.wait(0.12)
                    thrown = thrown + 1
                end)
            end
            return thrown
        end

        task.spawn(function()
            local collected = collectBombs(BombAmount)

            pcall(function() RootPart.CFrame = origin end)
            task.wait(0.12)

            local thrown = throwBombs()

            if ExplodeRemote then
                local safetyLimit = math.max(40, (collected + 10))
                local spamCount = 0
                while getBombCount() > 0 and spamCount < safetyLimit do
                    pcall(function()
                        ExplodeRemote:FireServer("Bomb" .. Player.Name)
                    end)
                    spamCount = spamCount + 1
                    task.wait(0.09)
                end

                pcall(function()
                    ExplodeRemote:FireServer("Bomb" .. Player.Name)
                end)
            end
        end)
    end
})
FunTab:AddButton({
    Name = "حذف كل القنابل",
    Callback = function()
        local args = {
            [1] = "ClearAllTools"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end
})
local SkyboxTab = Window:MakeTab({ Title = "SKYBOX", Icon = "rbxassetid://10709805838" })

local skyboxEnabled = false
local skyboxTrack = nil
local rigidTrack = nil
local savedNukeBody = {}

local function stopAllAnimations()
    if rigidTrack then
        pcall(function()
            rigidTrack:Stop()
            rigidTrack:Destroy()
        end)
        rigidTrack = nil
    end

    if skyboxTrack then
        pcall(function()
            skyboxTrack:Stop()
            skyboxTrack:Destroy()
        end)
        skyboxTrack = nil
    end

    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local animator = humanoid:FindFirstChild("Animator")
            if animator then
                for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                    if track.Animation then
                        local animId = track.Animation.AnimationId
                        if animId == "rbxassetid://70883871260184" or animId == "rbxassetid://3695333486" then
                            pcall(function()
                                track:Stop()
                            end)
                        end
                    end
                end
            end
        end
    end
end
SkyboxTab:AddToggle({
    Name = "V1",
    Default = false,
    Callback = function(value)
        skyboxEnabled = value

        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character

            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()

                    savedNukeBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }

                    task.wait(0.2)

                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }

                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)

                    task.wait(0.3)

                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"

                    skyboxTrack = humanoid:LoadAnimation(newAnim)
                    skyboxTrack.Priority = Enum.AnimationPriority.Action4
                    skyboxTrack:Play(0.1, 1, 0.01)

                    task.wait(0.5)

                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    rigidTrack = humanoid:LoadAnimation(plankAnim)
                    rigidTrack.Priority = Enum.AnimationPriority.Movement
                    rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopAllAnimations()

            task.wait(0.2)

            if next(savedNukeBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character

                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeBody.Torso,
                            [2] = savedNukeBody.RightArm,
                            [3] = savedNukeBody.LeftArm,
                            [4] = savedNukeBody.RightLeg,
                            [5] = savedNukeBody.LeftLeg,
                            [6] = savedNukeBody.Head
                        }

                        local args = {
                            [1] = restoreBody
                        }

                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)

                        savedNukeBody = {}
                    end
                end
            end
        end
    end
})
local nukeFlashEnabled = false
local nukeFlashTrack = nil
local flashRigidTrack = nil
local savedNukeFlashBody = {}

local function stopFlashAnimations()
    if flashRigidTrack then
        pcall(function()
            flashRigidTrack:Stop()
            flashRigidTrack:Destroy()
        end)
        flashRigidTrack = nil
    end

    if nukeFlashTrack then
        pcall(function()
            nukeFlashTrack:Stop()
            nukeFlashTrack:Destroy()
        end)
        nukeFlashTrack = nil
    end
end

SkyboxTab:AddToggle({
    Name = "V2",
    Default = false,
    Callback = function(value)
        nukeFlashEnabled = value

        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character

            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()

                    savedNukeFlashBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }

                    task.wait(0.2)

                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }

                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)

                    task.wait(0.3)

                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"

                    nukeFlashTrack = humanoid:LoadAnimation(newAnim)
                    nukeFlashTrack.Priority = Enum.AnimationPriority.Action4
                    nukeFlashTrack:Play(0.1, 1, 1)

                    task.wait(0.1)
                    nukeFlashTrack:AdjustSpeed(5)

                    task.wait(0.3)

                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    flashRigidTrack = humanoid:LoadAnimation(plankAnim)
                    flashRigidTrack.Priority = Enum.AnimationPriority.Movement
                    flashRigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopFlashAnimations()

            task.wait(0.2)

            if next(savedNukeFlashBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character

                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeFlashBody.Torso,
                            [2] = savedNukeFlashBody.RightArm,
                            [3] = savedNukeFlashBody.LeftArm,
                            [4] = savedNukeFlashBody.RightLeg,
                            [5] = savedNukeFlashBody.LeftLeg,
                            [6] = savedNukeFlashBody.Head
                        }

                        local args = {
                            [1] = restoreBody
                        }

                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)

                        savedNukeFlashBody = {}
                    end
                end
            end
        end
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ChangeCharacterBody = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody")
local ResetAppearance = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance")

local LoopAnim = false
local CurrentTrack
local Initialized = false

local function ApplyFreshBang()
    pcall(function()
        local args = {
            [1] = {
                96655874457685,
                123402086843885,
                78300682916056,
                86276701020724,
                78409653958165,
                120668655481073
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function PlayAnimation()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://70883871260184"

    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Action
    track.Looped = false
    track:Play()

    CurrentTrack = track
end

local function StopEverything()
    LoopAnim = false

    if CurrentTrack then
        pcall(function()
            CurrentTrack:Stop()
        end)
        CurrentTrack = nil
    end

    pcall(function()
        ResetAppearance:FireServer()
    end)

    task.wait(0.5)

    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Health = 0
        end
    end
end

SkyboxTab:AddToggle({
    Name = "V4",
    Default = false,
    Callback = function(Value)
        if not Initialized then
            Initialized = true
            return
        end

        if Value then
            if LoopAnim then return end
            LoopAnim = true

            task.spawn(function()
                while LoopAnim do
                    PlayAnimation()
                    task.wait(0.1)
                end
            end)

            task.delay(1.2, ApplyFreshBang)
        else
            StopEverything()
        end
    end
})
