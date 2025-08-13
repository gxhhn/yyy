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

about:Button("自瞄（死亡消失）",function()
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
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Marco8643/test/main/cdid%20script'))()
end)

about:Button("cdid",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/imkindagoodngl/Script/refs/heads/main/CDID.lua"))()
end）

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
end）

about:Button("墨水2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
end）

local UITab1 = win:Tab("『战争』",'16060333448')
local about = UITab1:section("『战争』",false)

about:Button("战争",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))()
end）

local UITab1 = win:Tab("『被遗弃』",'16060333448')
local about = UITab1:section("『被遗弃』",false)

about:Button("被遗弃",function()
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/ivannetta/ShitScripts/refs/heads/main/forsaken.lua")))()
end）

local UITab1 = win:Tab("『力量』",'16060333448')
local about = UITab1:section("『力量』",false)

about:Button("力量传奇",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/MuscleLegensOnTop/refs/heads/main/my"))()
end）

local UITab1 = win:Tab("『极速』",'16060333448')
local about = UITab1:section("『极速』",false)

about:Button("极速1",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/tUfDyUfz"))()
end）

about:Button("极速2",function()
loadstring(game:HttpGet("https://pastebin.com/raw/9KWQXasx"))()
end）

local UITab1 = win:Tab("『死铁轨』",'16060333448')
local about = UITab1:section("『死铁轨』",false)

about:Button("死铁轨",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))()
end）

local UITab1 = win:Tab("『99夜』",'16060333448')
local about = UITab1:section("『99夜』",false)

about:Button("99夜",function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/255ac567ced3dcb9e69aa7e44c423f19.lua"))()
end）

local UITab1 = win:Tab("『cw』",'16060333448')
local about = UITab1:section("『cw』",false)

about:Button("CW",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
end

local UITab1 = win:Tab("『压力』",'16060333448')
local about = UITab1:section("『压力』",false)

about:Button("压力",function()
    loadstring(request({["Url"]="https://raw.githubusercontent.com/9kn-1/preeorrr/main/pressure.luau"}).Body)()
end

about:Button("压力2",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/ohiojjj/78/main/.github/workflows/Protected_5509067665689579.lua'))()  
end)

local UITab1 = win:Tab("『黑火药』",'16060333448')
local about = UITab1:section("『黑火药』",false)

about:Button("黑火药",function()
    loadstring(game:HttpGet(('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\119\104\97\116\116\102\97\47\78\79\78\69\47\109\97\105\110\47\115\99\114\105\112\116\46\108\117\97\63\116\111\107\101\110\61\71\72\83\65\84\48\65\65\65\65\65\65\67\78\77\81\90\51\86\53\52\89\52\52\86\52\67\69\82\85\50\65\71\75\85\90\81\80\89\85\88\81'),true))()
end）

local UITab1 = win:Tab("『唐县』",'16060333448')
local about = UITab1:section("『唐县』",false)

about:Button("唐县",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE%20SCRIPT-Tang%20County%2C%20Hebei.lua"))()
end）

local UITab1 = win:Tab("『boors』",'16060333448')
local about = UITab1:section("『boors』",false)

about:Button("biors",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end）

local UITab1 = win:Tab("『ohio』",'16060333448')
local about = UITab1:section("『ohio』",false)

about:Button("ohio",function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Ohio.-TETRAX-22744"))()
end）

local UITab1 = win:Tab("『巴掌』",'16060333448')
local about = UITab1:section("『巴掌』",false)

about:Button("巴掌",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
end）

local UITab1 = win:Tab("『蜂群』",'16060333448')
local about = UITab1:section("『蜂群』",false)

about:Button("蜂群",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/PrisonLife-Gui-V1/main/PrisonLifeGuiV1"))()
end）

local UITab1 = win:Tab("『火箭』",'16060333448')
local about = UITab1:section("『火箭』",false)

about:Button("火箭",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/refs/heads/main/jmjmjmjmjmjm114514.txt"))()
end）

local UITab1 = win:Tab("『监狱』",'16060333448')
local about = UITab1:section("『监狱』",false)

about:Button("监狱",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/PrisonLife-Gui-V1/main/PrisonLifeGuiV1"))()
end）

local UITab1 = win:Tab("『汽车经售』",'16060333448')
local about = UITab1:section("『汽车经售』",false)

about:Button("汽车经售",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()
end）

local UITab1 = win:Tab("『忍者』",'16060333448')
local about = UITab1:section("『忍者』",false)

about:Button("忍者",function()
    loadstring(game:HttpGet("https://raw.github.com/VcPa/V/main/v"))()
end）

local UITab1 = win:Tab("『自然』",'16060333448')
local about = UITab1:section("『自然』",false)

about:Button("自然",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()
end）