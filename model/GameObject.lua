----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Class = require "core.lang.30log"

-- Package definition
local GameObject = Class("GameObject")

-- Default constructor.
function GameObject:init()
  -- Do nothing here.
end

-- Method that aims to be overriden. This method
-- is bind as an "enterFrame" event listener.
-- @param event Event that trigerred this method call.
function GameObject:update(event)
  -- Do nothing here.
end

-- Abstract display getter that aims to be overriden.
-- @return A display object instance that represents this game object.
function GameObject:getDisplayInstance()
  error("getDisplayInstance() should be overriden")
end

-- Package export
return GameObject
