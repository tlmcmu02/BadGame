love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'

function love.load()

  PlayerLoad()

  wall = love.graphics.newImage('assets-1/Wall/catacombs_0.png')

  mapc = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  mapc = Map:new(mapc)

end

function love.update(dt)

  engineupdate(dt)

  if love.keyboard.isDown ('escape') then 
    love.exitModule();
  end

end

function love.draw()

  mapc:draw()
  
  DrawPlayer()

end

