----------------------------------------------------
-- TODO : Document
-- @package scene
-- @author Faylixe
----------------------------------------------------

-- Static import
local insert = table.insert

-- Consider moving those default parameters.
display.setDefault("anchorX", 0.0)
display.setDefault("anchorY", 0.0)

-- Dependencies import
local Composer = require "composer"
local Class = require "core.lang.30log"
local Logger = require "core.log.Logger"
local SceneLayer = require "scene.SceneLayer"
local GameController = require "controller.GameController"

-- Package definition
local SceneBuilder = Class("scene.SceneBuilder")
local log = Logger(SceneBuilder)

-- Default constructor.
function SceneBuilder:init()
  self.factories = {}
  self.layers = {}
  self.scene = Composer.newScene()
  -- Delegate scene creation method definition
  -- @param scene Scene instance this method belongs to.
  -- @param event Creation event that trigerred this method call.
  self.scene.create = function(scene, event)
    -- Binds game controller.
     -- TODO : Check out why scene starting point is not 0 ?
    local view = scene.view
    local controller = GameController.getInstance()
    controller:setTargetView(view)
    -- Initializes scene layers.
    for _, factory in ipairs(self.factories) do
      local layer = factory(view)
      insert(self.layers, layer)
      layer:addListener("enterFrame", function(event) layer:update(event) end)
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
    for key, layer in ipairs(self.layers) do
      layer:removeListeners()
      self.layers[key] = nil
    end
    self.layers = nil
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
function SceneBuilder:build()
  local scene = self.scene
  scene:addEventListener("create", scene)
  scene:addEventListener("show", scene)
  scene:addEventListener("hide", scene)
  scene:addEventListener("destroy", scene)
  return scene
end

-- Package export
return SceneBuilder
