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

  Music = love.audio.newSource('Great Temple (Zelda II   The Adventure of Link)   Super Smash Bros Wii U.mp3', 'static')
  Music:setVolume(0.5)
end

function love.update(dt)

  engineupdate(dt)

  Music:play()

  if love.keyboard.isDown ('space') then 
    love.exitModule();
  end

end

function love.draw()

  mapc:draw()
  
  DrawPlayer()

end

