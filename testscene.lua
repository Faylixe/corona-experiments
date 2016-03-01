--
--

local SceneBuilder = require "core/SceneBuilder"

local builder = SceneBuilder("testscene")

return builder:build()

local composer = require "composer"
local scene = composer.newScene("testscene")

-- Scene constructor.
-- @param event Delegated event.
function scene:create(event)
  local sceneGroup = self.view
  -- TODO : Load resources here.
end

--
-- @param event Delegated event.
function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase
  if (phase == "did") then
    -- TODO : Start animation here ?
  end
end

--
-- @param event Delegated event.
function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase
  if (phase == "did") then
    -- TODO : Stop resources.
  end
end

--
-- @param event Delegated event.
function scene:destroy(event)
  local sceneGroup = self.view
  -- TODO : Unload resources.
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
