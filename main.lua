----------------------------------------------------
-- TODO : Document
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Logger = require "core.log4l"

-- Initiliazes logger (for development).
local log = Logger("Main")
log:info("Starting composer")

local composer = require "composer"

local well, exception = pcall(composer.gotoScene, "scene.land.test")
if not(well) then
  log:error(exception)
end
