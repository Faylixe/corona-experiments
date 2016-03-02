----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"

-- Package definition
local GameObject = class("GameObject")

-- Default constructor.
-- @parent Parent display group this object belong to.
function GameObject:init(parent)
  self.parent = parent
  self.parent:add(self)
end

-- Package export
return GameObject
