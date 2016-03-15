----------------------------------------------------
-- Grass object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local StaticGameObject = require "model.StaticGameObject"

-- Package definition
local Grass = StaticGameObject:extend("Grass")
local RESOURCE = "resources/assets/land/grass.png"

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function Grass:init(parent, x, y)
  Grass.super.init(self, RESOURCE)
  local image = self.image
  image.x = x
  image.y = y
  image.anchorY = 1
end

-- Package export
return Grass
