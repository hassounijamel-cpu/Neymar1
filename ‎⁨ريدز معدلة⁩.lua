# REDz Library V2
depois faço outra library Melhor
## Library
loadstring(game:HttpGet(("https://raw.githubusercontent.com/sajjadd2009igh-ship-it/Remix-Hub/refs/heads/main/Remixgui.lua")))()
## Cria a janela Inicial
MakeWindow({
  Hub = {
    Title = "REDz HUB",
    Animation = "by : redz9999"
  },
  Key = {
    KeySystem = false,
    Title = "Key System",
    Description = "",
    KeyLink = "",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

--[[
  Hub = {
    Title = "REDz HUB" -- <string> Titulo do seu script
    Animation = "by : redz9999" -- <string> Adiciona um texto na animacão do seu HUB
  },
  Key = {
    KeySystem = <bollean> Adiciona um sistema de chaves
    Title = "Key System" <string> Adiciona um titulo ao seu sistema de chaves
    Description = "" <string> Adiciona uma descrição ao seu sistema de chaves
    KeyLink = "" <string> Adicina o Link onde pega a chave do HUB
    Keys = {"1234"} <table> Adiciona as Chaves
    Notifi = {
      Notifications = true <boolean> Adicina notificações ao sistema de chaves
      CorrectKey = "Running the Script..." <string> notificação quando a chave estiver correta
      Incorrectkey = "The key is incorrect" <string> notificação quando a chave estiver incorreta
      CopyKeyLink = "Copied to Clipboard" <string> notificação quando o link da chave fir copiado
    }
  }
]]
## Botão de minimizar
Adiciona um botão para você minimizar o seu HUB
MinimizeButton({
  Image = "",
  Size = {40, 40},
  Color = Color3.fromRGB(10, 10, 10),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 0, 0)
})

--[[
  Image = "" <string> imagem do botão
  Size = {40, 40} <table> tamanho do botão
  Color = Color3.fromRGB(10, 10, 10) <Color3>  Cor do fundo do botäo
  Corner = true -- <boolean> Adicina um UICorner
  Stroke = false <boolean> Adiciona um UIStroke
  StrokeColor = Color3.fromRGB(255, 0, 0) <Color3> Cor do UIStroke
]]
## Tab
Cria uma guia
local Main = MakeTab({Name = "Main"})

--[[
  Name = "Main" <string> Nome da guia
]]
## Notificação
Cria uma notificacão
MakeNotifi({
  Title = "REDz HUB",
  Text = "Notificação teste",
  Time = 5
})

--[[
  Title = "REDz HUB" <string> titulo da notificação
  Text = "Notificação teste" <string> descrição da notificação
  Time = 5 <number> tempo da notificação
]]

## Sesão
cria uma sesão
local section = AddSection(Main, {"Teste"})
--[[
  {"Teste"} <table> nome da janela
]]
## Atualizar sesão
Atualiza um texto de uma sesão
SetSection(section, "HI")
## Botão
cria um botão
AddButton(Main, {
  Name = "Botão teste",
  Callback = function()
    
  end
})

--[[
  Name = "Botão teste" <string> nome do seu botão
  Callback = function()
    -- funcão do seu botão
  end
]]
## caixa de seleção
cria uma caixa de seleção onde você pode alternar entre (true/false)
local Toggle = AddToggle(Main, {
  Name = "Toggle teste",
  Default = false,
  Callback = function(Value)
    
  end
})

--[[
  Name = "Toggle teste" <string> nome da sua caixa de seleção
  Default = false <boolean> valor padrão
  Callback = function(Value)
    -- função da sua caixa de seleção
  end
]]
## Atualizar caixa de seleção
Atualiza o valor atual de uma caixa de seleção
UpdateToggle(Toggle, true)
## controle deslizante
cria um controle deslizante
local Slider = AddSlider(Main, {
  Name = "Slider teste",
  MinValue = 10,
  MaxValue = 100,
  Default = 25,
  Increase = 1,
  Callback = function(Value)
    
  end
})

--[[
  Name = "Slider teste" <string> nome do controle deslizante
  MinValue = 10 <number> valor minimo
  MaxValue = 100 <number> valor maximo
  Default = 25 <number> valor padrão
  Increase = 1 <number> valor que almenta de acordo com a posição do 
  Callback = function(Value)
    função do controle deslizante
  end
]]