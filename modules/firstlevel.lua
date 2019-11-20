love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()  --33, 35
    x = 64
    y = 64

    spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
    grid = anim8.newGrid(66, 70, 600, 504)
    idledown = anim8.newAnimation(grid('1-1', 7), 0.4)
    idleup = anim8.newAnimation(grid('3-3', 7), 0.4)
    idlex = anim8.newAnimation(grid('5-5', 7), 0.4)

    anim = idledown
end

function love.update(dt)
    if love.keyboard.isDown('up') then
        anim = idleup
        FaceU = true
        FaceD = false
        FaceL = false
        FaceR = false
    end
    if love.keyboard.isDown('down') then
        anim = idledown
        FaceU = false
        FaceD = true
        FaceL = false
        FaceR = false
    end
    if love.keyboard.isDown('left') then
        anim = idlex
        FaceU = false
        FaceD = false
        FaceL = true
        FaceR = false
    end
    if love.keyboard.isDown('right') then
        anim = idlex
        FaceD = false
        FaceL = false
        FaceR = true
    end
end

function love.draw()
    if anim == idlex then
        if FaceR == true then
            idlex:draw(spritesheet, x, y)
        end
        if FaceL == true then
            idlex:draw(spritesheet, x, y, rotation, -1, 1, 16, 0)
        end
    end
    if anim == idleup then
        idleup:draw(spritesheet, x, y)
    end
    if anim == idledown then
        idledown:draw(spritesheet, x, y)
    end
end
