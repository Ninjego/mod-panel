--[=[
	@class ModNevermoreService
]=]

local packages = game:GetService("ReplicatedStorage"):WaitForChild("Packages")

local require = require(script.Parent.loader).load(script)

local ModNevermoreService = {}
ModNevermoreService.ServiceName = "ModNevermoreService"

function ModNevermoreService:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")

	-- External
	self._serviceBag:GetService(require("CmdrService"))

	-- Internal
	self._serviceBag:GetService(require("ModNevermoreTranslator"))
	self._serviceBag:GetService(require("ModerationPanelService"))
end

return ModNevermoreService