
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local Block = require 'core/block'
local Bullet = require 'core/bullet'
local class = require 'core/middleclass'

Player = class("Player")

function Player:constructor(x, y, level)


        self.swordswipe = false
        self.dashattack = 0
        self.momentum = 0
        
        self.spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
        local grid = anim8.newGrid(66, 68, 600, 1000)
        self.walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
        self.walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
        self.walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
        self.idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
        self.idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
        self.idledown = anim8.newAnimation(grid('1-1', 1), 0.09)
        self.sword = anim8.newAnimation(grid('1-8', 4), 0.05)
        self.dashup = anim8.newAnimation(grid('1-8', 8), 0.05125, endofdash)
        self.dashdown = anim8.newAnimation(grid('1-8', 7), 0.05125, endofdash)
        self.dashx = anim8.newAnimation(grid('1-8', 5), 0.05125, endofdash)
        self.anim = walkdown
        self.x = x
        self.y = y

        self.hpnum = 3
        self.timerIFrames = 0
        self.Iframes = 0
        self.lifelost = 0
        self.hitboxtimer = 0
        self.animtimer = 0
        self.cooldown = 0
        self.hitboxtimer2 = 0
        self.animtimer2 = 0
        self.cooldown2 = 0

        self.IFTrigger = false

    
end




function Player:update(dt) 
    if love.keyboard.isDown('x') then
        self.swordswipe = true       --trigger swordswipe
    end 
    if love.keyboard.isDown('z') then
        if self.momentum > 45 then  --if you have enough momentum
            self.dashattack = 1      --trigger dash attack
            self.hitbox2 = 1
        end
    end 
    if love.keyboard.isDown('up') then
        self.FaceU = true
        self.FaceD = false
        self.FaceL = false
        self.FaceR = false
        self.anim = self.walkup
        self.anim:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashup 
            if mapc:cc(self.x + 16 , self.y + 4, 32, 32) == false  then
                self.y = self.y - 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if mapc:cc(self.x + 16 , self.y + 10, 32, 32) == false  then
                self.y = self.y - 6
                self.momentum = self.momentum + 1
            end
        end
    end
    if love.keyboard.isDown('down') then
        self.FaceU = false
        self.FaceD = true
        self.FaceL = false
        self.FaceR = false
        self.anim = self.walkdown 
        self.anim:update(dt) 
        if self.dashattack == 1 then
            self.anim = self.dashdown 
            if mapc:cc(self.x + 16 , self.y + 28, 32, 32) == false then
                self.y = self.y + 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if mapc:cc(self.x + 16 , self.y + 22, 32, 32) == false then
                self.y = self.y + 6
                self.momentum = self.momentum + 1
            end
        end       
    end
    if love.keyboard.isDown('left') then
        self.FaceU = false
        self.FaceD = false
        self.FaceL = true
        self.FaceR = false
        self.anim = self.walkx
        self.anim:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashx
            if mapc:cc(self.x + 4, self.y + 16, 32, 32) == false then
                self.x = self.x - 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if mapc:cc(self.x + 10, self.y + 16, 32, 32) == false then
                self.x = self.x - 6
                self.momentum = self.momentum + 1
            end
        end
    end
    if love.keyboard.isDown('right') then
        self.FaceU = false
        self.FaceD = false
        self.FaceL = false
        self.FaceR = true
        self.anim = self.walkx
        self.anim:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashx
            if mapc:cc(self.x + 28, self.y + 16, 32, 32) == false  then
                self.x = x + 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if mapc:cc(self.x + 22, self.y + 16, 32, 32) == false then
                self.x = self.x + 6
                self.momentum = self.momentum + 1
            end
        end
    end
    if self.swordswipe == true then
        if self.cooldown == 0 then
            self.sword:update(dt)
            if self.hitbox == 0 then
                self.hitbox = 1
          end
        end
    end
    if self.animtimer == 1 or self.animtimer == 0 then
        if love.keyboard.isDown('up') == false then
            if love.keyboard.isDown('down') == false then
                if love.keyboard.isDown('left') == false then
                    if love.keyboard.isDown('right') == false then
                        self.momentum = 0
                        if self.FaceU == true then
                            self.anim = self.idleup
                        end
                        if self.FaceD == true then
                            self.anim = self.idledown
                        end
                        if self.FaceL == true then
                            self.anim = self.idlex
                        end
                        if self.FaceR == true then
                            self.anim = self.idlex
                        end
                    end
                end
            end
        end
    end
    if self.animtimer == 1 or self.animtimer == 0 then
        if self.FaceU == true then
            self.sword:gotoFrame(6)
        end
        if self.FaceD == true then
            self.sword:gotoFrame(2)
        end
        if self.FaceL == true then
            self.sword:gotoFrame(8)
        end
        if self.FaceR == true then
            self.sword:gotoFrame(4)
        end
    end
    if self.hitbox == 1 then
        self.hitboxtimer = 24
        self.animtimer = 24
    end
    if self.hitboxtimer > 0 then
        self.hitboxtimer = self.hitboxtimer - 1
        self.hitbox = 2
        self.anim = self.sword
    end
    if self.animtimer > 0 then
        self.animtimer = self.animtimer - 1
    end
    if self.hitboxtimer == 0 then
        self.hitbox = 0
        self.swordswipe = 0
    end
    if self.hitboxtimer == 1 then
        self.cooldown = 16
    end
    if self.cooldown > 0 then
        self.cooldown = self.cooldown - 1
    end
    
    if self.hitbox2 == 1 then
        self.hitboxtimer2 = 30
        self.animtimer2 = 30
    end
    if self.hitboxtimer2 > 0 then
        self.hitboxtimer2 = self.hitboxtimer2 - 1
        self.hitbox2 = 2
        self.dashattack = 1
    end
    if self.animtimer2 > 0 then
        self.animtimer2 = self.animtimer2 - 1
    end
    if self.hitboxtimer2 == 0 then
        self.hitbox2 = 0
        self.dashattack = 0
    end
    if self.hitboxtimer2 == 1 then
      self.cooldown2 = 16
    end
    if self.cooldown2 > 0 then
        self.cooldown2 = self.cooldown2 - 1
    end
