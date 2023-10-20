local require = require(script.Parent.loader).load(script)

local Maid = require("Maid")

local ClockClientUtil = {}

-- Handles payload from server
function ClockClientUtil.secondsToClock(seconds)
    local seconds = tonumber(seconds)
  
    if seconds <= 0 then
      return "0h 00m 00s";
    else
      local hours = string.format("%02.f", math.floor(seconds/3600));
      local mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
      local secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
      return hours.."h "..mins.."m "..secs .."s"
    end
  end

return ClockClientUtil