----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log "
local GameObject = require "model.GameObject"

-- Package definition
local AnimatedGameObject = GameObject:extend("AnimatedGameObject")

-- Default constructor.
-- @parent Parent display group this object belong to.
function AnimatedGameObject:init(parent)
  GameObject.super.init(self, parent)
end

-- Package export
return AnimatedGameObject