end

function Player:IFrames()
    self.IFTrigger = true
    if self.Iframes == 0 then
        self.hpnum = self.hpnum - 1
        if self.Iframes == 0 then
            self.Iframes = 1
        end
    end
    if self.Iframes == 1 then
        self.timerIFrames = 60
    end
    if self.hpnum == 0 then
        self.lifelost = 1
    end
end

























































function Player:breakoutupdate(dt)
    if love.keyboard.isDown('x') then
        self.swordswipe = true
    end 
    if love.keyboard.isDown('z') then
        if self.momentum > 45 then
            self.dashattack = 1
            self.hitbox2 = 1
        end
    end 
    if love.keyboard.isDown('up') then
        self.FaceU = true
        self.FaceD = false
        self.FaceL = false
        self.FaceR = false
        self.anim = self.walkup
        self.anim:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashup
            --if updashcc() == true then
                self.y = self.y - 12
                self.momentum = self.momentum - 2
            --end
        end
        if self.dashattack == 0 then
            --if upcc() == true then
                self.y = self.y - 6
                self.momentum = self.momentum + 1
            --end
        end
    end
    if love.keyboard.isDown('down') then
        self.FaceU = false
        self.FaceD = true
        self.FaceL = false
        self.FaceR = false
        self.anim = self.walkdown 
        self.walkdown:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashdown 
            if downdashcc() == true then
                self.y = self.y + 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            --if downcc() == true then
                self.y = self.y + 6
                self.momentum = self.momentum + 1
            --end
        end       
    end
    if love.keyboard.isDown('left') then
        self.FaceU = false
        self.FaceD = false
        self.FaceL = true
        self.FaceR = false
        self.anim = self.walkx
        self.walkx:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashx
            if leftdashcc() == true then
                self.x = self.x - 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if leftcc() == true then
                self.x = self.x - 6
                self.momentum = self.momentum + 1
            end
        end
    end
    if love.keyboard.isDown('right') then
        self.FaceU = false
        self.FaceD = false
        self.FaceL = false
        self.FaceR = true
        self.anim = self.walkx
        self.walkx:update(dt)
        if self.dashattack == 1 then
            self.anim = self.dashx
            if rightdashcc() == true then
                self.x = self.x + 12
                self.momentum = self.momentum - 2
            end
        end
        if self.dashattack == 0 then
            if rightcc() == true then
                self.x = self.x + 6
                self.momentum = self.momentum + 1
            end
        end
    end
    if self.swordswipe == true then
        if self.cooldown == 0 then
            self.sword:update(dt)
            if self.hitbox == 0 then
                self.hitbox = 1
                self.timerIFrames = 25
          end
        end
    end
    if self.animtimer == 1 or self.animtimer == 0 then
        if love.keyboard.isDown('up') == false then
            if love.keyboard.isDown('down') == false then
                if love.keyboard.isDown('left') == false then
                    if love.keyboard.isDown('right') == false then
                        self.momentum = 0
                        if self.FaceU == true then
                            self.anim = self.idleup
                        end
                        if self.FaceD == true then
                            self.anim = self.idledown
                        end
                        if self.FaceL == true then
                            self.anim = self.idlex
                        end
                        if self.FaceR == true then
                            self.anim = self.idlex
                        end
                    end
                end
            end
        end
    end
    if self.animtimer == 1 or self.animtimer == 0 then
        if self.FaceU == true then
            self.sword:gotoFrame(6)
        end
        if self.FaceD == true then
            self.sword:gotoFrame(2)
        end
        if self.FaceL == true then
            self.sword:gotoFrame(8)
        end
        if self.FaceR == true then
            self.sword:gotoFrame(4)
        end
    end
    if self.hitbox == 1 then
        self.hitboxtimer = 24
        self.animtimer = 24
    end
    if self.hitboxtimer > 0 then
        self.hitboxtimer = self.hitboxtimer - 1
        self.hitbox = 2
        self.anim = self.sword
    end
    if self.animtimer > 0 then
        self.animtimer = self.animtimer - 1
    end
    if self.hitboxtimer == 0 then
        self.hitbox = 0
        self.swordswipe = 0
    end
    if self.hitboxtimer == 1 then
        self.cooldown = 16
    end
    if self.cooldown > 0 then
        self.cooldown = self.cooldown - 1
    end
    
    if self.hitbox2 == 1 then
        self.hitboxtimer2 = 30
        self.animtimer2 = 30
    end
    if self.hitboxtimer2 > 0 then
        self.hitboxtimer2 = self.hitboxtimer2 - 1
        self.hitbox2 = 2
        self.dashattack = 1
    end
    if self.animtimer2 > 0 then
        self.animtimer2 = self.animtimer2 - 1
    end
    if self.hitboxtimer2 == 0 then
        self.hitbox2 = 0
        self.dashattack = 0
    end
    if self.hitboxtimer2 == 1 then
        self.cooldown2 = 16
    end
    if self.cooldown2 > 0 then
        self.cooldown2 = self.cooldown2 - 1
    end
