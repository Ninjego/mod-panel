--[[
	@class ClientMain
]]
local packages = game:GetService("ReplicatedStorage"):WaitForChild("Packages")

local serviceBag = require(packages:WaitForChild("ServiceBag")).new()

serviceBag:GetService(packages:WaitForChild("ModNevermoreServiceClient"))

serviceBag:Init()
serviceBag:Start()