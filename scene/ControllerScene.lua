----------------------------------------------------
-- TODO : Document
-- @package controller
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Class = require "core.lang.30log"
local Singleton = require "core.lang.Singleton"
local Logger = require "core.log.Logger"
local Composer = require "composer"
local GameController = require "controller.GameController"

-- Package definition
local scene = Composer.newScene()
local controller = GameController.getInstance()

--
-- @param event
function scene:show(event)
  controller:show(self.view)
end

--
-- @param event
function scene:hide(event)
end

scene:addEventListener("show", scene)

return scene
