--[[
    This is a ModuleScript it should be located in ReplicatedStorage!
    Cynica
--]]

--// Variables
local DataStoreService = game:GetService('DataStoreService')
local PlayerStats = DataStoreService:GetDataStore('PlayerStats')
local DataStore = {}
DataStore.__index = DataStore
--// Functions
function DataStore:SaveData(Table)
    if Table then self.Table = Table end
    local Success, Returned
    local function saveData()
        Success, Returned = pcall(function()
            return PlayerStats:UpdateAsync(self.id, function(PreviousInfo)
                return {
                    ["Table"] = self.Table
                }
            end)
        end)
        if not Success then
            warn(Returned)
            task.wait(.5)
            saveData()
        end
    end
    saveData()
end
function DataStore:GetData()
    local Success, Returned
    local function getData()
        Success, Returned = pcall(function()
            local PlayerData = PlayerStats:GetAsync(self.id)
            if PlayerData == nil then
                self.Table = {}
                self.HasPlayed = false
            else
                if PlayerData["Table"] then self.Table = PlayerData["Table"] else self.Table = {} end
                self.HasPlayed = true
            end
        end)
        if not Success then
            warn(Returned)
            task.wait(.5)
            getData()
        end
    end
    getData()
end
function DataStore.new(Player)
    local self = setmetatable({}, DataStore)
    self.id = Player.UserId
    return self
end
return DataStore
