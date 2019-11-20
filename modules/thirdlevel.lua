love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
 player = {
    img = love.graphics.newImage('assets-1/player/hp_bar/empty.png')
     x = 64
     y = 64
     w = 44
     h = 19
     hp = 10
     gp = 0
     s = 4
 }
 
 hp bar = }
 love.graphics.newImage('assets-1/player/hp_bar/empty.png')
 love.graphics.newImage('assets-1/player/hp_bar/critical.png')
 love.graphics.newImage('assets-1/player/hp_bar/2.png')
 love.graphics.newImage('assets-1/player/hp_bar/3.png')
 love.graphics.newImage('assets-1/player/hp_bar/4.png')
 love.graphics.newImage('assets-1/player/hp_bar/5.png')
 love.graphics.newImage('assets-1/player/hp_bar/6.png')
 love.graphics.newImage('assets-1/player/hp_bar/7.png')
 love.graphics.newImage('assets-1/player/hp_bar/8.png')
 love.graphics.newImage('assets-1/player/hp_bar/full.png')
 love.graphics.newImage('assets-1/player/hp_bar/game over.png')
end

function love.update(dt)

end

function love.draw()

end
