----------------------------------------------------
-- TO Document
-- @package core
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local Logger = require "core.log.Logger"
local GameObject = require "model.GameObject"

-- Package definition
local GroupGameObject = GameObject:extend("core.GroupGameObject")

local log = Logger(GroupGameObject)

-- Default constructor.
function GroupGameObject:init()
  self.group = display.newGroup()
  self.childs = {}
  GroupGameObject.super.init(self)
end

--
-- @param object
function GroupGameObject:add(object)
  insert(self.childs, object)
  log:debug("Object display : " .. tostring(object:getDisplayInstance()))
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
