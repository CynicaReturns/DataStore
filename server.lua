--[[
    This is a ServerScript located in ServerScriptService!
    Cynica
--]]

--// Variables
local ReplicatedStorage = game:GetService('ReplicatedStorage')
--// Functions
game:GetService('Players').PlayerAdded:Connect(function(Player)
    local DataStore = require(ReplicatedStorage:WaitForChild('NAMEOFDATASTOREMODULE'))
    local PlayerData = DataStore.new(Player)
    PlayerData:GetData()
    table.insert(PlayerData.Table, Player.UserId)
    game:GetService('Players').PlayerRemoving:Connect(function(PlayerLeaving)
        if PlayerLeaving == Player then
            PlayerData:SaveData(PlayerData.Table)
            return print("[Server]: Successfully saved " .. PlayerLeaving.Name .. "'s data")
        end
    end)
end)
