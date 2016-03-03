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

-- Logs the given message with the info level.
-- @param message Information message to display.
function Logger:info(message)
  print(levels.info .. " " .. self.header .. self:createGap() .. tostring(message))
end

-- Logs the given exception using the error level.
-- @param exception Caught exception to display.
function Logger:error(exception)
  print(red(levels.error) .. " " .. red(self.header .. self:createGap() .. tostring(exception)))
end

-- Package export
return Logger
