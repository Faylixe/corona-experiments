----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local GameObject = require "core.GameObject"

-- Package definition
local StaticGameObject = GameObject:extend("StaticGameObject")

-- Default constructor.
-- @parent Parent display group this object belong to.
function StaticGameObject:init(parent, path)
  StaticGameObject.super.init(self, parent)
  print("Loading static image " .. path)
  self.image = display.newImage(path)
end

-- Static image getter.
-- @return Static image this object is bound to.
function StaticGameObject:getDisplayInstance()
  return self.image
end

-- Package export
return StaticGameObject
