----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"
local GameObject = require "model.GameObject"

-- Package definition
local StaticGameObject = GameObject:extend("StaticGameObject")

-- Default constructor.
-- @parent Parent display group this object belong to.
function StaticGameObject:init(parent, path)
  GameObject.super.init(self, parent)
  self.image = display.display.newImage(self.parent, path)
end

-- Package export
return StaticGameObject
