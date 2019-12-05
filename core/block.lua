local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local class = require 'core/middleclass'

function BlockLoad()
ball = {
    img = love.graphics.newImage('assets-1/ups.png'),
    x = 64,
    y = 64,
    r = 0,
    s = 4,
}

blockcolor = {
    love.graphics.newImage('assets-1/blocks/block5.png'), 
    love.graphics.newImage('assets-1/blocks/block4.png'), 
    love.graphics.newImage('assets-1/blocks/block3.png'), 
    love.graphics.newImage('assets-1/blocks/block2.png'), 
    love.graphics.newImage('assets-1/blocks/block1.png')
  }
end

function Block1(dt)

end

function Block2(dt)

end

function Block3(dt)

end

function Block4(dt)

end

function Block5(dt)

end
Block = class('Block')

function Block:constructor(x, y) 
  self.img = love.graphics.newImage('assets-1/blocks/block5.png')
  self.x=x
  self.y=y
  self.e=0
  self.collide = true
end

function Block:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Block