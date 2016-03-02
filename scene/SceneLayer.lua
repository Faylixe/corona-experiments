----------------------------------------------------
-- TODO : Document
-- @package scene
-- @author Faylixe
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local class = require "30log"
local GameObject = require "core.GameObject"

-- Package definition
local SceneLayer = class("SceneLayer")

-- Default constructor
-- @param container Scene display group container this layer is bound to.
function SceneLayer:init(container)
  self.container = container
  self.objects = {}
end

-- Adds the given object to this layer.
-- @param object The object to add.
function SceneLayer:add(object)
  if not(object.class:extends(GameObject)) then
    error("SceneLayer could only handle GameObject instance")
  end
  -- Consider setting group here.
  insert(self.objects, object)
end

-- Package export
return SceneLayer
