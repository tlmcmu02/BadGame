love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()

    cam = gamera.new(48, 52, 8000, 6000)
    
    
    spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
    grid = anim8.newGrid(66, 68, 600, 504)
    walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
    walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
    walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
    idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
    idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
    idledown = anim8.newAnimation(grid('1-1', 1), 0.09)
    sword = anim8.newAnimation(grid('1-8', 4), 0.05125)
    anim = walkdown
    x = 128
    y = 128

    hpnum = 10
    timerIFrames = 0
    Iframes = 0
    lifelost = 0
    hitboxtimer = 0
    animtimer = 0
    cooldown = 0

    wall = love.graphics.newImage('assets-1/Wall/catacombs_0.png')

    walls = {
        {wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', wall,},
        {wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,wall, wall, wall,},
    }
    walls = Map:new(walls)
end

function love.update(dt)
    if love.keyboard.isDown('x') then
        if cooldown == 0 then
          sword:update(dt)
          if hitbox == 0 then
          hitbox = 1
        end
      end
    end 
    if love.keyboard.isDown('up') then
        FaceU = true
        FaceD = false
        FaceL = false
        FaceR = false
        walkup:update(dt)
        anim = walkup
        if walls:cc(x + 16 , y + 10, 32, 32) == false  then
            y = y - 6
        end
    end
    if love.keyboard.isDown('down') then
        FaceU = false
        FaceD = true
        FaceL = false
        FaceR = false
        walkdown:update(dt)
        anim = walkdown
        if walls:cc(x + 16 , y + 22, 32, 32) == false then
            y = y + 6
        end
    end
    if love.keyboard.isDown('left') then
        FaceU = false
        FaceD = false
        FaceL = true
        FaceR = false
        walkx:update(dt)
        anim = walkx
        if walls:cc(x + 10, y + 16, 32, 32) == false  then
            x = x - 6
        end
    end
    if love.keyboard.isDown('right') then
        FaceU = false
        FaceD = false
        FaceL = false
        FaceR = true
        walkx:update(dt)
        anim = walkx
        if walls:cc(x + 22, y + 16, 32, 32) == false  then
            x = x + 6
        end
    end
    if animtimer == 1 or animtimer == 0 then
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
    
      if hitbox == 1 then
        hitboxtimer = 30
        animtimer = 30
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
      end
      if hitboxtimer == 1 then
        cooldown = 16
      end
      if cooldown > 0 then
        cooldown = cooldown - 1
      end
      if lifelost == 1 then
        lives = lives - 1
        x = 64
        y = 320
        hpnum = 10
        timerIFrames = 0
        Iframes = 0
        lifelost = 0
      end
    cam:setPosition(x, y)
end

function love.draw()
    cam:draw(function(camx, camy)
    walls:draw()
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
end)
end
