----------------------------------------------------
-- Cloud object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local StaticGameObject = require "model.StaticGameObject"

-- Package definition
local Cloud = StaticGameObject:extend("Cloud")
local RESOURCE = "resources/assets/land/cloud.png"

-- Default constructor.
-- @param parent Parent SceneLayer this object belong to.
-- @param y
-- @param speed Integer which acts as the horizontal delta scrolling speed.
function Cloud:init(y, speed)
  Cloud.super.init(self, RESOURCE)
  self.speed = speed
  self.image.y = y
end

--
-- @return true if the cloud is out of the area it belongs, false otherwise.
function Cloud:outofscreen()
  local image = self.image
  if (self.speed >= 0) then
    -- return image.x > TODO : re add parent.
  end
  return image.x <= (0 - image.contentWidth)
end

-- State update callback method. A Cloud updates will translate
-- this cloud position relative to it scrolling speed.
-- @param event Event that trigerred this method call.
function Cloud:update(event)
  local image = self.image
  image:translate(self.speed, 0)
  if self:outofscreen() then
    if self.speed >= 0 then
      image.x = 0 - image.contentWidth
    else
      image.x = display.contentWidth
    end
  end
end

-- Package export
return Cloud