end
--blipblop







function Player:Draw()
    if self.IFTrigger == false then
        if self.timerIFrames == 1 or self.timerIFrames == 2 or self.timerIFrames == 3 or self.timerIFrames == 4 or self.timerIFrames == 5 or self.timerIFrames == 6 or self.timerIFrames == 7 or self.timerIFrames == 8 or self.timerIFrames == 9 or self.timerIFrames == 10 or self.timerIFrames == 11 or self.timerIFrames == 12 or self.timerIFrames == 13 or self.timerIFrames == 14 or self.timerIFrames == 15 or self.timerIFrames == 16 or self.timerIFrames == 17 or self.timerIFrames == 21 or self.timerIFrames == 22 or self.timerIFrames == 23 or self.timerIFrames == 24 or self.timerIFrames == 25 or self.timerIFrames == 26 or self.timerIFrames == 27 or self.timerIFrames == 28 or self.timerIFrames == 29 or self.timerIFrames == 30 or self.timerIFrames == 31 or self.timerIFrames == 32 or self.timerIFrames == 33 or self.timerIFrames == 34 or self.timerIFrames == 35 or self.timerIFrames == 36 or self.timerIFrames == 37 or self.timerIFrames == 40 or self.timerIFrames == 41 or self.timerIFrames == 42 or self.timerIFrames == 43 or self.timerIFrames == 44 or self.timerIFrames == 45 or self.timerIFrames == 46 or self.timerIFrames == 47 or self.timerIFrames == 48 or self.timerIFrames == 49 or self.timerIFrames == 50 or self.timerIFrames == 51 or self.timerIFrames == 52 or self.timerIFrames == 53 or self.timerIFrames == 54 or self.timerIFrames == 55 or self.timerIFrames == 56 or self.timerIFrames == 57 or self.timerIFrames == 0 then
    end
    if self.anim == self.walkx then
        if self.FaceR == true then
            self.walkx:draw(self.spritesheet, self.x, self.y)
        end
        if self.FaceL == true then
            self.walkx:draw(self.spritesheet, self.x, self.y, rotation, -1, 1, 64, 0)
        end
    end
    if self.anim == self.walkup then
        self.walkup:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.walkdown then
        self.walkdown:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.idleup then
        self.idleup:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.idledown then
        self.idledown:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.idlex then
        if self.FaceR == true then
            self.idlex:draw(self.spritesheet, self.x, self.y)
        end
        if self.FaceL == true then
            self.idlex:draw(self.spritesheet, self.x, self.y, rotation, -1, 1, 64, 0)
        end
    end
    if self.anim == self.sword then
        self.sword:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.dashup then
        self.dashup:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.dashdown then
        self.dashdown:draw(self.spritesheet, self.x, self.y)
    end
    if self.anim == self.dashx then
        if self.FaceR == true then
            self.dashx:draw(self.spritesheet, self.x, self.y)
        end
        if self.FaceL == true then
            self.dashx:draw(self.spritesheet, self.x, self.y, rotation, -1, 1, 64, 0)
        end
    end
    if self.IFTrigger == false then
        end
    end
