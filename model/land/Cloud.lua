----------------------------------------------------
-- Cloud object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local StaticGameObject = require "core.StaticGameObject"

-- Package definition
local Cloud = StaticGameObject:extend("Cloud")
local RESOURCE = "resources/assets/cloud.png"

-- Default constructor.
-- @param parent Parent SceneLayer this object belong to.
-- @param y
-- @param speed Integer which acts as the horizontal delta scrolling speed.
function Cloud:init(parent, y, speed)
  Cloud.super.init(self, parent, RESOURCE)
  self.speed = speed
end

-- State update callback method. A Cloud updates will translate
-- this cloud position relative to it scrolling speed.
-- @param event Event that trigerred this method call.
function Cloud:update(event)
  local image = self.image
  -- TODO : Consider applying light vertical moves.
  image:translate(self.speed, 0)
end

-- Package export
return Cloud
