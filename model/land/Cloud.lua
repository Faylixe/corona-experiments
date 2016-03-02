----------------------------------------------------
-- Cloud object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"
local StaticGameObject = require "core.StaticGameObject"

-- Package definition
local Cloud = StaticGameObject:extends("Cloud")
local RESOURCE = "resources/assets/cloud.png"

-- Default constructor.
-- @parent Parent display group this object belong to.
function Cloud:init(parent)
  StaticGameObject.super.init(self, parent, RESOURCE)
end

-- Package export
return Cloud
