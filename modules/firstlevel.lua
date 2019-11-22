love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()  --33, 35
    x = 64
    y = 64

    spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
    grid = anim8.newGrid(66, 68, 600, 504)
    walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
    walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
    walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
    idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
    idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
    idledown = anim8.newAnimation(grid('1-1', 1), 0.09)

    anim = walkdown
end

function love.update(dt)
    if love.keyboard.isDown('up') then
        FaceU = true
        FaceD = false
        FaceL = false
        FaceR = false
        walkup:update(dt)
        anim = walkup
    end
    if love.keyboard.isDown('down') then
        FaceU = false
        FaceD = true
        FaceL = false
        FaceR = false
        walkdown:update(dt)
        anim = walkdown
    end
    if love.keyboard.isDown('left') then
        FaceU = false
        FaceD = false
        FaceL = true
        FaceR = false
        walkx:update(dt)
        anim = walkx
    end
    if love.keyboard.isDown('right') then
        FaceU = false
        FaceD = false
        FaceL = false
        FaceR = true
        walkx:update(dt)
        anim = walkx
    end
    if love.keyboard.isDown('up') == false then
        if love.keyboard.isDown('down') == false then
            if love.keyboard.isDown('left') == false then
                if love.keyboard.isDown('right') == false then
                    if FaceU == true then
                        anim = idleup
                    end
                    if FaceD == true then
                        anim = idledown
                    end
                    if FaceL == true then
                        anim = idlex
                    end
                    if FaceR == true then
                        anim = idlex
                    end
                end
            end
        end
    end
end

function love.draw()
    if anim == walkx then
        if FaceR == true then
            walkx:draw(spritesheet, x, y)
        end
        if FaceL == true then
            walkx:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
        end
    end
    if anim == walkup then
        walkup:draw(spritesheet, x, y)
    end
    if anim == walkdown then
        walkdown:draw(spritesheet, x, y)
    end
    if anim == idleup then
        idleup:draw(spritesheet, x, y)
    end
    if anim == idledown then
        idledown:draw(spritesheet, x, y)
    end
    if anim == idlex then
        if FaceR == true then
            idlex:draw(spritesheet, x, y)
        end
        if FaceL == true then
            idlex:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
        end
    end
end
