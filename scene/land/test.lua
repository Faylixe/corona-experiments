----------------------------------------------------
-- TODO : Document
-- @package scene.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Logger = require "core.log.Logger"
local SceneLayer = require "scene.SceneLayer"
local SceneBuilder = require "scene.SceneBuilder"
local GroupGameObject = require "model.GroupGameObject"
local Cloud = require "model.land.cloud"
local Grass = require "model.land.Grass"

-- Create scene
local log = Logger("scene.land.Test")
local builder = SceneBuilder()

-- Factory function for Sky layer.
-- @param group Display group container of the parent scene.
local skyFactory = function(group)
  local layer = SceneLayer(group)
  local background = display.newRect(group, 0, 0, display.actualContentWidth, display.actualContentHeight)
  background.fill = {
    type = "gradient",
    color1 = {0, 0, 1},
    color2 = {1, 1, 1},
    direction = "down"
  }
  local sky = GroupGameObject()
  sky:add(Cloud(50, -2))
  sky:add(Cloud(80, -3))
  layer:add(sky)
  return layer
end

-- Factory function for Grass.
-- @param group Display group container of the parent scene.
local grassFactory = function(group)
  local layer = SceneLayer(group)
  for n = 0, 9 do
    layer:add(Grass(nil, n * 90, display.contentHeight))
  end
  return layer
end

-- Fill builder with created factories.
builder:addLayerFactory(skyFactory)
builder:addLayerFactory(grassFactory)

return builder:build()
