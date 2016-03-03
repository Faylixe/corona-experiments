----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local GameObject = require "model.GameObject"

-- Package definition
local AnimatedGameObject = GameObject:extend("AnimatedGameObject")

-- Default constructor.
-- @parent Parent display group this object belong to.
function AnimatedGameObject:init(parent)
  AnimatedGameObject.super.init(self, parent)
end

-- Package export
return AnimatedGameObject
