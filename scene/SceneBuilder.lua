----------------------------------------------------
-- TODO : Document
-- @package scene
-- @author Faylixe
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local composer = require "composer"
local class = require "core.30log "
local SceneLayer = require "scene.SceneLayer"


-- Package definition
local SceneBuilder = class("SceneBuilder")

-- Default constructor.
function SceneBuilder:init()
  self.scene = composer.newScene()
  self.layers = {}
end

--
-- @return
function SceneBuilder:createLayer()
  local layer = SceneLayer()
  insert(self.layers, layer)
  return layer
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

-- Package export
return SceneBuilder
