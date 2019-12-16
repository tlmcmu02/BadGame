
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local Block = require 'core/block'
local Bullet = require 'core/bullet'
local class = require 'core/middleclass'

function PlayerLoad()


        swordswipe = false
        dashattack = 0
        momentum = 0
        
        spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
        grid = anim8.newGrid(66, 68, 600, 1000)
        walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
        walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
        walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
        idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
        idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
        idledown = anim8.newAnimation(grid('1-1', 1), 0.09)
        sword = anim8.newAnimation(grid('1-8', 4), 0.05)
        dashup = anim8.newAnimation(grid('1-8', 8), 0.05125, endofdash)
        dashdown = anim8.newAnimation(grid('1-8', 7), 0.05125, endofdash)
        dashx = anim8.newAnimation(grid('1-8', 5), 0.05125, endofdash)
        anim = walkdown
        x = 128
        y = 386

        hpnum = 10
        timerIFrames = 0
        Iframes = 0
        lifelost = 0
        hitboxtimer = 0
        animtimer = 0
        cooldown = 0
        hitboxtimer2 = 0
        animtimer2 = 0
        cooldown2 = 0

    
end

function PlayerbreakoutLoad()


    swordswipe = false
    dashattack = 0
    momentum = 0
    
    spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
    grid = anim8.newGrid(66, 68, 600, 1000)
    walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
    walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
    walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
    idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
    idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
    idledown = anim8.newAnimation(grid('1-1', 1), 0.09)
    sword = anim8.newAnimation(grid('1-8', 4), 0.05)
    dashup = anim8.newAnimation(grid('1-8', 8), 0.05125, endofdash)
    dashdown = anim8.newAnimation(grid('1-8', 7), 0.05125, endofdash)
    dashx = anim8.newAnimation(grid('1-8', 5), 0.05125, endofdash)
    anim = walkdown
    x = 128
    y = 386

    hpnum = 10
    timerIFrames = 0
    Iframes = 0
    lifelost = 0
    hitboxtimer = 0
    animtimer = 0
    cooldown = 0
    hitboxtimer2 = 0
    animtimer2 = 0
    cooldown2 = 0

    block = {}
    for i = 1, 5 do
        block[i] = {}
    for t = 1, 10 do
        block[i][t] = Block:new(color[i], t, i + 1)
    end
    end

end




































