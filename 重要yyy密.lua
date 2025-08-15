local LBLG = Instance.new("ScreenGui")
local LBL = Instance.new("TextLabel")
local player = game.Players.LocalPlayer 

local keyAuthEnabled = true -- 是否启用卡密验证
local validKeys = {
    "YSCRIPT-1234-ABCD",
    "YSCRIPT-5678-EFGH",
    "YSCRIPT-9012-IJKL",
    "YSCRIPT-3456-MNOP",
    "YSCRIPT-3496-UDBJ",
    "YSCRIPT-8888-YYYP",
    "YSCRIPT-3348-YSJB",
    "YSCRIPT-7891-WACJ",
    "YSCRIPT-1391-DJNP",
    "YSCRIPT-9191-CJBB",
    "YSCRIPT-6756-Udnj",
    "YSCRIPT-3676-Hdjc",
    "YSCRIPT-3456-cnHs",
    "YSCRIPT-3946-JSID",
    "YSCRIPT-3466-LHKN",
    "YSCRIPT-3649-JCND"
}

-- 创建卡密验证界面
local keyAuthGui = Instance.new("ScreenGui")
keyAuthGui.Name = "KeyAuthGui"
keyAuthGui.Parent = game.CoreGui
keyAuthGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keyAuthGui.Enabled = true

local authFrame = Instance.new("Frame")
authFrame.Name = "AuthFrame"
authFrame.Parent = keyAuthGui
authFrame.Size = UDim2.new(0, 400, 0, 280)
authFrame.Position = UDim2.new(0.5, -200, 0.5, -140)
authFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
authFrame.BorderSizePixel = 0
authFrame.Visible = true

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = authFrame
title.Text = "Y脚本 - 卡密验证"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 24

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.Parent = authFrame
logo.Size = UDim2.new(0, 80, 0, 80)
logo.Position = UDim2.new(0.5, -40, 0, 60)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://11381245678" -- 替换为您的logo ID

local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "InfoLabel"
infoLabel.Parent = authFrame
infoLabel.Text = "请输入卡密，使用Y脚本"
infoLabel.Size = UDim2.new(1, -20, 0, 30)
infoLabel.Position = UDim2.new(0, 10, 0, 150)
infoLabel.BackgroundTransparency = 1
infoLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 16
infoLabel.TextWrapped = true

local keyBox = Instance.new("TextBox")
keyBox.Name = "输入卡密"
keyBox.Parent = authFrame
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 190)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
keyBox.TextColor3 = Color3.new(1, 1, 1)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 18
keyBox.PlaceholderText = "在此输入卡密..."
keyBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
keyBox.ClearTextOnFocus = false

local submitButton = Instance.new("TextButton")
submitButton.Name = "SubmitButton"
submitButton.Parent = authFrame
submitButton.Size = UDim2.new(1, -20, 0, 40)
submitButton.Position = UDim2.new(0, 10, 0, 240)
submitButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
submitButton.Text = "验证并启动脚本"
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 18

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Parent = authFrame
statusLabel.Text = "状态：等待输入"
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 0, 290)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 验证卡密函数
local function validateKey(inputKey)
    for _, validKey in ipairs(validKeys) do
        if inputKey == validKey then
            return true
        end
    end
    return false
end

local keyVerified = false

submitButton.MouseButton1Click:Connect(function()
    local inputKey = keyBox.Text:gsub("%s+", "") -- 去除空格
    if validateKey(inputKey) then
        statusLabel.Text = "状态：验证成功！正在加载脚本..."
        statusLabel.TextColor3 = Color3.fromRGB(50, 200, 50)
        
        -- 禁用UI元素
        keyBox.Visible = false
        submitButton.Visible = false
        
        -- 延迟后隐藏验证窗口
        wait(1.5)
        keyAuthGui:Destroy()
        keyVerified = true
        
        -- 加载主脚本
        loadMainScript()
    else
        statusLabel.Text = "状态：卡密无效，请重试"
        statusLabel.TextColor3 = Color3.fromRGB(220, 50, 50)
        
        -- 抖动动画
        local originalPos = keyBox.Position
        for i = 1, 3 do
            keyBox.Position = originalPos + UDim2.new(0, 5, 0, 0)
            wait(0.05)
            keyBox.Position = originalPos + UDim2.new(0, -5, 0, 0)
            wait(0.05)
            keyBox.Position = originalPos
            wait(0.05)
        end
        
        -- 清空输入框
        keyBox.Text = ""
    end
end)

-- 如果不需要验证，直接加载脚本
if not keyAuthEnabled then
    keyAuthGui:Destroy()
    loadMainScript()
end

