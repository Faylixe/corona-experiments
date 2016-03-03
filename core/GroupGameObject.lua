----------------------------------------------------
-- TO Document
-- @package core
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local GameObject = require "core.GameObject"

-- Package definition
local GroupGameObject = GameObject:extend("GroupGameObject")

-- Default constructor.
-- @parent Parent SceneLayer this object belong to.
function GroupGameObject:init(parent)
  GroupGameObject.super.init(self, parent)
  self.group = display.newGroup()
  self.childs = {}
end

--
-- @param object
function GroupGameObject:add(object)
  insert(self.childs, object)
  self.group:insert(object:getDisplayInstance())
end

-- State update callback method. Such update
-- will updates all children instance.
-- @param event Event that trigerred this method call.
function GroupGameObject:update(event)
  for _, object in ipairs(self.childs) do
    object:update(event)
  end
end

-- Overriden implementation of getDisplayInstance abstract method.
-- @return Display group that this object is defining.
function GroupGameObject:getDisplayInstance()
  return self.group
end

-- Package export
return GroupGameObject
