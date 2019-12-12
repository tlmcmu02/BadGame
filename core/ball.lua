local Util = require 'core/util'
local class = require 'core/middleclass'
local anim8 = require 'core/anim8'

ball = class("ball")

  

function ball:constructor(bx, by) 
  self.img = love.graphics.newImage('assets-1/kfc.png')
  grid = anim8.newGrid(32, 32, 256, 256)
  rotate = anim8.newAnimation(grid('1-8', 1), 0.09)
  self.x = bx 
  self.y = by 
  self.w = 32
  self.h = 32
  
end

function ball:update()
rotate:update(dt)
end

function ball:draw()
 
    rotate:draw(self.img, self.x, self.y)
  
end

return ball