local Util = require 'core/util'
local class = require 'core/middleclass'
local anim8 = require 'core/anim8'


ball = class("ball")

  

function ball:constructor(bx, by) 
  self.img = love.graphics.newImage('assets-1/kfc.png')
  grid = anim8.newGrid(32, 32, 256, 256)
  rotate = anim8.newAnimation(grid('1-8', 1), 0.05125)
  self.x = bx 
  self.y = by 
  self.w = 32
  self.h = 32
  self.facing = 'UR'
  
end

function ball:update(dt)
  rotate:update(dt)
  if self.facing == 'UR' then
    self.y = self.y - 3 
    self.x = self.x + 3
  end
  if self.facing == 'UL' then
    self.y = self.y - 3 
    self.x = self.x - 3
  end
  if self.facing == 'DR' then
    self.y = self.y + 3 
    self.x = self.x + 3
  end
  if self.facing == 'DL' then
    self.y = self.y + 3 
    self.x = self.x - 3
  end
  
end

function ball:draw()
 
    rotate:draw(self.img, self.x, self.y)
  
end

return ball