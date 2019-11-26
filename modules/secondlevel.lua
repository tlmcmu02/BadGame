love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
  swordswipe = false
  dashattack = 0
  momentum = 0
  
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
  
  spritesheet = love.graphics.newImage('assets-1/Player/placehold.png')
  grid = anim8.newGrid(66, 68, 600, 1000)
  walkdown = anim8.newAnimation(grid('1-7', 1), 0.09)
  walkup = anim8.newAnimation(grid('1-7', 2), 0.09)
  walkx = anim8.newAnimation(grid('1-7', 3), 0.09)
  idlex = anim8.newAnimation(grid('1-1', 3), 0.09)
  idleup = anim8.newAnimation(grid('1-1', 2), 0.09)
  idledown = anim8.newAnimation(grid('1-1', 1), 0.09)
  sword = anim8.newAnimation(grid('1-8', 4), 0.05125)
  dashup = anim8.newAnimation(grid('1-8', 8), 0.05125, endofdash)
  dashdown = anim8.newAnimation(grid('1-8', 7), 0.05125, endofdash)
  dashx = anim8.newAnimation(grid('1-8', 5), 0.05125, endofdash)
  anim = walkdown

  player = {
        img = love.graphics.newImage('assets-1/player/hp_bar/heart.png'),
        x = 64,
        y  = 64,
        w = 10,
        h = 10,
        hp = 10,
        s = 4
}

ball = {
  img = love.graphics.newImage('assets-1/ups.png'),
  x = 64,
  y = 64,
  r = 0,
  s = 4,
}

block1 = {
  img = love.graphics.newImage('assets-1/blocks/block1.png'),
  x=0,
  y=0,
  e=0
}


hpBar = {
    love.graphics.newImage('assets-1/player/hp_bar/0.png'),
    love.graphics.newImage('assets-1/player/hp_bar/1.png'),
    love.graphics.newImage('assets-1/player/hp_bar/2.png'),
    love.graphics.newImage('assets-1/player/hp_bar/3.png'),
    love.graphics.newImage('assets-1/player/hp_bar/4.png'),
    love.graphics.newImage('assets-1/player/hp_bar/5.png'),
    love.graphics.newImage('assets-1/player/hp_bar/6.png'),
    love.graphics.newImage('assets-1/player/hp_bar/7.png'),
    love.graphics.newImage('assets-1/player/hp_bar/8.png'),
    love.graphics.newImage('assets-1/player/hp_bar/9.png'),
    love.graphics.newImage('assets-1/player/hp_bar/10.png'),
  }

  w1 ='assets-1/wall/transparent_wall.png'
  f = 'assets-1/wall/frozen_0.png'

  background = {
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f, f},
  }
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
  }

  cam = gamera.new(0, 0, 832, 832) 
  
  map = Map:new(background)
  mapc = Map:new(layer1)

end

function love.update(dt)

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
        if mapc:cc(player.x + 16 , player.y + 4, 32, 32) == false  then
            player.y = player.y - 12
            momentum = momentum - 2
        end
    end
    if dashattack == 0 then
        if mapc:cc(player.x + 16 , player.y + 10, 32, 32) == false  then
            player.y = player.y - 6
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
        if mapc:cc(player.x + 16 , player.y + 28, 32, 32) == false then
            player.y = player.y + 12
            momentum = momentum - 2
        end
    end
    if dashattack == 0 then
        if mapc:cc(player.x + 16 , player.y + 22, 32, 32) == false then
            player.y = player.y + 6
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
        if mapc:cc(player.x + 4, player.y + 16, 32, 32) == false then
            player.x = player.x - 12
            momentum = momentum - 2
        end
    end
    if dashattack == 0 then
        if mapc:cc(player.x + 10, player.y + 16, 32, 32) == false then
            player.x = player.x - 6
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
        if mapc:cc(player.x + 28, player.y + 16, 32, 32) == false  then
            player.x = player.x + 12
            momentum = momentum - 2
        end
    end
    if dashattack == 0 then
        if mapc:cc(player.x + 22, player.y + 16, 32, 32) == false then
            player.x = player.x + 6
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
  if lifelost == 1 then
    lives = lives - 1
    player.x = 64
    player.y = 320
    hpnum = 10
    timerIFrames = 0
    Iframes = 0
    lifelost = 0
  end
      


      cam:setPosition(player.x, player.y)

end

function love.draw()
    cam:draw(function(l, t, w, h)
        map:draw()
        mapc:draw()
        if anim == walkx then
          if FaceR == true then
              walkx:draw(spritesheet, player.x, player.y)
          end
          if FaceL == true then
              walkx:draw(spritesheet, player.x, player.y, rotation, -1, 1, 64, 0)
          end
      end
      if anim == walkup then
          walkup:draw(spritesheet, player.x, player.y)
      end
      if anim == walkdown then
          walkdown:draw(spritesheet, player.x, player.y)
      end
  
      if anim == idleup then
          idleup:draw(spritesheet, player.x, player.y)
      end
      if anim == idledown then
          idledown:draw(spritesheet, player.x, player.y)
      end
      if anim == idlex then
          if FaceR == true then
              idlex:draw(spritesheet, player.x, player.y)
          end
          if FaceL == true then
              idlex:draw(spritesheet, player.x, player.y, rotation, -1, 1, 64, 0)
          end
      end
  
      if anim == sword then
          sword:draw(spritesheet, player.x, player.y)
      end
  
      if anim == dashup then
          dashup:draw(spritesheet, player.x, player.y)
      end
      if anim == dashdown then
          dashdown:draw(spritesheet, player.x, player.y)
      end
      if anim == dashx then
          if FaceR == true then
              dashx:draw(spritesheet, player.x, player.y)
          end
          if FaceL == true then
              dashx:draw(spritesheet, player.x, player.y, rotation, -1, 1, 64, 0)
          end
      end
        

        love.graphics.draw(ball.img, ball.x, ball.y)
        --walk:draw(spritesheet, 400, 300)
        
        
        
        love.graphics.draw(hpBar[player.hp + 1], player.x -10, player.y - 20)
      end)


end

function endofdash()
  dashattack = 0
end
