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
  self.listeners = {}
end

-- Updates methods that updates each child object of this layer.
-- This method is bind as an "enterFrame" event listener.
-- @param event Event that trigerred this method call.
function SceneLayer:update(event)
  for _, object in ipairs(self.objects) do
    object:update(event)
  end
end

-- Adds the given listener to this layer and binds it
-- to the given event using Runtime registration.
-- @param event Event to bind listener to.
-- @param listener Listener to register.
function SceneLayer:addListener(event, listener)
  self.listeners[event] = listener
  Runtime:addEventListener(event, listener)
end

-- Removes all listeners binding from this layer.
-- This method should be called prior to object destruction.
function SceneLayer:removeListeners()
  for event, listener in pairs(self.listeners) do
    Runtime:removeEventListener(event, listener)
  end
end

-- Adds the given object to this layer.
-- @param object The object to add.
function SceneLayer:add(object)
  if not(object.class:extends(GameObject)) then
    error("SceneLayer could only handle GameObject instance")
  end
  insert(self.objects, object)
end

-- Package export
return SceneLayer
