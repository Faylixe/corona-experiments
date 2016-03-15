----------------------------------------------------
-- TODO : Document
-- @package controller
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Class = require "core.lang.30log"
local Singleton = require "core.lang.Singleton"
local Logger = require "core.log.Logger"
local Composer = require "composer"

-- Package definition
local AREA_WIDTH_RATIO = 0.10

--
local ControllerArea = Class("ControllerArea")

--
-- @param side
function ControllerArea:init(group, side)
  local x = 0
  local width = display.actualContentWidth * AREA_WIDTH_RATIO
  local height = display.actualContentHeight
  self.area = display.newRect(group, x, 0, width, height)
  -- TODO : Add event listener to make this area persistent over touch
  self:released()
end

--
function ControllerArea:released()
  local area = self.area
  area:setFillColor(1, 0.4)
  area:setStrokeColor(1, 1)
  area.strokeWidth = 1
end


--
local GameController = Class("GameController")

local CONTROLLER_DELAY = 1000
local log = Logger(GameController)

-- Default constructor.
function GameController:init()
  self.visible = false
end

local OVERLAY_OPTIONS = {
  effect = "fade"
}

local function startController(controller)
  controller.visible = true
  log:debug("Starting overlay")
  Composer.showOverlay("scene.ControllerScene")
end

local function stopController(controller)
  controller.visible = false
  log:debug("Stopping overlay")
  Composer.hideOverlay(true, "fade", 200)
end

--
-- @param view
function GameController:setTargetView(view)
  view:addEventListener("touch", function(event)
    log:debug("Touch event detected [" .. event.phase .. "]")
    if not(self.visible) and event.phase == "began" then
      startController(self)
    elseif event.phase == "ended" then
      log:debug("Starting timer")
      -- TODO : Check for mutual timer exclusion
      timer.performWithDelay(CONTROLLER_DELAY,
        function()
          stopController(self)
        end)
    end
  end)
end



--
-- @param group
function GameController:show(group)
  log:debug("Showing controller area LEFT")
  ControllerArea(group, -1)
end

-- Package export
return Singleton(GameController)
