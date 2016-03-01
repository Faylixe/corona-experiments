
local class = require "core.30log "
local composer = require "composer"

local SceneBuilder = class("SceneBuilder")

--
-- @name
function SceneBuilder:init(name)
  self.scene = composer.newScene(name)
end

--
--
-- @return
function SceneBuilder:builder()
  local scene = self.scene
  scene:addEventListener("create", scene)
  scene:addEventListener("show", scene)
  scene:addEventListener("hide", scene)
  scene:addEventListener("destroy", scene)
  return scene
end

return SceneBuilder
