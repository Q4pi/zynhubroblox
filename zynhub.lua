--[[
    Универсальный авто-лоадер ZynHub
    Автоматически определяет игру и запускает нужный скрипт
--]]

local currentPlaceId = game.PlaceId
print("[ZynHub-Loader]: Проверка текущей игры... (PlaceID: " .. tostring(currentPlaceId) .. ")")

-- Функция для безопасной загрузки скриптов
local function runScript(url, gameName)
    print("[ZynHub-Loader]: Запуск скрипта для " .. gameName .. "...")
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("[ZynHub-Loader]: Ошибка при загрузке " .. gameName .. ": " .. tostring(err))
    end
end

-- Проверяем, в какой мы игре
if currentPlaceId == 96342491571673 then
    -- 🧠 STEAL A BRAINROT (SAB)
    runScript("https://raw.githubusercontent.com/Q4pi/ZYNHUBSTEALABRAINROTV4/refs/heads/main/zynhub.lua", "Steal a Brainrot")

elseif currentPlaceId == 142823291 then
    -- 🔪 MURDER MYSTERY 2 (MM2)
    runScript("https://https://raw.githubusercontent.com/Q4pi/zynhubmm2/refs/heads/main/zynhubmm2.lua", "Murder Mystery 2")

else
    -- 🌍 ВСЕ ОСТАЛЬНЫЕ ИГРЫ
    runScript("https://raw.githubusercontent.com/Q4pi/zynhub-v4/main/zyn_hub.lua", "ZynHub V4 (Универсальный)")
end
