----------------------------------------------------
-- Level enumeration for logging.
-- @package core.log
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local Class = require "core.lang.30log"

-- Package definition.
local Level = Class("core.log.Level")
local stop = "\27[0m"

-- Static factory function that creates a formatter
-- function which applies color to the given message.
-- @param color Color index to use (see ANSI color code)
-- @return Created formatter function.
function Level.createColorFormatter(color)
  return function(message)
    return "\27[" .. color .. "m" .. message .. stop
  end
end

-- Level constructor.
-- @param priority Level priority relative to other level instance.
-- @param label Level label.
-- @param formatter (Optional) formatter to apply to logged message through this level.
function Level:init(priority, label, formatter)
  self.priority = priority
  self.formatter = formatter
  self.header = "\27[1m" .. label .. stop
  if not(self.formatter == nil) then
    self.header = self.formatter(self.header)
  end
end

-- Formats the given message according to this
-- level formatting process.
-- @param message Message to format.
-- @return Formatted message if this level require one, or the same message otherwise.
function Level:format(message)
  if not(self.formatter == nil) then
    return self.formatter(message)
  end
  return message
end

-- Package export
return setmetatable(Level, { __index = {
  ERROR = Level(0, "ERROR", Level.createColorFormatter(31)),
  WARN = Level(1, "WARN "),
  INFO = Level(2, "INFO ", Level.createColorFormatter(32)),
  DEBUG = Level(3, "DEBUG", Level.createColorFormatter(35))
}})
