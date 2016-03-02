----------------------------------------------------
-- Sky object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local class = require "core.30log"
local GameObject = require "core.GameObject"
local Cloud = require "model.land.Cloud"

-- Package definition
local Sky = GameObject:extends("Sky")

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function Sky:init(parent)
  GameObject.super.init(self, parent)
  self.clouds = {}
end

-- State update callback method. A Sky updates
-- will updates all Cloud children instance.
-- @param event Event that trigerred this method call.
function Sky:update(event)
  for _, cloud in ipairs(self.clouds) do
    cloud:update(event)
  end
end

-- Adds a new cloud to this Sky. Built cloud instance
-- will be centered to the given y coordinates, and move
-- to the given speed.
-- @param y Y axis position.
-- @param speed Scrolling speed.
function Sky:addCloud(y, speed)
  local cloud = Cloud(y, speed)
  insert(self.clouds, cloud)
end

-- Package export
return Sky
