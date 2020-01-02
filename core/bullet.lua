love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local class = require 'core/middleclass'

bullet = class("Bullet")

function bullet:constructor(bulletx, bullety, bulletd) 
    self.img = love.graphics.newImage('assets-1/kfc.png')
    grid = anim8.newGrid(16, 16, 256, 256)
    spin = anim8.newAnimation(grid('1-4', 3), 0.07)
    delete = anim8.newAnimation(grid('1-4', 4), 0.05)
    self.x = bulletx
    self.y = bullety
    self.direction = bulletd
    self.anim = spin
    self.animdeletetime = 16
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
        CR()
    end
    if self.direction == 'SEE' then
        self.y = self.y + 1.5
        self.x = self.x + 4.5
        CR()
    end
    if self.direction == 'NWW' then
        self.y = self.y - 1.5
        self.x = self.x - 4.5
        CR()
    end
    if self.direction == 'NEE' then
        self.y = self.y - 1.5
        self.x = self.x + 4.5
        CR()
    end
    if self.direction == 'SSW' then
        self.y = self.y + 4.5
        self.x = self.x - 1.5
        CR()
    end
    if self.direction == 'SSE' then
        self.y = self.y + 4.5
        self.x = self.x + 1.5
        CR()
    end
    if self.direction == 'NNW' then
        self.y = self.y - 4.5
        self.x = self.x - 1.5
        CR()
    end
    if self.direction == 'NNE' then
        self.y = self.y - 4.5
        self.x = self.x + 1.5
        CR()
    end
    if self.direction == 'SW' then
        if mapc:cc(self.x - 3, self.y + 3, 16, 16) == false then  
            self.y = self.y + 3
            self.x = self.x - 3
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'SE' then
        if mapc:cc(self.x + 3, self.y + 3, 16, 16) == false then  
            self.y = self.y + 3
            self.x = self.x + 3
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'NW' then
        if mapc:cc(self.x - 3, self.y - 3, 16, 16) == false then  
            self.y = self.y - 3
            self.x = self.x - 3
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'NE' then
        if mapc:cc(self.x + 3, self.y - 3, 16, 16) == false then  
            self.y = self.y - 3
            self.x = self.x + 3
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'S' then
        if mapc:cc(self.x, self.y + 6, 16, 16) == false then  
            self.y = self.y + 6
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'W' then
        if mapc:cc(self.x - 6, self.y, 16, 16) == false then  
            self.x = self.x - 6
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'N' then
        if mapc:cc(self.x, self.y - 6, 16, 16) == false then  
        self.y = self.y - 6
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end
    if self.direction == 'E' then
        if mapc:cc(self.x + 6, self.y, 16, 16) == false then  
            self.x = self.x + 6
        elseif cc(x + 16, y + 16, 32, 32, self.x, self.y, 16, 16) then
            Delete()
        else
            Delete()
        end
        CR()
    end

    function CR()
        if FaceD == true then
            if animtimer == 24 or animtimer == 23 or animtimer == 22 then
                if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'S'
                end
            end
            if animtimer == 21 or animtimer == 20 or animtimer == 19 then
                if cc(x + 4, y + 43, 13, 7, self.x, self.y, 16, 16) or cc(x + 4, y + 49, 34, 13, self.x, self.y, 16, 16) or cc(x + 18, y + 60, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'SE'
                end
            end
            if animtimer == 18 or animtimer == 17 or animtimer == 16 then
                if cc(x + 34, y + 47, 27, 16, self.x, self.y, 16, 16) or cc(x + 48, y + 41, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'E'
                end
            end
            if animtimer == 15 or animtimer == 14 or animtimer == 13 then
                if cc(x + 48, y + 41, 7, 13, self.x, self.y, 16, 16) or cc(x + 49, y + 28, 13, 34, self.x, self.y, 16, 16) or cc(x + 60, y + 28, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'NE'
                end
            end
            if animtimer == 12 or animtimer == 11 or animtimer == 10 then
                if cc(x + 49, y + 6, 16, 27, self.x, self.y, 16, 16) or cc(x + 43, y + 6, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'N'
                end
            end
            if animtimer == 9 or animtimer == 8 or animtimer == 7 then
                if cc(x + 49, y + 18, 13, 7, self.x, self.y, 16, 16) or cc(x + 28, y + 6, 34, 13, self.x, self.y, 16, 16) or cc(x + 28, y + 2, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'NW'
                end
            end
            if animtimer == 6 or animtimer == 5 or animtimer == 4 then
                if cc(x + 4, y + 4, 27, 16, self.x, self.y, 16, 16) or cc(x + 4, y + 19, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'W'
                end
            end
            if animtimer == 3 or animtimer == 2 or animtimer == 1 then
                if cc(x, y + 19, 7, 13, self.x, self.y, 16, 16) or cc(x + 4, y + 5, 13, 34, self.x, self.y, 16, 16) or cc(x + 15, y + 5, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'SW'
                end
            end
        end

        if FaceR == true then
            if animtimer == 6 or animtimer == 5 or animtimer == 4 then
                if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'S'
                end
            end
            if animtimer == 3 or animtimer == 2 or animtimer == 1 then
                if cc(x + 4, y + 43, 13, 7, self.x, self.y, 16, 16) or cc(x + 4, y + 49, 34, 13, self.x, self.y, 16, 16) or cc(x + 18, y + 60, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'SE'
                end
            end
            if animtimer == 24 or animtimer == 23 or animtimer == 22 then
                if cc(x + 34, y + 47, 27, 16, self.x, self.y, 16, 16) or cc(x + 48, y + 41, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'E'
                end
            end
            if animtimer == 21 or animtimer == 20 or animtimer == 19 then
                if cc(x + 48, y + 41, 7, 13, self.x, self.y, 16, 16) or cc(x + 49, y + 28, 13, 34, self.x, self.y, 16, 16) or cc(x + 60, y + 28, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'NE'
                end
            end
            if animtimer == 18 or animtimer == 17 or animtimer == 16 then
                if cc(x + 49, y + 6, 16, 27, self.x, self.y, 16, 16) or cc(x + 43, y + 6, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'N'
                end
            end
            if animtimer == 15 or animtimer == 14 or animtimer == 13 then
                if cc(x + 49, y + 18, 13, 7, self.x, self.y, 16, 16) or cc(x + 28, y + 6, 34, 13, self.x, self.y, 16, 16) or cc(x + 28, y + 2, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'NW'
                end
            end
            if animtimer == 12 or animtimer == 11 or animtimer == 10 then
                if cc(x + 4, y + 4, 27, 16, self.x, self.y, 16, 16) or cc(x + 4, y + 19, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'W'
                end
            end
            if animtimer == 9 or animtimer == 8 or animtimer == 7 then
                if cc(x, y + 19, 7, 13, self.x, self.y, 16, 16) or cc(x + 4, y + 5, 13, 34, self.x, self.y, 16, 16) or cc(x + 15, y + 5, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'SW'
                end
            end
        end

        if FaceU == true then
            if animtimer == 12 or animtimer == 11 or animtimer == 10 then
                if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'S'
                end
            end
            if animtimer == 9 or animtimer == 8 or animtimer == 7 then
                if cc(x + 4, y + 43, 13, 7, self.x, self.y, 16, 16) or cc(x + 4, y + 49, 34, 13, self.x, self.y, 16, 16) or cc(x + 18, y + 60, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'SE'
                end
            end
            if animtimer == 6 or animtimer == 5 or animtimer == 4 then
                if cc(x + 34, y + 47, 27, 16, self.x, self.y, 16, 16) or cc(x + 48, y + 41, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'E'
                end
            end
            if animtimer == 3 or animtimer == 2 or animtimer == 1 then
                if cc(x + 48, y + 41, 7, 13, self.x, self.y, 16, 16) or cc(x + 49, y + 28, 13, 34, self.x, self.y, 16, 16) or cc(x + 60, y + 28, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'NE'
                end
            end
            if animtimer == 24 or animtimer == 23 or animtimer == 22 then
                if cc(x + 49, y + 6, 16, 27, self.x, self.y, 16, 16) or cc(x + 43, y + 6, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'N'
                end
            end
            if animtimer == 21 or animtimer == 20 or animtimer == 19 then
                if cc(x + 49, y + 18, 13, 7, self.x, self.y, 16, 16) or cc(x + 28, y + 6, 34, 13, self.x, self.y, 16, 16) or cc(x + 28, y + 2, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'NW'
                end
            end
            if animtimer == 18 or animtimer == 17 or animtimer == 16 then
                if cc(x + 4, y + 4, 27, 16, self.x, self.y, 16, 16) or cc(x + 4, y + 19, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'W'
                end
            end
            if animtimer == 15 or animtimer == 14 or animtimer == 13 then
                if cc(x, y + 19, 7, 13, self.x, self.y, 16, 16) or cc(x + 4, y + 5, 13, 34, self.x, self.y, 16, 16) or cc(x + 15, y + 5, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'SW'
                end
            end
        end

        if FaceL == true then
            if animtimer == 18 or animtimer == 17 or animtimer == 16 then
                if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'S'
                end
            end
            if animtimer == 15 or animtimer == 14 or animtimer == 13 then
                if cc(x + 4, y + 43, 13, 7, self.x, self.y, 16, 16) or cc(x + 4, y + 49, 34, 13, self.x, self.y, 16, 16) or cc(x + 18, y + 60, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'SE'
                end
            end
            if animtimer == 12 or animtimer == 11 or animtimer == 10 then
                if cc(x + 34, y + 47, 27, 16, self.x, self.y, 16, 16) or cc(x + 48, y + 41, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'E'
                end
            end
            if animtimer == 9 or animtimer == 8 or animtimer == 7 then
                if cc(x + 48, y + 41, 7, 13, self.x, self.y, 16, 16) or cc(x + 49, y + 28, 13, 34, self.x, self.y, 16, 16) or cc(x + 60, y + 28, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'NE'
                end
            end
            if animtimer == 6 or animtimer == 5 or animtimer == 4 then
                if cc(x + 49, y + 6, 16, 27, self.x, self.y, 16, 16) or cc(x + 43, y + 6, 7, 12, self.x, self.y, 16, 16) then
                    self.direction = 'N'
                end
            end
            if animtimer == 3 or animtimer == 2 or animtimer == 1 then
                if cc(x + 49, y + 18, 13, 7, self.x, self.y, 16, 16) or cc(x + 28, y + 6, 34, 13, self.x, self.y, 16, 16) or cc(x + 28, y + 2, 20, 5, self.x, self.y, 16, 16) then
                    self.direction = 'NW'
                end
            end
            if animtimer == 24 or animtimer == 23 or animtimer == 22 then
                if cc(x + 4, y + 4, 27, 16, self.x, self.y, 16, 16) or cc(x + 4, y + 19, 12, 7, self.x, self.y, 16, 16) then
                    self.direction = 'W'
                end
            end
            if animtimer == 21 or animtimer == 20 or animtimer == 19 then
                if cc(x, y + 19, 7, 13, self.x, self.y, 16, 16) or cc(x + 4, y + 5, 13, 34, self.x, self.y, 16, 16) or cc(x + 15, y + 5, 5, 20, self.x, self.y, 16, 16) then
                    self.direction = 'SW'
                end
            end
        end

        --function Delete()
        --    self.anim = delete
        --    delete:update(dt)
        --    self.animdeletetime = 16
        --    if self.animdeletetime >= 0 then
        --        self.animdeletetime = self.animdeletetime - 1
        --    end
        --    if self.animdeletetime == -1 then
        --        self.x = nil
        --        self.y = nil
        --        self.direction = nil 
        --    end
        --end

    end

end

function bullet:draw()
    if self.anim == spin then
        spin:draw(self.img, self.x, self.y)
    end
    if self.anim == delete then
        delete:draw(self.img, self.x, self.y)
    end
end

--function Delete()
--    self.anim = delete
--    delete:update(dt)
--    self.animdeletetime = 16
--    if self.animdeletetime >= 0 then
--        self.animdeletetime = self.animdeletetime - 1
--    end
--    if self.animdeletetime == -1 then
--        self.x = nil
--        self.y = nil
--        self.direction = nil 
--    end
--end

function CR()
    if FaceD == true then
        if animtimer == 24 or animtimer == 23 or animtimer == 22 then
            if cc(x, y + 32, 16, 27, self.x, self.y, 16, 16) or cc(x + 16, y + 48, 7, 12, self.x, self.y, 16, 16) then
                self.direction = 'S'
            end
        end
        if animtimer == 21 or animtimer == 20 or animtimer == 19 then
            if cc(x + 4, y + 43, 13, 7, self.x, self.y, 16, 16) or cc(x + 4, y + 49, 34, 13, self.x, self.y, 16, 16) or cc(x + 18, y + 60, 20, 5, self.x, self.y, 16, 16) then
                self.direction = 'SE'
            end
        end
        if animtimer == 18 or animtimer == 17 or animtimer == 16 then
            if cc(x + 34, y + 47, 27, 16, self.x, self.y, 16, 16) or cc(x + 48, y + 41, 12, 7, self.x, self.y, 16, 16) then
                self.direction = 'E'
            end
        end
        if animtimer == 15 or animtimer == 14 or animtimer == 13 then
            if cc(x + 48, y + 41, 7, 13, self.x, self.y, 16, 16) or cc(x + 49, y + 28, 13, 34, self.x, self.y, 16, 16) or cc(x + 60, y + 28, 5, 20, self.x, self.y, 16, 16) then
                self.direction = 'NE'
            end
        end
        if animtimer == 12 or animtimer == 11 or animtimer == 10 then
            if cc(x + 49, y + 6, 16, 27, self.x, self.y, 16, 16) or cc(x + 43, y + 6, 7, 12, self.x, self.y, 16, 16) then
                self.direction = 'N'
            end
        end
    end
end

return Bullet