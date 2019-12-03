love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'

function BulletLoad()

    spritesheetbullet = love.graphics.newImage('assets-1/kfc.png')
    grid = anim8.newGrid(16, 16, 256, 256)
    spin = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin2 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin3 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin4 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin5 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin6 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin7 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin8 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin9 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin10 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin11 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin12 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin13 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin14 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin15 = anim8.newAnimation(grid('1-4', 3), 0.07)
    spin16 = anim8.newAnimation(grid('1-4', 3), 0.07)
    bx = 400
    by = 400
    bx2 = 400
    by2 = 400
    bx3 = 400
    by3 = 400
    bx4 = 400
    by4 = 400
    bx5 = 400
    by5 = 400
    bx6 = 400
    by6 = 400
    bx7 = 400
    by7 = 400
    bx8 = 400
    by8 = 400
    bx9 = 400
    by9 = 400
    bx10 = 400
    by10 = 400
    bx11 = 400
    by11 = 400
    bx12 = 400
    by12 = 400
    bx13 = 400
    by13 = 400
    bx14 = 400
    by14 = 400
    bx15 = 400
    by15 = 400
    bx16 = 400
    by16 = 400

end

function DetermineDistance(dt)
    left = x - bx
    right = bx - x
    down = y - by
    up = by - y
end

function Nbullet(dt)
    by = by - 6
    spin:update(dt)
end

function Ebullet(dt)
    bx2 = bx2 + 6
    spin:update(dt)
end

function Sbullet(dt)
    by3 = by3 + 6
    spin:update(dt)
end

function Wbullet(dt)
    bx4 = bx4 - 6
    spin:update(dt)
end

function NEbullet(dt)
    by5 = by5 - 3
    bx5 = bx5 + 3
    spin:update(dt)
end

function NWbullet(dt)
    by6 = by6 - 3
    bx6 = bx6 - 3
    spin:update(dt)
end

function SEbullet(dt)
    by7 = by7 + 3
    bx7 = bx7 + 3
    spin:update(dt)
end

function SWbullet(dt)
    by8 = by8 + 3
    bx8 = bx8 - 3
    spin:update(dt)
end

function NNEbullet(dt)
    by9 = by9 - 4
    bx9 = bx9 + 2
    spin:update(dt)
end

function NNWbullet(dt)
    by10 = by10 - 4
    bx10 = bx10 - 2
    spin:update(dt)
end

function SSEbullet(dt)
    by11 = by11 + 4
    bx11 = bx11 + 2
    spin:update(dt)
end

function SSWbullet(dt)
    by12 = by12 + 4
    bx12 = bx12 - 2
    spin:update(dt)
end

function NEEbullet(dt)
    by13 = by13 - 2
    bx13 = bx13 + 4
    spin:update(dt)
end

function NWWbullet(dt)
    by14 = by14 - 2
    bx14 = bx14 - 4
    spin:update(dt)
end

function SEEbullet(dt)
    by15 = by15 + 2
    bx15 = bx15 + 4
    spin:update(dt)
end

function SWWbullet(dt)
    by16 = by16 + 2
    bx16 = bx16 - 4
    spin:update(dt)
end

function DrawBullet()
    spin:draw(spritesheetbullet, bx, by)
    spin2:draw(spritesheetbullet, bx2, by2)
    spin3:draw(spritesheetbullet, bx3, by3)
    spin4:draw(spritesheetbullet, bx4, by4)
    spin5:draw(spritesheetbullet, bx5, by5)
    spin6:draw(spritesheetbullet, bx6, by6)
    spin7:draw(spritesheetbullet, bx7, by7)
    spin8:draw(spritesheetbullet, bx8, by8)
    spin9:draw(spritesheetbullet, bx9, by9)
    spin10:draw(spritesheetbullet, bx10, by10)
    spin11:draw(spritesheetbullet, bx11, by11)
    spin12:draw(spritesheetbullet, bx12, by12)
    spin13:draw(spritesheetbullet, bx13, by13)
    spin14:draw(spritesheetbullet, bx14, by14)
    spin15:draw(spritesheetbullet, bx15, by15)
    spin16:draw(spritesheetbullet, bx16, by16)
end