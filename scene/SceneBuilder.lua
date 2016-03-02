----------------------------------------------------
-- TODO : Document
-- @package scene
-- @author Faylixe
----------------------------------------------------

-- Static import
local insert = table.insert

-- Dependencies import
local composer = require "composer"
local class = require "core.30log "
local SceneLayer = require "scene.SceneLayer"

-- Package definition
local SceneBuilder = class("SceneBuilder")

-- Default constructor.
function SceneBuilder:init()
  self.factories = {}
  self.scene = composer.newScene()
  -- Delegate scene creation method definition
  -- @param scene Scene instance this method belongs to.
  -- @param event Creation event that trigerred this method call.
  self.scene.create = function(scene, event)
    for _, factory in ipairs(self.factories) do
      factory(scene.view)
    end
  end
  -- Delegate scene showing method definition
  -- @param scene Scene instance this method belongs to.
  -- @param event Showing event that trigerred this method call.
  self.scene.show = function(scene, event)
  end
  -- Delegate scene hiding method definition
  -- @param scene Scene instance this method belongs to.
  -- @param event Hiding event that trigerred this method call.
  self.scene.hide = function(scene, event)
  end
  -- Delegate scene destruction method definition
  -- @param scene Scene instance this method belongs to.
  -- @param event Destruction event that trigerred this method call.
  self.scene.destroy = function(scene, event)
  end

end

-- Adds the given layer factory method to this builder. Such factory will
-- be called by the built scene during the creation event callback.
-- @param factory Layer factory method
function SceneBuilder:addLayerFactory(factory)
  insert(self.factories, factory)
end

-- Builds a scene instance, after binding event listener methods.
-- @return Built scene instance.
function SceneBuilder:builder()
  local scene = self.scene
  scene:addEventListener("create", scene)
  scene:addEventListener("show", scene)
  scene:addEventListener("hide", scene)
  scene:addEventListener("destroy", scene)
  return scene
end

-- Package export
return SceneBuilder
