----------------------------------------------------
-- Grass object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local StaticGameObject = require "model.StaticGameObject"

-- Package definition
local Grass = StaticGameObject:extend("Grass")
local RESOURCE = "resources/assets/grass.png"

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function Grass:init(parent)
  Grass.super.init(self, parent, RESOURCE)
end

-- Package export
return Grass
