-- Конфигурация ссылок на скрипты
local SAB   = "https://raw.githubusercontent.com/Q4pi/ZYNHUBSTEALABRAINROTV4/refs/heads/main/zynhub.lua"
local MM2   = "https://raw.githubusercontent.com/Q4pi/zynhubmm2/refs/heads/main/zynhubmm2.lua"
local OTHER = "https://raw.githubusercontent.com/Q4pi/zynhub-v4/main/zyn_hub.lua" -- Твоя ссылка для других игр (сейчас стоит Rayfield)

-- Таблица проверки по GameId
local byGameId = {
    [7709344486] = SAB,
    [66654135]   = MM2,
}

-- Таблица проверки по PlaceId
local byPlaceId = {
    [109983668079237] = SAB, -- Основной плейс SAB
    [142823291]       = MM2, -- Основной плейс MM2
}

-- Ожидание полной загрузки ID игры
local gameId = game.GameId
while gameId == 0 and game.PlaceId == 0 do
    task.wait()
    gameId = game.GameId
end

-- Ищем скрипт: сначала проверяем SAB и MM2, если не нашли — ставим универсальный для Other Games
local url = byGameId[gameId] or byPlaceId[game.PlaceId] or OTHER

-- Загрузка и выполнение скрипта (3 попытки в случае сбоя сети)
for _ = 1, 3 do
    local ok, source = pcall(game.HttpGet, game, url)
    if ok and type(source) == "string" and source ~= "" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
        return
    end
    task.wait(0.5)
end
с
