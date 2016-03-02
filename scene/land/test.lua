----------------------------------------------------
-- TODO : Document
-- @package scene.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "30log"
local Sky = require "model.land.Sky"
local SceneLayer = require "scene.SceneLayer"
local SceneBuilder = require "scene.SceneBuilder"

-- Create scene
local builder = SceneBuilder()

-- Factory function for Sky layer.
-- @param container Display group container of the parent scene.
local skyFactory = function(container)
  local layer = SceneLayer(container)
  local sky = Sky(layer)
  sky:addCloud(50, -2)
  sky:addCloud(75, -4)
  return layer
end

-- Fill builder with created factories.
builder:addLayerFactory(skyFactory)

return builder:build()
