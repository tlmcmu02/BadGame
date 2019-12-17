love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local class = require 'core/middleclass'

bullet = class("Bullet")

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
    by9 = by9 - 4.5
    bx9 = bx9 + 1.5
    spin:update(dt)
end

function NNWbullet(dt)
    by10 = by10 - 4.5
    bx10 = bx10 - 1.5
    spin:update(dt)
end

function SSEbullet(dt)
    by11 = by11 + 4.5
    bx11 = bx11 + 1.5
    spin:update(dt)
end

function SSWbullet(dt)
    by12 = by12 + 4.5
    bx12 = bx12 - 1.5
    spin:update(dt)
end

function NEEbullet(dt)
    by13 = by13 - 1.5
    bx13 = bx13 + 4.5
    spin:update(dt)
end

function NWWbullet(dt)
    by14 = by14 - 1.5
    bx14 = bx14 - 4.5
    spin:update(dt)
end

function SEEbullet(dt)
    by15 = by15 + 1.5
    bx15 = bx15 + 4.5
    spin:update(dt)
end

function SWWbullet(dt)
    by16 = by16 + 1.5
    bx16 = bx16 - 4.5
    spin:update(dt)
end

function bullet:constructor(bulletx, bullety, bulletd) 
    self.img = love.graphics.newImage('assets-1/kfc.png')
    grid = anim8.newGrid(16, 16, 256, 256)
    spin = anim8.newAnimation(grid('1-4', 3), 0.07)
    self.x = bulletx
    self.y = bullety
    self.direction = bulletd
    if self.direction == 'SWW' then
        self.y = self.y + 1.5
        self.x = self.x - 4.5
    end
    if self.direction == 'SEE' then
        self.y = self.y + 1.5
        self.x = self.x + 4.5
    end
    if self.direction == 'NWW' then
        self.y = self.y - 1.5
        self.x = self.x - 4.5
    end
    if self.direction == 'NEE' then
        self.y = self.y - 1.5
        self.x = self.x + 4.5
    end
    if self.direction == 'SSW' then
        self.y = self.y + 4.5
        self.x = self.x - 1.5
    end
    if self.direction == 'SSE' then
        self.y = self.y + 4.5
        self.x = self.x + 1.5
    end
    if self.direction == 'NNW' then
        self.y = self.y - 4.5
        self.x = self.x - 1.5
    end
    if self.direction == 'NNE' then
        self.y = self.y - 4.5
        self.x = self.x + 1.5
    end
    if self.direction == 'SW' then
        self.y = self.y + 3
        self.x = self.x - 3
    end
    if self.direction == 'SE' then
        self.y = self.y + 3
        self.x = self.x + 3
    end
    if self.direction == 'NW' then
        self.y = self.y - 3
        self.x = self.x - 3
    end
    if self.direction == 'NE' then
        self.y = self.y - 3
        self.x = self.x + 3
    end
    if self.direction == 'S' then
        self.y = self.y + 6
    end
    if self.direction == 'W' then
        self.x = self.x + 6
    end
    if self.direction == 'N' then
        self.y = self.y - 6
    end
    if self.direction == 'E' then
        self.x = self.x - 6
    end
end

function bullet:update(dt)
    spin:update(dt)
    if self.direction == 'SWW' then
        self.y = self.y + 1.5
        self.x = self.x - 4.5
    end
    if self.direction == 'SEE' then
        self.y = self.y + 1.5
        self.x = self.x + 4.5
    end
    if self.direction == 'NWW' then
        self.y = self.y - 1.5
        self.x = self.x - 4.5
    end
    if self.direction == 'NEE' then
        self.y = self.y - 1.5
        self.x = self.x + 4.5
    end
    if self.direction == 'SSW' then
        self.y = self.y + 4.5
        self.x = self.x - 1.5
    end
    if self.direction == 'SSE' then
        self.y = self.y + 4.5
        self.x = self.x + 1.5
    end
    if self.direction == 'NNW' then
        self.y = self.y - 4.5
        self.x = self.x - 1.5
    end
    if self.direction == 'NNE' then
        self.y = self.y - 4.5
        self.x = self.x + 1.5
    end
    if self.direction == 'SW' then
        self.y = self.y + 3
        self.x = self.x - 3
    end
    if self.direction == 'SE' then
        self.y = self.y + 3
        self.x = self.x + 3
    end
    if self.direction == 'NW' then
        self.y = self.y - 3
        self.x = self.x - 3
    end
    if self.direction == 'NE' then
        self.y = self.y - 3
        self.x = self.x + 3
    end
    if self.direction == 'S' then
        self.y = self.y + 6
    end
    if self.direction == 'W' then
        self.x = self.x + 6
    end
    if self.direction == 'N' then
        self.y = self.y - 6
    end
    if self.direction == 'E' then
        self.x = self.x - 6
        if FaceD == true then
            if animtimer == 24 or animtimer == 23 or animtimer == 22 then
                if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'S'
                end
            end
        end
    end
end

function bullet:draw()
    spin:draw(self.img, self.x, self.y)
end

return Bullet