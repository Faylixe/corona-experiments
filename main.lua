----------------------------------------------------
-- TODO : Document
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local composer = require "composer"
local Logger = require "core.log.Logger"

-- Initiliazes logger (for development).
local log = Logger("Main")
log:info("Starting composer")

local well, exception = pcall(composer.gotoScene, "scene.land.test")
if not(well) then
  log:error(exception)
end
