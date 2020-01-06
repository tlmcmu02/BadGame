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
  
PlayerbreakoutLoad()
Bullet1 = bullet:new(140, 140, 'S')

ball1 = ball:new(64, 500)

hpBar = {
    love.graphics.newImage('assets-1/player/hp_bar/0.png'),
    love.graphics.newImage('assets-1/player/hp_bar/1.png'),
    love.graphics.newImage('assets-1/player/hp_bar/2.png'),
    love.graphics.newImage('assets-1/player/hp_bar/3.png'),
  }

  w1 ='assets-1/wall/transparent_wall.png'
  f = 'assets-1/wall/frozen_0.png'

  
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, },
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, },
  }

  cam = gamera.new(0, 0, 768, 768) 
  
  
  mapc = Map:new(layer1)

end

function love.update(dt)

  
  ball1:update(dt)
  Bullet1:update(dt)

  if timerIFrames > 0 then
    timerIFrames = timerIFrames - 1
    Iframes = 2
end
if timerIFrames < 1 then
    timerIFrames = 0
    Iframes = 0
end

  enginebreakoutupdate(dt)
  if lifelost == 1 then
    lives = lives - 1
    x = 128
    y = 500
    hpnum = 3
    timerIFrames = 120
    Iframes = 0
    lifelost = 0
  end



  cam:setPosition(x, y)

end

function love.draw()
    cam:draw(function(l, t, w, h)
        
        mapc:draw()
        ball1:draw()
       
        DrawbreakoutPlayer()
        Bullet1:draw()
       
        

        love.graphics.print(Iframes, x, y)

        
        
      end)
      
if hpnum == 3 then
  love.graphics.draw(hpBar[4], 16, 32, 6, 3)
end
if hpnum == 2 then
  love.graphics.draw(hpBar[3], 16, 32, 6, 3)
end
if hpnum == 1 then
  love.graphics.draw(hpBar[2], 16, 32, 6, 3)
end

end

function endofdash()
  dashattack = 0
end





