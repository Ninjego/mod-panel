--[[
	@class ServerMain
]]
local ServerScriptService = game:GetService("ServerScriptService")

local loader = ServerScriptService.ModNevermore:FindFirstChild("LoaderUtils", true).Parent
local packages = require(loader).bootstrapGame(ServerScriptService.ModNevermore)

local serviceBag = require(packages.ServiceBag).new()

serviceBag:GetService(packages.ModNevermoreService)

serviceBag:Init()
serviceBag:Start()