function loadMainScript()
    -- 以下是您原有的脚本内容 --
    local LBLG = Instance.new("ScreenGui")
    local LBL = Instance.new("TextLabel")
    local player = game.Players.LocalPlayer

    LBLG.Name = "LBLG"
    LBLG.Parent = game.CoreGui
    LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LBLG.Enabled = true
    LBL.Name = "LBL"
    LBL.Parent = LBLG
    LBL.BackgroundColor3 = Color3.new(1, 1, 1)
    LBL.BackgroundTransparency = 1
    LBL.BorderColor3 = Color3.new(0, 0, 0)
    LBL.Position = UDim2.new(0.75,0,0.010,0)
    LBL.Size = UDim2.new(0, 133, 0, 30)
    LBL.Font = Enum.Font.GothamSemibold
    LBL.Text = "TextLabel"
    LBL.TextColor3 = Color3.new(1, 1, 1)
    LBL.TextScaled = true
    LBL.TextSize = 14
    LBL.TextWrapped = true
    LBL.Visible = true

    local FpsLabel = LBL
    local Heartbeat = game:GetService("RunService").Heartbeat
    local LastIteration, Start
    local FrameUpdateTable = {}

    local function HeartbeatUpdate()
        LastIteration = tick()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
        end
        FrameUpdateTable[1] = LastIteration
        local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
        CurrentFPS = CurrentFPS - CurrentFPS % 1
        FpsLabel.Text = ("时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
    end

    Start = tick()
    Heartbeat:Connect(HeartbeatUpdate)

    local FpsGui = Instance.new("ScreenGui")
    local FpsXS = Instance.new("TextLabel")
    FpsGui.Name = "FPSGui"
    FpsGui.ResetOnSpawn = false
    FpsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    FpsXS.Name = "FpsXS"
    FpsXS.Size = UDim2.new(0, 100, 0, 50)
    FpsXS.Position = UDim2.new(0, 10, 0, 10)
    FpsXS.BackgroundTransparency = 1
    FpsXS.Font = Enum.Font.SourceSansBold
    FpsXS.Text = "帧率: 0"
    FpsXS.TextSize = 20
    FpsXS.TextColor3 = Color3.new(1, 1, 1)
    FpsXS.Parent = FpsGui

    local function updateFpsXS()
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        FpsXS.Text = "帧率: " .. fps
    end

    game:GetService("RunService").RenderStepped:Connect(updateFpsXS)
    FpsGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Lengui = loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/iuop/refs/heads/main/Protected_7843953596944453.lua"))()
    local win = Lengui:new("Y脚本")

    local UITab1 = win:Tab("『信息』",'16060333448')
    local about = UITab1:section("『LENG Script』",false)
    about:Label("Y脚本")
    about:Label("QQ主群：1055935003")
    about:Label("作者：小yo")
    about:Label("有bug进群反馈")
    about:Label("对该脚本有帮助的")

    local UITab1 = win:Tab("『加入服务器』",'16060333448')
    local about = UITab1:section("『加入服务器』",false)

    about:Button("加入极速传奇",function()
        local game_id = 3101667897
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入鲨口生求2",function()
        local game_id = 8908228901
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入监狱人生",function()
        local game_id = 155615604
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入忍者传奇",function()
        local game_id = 3956818381
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入Break in (故事)",function()
        local game_id = 1318971886
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入自然灾害生存游戏",function()
        local game_id = 189707
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入力量传奇",function()
        local game_id = 3623096087
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    about:Button("加入餐厅大亨2",function()
        local game_id = 3398014311
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
    end)

    local UITab1 = win:Tab("『通用』",'16060333448')
    local about = UITab1:section("『通用』",false)

    about:Button("自瞄（死亡消失)",function()
        loadstring(game:HttpGet("https://pastefy.app/ZYMlyhhz/raw",false))()
    end)

    about:Button("宙斯自瞄",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
    end)

    about:Button("英文自瞄",function()
        loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
    end)

    about:Button("自瞄50",function()
        loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",false))()
    end)

    about:Button("自瞄100",function()
        loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",false))()
    end)

    about:Button("自瞄150",function()
        loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",false))()
    end)

    about:Button("自瞄200",function()
        loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",false))()
    end)

    about:Button("自瞄250",function()
        loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",false))()
    end)

    about:Button("自瞄300",function()
        loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",false))()
    end)

    about:Button("自瞄350",function()
        loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",false))()
    end)

    about:Button("自瞄400",function()
        loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",false))()
    end)

    about:Button("自瞄600",function()
        loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",false))()
    end)

    about:Button("自瞄全屏",function()
        loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",false))()
    end)

    about:Button("阿尔子追",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
    end)

    about:Button("俄州子追",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
    end)

    local UITab6 = win:Tab("『范围』",'16060333448')
    local about = UITab6:section("『范围』",false)

    about:Button("修复范围",function()
        _G.HeadSize = 15
        _G.Disabled = true

        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end)

    about:Textbox("自定义范围!", "HitBox", "输入", function(Value)
        _G.HeadSize = Value
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end)

    about:Button("普通范围",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
    end)
    about:Button("中等范围",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
    end)
    about:Button("全图范围",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
    end)
    about:Button("终极范围",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()
    end)
    local about = UITab6:section("『飞』",false)
    about:Button("飞车",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/-V2.0/refs/heads/main/%E5%86%B7%E9%A3%9E%E8%BD%A6%E6%BA%90%E7%A0%81.txt"))()
    end)
    about:Button("飞行v1",function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\90\66\122\99\84\109\49\102\34\41\41\40\41\10")()
    end)
    about:Button("小yo飞行",function()
        loadstring(game:HttpGet("https://pastefy.app/J9x7RnEZ/raw"))()
    end)
    local about = UITab6:section("『剩下懒得排了』",false)
    about:Button("反挂机v2",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
    end)
    about:Button("获得管理员权限",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
    end)
    about:Button("死亡笔记",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end)
    about:Button("汉化穿墙",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
    end)

    local UITab1 = win:Tab("『格林威尔』",'16060333448')
    local about = UITab1:section("『格林威尔』",false)
    about:Button("格林维尔",function()
        loadstring(game:HttpGet("https://github.com/root-jiege/new/raw/refs/heads/main/KO"))()
    end)
    about:Button("格林维尔2",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8643/test/main/green"))()
    end)
    about:Button("格林维尔3",function()
        loadstring(game:HttpGet("https://pastefy.app/WBYAsWJm/raw"))()
    end)

    local UITab23 = win:Tab("『CDID』",'16060333448')
    local about = UITab23:section("『CDID』",false)
    about:Button("CDID",function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Car-Driving-Indonesia-Lunar-hub-v2-12376"))()
    end)
    about:Button("cdid",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/imkindagoodngl/Script/refs/heads/main/CDID.lua"))()
    end)

    local UITab1 = win:Tab("『degp』",'16060333448')
    local about = UITab1:section("『degp』",false)
    about:Button("degp",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/refs/heads/ok/dejp"))()
    end)

    local UITab1 = win:Tab("『伐木』",'16060333448')
    local about = UITab1:section("『伐木』",false)
    about:Button("伐木",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A822.lua", true))()
    end)
    about:Button("伐木2",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))("")
    end)

    local UITab1 = win:Tab("『墨水』",'16060333448')
    local about = UITab1:section("『墨水』",false)
    about:Button("墨水1",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScripterVaz/InkGameAzure/main/Protected_7974105512464815.lua.txt"))()
    end)
    about:Button("墨水2",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
    end)

    local UITab1 = win:Tab("『战争』",'16060333448')
    local about = UITab1:section("『战争』",false)
    about:Button("战争",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))()
    end)

    local UITab1 = win:Tab("『被遗弃』",'16060333448')
    local about = UITab1:section("『被遗弃』",false)
    about:Button("被遗弃",function()
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/ivannetta/ShitScripts/refs/heads/main/forsaken.lua")))()
    end)

    local UITab1 = win:Tab("『力量』",'16060333448')
    local about = UITab1:section("『力量』",false)
    about:Button("力量传奇",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/MuscleLegensOnTop/refs/heads/main/my"))()
    end)

    local UITab1 = win:Tab("『极速』",'16060333448')
    local about = UITab1:section("『极速』",false)
    about:Button("极速1",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/tUfDyUfz"))()
    end)
    about:Button("极速2",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9KWQXasx"))()
    end)

    local UITab1 = win:Tab("『死铁轨』",'16060333448')
    local about = UITab1:section("『死铁轨』",false)
    about:Button("死铁轨",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))()
    end)

    local UITab1 = win:Tab("『99夜』",'16060333448')
    local about = UITab1:section("『99夜』",false)
    about:Button("99夜",function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/255ac567ced3dcb9e69aa7e44c423f19.lua"))()
    end)

    local UITab1 = win:Tab("『cw』",'16060333448')
    local about = UITab1:section("『cw』",false)
    about:Button("CW",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
    end)

    local UITab1 = win:Tab("『压力』",'16060333448')
    local about = UITab1:section("『压力』",false)
    about:Button("压力",function()
        loadstring(request({["Url"]="https://raw.githubusercontent.com/9kn-1/preeorrr/main/pressure.luau"}).Body)()
    end)
    about:Button("压力2",function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/ohiojjj/78/main/.github/workflows/Protected_5509067665689579.lua'))()  
    end)

    local UITab1 = win:Tab("『黑火药』",'16060333448')
    local about = UITab1:section("『黑火药』",false)
    about:Button("黑火药",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/GB"))()
    end)
    local UITab1 = win:Tab("『唐县』",'16060333448')
    local about = UITab1:section("『唐县』",false)
    about:Button("唐县",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE%20SCRIPT-Tang%20County%2C%20Hebei.lua"))()
    end)

    local UITab1 = win:Tab("『boors』",'16060333448')
    local about = UITab1:section("『boors』",false)
    about:Button("biors",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
    end)

    local UITab1 = win:Tab("『ohio』",'16060333448')
    local about = UITab1:section("『ohio』",false)
    about:Button("ohio",function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Ohio.-TETRAX-22744"))()
    end)

    local UITab1 = win:Tab("『巴掌』",'16060333448')
    local about = UITab1:section("『巴掌』",false)
    about:Button("巴掌",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
    end)

    local UITab1 = win:Tab("『蜂群』",'16060333448')
    local about = UITab1:section("『蜂群』",false)
    about:Button("蜂群",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/PrisonLife-Gui-V1/main/PrisonLifeGuiV1"))()
    end)

    local UITab1 = win:Tab("『火箭』",'16060333448')
    local about = UITab1:section("『火箭』",false)
    about:Button("火箭",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/refs/heads/main/jmjmjmjmjmjm114514.txt"))()
    end)

    local UITab1 = win:Tab("『监狱』",'16060333448')
    local about = UITab1:section("『监狱』",false)
    about:Button("监狱",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/PrisonLife-Gui-V1/main/PrisonLifeGuiV1"))()
    end)

    local UITab1 = win:Tab("『汽车经售』",'16060333448')
    local about = UITab1:section("『汽车经售』",false)
    about:Button("汽车经售",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()
    end)

    local UITab1 = win:Tab("『忍者』",'16060333448')
    local about = UITab1:section("『忍者』",false)
    about:Button("忍者",function()
        loadstring(game:HttpGet("https://raw.github.com/VcPa/V/main/v"))()
    end)

    local UITab1 = win:Tab("『自然』",'16060333448')
    local about = UITab1:section("『自然』",false)
    about:Button("自然",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()
    end)

    local UITab1 = win:Tab("『偷走脑红』",'16060333448')
    local about = UITab1:section("『偷走脑红』",false)
    about:Button("偷走脑红",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
    end)
    
    local UITab1 = win:Tab("『鲨口求生』",'16060333448')
    local about = UITab1:section("『鲨口求生』",false)
    about:Button("鲨口求生",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
    end)
    
    local UITab1 = win:Tab("『克隆』",'16060333448')
    local about = UITab1:section("『克隆』",false)
    about:Button("克隆大亨1",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HELLLO1073/RobloxStuff/main/CT-Destroyer"))()
    end)
    
    local UITab1 = win:Tab("『刀刃球』",'16060333448')
    local about = UITab1:section("『刀刃球』",false)
    about:Button("飞行",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/brP8SAfJ"))()
    end)
    about:Button("刀刃球自动格挡",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
    end)
    about:Button("刀刃球1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()
    end)
    about:Button("刀刃球2",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/redz9999"))()
    end)
    about:Button("刀刃球3",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Neoncat765/Neon.C-Hub-X/main/UnknownVersion"))()
    end)
    
    local UITab1 = win:Tab("『战斗』",'16060333448')
    local about = UITab1:section("『战斗』",false)
    about:Button("战斗勇士1",function()
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/697fc3cad5f743508318cb7399e89432/files/b5923e52edab4e5c91e46b74563d0ae8/raw"))()
    end)
    
    local UITab1 = win:Tab("『背上只因剑』",'16060333448')
    local about = UITab1:section("『背上只因剑』",false)
    about:Button("背上只因剑1",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
    end)
    
    local UITab1 = win:Tab("『彩虹朋友』",'16060333448')
    local about = UITab1:section("『彩虹朋友』",false)
    about:Button("彩虹朋友1",function()
        loadstring(game:HttpGet("https://pastefy.app/XoNv04vR/raw"))()
    end)
    
    local UITab1 = win:Tab("『51区』",'16060333448')
    local about = UITab1:section("『51区』",false)
    about:Button("51区1",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Saktk-In-Area51/main/Area51", true))()
    end)
    
    local UITab1 = win:Tab("『短信』",'16060333448')
    local about = UITab1:section("『短信』",false)
    about:Button("短信模拟器1",function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/9hxkxUZ5'),true))()
    end)
end