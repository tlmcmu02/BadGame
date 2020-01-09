love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local Block = require 'core/block'
local class = require 'core/middleclass'
local Ball = require 'core/ball'
local Bullet = require 'core/bullet'

function love.load()

  PlayerLoad()
  
  Bullet1 = bullet:new(140, 140, 'S')
  


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
  Bullet1:update(dt)

  Music:play()


  if love.keyboard.isDown ('space') then 
    love.exitModule();
  end

  cam:setPosition(x, y)

end

function love.draw()
  cam:draw(function(l, t, w, h)
    Bullet1:draw()

  mapc:draw()


  
  DrawPlayer()

  end)

end

