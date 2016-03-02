----------------------------------------------------
-- Sky object defintion.
-- @package model.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"
local GameObject = require "core.GameObject"

-- Package definition
local Sky = GameObject:extends("Sky")

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function Sky:init(parent)
  GameObject.super.init(self, parent)
  self.clouds = {}
end

-- Package export
return Sky
