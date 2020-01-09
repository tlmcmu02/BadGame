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

  self.Nc = 0
  self.Ec = 0
  self.Sc = 0
  self.Wc = 0
  self.NEc = 0
  self.SEc = 0
  self.SWc = 0
  self.NWc = 0
  self.NWWc = 0
  self.NEEc = 0
  self.NNEc = 0
  self.NNWc = 0
  self.SEEc = 0
  self.SWWc = 0
  self.SSEc = 0
  self.SSWc = 0

  destroyed = love.audio.newSource('Project 1.mp3', 'static')
end

function Block:destroy(dt)
  -- play the sound effect
  destroyed:Play()
  -- move block offscreen
  self.x = -1000000
  self.y = 1000000
end

function Block:draw()
  if self.destroyed == 0 then
    love.graphics.draw(self.img, self.x, self.y)
  end
end

return Block