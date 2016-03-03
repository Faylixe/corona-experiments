----------------------------------------------------
-- Logging utils for development purpose.
-- @package core.log
-- @author Faylixe
----------------------------------------------------

-- Static import
local max = math.max

-- Dependencies import
local Class = require "core.lang.30log"
local Level = require "core.log.Level"

-- Package definition
local Logger = Class("core.log.Logger")

-- The header overflow property allows to align the gap between header and message.
Logger.headerOverflow = 0

-- The level property allows to deny useless message.
Logger.level = Level.DEBUG

-- Default constructor. Initializes the logger header depending
-- of the target nature.
-- @param target Target element that hold this logger.
function Logger:init(target)
  if (type(target) == "table") then
      self:init(target.name)
  else
    if (target == nil) then
      self:init("?")
    else
      self.header = "[" .. target .. "]"
      Logger.headerOverflow = max(#self.header, Logger.headerOverflow)
    end
  end
end

-- Creates a gap according to the Logger.headerOverflow value.
-- Such gap aims to grow as long as we are creating new logger.
-- @return Gap that aims to be set between the log header and message.
function Logger:createGap()
  local gap = " "
  for i = 0, Logger.headerOverflow - #self.header do
    gap = gap .. " "
  end
  return gap
end

--
-- @param level
-- @param message
function Logger:log(level, message)
  if (level.priority <= Logger.level.priority) then
    print(level.header .. " " .. level:format(self.header .. self:createGap() .. tostring(message)))
  end
end

-- Logs the given exception using the ERROR level.
-- @param exception Caught exception to display.
function Logger:error(exception)
  self:log(Level.ERROR, exception)
end

-- Logs the given message with the WARN level.
-- @param warning Warning message to display.
function Logger:warn(warning)
  self:log(Level.WARN, warning)
end

-- Logs the given message with the INFO level.
-- @param message Information message to display.
function Logger:info(message)
  self:log(Level.INFO, message)
end

-- Logs the given message with the DEBUG level.
-- @param message Debug message to display.
function Logger:debug(message)
  self:log(Level.DEBUG, message)
end

-- Package export
return Logger
