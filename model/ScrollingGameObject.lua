----------------------------------------------------
-- TODO : Document
-- @package model
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Logger = require "core.log.Logger"
local GameObject = require "model.GameObject"

-- Package definition
local ScrollingGameObject = GameObject:extend("ScrollingGameObject")
local log = Logger(StaticGameObject)

-- Default constructor.
-- @parent Parent display group this object belong to.
function ScrollingGameObject:init(path)
  ScrollingGameObject.super.init(self)
  log:debug("Loading static image " .. path)
  self.image = display.newImage(path)
  if self.image == nil then
    error(path .. " image not found")
  end
end

-- Static image getter.
-- @return Static image this object is bound to.
function StaticGameObject:getDisplayInstance()
  return self.image
end

-- Package export
return StaticGameObject
