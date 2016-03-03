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

-- Create scene
local log = Logger("scene.land.Test")
local builder = SceneBuilder()

-- Factory function for Sky layer.
-- @param group Display group container of the parent scene.
local skyFactory = function(group)
  local layer = SceneLayer(group)
  local sky = GroupGameObject()
  log:debug("Adding 2 clouds")
  sky:add(Cloud(50, -2))
  sky:add(Cloud(80, -3))
  layer:add(sky)
  return layer
end

-- Fill builder with created factories.
builder:addLayerFactory(skyFactory)

return builder:build()
