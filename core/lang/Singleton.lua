----------------------------------------------------
-- Simple method only package that allows to turn
-- a given class into a Singleton.
-- @package core.lang
-- @author Faylixe
----------------------------------------------------

return function(class, ...)
  local instance = nil
  return {
    getInstance = function()
      if instance == nil then
        instance = class(args)
      end
      return instance
    end
  }
end
