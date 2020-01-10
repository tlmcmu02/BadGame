love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local class = require 'core/middleclass'

Bullet = class("Bullet")




function Bullet:constructor(bulletx, bullety, bulletd) 
    self.img = love.graphics.newImage('assets-1/kfc.png')
    local grid = anim8.newGrid(16, 16, 256, 256)
    local spin = anim8.newAnimation(grid('1-4', 3), 0.07)
    self.delete = anim8.newAnimation(grid('1-4', 4), 0.05)
    self.x = bulletx
    self.y = bullety
    self.direction = bulletd
    self.anim = spin
    self.animdeletetime = 16
    self.bounce = 0
    self.cool = 0
end


function Bullet:update(dt)
    self.anim:update(dt)  --run animation

    if self.direction == 'SWW' then
        if mapc:cc(self.x - 4.5, self.y + 1.5, 16, 16) == false then 
        self.y = self.y + 1.5
        self.x = self.x - 4.5
        else
            bulletreflect()
        end 
    end
    if self.direction == 'SEE' then
        if mapc:cc(self.x + 4.5, self.y + 1.5, 16, 16) == false then  
        self.y = self.y + 1.5
        self.x = self.x + 4.5  
        else
            bulletreflect()
        end 
    end
    if self.direction == 'NWW' then
        if mapc:cc(self.x - 4.5, self.y - 1.5, 16, 16) == false then 
        self.y = self.y - 1.5
        self.x = self.x - 4.5  
        else
            bulletreflect()
        end  
    end
    if self.direction == 'NEE' then
        if mapc:cc(self.x + 4.5, self.y - 1.5, 16, 16) == false then  
        self.y = self.y - 1.5
        self.x = self.x + 4.5  
        else
            bulletreflect()
        end  
    end
    if self.direction == 'SSW' then
        if mapc:cc(self.x - 1.5, self.y + 4.5, 16, 16) == false then  
        self.y = self.y + 4.5
        self.x = self.x - 1.5 
        else
            bulletreflect()
        end  
    end
    if self.direction == 'SSE' then
        if mapc:cc(self.x + 1.5, self.y + 4.5, 16, 16) == false then   
        self.y = self.y + 4.5
        self.x = self.x + 1.5
        else
            bulletreflect()
        end  
    end
    if self.direction == 'NNW' then
        if mapc:cc(self.x - 1.5, self.y - 4.5, 16, 16) == false then 
        self.y = self.y - 4.5
        self.x = self.x - 1.5  
        else
            bulletreflect()
        end  
    end
    if self.direction == 'NNE' then
        if mapc:cc(self.x + 1.5, self.y - 4.5, 16, 16) == false then 
        self.y = self.y - 4.5
        self.x = self.x + 1.5 
        else
            bulletreflect()
        end  
    end
    if self.direction == 'SW' then
        if mapc:cc(self.x - 3, self.y + 3, 16, 16) == false then   
        self.y = self.y + 3
        self.x = self.x - 3 
        else
            bulletreflect()
        end  
    end
    if self.direction == 'SE' then
        if mapc:cc(self.x + 3, self.y + 3, 16, 16) == false then  
        self.y = self.y + 3
        self.x = self.x + 3 
        else
            bulletreflect()
        end  
    end
    if self.direction == 'NW' then
        if mapc:cc(self.x - 3, self.y - 3, 16, 16) == false then  
        self.y = self.y - 3
        self.x = self.x - 3
        else
            bulletreflect()
        end  
    end
    if self.direction == 'NE' then
        if mapc:cc(self.x + 3, self.y - 3, 16, 16) == false then  
        self.y = self.y - 3
        self.x = self.x + 3  
        else
            bulletreflect()
        end  
    end
    if self.direction == 'S' then
        if mapc:cc(self.x, self.y + 6, 16, 16) == false then  
            self.y = self.y + 6  
        else
            bulletreflect()
        end   
    end
    if self.direction == 'W' then
        if mapc:cc(self.x - 6, self.y, 16, 16) == false then  
            self.x = self.x - 6 
        else
            bulletreflect()
        end    
    end
    if self.direction == 'N' then
        if mapc:cc(self.x, self.y - 6, 16, 16) == false then  
            self.y = self.y - 6
        else
            bulletreflect()
        end  
    end
    if self.direction == 'E' then
        if mapc:cc(self.x + 6, self.y, 16, 16) == false then  
            self.x = self.x + 6  
        else
            bulletreflect()
        end 
    end

end






function Bullet:setDelete()
    self.anim = self.delete
    if self.animdeletetime >= 0 then
        self.animdeletetime = self.animdeletetime - 1
    end
    if self.animdeletetime == -1 then
        -- move bullet offscreen
        self.x = -1000000
        self.y = 1000000
        self.direction = 'S'
    end
end

function Bullet:draw()
    self.anim:draw(self.img, self.x, self.y)
end

return Bullet