function engineupdate(dt)
    if love.keyboard.isDown('x') then
        swordswipe = true
    end 
    if love.keyboard.isDown('z') then
        if momentum > 45 then
            dashattack = 1
            hitbox2 = 1
        end
    end 
    if love.keyboard.isDown('up') then
        FaceU = true
        FaceD = false
        FaceL = false
        FaceR = false
        walkup:update(dt)
        anim = walkup
        if dashattack == 1 then
            anim = dashup 
            if mapc:cc(x + 16 , y + 4, 32, 32) == false  then
                y = y - 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 16 , y + 10, 32, 32) == false  then
                y = y - 6
                momentum = momentum + 1
            end
        end
    end
    if love.keyboard.isDown('down') then
        FaceU = false
        FaceD = true
        FaceL = false
        FaceR = false
        walkdown:update(dt)
        anim = walkdown  
        if dashattack == 1 then
            anim = dashdown 
            if mapc:cc(x + 16 , y + 28, 32, 32) == false then
                y = y + 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 16 , y + 22, 32, 32) == false then
                y = y + 6
                momentum = momentum + 1
            end
        end       
    end
    if love.keyboard.isDown('left') then
        FaceU = false
        FaceD = false
        FaceL = true
        FaceR = false
        walkx:update(dt)
        anim = walkx
        if dashattack == 1 then
            anim = dashx
            if mapc:cc(x + 4, y + 16, 32, 32) == false then
                x = x - 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 10, y + 16, 32, 32) == false then
                x = x - 6
                momentum = momentum + 1
            end
        end
    end
    if love.keyboard.isDown('right') then
        FaceU = false
        FaceD = false
        FaceL = false
        FaceR = true
        walkx:update(dt)
        anim = walkx
        if dashattack == 1 then
            anim = dashx
            if mapc:cc(x + 28, y + 16, 32, 32) == false  then
                x = x + 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 22, y + 16, 32, 32) == false then
                x = x + 6
                momentum = momentum + 1
            end
        end
    end
    if swordswipe == true then
        if cooldown == 0 then
            sword:update(dt)
            if hitbox == 0 then
            hitbox = 1
          end
        end
    end
    if animtimer == 1 or animtimer == 0 then
        if love.keyboard.isDown('up') == false then
            if love.keyboard.isDown('down') == false then
                if love.keyboard.isDown('left') == false then
                    if love.keyboard.isDown('right') == false then
                        momentum = 0
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
    if animtimer == 1 or animtimer == 0 then
        if FaceU == true then
            sword:gotoFrame(6)
        end
        if FaceD == true then
            sword:gotoFrame(2)
        end
        if FaceL == true then
            sword:gotoFrame(8)
        end
        if FaceR == true then
            sword:gotoFrame(4)
        end
    end
    if hitbox == 1 then
      hitboxtimer = 24
      animtimer = 24
    end
    if hitboxtimer > 0 then
      hitboxtimer = hitboxtimer - 1
      hitbox = 2
      anim = sword
    end
    if animtimer > 0 then
      animtimer = animtimer - 1
    end
    if hitboxtimer == 0 then
      hitbox = 0
      swordswipe = 0
    end
    if hitboxtimer == 1 then
      cooldown = 16
    end
    if cooldown > 0 then
      cooldown = cooldown - 1
    end
    
    if hitbox2 == 1 then
      hitboxtimer2 = 30
      animtimer2 = 30
    end
    if hitboxtimer2 > 0 then
      hitboxtimer2 = hitboxtimer2 - 1
      hitbox2 = 2
      dashattack = 1
    end
    if animtimer2 > 0 then
      animtimer2 = animtimer2 - 1
    end
    if hitboxtimer2 == 0 then
      hitbox2 = 0
      dashattack = 0
    end
    if hitboxtimer2 == 1 then
      cooldown2 = 16
    end
    if cooldown2 > 0 then
      cooldown2 = cooldown2 - 1
    end
end

function Iframes()
    
      if Iframes == 1 then
        timerIFrames = 60
      end
      if timerIFrames > 0 then
       timerIFrames = timerIFrames - 1
       Iframes = 2
      end
      if timerIFrames < 1 then
        timerIFrames = 0
        Iframes = 0
      end
      if hpnum == 0 then
        lifelost = 1
      end

end

























































