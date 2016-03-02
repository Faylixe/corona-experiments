----------------------------------------------------
-- TODO : Document
-- @package scene.land
-- @author Faylixe
----------------------------------------------------

-- Dependencies import
local class = require "30log"
local Cloud = require "model.land.Cloud"
local SceneLayer = require "scene.SceneLayer"
local SceneBuilder = require "scene.SceneBuilder"

-- Create scene
local builder = SceneBuilder()
local sky = builder:createLayer()
local cloud = Cloud(sky)
sky.add(cloud)
return builder:build()
