local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local class = require 'core/middleclass'
--function BlockLoad()
--ball = {
--    img = love.graphics.newImage('assets-1/ups.png'),
--    x = 64,
--    y = 64,
--    r = 0,
--    s = 4,
--}
--end
local Util = require 'core/util'
local class = require 'core/middleclass'

Block = class("Block")

color = {
  'assets-1/blocks/block5.png',
  'assets-1/blocks/block4.png',
  'assets-1/blocks/block3.png',
  'assets-1/blocks/block2.png',
  'assets-1/blocks/block1.png',
}

function Block:constructor(img, bx, by) 
  self.img = love.graphics.newImage(img)
  self.x = bx * 64
  self.y = by * 64
  self.w = 64
  self.h = 64
  self.destroyed = 0
  if dashattack == 0 then
  if cc(x + 16, y + 10, 32, 32, self.x, self.y, 64, 64) == false then
  self.upcollision = 0
  end
  end
  if dashattack == 1 then
  if cc(x + 16, y + 4, 32, 32, self.x, self.y, 64, 64) == false then
  self.updashcollision = 0
  end
  end
end

function Block:update(dt)
  if dashattack == 0 then
    if cc(x + 16, y + 10, 32, 32, self.x, self.y, 64, 64) == false then
    self.upcollision = 0
    end
    if cc(x + 16, y + 10, 32, 32, self.x, self.y, 64, 64) == true then
    self.upcollision = 1
    end
  end
  if dashattack == 1 then
    if cc(x + 16, y + 4, 32, 32, self.x, self.y, 64, 64) == false then
    self.updashcollision = 0
    end
    if cc(x + 16, y + 4, 32, 32, self.x, self.y, 64, 64) == true then
    self.updashcollision = 1
    end
  end
end

function Block:draw()
  if self.destroyed == 0 then
    love.graphics.draw(self.img, self.x, self.y)
  end
end

return Block