function enginebreakoutupdate(dt)
    if love.keyboard.isDown('x') then
        swordswipe = true
    end 
    if love.keyboard.isDown('z') then
        if momentum > 45 then
            dashattack = 1
            hitbox2 = 1
        end
    end 
    if love.keyboard.isDown('up') then
        FaceU = true
        FaceD = false
        FaceL = false
        FaceR = false
        walkup:update(dt)
        anim = walkup

        if dashattack == 1 then
            anim = dashup
            if mapc:cc(x + 16 , y + 4, 32, 32) == false then   
                if block[1][1].upcollision == 0 then
                if block[1][2].upcollision == 0 then
                if block[1][3].upcollision == 0 then
                if block[1][4].upcollision == 0 then
                if block[1][5].upcollision == 0 then
                if block[1][6].upcollision == 0 then
                if block[1][7].upcollision == 0 then
                if block[1][8].upcollision == 0 then
                if block[1][9].upcollision == 0 then
                if block[1][10].upcollision == 0 then
                if block[2][1].upcollision == 0 then
                if block[2][2].upcollision == 0 then
                if block[2][3].upcollision == 0 then
                if block[2][4].upcollision == 0 then
                if block[2][5].upcollision == 0 then
                if block[2][6].upcollision == 0 then
                if block[2][7].upcollision == 0 then
                if block[2][8].upcollision == 0 then
                if block[2][9].upcollision == 0 then
                if block[2][10].upcollision == 0 then
                if block[3][1].upcollision == 0 then
                if block[3][2].upcollision == 0 then
                if block[3][3].upcollision == 0 then
                if block[3][4].upcollision == 0 then
                if block[3][5].upcollision == 0 then
                if block[3][6].upcollision == 0 then
                if block[3][7].upcollision == 0 then
                if block[3][8].upcollision == 0 then
                if block[3][9].upcollision == 0 then
                if block[3][10].upcollision == 0 then
                if block[4][1].upcollision == 0 then
                if block[4][2].upcollision == 0 then
                if block[4][3].upcollision == 0 then
                if block[4][4].upcollision == 0 then
                if block[4][5].upcollision == 0 then
                if block[4][6].upcollision == 0 then
                if block[4][7].upcollision == 0 then
                if block[4][8].upcollision == 0 then
                if block[4][9].upcollision == 0 then
                if block[4][10].upcollision == 0 then
                if block[5][1].upcollision == 0 then
                if block[5][2].upcollision == 0 then
                if block[5][3].upcollision == 0 then
                if block[5][4].upcollision == 0 then
                if block[5][5].upcollision == 0 then
                if block[5][6].upcollision == 0 then
                if block[5][7].upcollision == 0 then
                if block[5][8].upcollision == 0 then
                if block[5][9].upcollision == 0 then
                if block[5][10].upcollision == 0 then
                    y = y - 12
                    momentum = momentum - 2
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end         
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 16 , y + 10, 32, 32) == false then   
                for i = 1, 5 do
                    for t = 1, 10 do
                        block[i][t]:update(dt)
                    end
                end 
                if block[1][1].upcollision == 0 then
                if block[1][2].upcollision == 0 then
                if block[1][3].upcollision == 0 then
                if block[1][4].upcollision == 0 then
                if block[1][5].upcollision == 0 then
                if block[1][6].upcollision == 0 then
                if block[1][7].upcollision == 0 then
                if block[1][8].upcollision == 0 then
                if block[1][9].upcollision == 0 then
                if block[1][10].upcollision == 0 then
                if block[2][1].upcollision == 0 then
                if block[2][2].upcollision == 0 then
                if block[2][3].upcollision == 0 then
                if block[2][4].upcollision == 0 then
                if block[2][5].upcollision == 0 then
                if block[2][6].upcollision == 0 then
                if block[2][7].upcollision == 0 then
                if block[2][8].upcollision == 0 then
                if block[2][9].upcollision == 0 then
                if block[2][10].upcollision == 0 then
                if block[3][1].upcollision == 0 then
                if block[3][2].upcollision == 0 then
                if block[3][3].upcollision == 0 then
                if block[3][4].upcollision == 0 then
                if block[3][5].upcollision == 0 then
                if block[3][6].upcollision == 0 then
                if block[3][7].upcollision == 0 then
                if block[3][8].upcollision == 0 then
                if block[3][9].upcollision == 0 then
                if block[3][10].upcollision == 0 then
                if block[4][1].upcollision == 0 then
                if block[4][2].upcollision == 0 then
                if block[4][3].upcollision == 0 then
                if block[4][4].upcollision == 0 then
                if block[4][5].upcollision == 0 then
                if block[4][6].upcollision == 0 then
                if block[4][7].upcollision == 0 then
                if block[4][8].upcollision == 0 then
                if block[4][9].upcollision == 0 then
                if block[4][10].upcollision == 0 then
                if block[5][1].upcollision == 0 then
                if block[5][2].upcollision == 0 then
                if block[5][3].upcollision == 0 then
                if block[5][4].upcollision == 0 then
                if block[5][5].upcollision == 0 then
                if block[5][6].upcollision == 0 then
                if block[5][7].upcollision == 0 then
                if block[5][8].upcollision == 0 then
                if block[5][9].upcollision == 0 then
                if block[5][10].upcollision == 0 then
                    y = y - 6
                    momentum = momentum + 1
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end     
                end
                end
                end
                end
                end
                end
                end
                end
            end
        end
    end
    if love.keyboard.isDown('down') then
        FaceU = false
        FaceD = true
        FaceL = false
        FaceR = false
        walkdown:update(dt)
        anim = walkdown  
        if dashattack == 1 then
            anim = dashdown 
            if mapc:cc(x + 16 , y + 28, 32, 32) == false then
                y = y + 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 16 , y + 22, 32, 32) == false then
                y = y + 6
                momentum = momentum + 1
            end
        end       
    end
    if love.keyboard.isDown('left') then
        FaceU = false
        FaceD = false
        FaceL = true
        FaceR = false
        walkx:update(dt)
        anim = walkx
        if dashattack == 1 then
            anim = dashx
            if mapc:cc(x + 4, y + 16, 32, 32) == false then
                x = x - 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 10, y + 16, 32, 32) == false then
                x = x - 6
                momentum = momentum + 1
            end
        end
    end
    if love.keyboard.isDown('right') then
        FaceU = false
        FaceD = false
        FaceL = false
        FaceR = true
        walkx:update(dt)
        anim = walkx
        if dashattack == 1 then
            anim = dashx
            if mapc:cc(x + 28, y + 16, 32, 32) == false  then
                x = x + 12
                momentum = momentum - 2
            end
        end
        if dashattack == 0 then
            if mapc:cc(x + 22, y + 16, 32, 32) == false then
                x = x + 6
                momentum = momentum + 1
            end
        end
    end
    if swordswipe == true then
        if cooldown == 0 then
            sword:update(dt)
            if hitbox == 0 then
            hitbox = 1
          end
        end
    end
    if animtimer == 1 or animtimer == 0 then
        if love.keyboard.isDown('up') == false then
            if love.keyboard.isDown('down') == false then
                if love.keyboard.isDown('left') == false then
                    if love.keyboard.isDown('right') == false then
                        momentum = 0
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
    if animtimer == 1 or animtimer == 0 then
        if FaceU == true then
            sword:gotoFrame(6)
        end
        if FaceD == true then
            sword:gotoFrame(2)
        end
        if FaceL == true then
            sword:gotoFrame(8)
        end
        if FaceR == true then
            sword:gotoFrame(4)
        end
    end
    if hitbox == 1 then
      hitboxtimer = 24
      animtimer = 24
    end
    if hitboxtimer > 0 then
      hitboxtimer = hitboxtimer - 1
      hitbox = 2
      anim = sword
    end
    if animtimer > 0 then
      animtimer = animtimer - 1
    end
    if hitboxtimer == 0 then
      hitbox = 0
      swordswipe = 0
    end
    if hitboxtimer == 1 then
      cooldown = 16
    end
    if cooldown > 0 then
      cooldown = cooldown - 1
    end
    
    if hitbox2 == 1 then
      hitboxtimer2 = 30
      animtimer2 = 30
    end
    if hitboxtimer2 > 0 then
      hitboxtimer2 = hitboxtimer2 - 1
      hitbox2 = 2
      dashattack = 1
    end
    if animtimer2 > 0 then
      animtimer2 = animtimer2 - 1
    end
    if hitboxtimer2 == 0 then
      hitbox2 = 0
      dashattack = 0
    end
    if hitboxtimer2 == 1 then
      cooldown2 = 16
    end
    if cooldown2 > 0 then
      cooldown2 = cooldown2 - 1
    end
end



















--      if lifelost == 1 then
--        lives = lives - 1
--        x = 64
--        y = 320
--        hpnum = 10
--        timerIFrames = 0
--        Iframes = 0
--        lifelost = 0
--      end













function DrawPlayer()
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

function DrawbreakoutPlayer()
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
    for i = 1, 5 do
        for t = 1, 10 do
        block[i][t]:draw()
        end
    end 
end

function endofdash()
    dashattack = 0
end