end

function DrawbreakoutPlayer()
    if timerIFrames == 1 or timerIFrames == 2 or timerIFrames == 3 or timerIFrames == 4 or timerIFrames == 5 or timerIFrames == 6 or timerIFrames == 7 or timerIFrames == 8 or timerIFrames == 9 or timerIFrames == 10 or timerIFrames == 11 or timerIFrames == 12 or timerIFrames == 13 or timerIFrames == 14 or timerIFrames == 15 or timerIFrames == 16 or timerIFrames == 17 or timerIFrames == 21 or timerIFrames == 22 or timerIFrames == 23 or timerIFrames == 24 or timerIFrames == 25 or timerIFrames == 26 or timerIFrames == 27 or timerIFrames == 28 or timerIFrames == 29 or timerIFrames == 30 or timerIFrames == 31 or timerIFrames == 32 or timerIFrames == 33 or timerIFrames == 34 or timerIFrames == 35 or timerIFrames == 36 or timerIFrames == 37 or timerIFrames == 40 or timerIFrames == 41 or timerIFrames == 42 or timerIFrames == 43 or timerIFrames == 44 or timerIFrames == 45 or timerIFrames == 46 or timerIFrames == 47 or timerIFrames == 48 or timerIFrames == 49 or timerIFrames == 50 or timerIFrames == 51 or timerIFrames == 52 or timerIFrames == 53 or timerIFrames == 54 or timerIFrames == 55 or timerIFrames == 56 or timerIFrames == 57 or timerIFrames == 0 then
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

    if anim == sword then
        sword:draw(spritesheet, x, y)
    end

    if anim == dashup then
        dashup:draw(spritesheet, x, y)
    end
    if anim == dashdown then
        dashdown:draw(spritesheet, x, y)
    end
    if anim == dashx then
        if FaceR == true then
            dashx:draw(spritesheet, x, y)
        end
        if FaceL == true then
            dashx:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
        end
    end
end
for i = 1, 5 do
    for t = 1, 10 do
    block[i][t]:draw()
    end
end 
end

return Player