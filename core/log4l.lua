----------------------------------------------------
-- Logging utils for development purpose.
-- @package core
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "core.30log"
local max = math.max
local stop = '\27[0m'

-- Boldify the given label.
-- @param Label to boldify.
-- @return Boldified label.
local function bold(label)
  return '\27[1m' .. label .. stop
end

-- Redify the given label.
-- @param Label to redify.
-- @return Redified label.
local function red(label)
  return '\27[31m' .. label .. stop
end


-- Enumeration of all logging level.
local Level = {
  ERROR = 1,
  WARN = 2,
  INFO = 3,
  DEBUG = 4,
}

local levels = {
  info = bold("INFO "),
  warn = bold("WARN "),
  debug = bold("DEBUG"),
  error = bold("ERROR"),
}

-- Package definition
local Logger = class("Logger")

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

-- Logs the given exception using the ERROR level.
-- @param exception Caught exception to display.
function Logger:error(exception)
  print(red(levels.error) .. " " .. red(self.header .. self:createGap() .. tostring(exception)))
end

-- Logs the given message with the WARN level.
-- @param message Warning message to display.
function Logger:warn(message)
  print(red(levels.warn) .. " " .. red(self.header .. self:createGap() .. tostring(exception)))
end

-- Logs the given message with the INFO level.
-- @param message Information message to display.
function Logger:info(message)
  if (Logger.level >= Level.INFO) then
    print(levels.info .. " " .. self.header .. self:createGap() .. tostring(message))
  end
end


-- Logs the given message with the DEBUG level.
-- @param message Debug message to display.
function Logger:debug(message)
  if (Logger.level >= Level.DEBUG) then
    print(levels.debug .. " " .. self.header .. self:createGap() .. tostring(message))
  end
end

-- Package export
return Logger
