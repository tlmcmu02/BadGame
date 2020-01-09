local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local class = require 'core/middleclass'
local ball = require 'core/ball'

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
  self.upcollision = 0
  self.updashcollision = 0
  self.leftcollision = 0
  self.leftdashcollision = 0
  self.downcollision = 0
  self.downdashcollision = 0
  self.rightcollision = 0
  self.rightdashcollision = 0
  destroyed = love.audio.newSource('Project 1.mp3', 'static')
end

function Block:destroy(dt)
  destroyed:Play()
end

function Block:draw()
  if self.destroyed == 0 then
    love.graphics.draw(self.img, self.x, self.y)
  end
end

return Block