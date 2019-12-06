love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local bullet = require 'core/bullet'

function love.load()

  PlayerLoad()
  BulletLoad()
  bullettimer = 0

  wall = love.graphics.newImage('assets-1/Wall/catacombs_0.png')

  mapc = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  mapc = Map:new(mapc)

  cam = gamera.new(0, 0, 832, 11000)

  Music = love.audio.newSource('Great Temple (Zelda II   The Adventure of Link)   Super Smash Bros Wii U.mp3', 'static')
  Music:setVolume(0.5)
end

function love.update(dt)

  engineupdate(dt)

  Music:play()

  if bullettimer == 0 then
    bullettimer = 12
  end

  if bullettimer == 1 then
    Wbullet(dt)
  end

  if bullettimer > 0 then
    bullettimer = bullettimer - 1
  end

  if love.keyboard.isDown ('space') then 
    love.exitModule();
  end

  cam:setPosition(x, y)

end

function love.draw()
  cam:draw(function(l, t, w, h)

  mapc:draw()

  love.graphics.print(bullettimer, x, y)
  
  DrawPlayer()
  DrawBullet()
  end)

end

