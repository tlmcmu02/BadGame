love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
player = {
        img = love.graphics.newImage('assets-1/player/hp_bar/heart.png'),
        x = 64,
        y  = 64,
        w = 10,
        h = 10,
        hp = 10,
        gp = 0,
        s = 4
}

ball = {
  img = love.graphics.newImage('assets-1/untitled.png'),
  x = 64,
  y = 64,
  r = 0,
  s = 4,
}




hpBar = {
    love.graphics.newImage('assets-1/player/hp_bar/0.png'),
    love.graphics.newImage('assets-1/player/hp_bar/1.png'),
    love.graphics.newImage('assets-1/player/hp_bar/2.png'),
    love.graphics.newImage('assets-1/player/hp_bar/3.png'),
    love.graphics.newImage('assets-1/player/hp_bar/4.png'),
    love.graphics.newImage('assets-1/player/hp_bar/5.png'),
    love.graphics.newImage('assets-1/player/hp_bar/6.png'),
    love.graphics.newImage('assets-1/player/hp_bar/7.png'),
    love.graphics.newImage('assets-1/player/hp_bar/8.png'),
    love.graphics.newImage('assets-1/player/hp_bar/9.png'),
    love.graphics.newImage('assets-1/player/hp_bar/10.png'),
  }

  w1 ='assets-1/transparent_wall.png'
  f = 'assets-1/frozen_0.png'

  background = {
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
  }
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
  }

  cam = gamera.new(0, 0, 832, 832) 
  
  map = Map:new(background)
  mapc = Map:new(layer1)

end

function love.update(dt)

    if love.keyboard.isDown('up' or 'w') then
        if mapc:cc(player.x , player.y - player.s, player.w, player.h) == false then
          player.y = player.y - player.s
        end
      end
      if love.keyboard.isDown('down' or 's') then
        if mapc:cc(player.x, player.y + player.s, player.w, player.h) == false then
          player.y = player.y + player.s
        end
      end
      if love.keyboard.isDown('right' or 'd') then
        if mapc:cc(player.x + player.s, player.y, player.w, player.h) == false then
          player.x = player.x + player.s
        end
      end
      if love.keyboard.isDown('left' or 'a') then
        if mapc:cc(player.x - player.s, player.y, player.w, player.h) == false then
          player.x = player.x - player.s
        end
      end
      
      cam:setPosition(player.x, player.y)

end

function love.draw()
    cam:draw(function(l, t, w, h)
        map:draw()
        mapc:draw()
        
        love.graphics.draw(ball.img, ball.x, ball.y)
        --walk:draw(spritesheet, 400, 300)
        love.graphics.draw(player.img, player.x , player.y )
        
        
        love.graphics.draw(hpBar[player.hp + 1], player.x -10, player.y - 20)
      end)


end
