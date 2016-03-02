----------------------------------------------------
-- Grass object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"
local StaticGameObject = require "core.StaticGameObject"

-- Package definition
local Grass = StaticGameObject:extends("Grass")
local RESOURCE = "resources/assets/grass.png"

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function Grass:init(parent)
  StaticGameObject.super.init(self, parent, RESOURCE)
end

-- Package export
return Grass
