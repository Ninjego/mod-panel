--[=[
	@class ModNevermoreServiceClient
]=]

local require = require(script.Parent.loader).load(script)

local ModNevermoreServiceClient = {}
ModNevermoreServiceClient.ServiceName = "ModNevermoreServiceClient"

function ModNevermoreServiceClient:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")

	-- External
	self._serviceBag:GetService(require("CmdrServiceClient"))

	-- Internal
	self._serviceBag:GetService(require("ModNevermoreTranslator"))
end

return ModNevermoreServiceClient