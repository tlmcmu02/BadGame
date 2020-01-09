love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local Block = require 'core/block'
local class = require 'core/middleclass'
local Ball = require 'core/ball'
local Bullet = require 'core/bullet'

local bullets = {}
table.insert(bullets, Bullet:new(415, 500, 'S'))
block = {}
for i = 1, 5 do
    block[i] = {}
    for t = 1, 10 do
    block[i][t] = Block:new(color[i], t, i + 1)
    end
end
function love.load()
  
Player1 = Player:new(200, 500, 'Breakout')
ball1 = ball:new(64, 500)

hpBar = {
    love.graphics.newImage('assets-1/player/hp_bar/0.png'),
    love.graphics.newImage('assets-1/player/hp_bar/1.png'),
    love.graphics.newImage('assets-1/player/hp_bar/2.png'),
    love.graphics.newImage('assets-1/player/hp_bar/3.png'),
  }

  w1 ='assets-1/wall/transparent_wall.png'
  f = 'assets-1/wall/frozen_0.png'

  
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, },
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil",  w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, },
  }

  cam = gamera.new(0, 0, 768, 768) 
  
  
  mapc = Map:new(layer1)

end

function love.update(dt)


  for i = 1, 5 do
  for t = 1, 10 do
  for y = 1, #bullets do

      if cc(Player1.x + 16, Player1.y + 10, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].upcollision = 0
      else
      block[i][t].upcollision = 1
      end
      if cc(Player1.x + 16, Player1.y + 4, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].updashcollision = 0
      else
      block[i][t].updashcollision = 1
      end
      if cc(Player1.x + 4, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].leftcollision = 0
      else
      block[i][t].leftcollision = 1
      end
      if cc(Player1.x + 10, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].leftdashcollision = 0
      else
      block[i][t].leftdashcollision = 1
      end
      if cc(Player1.x + 16, Player1.y + 28, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].downcollision = 0
      else
      block[i][t].downcollision = 1
      end
      if cc(Player1.x + 16, Player1.y + 22, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].downdashcollision = 0
      else
      block[i][t].downdashcollision = 1
      end
      if cc(Player1.x + 28, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].rightcollision = 0
      else
      block[i][t].rightcollision = 1
      end
      if cc(Player1.x + 22, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].rightdashcollision = 0
      else
      block[i][t].rightdashcollision = 1
      end
      if cc(bullets[y].x + 6, bullets[y].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].Ec = 0
      else
      block[i][t].Ec = 1
      end
      if cc(bullets[y].x, bullets[y].y + 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].Sc = 0
      else
      block[i][t].Sc = 1
      end
      if cc(bullets[y].x, bullets[y].y - 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].Nc = 0
      else
      block[i][t].Nc = 1
      end
      if cc(bullets[y].x - 6, bullets[y].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].Wc = 0
      else
      block[i][t].Wc = 1
      end
      if cc(bullets[y].x - 3, bullets[y].y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NWc = 0
      else
      block[i][t].NWc = 1
      end
      if cc(bullets[y].x + 3, bullets[y].y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NEc = 0
      else
      block[i][t].NEc = 1
      end
      if cc(bullets[y].x + 3, bullets[y].y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SEc = 0
      else
      block[i][t].SEc = 1
      end
      if cc(bullets[y].x - 3, bullets[y].y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SWc = 0
      else
      block[i][t].SWc = 1
      end
      if cc(bullets[y].x - 4.5, bullets[y].y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SWWc = 0
      else
      block[i][t].SWWc = 1
      end
      if cc(bullets[y].x + 4.5, bullets[y].y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SEEc = 0
      else
      block[i][t].SEEc = 1
      end
      if cc(bullets[y].x - 4.5, bullets[y].y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NWWc = 0
      else
      block[i][t].NWWc = 1
      end
      if cc(bullets[y].x + 4.5, bullets[y].y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NEEc = 0
      else
      block[i][t].NEEc = 1
      end
      if bullets[y].animdeletetime >= 0 then
        bullets[y].animdeletetime = bullets[y].animdeletetime - 1
      end
  end
  end
  end
  CR()



  ball1:update(dt)
  for i = 1, #bullets do
    bullets[i]:update(dt)
    if cc(Player1.x + 16, Player1.y + 16, 32, 32, bullets[i].x, bullets[i].y, 16, 16) then
      bullets[i]:setDelete() -- delete the bullet
      Player1:IFrames() -- decrease player hp
    end
  end


  -- if the bullet collides with the player,
  

  if Player1.timerIFrames > 0 then
    Player1.timerIFrames = Player1.timerIFrames - 1
    Player1.Iframes = 2
end
if Player1.timerIFrames < 1 then
  Player1.timerIFrames = 0
  Player1.Iframes = 0
end

  Player1:breakoutupdate(dt)
  if lifelost == 1 then
    lives = lives - 1
    x = 128
    y = 500
    hpnum = 3
    timerIFrames = 120
    Iframes = 0
    lifelost = 0
  end



  cam:setPosition(Player1.x, Player1.y)

end

function love.draw()
    cam:draw(function(l, t, w, h)
        
        mapc:draw()
        ball1:draw()
       
        Player1:Draw()
        for i = 1, #bullets do
          bullets[i]:draw()
        end
        for i = 1, 5 do
          for t = 1, 10 do
          --block[i][t]:draw()
          end
        end 
        

        love.graphics.print(Player1.Iframes, Player1.x, Player1.y)

        
        
      end)
      
if hpnum == 3 then
  love.graphics.draw(hpBar[4], 16, 32, 6, 3)
end
if hpnum == 2 then
  love.graphics.draw(hpBar[3], 16, 32, 6, 3)
end
if hpnum == 1 then
  love.graphics.draw(hpBar[2], 16, 32, 6, 3)
end

end

function endofdash()
  dashattack = 0
end

     function CR()

        for i = 1, #bullets do 

        if Player1.FaceD == true then
            if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                if cc(Player1.x, Player1.y + 32, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'S'
                end
            end
            if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SE'
                end
            end
            if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'E'
                end
            end
            if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NE'
                end
            end
            if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'N'
                end
            end
            if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NW'
                end
            end
            if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'W'
                end
            end
            if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                if cc(Player1.x, Player1.y + 19, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SW'
                end
            end
        end 
        if Player1.FaceR == true then
            if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                if cc(Player1.x, Player1.y + 32, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'S'
                end
            end
            if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SE'
                end
            end
            if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'E'
                end
            end
            if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NE'
                end
            end
            if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'N'
                end
            end
            if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NW'
                end
            end
            if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'W'
                end
            end
            if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                if cc(Player1.x, Player1.y + 19, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SW'
                end
            end
        end 
        if Player1.FaceU == true then
            if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                if cc(Player1.x, Player1.y + 32, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'S'
                end
            end
            if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SE'
                end
            end
            if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'E'
                end
            end
            if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NE'
                end
            end
            if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'N'
                end
            end
            if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NW'
                end
            end
            if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'W'
                end
            end
            if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                if cc(Player1.x, Player1.y + 19, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SW'
                end
            end
        end 
        if Player1.FaceL == true then
            if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                if cc(Player1.x, Player1.y + 32, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'S'
                end
            end
            if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SE'
                end
            end
            if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'E'
                end
            end
            if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NE'
                end
            end
            if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'N'
                end
            end
            if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'NW'
                end
            end
            if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'W'
                end
            end
            if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                if cc(Player1.x, Player1.y + 19, 7, 13, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullets[i].x, bullets[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullets[i].x, bullets[i].y, 16, 16) then
                    bullets[i].direction = 'SW'
                end
            end
        end

      end

 end


function ballreflect()

for p = 1, #bullets do 
for i = 1, 5 do
for t = 1, 10 do

if ball1.direction == 'SWW' then
  if mapc:cc(ball1.x - 4.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NNE'
  end 
  if mapc:cc(ball1.x, ball1.y + 1.5, 16, 16) == true then   
    ball1.direction = 'SSW'
  end  
  if cc(ball1.x - 4.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NNE'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SSW'
    block[i][t].destroy()
  end
end

if ball1.direction == 'SEE' then
  if mapc:cc(ball1.x + 4.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NNW'
  end 
  if mapc:cc(ball1.x, ball1.y + 1.5, 16, 16) == true then   
    ball1.direction = 'SSE'
  end  
  if cc(ball1.x + 4.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NNW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SSE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NWW' then
  if mapc:cc(ball1.x - 4.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NNE'
  end 
  if mapc:cc(ball1.x, ball1.y - 1.5, 16, 16) == true then   
    ball1.direction = 'SSW'
  end  
  if cc(ball1.x - 4.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NNE'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SSW'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NEE' then
  if mapc:cc(ball1.x + 4.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NNW'
  end 
  if mapc:cc(ball1.x, ball1.y - 1.5, 16, 16) == true then   
    ball1.direction = 'SSE'
  end  
  if cc(ball1.x + 4.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NNW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SSE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'SSW' then
  if mapc:cc(ball1.x - 1.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NWW'
  end 
  if mapc:cc(ball1.x, ball1.y + 4.5, 16, 16) == true then   
    ball1.direction = 'SEE'
  end  
  if cc(ball1.x - 1.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NWW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SEE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'SSE' then
  if mapc:cc(ball1.x + 1.5, ball1.y, 16, 16) == true then
    ball1.direction = 'NEE'
  end 
  if mapc:cc(ball1.x, ball1.y + 4.5, 16, 16) == true then   
    ball1.direction = 'SWW'
  end  
  if cc(ball1.x + 1.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NEE'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SWW'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NNW' then
  if mapc:cc(ball1.x - 1.5, ball1.y, 16, 16) == true then
    ball1.direction = 'SWW'
  end 
  if mapc:cc(ball1.x, ball1.y - 4.5, 16, 16) == true then   
    ball1.direction = 'NEE'
  end  
  if cc(ball1.x - 1.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SWW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y - 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NEE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NNE' then
if mapc:cc(ball1.x + 1.5, ball1.y, 16, 16) == true then
  ball1.direction = 'SEE'
end 
if mapc:cc(ball1.x, ball1.y - 4.5, 16, 16) == true then   
  ball1.direction = 'NWW'
end  
if cc(ball1.x + 1.5, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
  ball1.direction = 'SEE'
  block[i][t].destroy()
end
if cc(ball1.x, ball1.y - 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
  ball1.direction = 'NWW'
  block[i][t].destroy()
end
end

if ball1.direction == 'SW' then
  if mapc:cc(ball1.x - 3, ball1.y, 16, 16) == true then  
    ball1.direction = 'SE'
  end 
  if mapc:cc(ball1.x, ball1.y + 3, 16, 16) == true then   
    ball1.direction = 'NW'
  end  
  if cc(ball1.x - 3, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SE'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NW'
    block[i][t].destroy()
  end
end

if ball1.direction == 'SE' then
  if mapc:cc(ball1.x + 3, ball1.y, 16, 16) == true then  
    ball1.direction = 'SW'
  end 
  if mapc:cc(ball1.x, ball1.y + 3, 16, 16) == true then   
    ball1.direction = 'NE'
  end  
  if cc(ball1.x + 3, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NW' then
  if mapc:cc(ball1.x - 3, ball1.y, 16, 16) == true then  
    ball1.direction = 'NE'
  end 
  if mapc:cc(ball1.x, ball1.y - 3, 16, 16) == true then   
    ball1.direction = 'SW'
  end  
  if cc(ball1.x - 3, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NE'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SW'
    block[i][t].destroy()
  end
end

if ball1.direction == 'NE' then
  if mapc:cc(ball1.x + 3, ball1.y, 16, 16) == true then   
    ball1.direction = 'NW'
  end 
  if mapc:cc(ball1.x, ball1.y - 3, 16, 16) == true then   
    ball1.direction = 'SE'
  end  
  if cc(ball1.x + 3, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'NW'
    block[i][t].destroy()
  end
  if cc(ball1.x, ball1.y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    ball1.direction = 'SE'
    block[i][t].destroy()
  end
end

if ball1.direction == 'S' then
  if mapc:cc(ball1.x, ball1.y + 6, 16, 16) == true then  
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NNW'
    end
    if n == 2 then
      ball1.direction = 'NNE'
    end
  end  
  if cc(ball1.x, ball1.y + 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NNW'
      block[i][t].destroy()
    end
    if n == 2 then
      ball1.direction = 'NNE'
      block[i][t].destroy()
    end
  end  
end

if ball1.direction == 'W' then
  if mapc:cc(ball1.x - 6, ball1.y, 16, 16) == true then  
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NEE'
    end
    if n == 2 then
      ball1.direction = 'SEE'
    end
  end  
  if cc(ball1.x - 6, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NEE'
      block[i][t].destroy()
    end
    if n == 2 then
      ball1.direction = 'SEE'
      block[i][t].destroy()
    end
  end
end

if ball1.direction == 'N' then
  if mapc:cc(ball1.x, ball1.y - 6, 16, 16) == true then 
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'SSW'
    end
    if n == 2 then
      ball1.direction = 'SSE'
    end
  end  
  if cc(ball1.x, ball1.y - 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'SSW'
      block[i][t].destroy()
    end
    if n == 2 then
      ball1.direction = 'SSE'
      block[i][t].destroy()
    end
  end
end

if ball1.direction == 'E' then
  if mapc:cc(ball1.x + 6, ball1.y, 16, 16) == false then  
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NWW'
    end
    if n == 2 then
      ball1.direction = 'SWW'
    end
  end  
  if cc(ball1.x + 6, ball1.y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    local n = love.math.random(1, 2)
    if n == 1 then
      ball1.direction = 'NWW'
      block[i][t].destroy()
    end
    if n == 2 then
      ball1.direction = 'SWW'
      block[i][t].destroy()
    end
  end
end

end
end
end

end

function bulletreflect()

  for p = 1, #bullets do 
  for i = 1, 5 do
  for t = 1, 10 do
  
  if bullets[p].direction == 'SWW' then
    if mapc:cc(bullets[p].x - 4.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NNE'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 1.5, 16, 16) == true then   
      bullets[p].direction = 'SSW'
    end  
    if cc(bullets[p].x - 4.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NNE'
    end
    if cc(bullets[p].x, bullets[p].y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SSW'
    end
  end
  
  if bullets[p].direction == 'SEE' then
    if mapc:cc(bullets[p].x + 4.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NNW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 1.5, 16, 16) == true then   
      bullets[p].direction = 'SSE'
    end  
    if cc(bullets[p].x + 4.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NNW'
    end
    if cc(bullets[p].x, bullets[p].y + 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SSE'
    end
  end
  
  if bullets[p].direction == 'NWW' then
    if mapc:cc(bullets[p].x - 4.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NNE'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y - 1.5, 16, 16) == true then   
      bullets[p].direction = 'SSW'
    end  
    if cc(bullets[p].x - 4.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NNE'
    end
    if cc(bullets[p].x, bullets[p].y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SSW'
    end
  end
  
  if bullets[p].direction == 'NEE' then
    if mapc:cc(bullets[p].x + 4.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NNW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y - 1.5, 16, 16) == true then   
      bullets[p].direction = 'SSE'
    end  
    if cc(bullets[p].x + 4.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NNW'
    end
    if cc(bullets[p].x, bullets[p].y - 1.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SSE'
    end
  end
  
  if bullets[p].direction == 'SSW' then
    if mapc:cc(bullets[p].x - 1.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NWW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 4.5, 16, 16) == true then   
      bullets[p].direction = 'SEE'
    end  
    if cc(bullets[p].x - 1.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NWW'
    end
    if cc(bullets[p].x, bullets[p].y + 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SEE'
    end
  end
  
  if bullets[p].direction == 'SSE' then
    if mapc:cc(bullets[p].x + 1.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'NEE'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 4.5, 16, 16) == true then   
      bullets[p].direction = 'SWW'
    end  
    if cc(bullets[p].x + 1.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NEE'
    end
    if cc(bullets[p].x, bullets[p].y + 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SWW'
    end
  end
  
  if bullets[p].direction == 'NNW' then
    if mapc:cc(bullets[p].x - 1.5, bullets[p].y, 16, 16) == true then
      bullets[p].direction = 'SWW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y - 4.5, 16, 16) == true then   
      bullets[p].direction = 'NEE'
    end  
    if cc(bullets[p].x - 1.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SWW'
    end
    if cc(bullets[p].x, bullets[p].y - 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NEE'
    end
  end
  
  if bullets[p].direction == 'NNE' then
  if mapc:cc(bullets[p].x + 1.5, bullets[p].y, 16, 16) == true then
    bullets[p].direction = 'SEE'
  end 
  if mapc:cc(bullets[p].x, bullets[p].y - 4.5, 16, 16) == true then   
    bullets[p].direction = 'NWW'
  end  
  if cc(bullets[p].x + 1.5, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    bullets[p].direction = 'SEE'
  end
  if cc(bullets[p].x, bullets[p].y - 4.5, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
    bullets[p].direction = 'NWW'
  end
  end
  
  if bullets[p].direction == 'SW' then
    if mapc:cc(bullets[p].x - 3, bullets[p].y, 16, 16) == true then  
      bullets[p].direction = 'SE'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 3, 16, 16) == true then   
      bullets[p].direction = 'NW'
    end  
    if cc(bullets[p].x - 3, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SE'
    end
    if cc(bullets[p].x, bullets[p].y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NW'
    end
  end
  
  if bullets[p].direction == 'SE' then
    if mapc:cc(bullets[p].x + 3, bullets[p].y, 16, 16) == true then  
      bullets[p].direction = 'SW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y + 3, 16, 16) == true then   
      bullets[p].direction = 'NE'
    end  
    if cc(bullets[p].x + 3, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SW'
    end
    if cc(bullets[p].x, bullets[p].y + 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NE'
    end
  end
  
  if bullets[p].direction == 'NW' then
    if cc(bullets[p].x - 3, bullets[p].y, 16, 16, 64, 0, 640, 64) == true then  
      bullets[p].direction = 'NE'
    end 
    if cc(bullets[p].x, bullets[p].y - 3, 16, 16, 64, 0, 640, 64) == true then   
      bullets[p].direction = 'SW'
    end  
    if cc(bullets[p].x - 3, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NE'
    end
    if cc(bullets[p].x, bullets[p].y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SW'
    end
  end
  
  if bullets[p].direction == 'NE' then
    if mapc:cc(bullets[p].x + 3, bullets[p].y, 16, 16) == true then   
      bullets[p].direction = 'NW'
    end 
    if mapc:cc(bullets[p].x, bullets[p].y - 3, 16, 16) == true then   
      bullets[p].direction = 'SE'
    end  
    if cc(bullets[p].x + 3, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'NW'
    end
    if cc(bullets[p].x, bullets[p].y - 3, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      bullets[p].direction = 'SE'
    end
  end
  
  if bullets[p].direction == 'S' then
    if mapc:cc(bullets[p].x, bullets[p].y + 6, 16, 16) == true then  
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NNW'
      end
      if n == 2 then
        bullets[p].direction = 'NNE'
      end
    end  
    if cc(bullets[p].x, bullets[p].y + 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NNW' 
      end
      if n == 2 then
        bullets[p].direction = 'NNE'
      end
    end  
  end
  
  if bullets[p].direction == 'W' then
    if mapc:cc(bullets[p].x - 6, bullets[p].y, 16, 16) == true then  
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NEE'
      end
      if n == 2 then
        bullets[p].direction = 'SEE'
      end
    end  
    if cc(bullets[p].x - 6, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NEE'
      end
      if n == 2 then
        bullets[p].direction = 'SEE'
      end
    end
  end
  
  if bullets[p].direction == 'N' then
    if mapc:cc(bullets[p].x, bullets[p].y - 6, 16, 16) == true then 
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'SSW'
      end
      if n == 2 then
        bullets[p].direction = 'SSE'
      end
    end  
    if cc(bullets[p].x, bullets[p].y - 6, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'SSW'
      end
      if n == 2 then
        bullets[p].direction = 'SSE'
      end
    end
  end
  
  if bullets[p].direction == 'E' then
    if mapc:cc(bullets[p].x + 6, bullets[p].y, 16, 16) == false then  
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NWW'
      end
      if n == 2 then
        bullets[p].direction = 'SWW'
      end
    end  
    if cc(bullets[p].x + 6, bullets[p].y, 16, 16, block[i][t].x, block[i][t].y, 64, 64) == true then 
      local n = love.math.random(1, 2)
      if n == 1 then
        bullets[p].direction = 'NWW' 
      end
      if n == 2 then
        bullets[p].direction = 'SWW'
      end
    end
  end
  
  end
  end
  end
  
  end

function updashcc()
    if block[1][1].updashcollision == 0 then
    if block[1][2].updashcollision == 0 then
    if block[1][3].updashcollision == 0 then
    if block[1][4].updashcollision == 0 then
    if block[1][5].updashcollision == 0 then
    if block[1][6].updashcollision == 0 then
    if block[1][7].updashcollision == 0 then
    if block[1][8].updashcollision == 0 then
    if block[1][9].updashcollision == 0 then
    if block[1][10].updashcollision == 0 then
    if block[2][1].updashcollision == 0 then
    if block[2][2].updashcollision == 0 then
    if block[2][3].updashcollision == 0 then
    if block[2][4].updashcollision == 0 then
    if block[2][5].updashcollision == 0 then
    if block[2][6].updashcollision == 0 then
    if block[2][7].updashcollision == 0 then
    if block[2][8].updashcollision == 0 then
    if block[2][9].updashcollision == 0 then
    if block[2][10].updashcollision == 0 then
    if block[3][1].updashcollision == 0 then
    if block[3][2].updashcollision == 0 then
    if block[3][3].updashcollision == 0 then
    if block[3][4].updashcollision == 0 then
    if block[3][5].updashcollision == 0 then
    if block[3][6].updashcollision == 0 then
    if block[3][7].updashcollision == 0 then
    if block[3][8].updashcollision == 0 then
    if block[3][9].updashcollision == 0 then
    if block[3][10].updashcollision == 0 then
    if block[4][1].updashcollision == 0 then
    if block[4][2].updashcollision == 0 then
    if block[4][3].updashcollision == 0 then
    if block[4][4].updashcollision == 0 then
    if block[4][5].updashcollision == 0 then
    if block[4][6].updashcollision == 0 then
    if block[4][7].updashcollision == 0 then
    if block[4][8].updashcollision == 0 then
    if block[4][9].updashcollision == 0 then
    if block[4][10].updashcollision == 0 then
    if block[5][1].updashcollision == 0 then
    if block[5][2].updashcollision == 0 then
    if block[5][3].updashcollision == 0 then
    if block[5][4].updashcollision == 0 then
    if block[5][5].updashcollision == 0 then
    if block[5][6].updashcollision == 0 then
    if block[5][7].updashcollision == 0 then
    if block[5][8].updashcollision == 0 then
    if block[5][9].updashcollision == 0 then
    if block[5][10].updashcollision == 0 then
    if mapc:cc(Player1.x + 16 , Player1.y + 4, 32, 32) == false then   
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
end    


function upcc()
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
  if mapc:cc(Player1.x + 16 , Player1.y + 10, 32, 32) == false then   
    return true  
  else
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end    

function leftdashcc()
  if block[1][1].leftdashcollision == 0 then
  if block[1][2].leftdashcollision == 0 then
  if block[1][3].leftdashcollision == 0 then
  if block[1][4].leftdashcollision == 0 then
  if block[1][5].leftdashcollision == 0 then
  if block[1][6].leftdashcollision == 0 then
  if block[1][7].leftdashcollision == 0 then
  if block[1][8].leftdashcollision == 0 then
  if block[1][9].leftdashcollision == 0 then
  if block[1][10].leftdashcollision == 0 then
  if block[2][1].leftdashcollision == 0 then
  if block[2][2].leftdashcollision == 0 then
  if block[2][3].leftdashcollision == 0 then
  if block[2][4].leftdashcollision == 0 then
  if block[2][5].leftdashcollision == 0 then
  if block[2][6].leftdashcollision == 0 then
  if block[2][7].leftdashcollision == 0 then
  if block[2][8].leftdashcollision == 0 then
  if block[2][9].leftdashcollision == 0 then
  if block[2][10].leftdashcollision == 0 then
  if block[3][1].leftdashcollision == 0 then
  if block[3][2].leftdashcollision == 0 then
  if block[3][3].leftdashcollision == 0 then
  if block[3][4].leftdashcollision == 0 then
  if block[3][5].leftdashcollision == 0 then
  if block[3][6].leftdashcollision == 0 then
  if block[3][7].leftdashcollision == 0 then
  if block[3][8].leftdashcollision == 0 then
  if block[3][9].leftdashcollision == 0 then
  if block[3][10].leftdashcollision == 0 then
  if block[4][1].leftdashcollision == 0 then
  if block[4][2].leftdashcollision == 0 then
  if block[4][3].leftdashcollision == 0 then
  if block[4][4].leftdashcollision == 0 then
  if block[4][5].leftdashcollision == 0 then
  if block[4][6].leftdashcollision == 0 then
  if block[4][7].leftdashcollision == 0 then
  if block[4][8].leftdashcollision == 0 then
  if block[4][9].leftdashcollision == 0 then
  if block[4][10].leftdashcollision == 0 then
  if block[5][1].leftdashcollision == 0 then
  if block[5][2].leftdashcollision == 0 then
  if block[5][3].leftdashcollision == 0 then
  if block[5][4].leftdashcollision == 0 then
  if block[5][5].leftdashcollision == 0 then
  if block[5][6].leftdashcollision == 0 then
  if block[5][7].leftdashcollision == 0 then
  if block[5][8].leftdashcollision == 0 then
  if block[5][9].leftdashcollision == 0 then
  if block[5][10].leftdashcollision == 0 then
  if mapc:cc(Player1.x + 4, Player1.y + 16, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function leftcc()
  if block[1][1].leftcollision == 0 then
  if block[1][2].leftcollision == 0 then
  if block[1][3].leftcollision == 0 then
  if block[1][4].leftcollision == 0 then
  if block[1][5].leftcollision == 0 then
  if block[1][6].leftcollision == 0 then
  if block[1][7].leftcollision == 0 then
  if block[1][8].leftcollision == 0 then
  if block[1][9].leftcollision == 0 then
  if block[1][10].leftcollision == 0 then
  if block[2][1].leftcollision == 0 then
  if block[2][2].leftcollision == 0 then
  if block[2][3].leftcollision == 0 then
  if block[2][4].leftcollision == 0 then
  if block[2][5].leftcollision == 0 then
  if block[2][6].leftcollision == 0 then
  if block[2][7].leftcollision == 0 then
  if block[2][8].leftcollision == 0 then
  if block[2][9].leftcollision == 0 then
  if block[2][10].leftcollision == 0 then
  if block[3][1].leftcollision == 0 then
  if block[3][2].leftcollision == 0 then
  if block[3][3].leftcollision == 0 then
  if block[3][4].leftcollision == 0 then
  if block[3][5].leftcollision == 0 then
  if block[3][6].leftcollision == 0 then
  if block[3][7].leftcollision == 0 then
  if block[3][8].leftcollision == 0 then
  if block[3][9].leftcollision == 0 then
  if block[3][10].leftcollision == 0 then
  if block[4][1].leftcollision == 0 then
  if block[4][2].leftcollision == 0 then
  if block[4][3].leftcollision == 0 then
  if block[4][4].leftcollision == 0 then
  if block[4][5].leftcollision == 0 then
  if block[4][6].leftcollision == 0 then
  if block[4][7].leftcollision == 0 then
  if block[4][8].leftcollision == 0 then
  if block[4][9].leftcollision == 0 then
  if block[4][10].leftcollision == 0 then
  if block[5][1].leftcollision == 0 then
  if block[5][2].leftcollision == 0 then
  if block[5][3].leftcollision == 0 then
  if block[5][4].leftcollision == 0 then
  if block[5][5].leftcollision == 0 then
  if block[5][6].leftcollision == 0 then
  if block[5][7].leftcollision == 0 then
  if block[5][8].leftcollision == 0 then
  if block[5][9].leftcollision == 0 then
  if block[5][10].leftcollision == 0 then
  if mapc:cc(Player1.x + 10, Player1.y + 16, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function downdashcc()
  if block[1][1].downdashcollision == 0 then
  if block[1][2].downdashcollision == 0 then
  if block[1][3].downdashcollision == 0 then
  if block[1][4].downdashcollision == 0 then
  if block[1][5].downdashcollision == 0 then
  if block[1][6].downdashcollision == 0 then
  if block[1][7].downdashcollision == 0 then
  if block[1][8].downdashcollision == 0 then
  if block[1][9].downdashcollision == 0 then
  if block[1][10].downdashcollision == 0 then
  if block[2][1].downdashcollision == 0 then
  if block[2][2].downdashcollision == 0 then
  if block[2][3].downdashcollision == 0 then
  if block[2][4].downdashcollision == 0 then
  if block[2][5].downdashcollision == 0 then
  if block[2][6].downdashcollision == 0 then
  if block[2][7].downdashcollision == 0 then
  if block[2][8].downdashcollision == 0 then
  if block[2][9].downdashcollision == 0 then
  if block[2][10].downdashcollision == 0 then
  if block[3][1].downdashcollision == 0 then
  if block[3][2].downdashcollision == 0 then
  if block[3][3].downdashcollision == 0 then
  if block[3][4].downdashcollision == 0 then
  if block[3][5].downdashcollision == 0 then
  if block[3][6].downdashcollision == 0 then
  if block[3][7].downdashcollision == 0 then
  if block[3][8].downdashcollision == 0 then
  if block[3][9].downdashcollision == 0 then
  if block[3][10].downdashcollision == 0 then
  if block[4][1].downdashcollision == 0 then
  if block[4][2].downdashcollision == 0 then
  if block[4][3].downdashcollision == 0 then
  if block[4][4].downdashcollision == 0 then
  if block[4][5].downdashcollision == 0 then
  if block[4][6].downdashcollision == 0 then
  if block[4][7].downdashcollision == 0 then
  if block[4][8].downdashcollision == 0 then
  if block[4][9].downdashcollision == 0 then
  if block[4][10].downdashcollision == 0 then
  if block[5][1].downdashcollision == 0 then
  if block[5][2].downdashcollision == 0 then
  if block[5][3].downdashcollision == 0 then
  if block[5][4].downdashcollision == 0 then
  if block[5][5].downdashcollision == 0 then
  if block[5][6].downdashcollision == 0 then
  if block[5][7].downdashcollision == 0 then
  if block[5][8].downdashcollision == 0 then
  if block[5][9].downdashcollision == 0 then
  if block[5][10].downdashcollision == 0 then
  if mapc:cc(Player1.x + 16, Player1.y + 28, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function downcc()
  if block[1][1].downcollision == 0 then
  if block[1][2].downcollision == 0 then
  if block[1][3].downcollision == 0 then
  if block[1][4].downcollision == 0 then
  if block[1][5].downcollision == 0 then
  if block[1][6].downcollision == 0 then
  if block[1][7].downcollision == 0 then
  if block[1][8].downcollision == 0 then
  if block[1][9].downcollision == 0 then
  if block[1][10].downcollision == 0 then
  if block[2][1].downcollision == 0 then
  if block[2][2].downcollision == 0 then
  if block[2][3].downcollision == 0 then
  if block[2][4].downcollision == 0 then
  if block[2][5].downcollision == 0 then
  if block[2][6].downcollision == 0 then
  if block[2][7].downcollision == 0 then
  if block[2][8].downcollision == 0 then
  if block[2][9].downcollision == 0 then
  if block[2][10].downcollision == 0 then
  if block[3][1].downcollision == 0 then
  if block[3][2].downcollision == 0 then
  if block[3][3].downcollision == 0 then
  if block[3][4].downcollision == 0 then
  if block[3][5].downcollision == 0 then
  if block[3][6].downcollision == 0 then
  if block[3][7].downcollision == 0 then
  if block[3][8].downcollision == 0 then
  if block[3][9].downcollision == 0 then
  if block[3][10].downcollision == 0 then
  if block[4][1].downcollision == 0 then
  if block[4][2].downcollision == 0 then
  if block[4][3].downcollision == 0 then
  if block[4][4].downcollision == 0 then
  if block[4][5].downcollision == 0 then
  if block[4][6].downcollision == 0 then
  if block[4][7].downcollision == 0 then
  if block[4][8].downcollision == 0 then
  if block[4][9].downcollision == 0 then
  if block[4][10].downcollision == 0 then
  if block[5][1].downcollision == 0 then
  if block[5][2].downcollision == 0 then
  if block[5][3].downcollision == 0 then
  if block[5][4].downcollision == 0 then
  if block[5][5].downcollision == 0 then
  if block[5][6].downcollision == 0 then
  if block[5][7].downcollision == 0 then
  if block[5][8].downcollision == 0 then
  if block[5][9].downcollision == 0 then
  if block[5][10].downcollision == 0 then
  if mapc:cc(Player1.x + 16, Player1.y + 22, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  


function rightdashcc()
  if block[1][1].rightdashcollision == 0 then
  if block[1][2].rightdashcollision == 0 then
  if block[1][3].rightdashcollision == 0 then
  if block[1][4].rightdashcollision == 0 then
  if block[1][5].rightdashcollision == 0 then
  if block[1][6].rightdashcollision == 0 then
  if block[1][7].rightdashcollision == 0 then
  if block[1][8].rightdashcollision == 0 then
  if block[1][9].rightdashcollision == 0 then
  if block[1][10].rightdashcollision == 0 then
  if block[2][1].rightdashcollision == 0 then
  if block[2][2].rightdashcollision == 0 then
  if block[2][3].rightdashcollision == 0 then
  if block[2][4].rightdashcollision == 0 then
  if block[2][5].rightdashcollision == 0 then
  if block[2][6].rightdashcollision == 0 then
  if block[2][7].rightdashcollision == 0 then
  if block[2][8].rightdashcollision == 0 then
  if block[2][9].rightdashcollision == 0 then
  if block[2][10].rightdashcollision == 0 then
  if block[3][1].rightdashcollision == 0 then
  if block[3][2].rightdashcollision == 0 then
  if block[3][3].rightdashcollision == 0 then
  if block[3][4].rightdashcollision == 0 then
  if block[3][5].rightdashcollision == 0 then
  if block[3][6].rightdashcollision == 0 then
  if block[3][7].rightdashcollision == 0 then
  if block[3][8].rightdashcollision == 0 then
  if block[3][9].rightdashcollision == 0 then
  if block[3][10].rightdashcollision == 0 then
  if block[4][1].rightdashcollision == 0 then
  if block[4][2].rightdashcollision == 0 then
  if block[4][3].rightdashcollision == 0 then
  if block[4][4].rightdashcollision == 0 then
  if block[4][5].rightdashcollision == 0 then
  if block[4][6].rightdashcollision == 0 then
  if block[4][7].rightdashcollision == 0 then
  if block[4][8].rightdashcollision == 0 then
  if block[4][9].rightdashcollision == 0 then
  if block[4][10].rightdashcollision == 0 then
  if block[5][1].rightdashcollision == 0 then
  if block[5][2].rightdashcollision == 0 then
  if block[5][3].rightdashcollision == 0 then
  if block[5][4].rightdashcollision == 0 then
  if block[5][5].rightdashcollision == 0 then
  if block[5][6].rightdashcollision == 0 then
  if block[5][7].rightdashcollision == 0 then
  if block[5][8].rightdashcollision == 0 then
  if block[5][9].rightdashcollision == 0 then
  if block[5][10].rightdashcollision == 0 then
  if mapc:cc(Player1.x + 28, Player1.y + 16, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function rightcc()
  if block[1][1].rightcollision == 0 then
  if block[1][2].rightcollision == 0 then
  if block[1][3].rightcollision == 0 then
  if block[1][4].rightcollision == 0 then
  if block[1][5].rightcollision == 0 then
  if block[1][6].rightcollision == 0 then
  if block[1][7].rightcollision == 0 then
  if block[1][8].rightcollision == 0 then
  if block[1][9].rightcollision == 0 then
  if block[1][10].rightcollision == 0 then
  if block[2][1].rightcollision == 0 then
  if block[2][2].rightcollision == 0 then
  if block[2][3].rightcollision == 0 then
  if block[2][4].rightcollision == 0 then
  if block[2][5].rightcollision == 0 then
  if block[2][6].rightcollision == 0 then
  if block[2][7].rightcollision == 0 then
  if block[2][8].rightcollision == 0 then
  if block[2][9].rightcollision == 0 then
  if block[2][10].rightcollision == 0 then
  if block[3][1].rightcollision == 0 then
  if block[3][2].rightcollision == 0 then
  if block[3][3].rightcollision == 0 then
  if block[3][4].rightcollision == 0 then
  if block[3][5].rightcollision == 0 then
  if block[3][6].rightcollision == 0 then
  if block[3][7].rightcollision == 0 then
  if block[3][8].rightcollision == 0 then
  if block[3][9].rightcollision == 0 then
  if block[3][10].rightcollision == 0 then
  if block[4][1].rightcollision == 0 then
  if block[4][2].rightcollision == 0 then
  if block[4][3].rightcollision == 0 then
  if block[4][4].rightcollision == 0 then
  if block[4][5].rightcollision == 0 then
  if block[4][6].rightcollision == 0 then
  if block[4][7].rightcollision == 0 then
  if block[4][8].rightcollision == 0 then
  if block[4][9].rightcollision == 0 then
  if block[4][10].rightcollision == 0 then
  if block[5][1].rightcollision == 0 then
  if block[5][2].rightcollision == 0 then
  if block[5][3].rightcollision == 0 then
  if block[5][4].rightcollision == 0 then
  if block[5][5].rightcollision == 0 then
  if block[5][6].rightcollision == 0 then
  if block[5][7].rightcollision == 0 then
  if block[5][8].rightcollision == 0 then
  if block[5][9].rightcollision == 0 then
  if block[5][10].rightcollision == 0 then
  if mapc:cc(Player1.x + 22, Player1.y + 16, 32, 32) == false then 
    return true  
  else
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end 

function love.keypressed(key)
  if key == 'space' then
    table.insert(bullets, Bullet:new(140, 140, 'S'))
  end
end

function Nc()
  if block[1][1].Nc == 0 then
  if block[1][2].Nc == 0 then
  if block[1][3].Nc == 0 then
  if block[1][4].Nc == 0 then
  if block[1][5].Nc == 0 then
  if block[1][6].Nc == 0 then
  if block[1][7].Nc == 0 then
  if block[1][8].Nc == 0 then
  if block[1][9].Nc == 0 then
  if block[1][10].Nc == 0 then
  if block[2][1].Nc == 0 then
  if block[2][2].Nc == 0 then
  if block[2][3].Nc == 0 then
  if block[2][4].Nc == 0 then
  if block[2][5].Nc == 0 then
  if block[2][6].Nc == 0 then
  if block[2][7].Nc == 0 then
  if block[2][8].Nc == 0 then
  if block[2][9].Nc == 0 then
  if block[2][10].Nc == 0 then
  if block[3][1].Nc == 0 then
  if block[3][2].Nc == 0 then
  if block[3][3].Nc == 0 then
  if block[3][4].Nc == 0 then
  if block[3][5].Nc == 0 then
  if block[3][6].Nc == 0 then
  if block[3][7].Nc == 0 then
  if block[3][8].Nc == 0 then
  if block[3][9].Nc == 0 then
  if block[3][10].Nc == 0 then
  if block[4][1].Nc == 0 then
  if block[4][2].Nc == 0 then
  if block[4][3].Nc == 0 then
  if block[4][4].Nc == 0 then
  if block[4][5].Nc == 0 then
  if block[4][6].Nc == 0 then
  if block[4][7].Nc == 0 then
  if block[4][8].Nc == 0 then
  if block[4][9].Nc == 0 then
  if block[4][10].Nc == 0 then
  if block[5][1].Nc == 0 then
  if block[5][2].Nc == 0 then
  if block[5][3].Nc == 0 then
  if block[5][4].Nc == 0 then
  if block[5][5].Nc == 0 then
  if block[5][6].Nc == 0 then
  if block[5][7].Nc == 0 then
  if block[5][8].Nc == 0 then
  if block[5][9].Nc == 0 then
  if block[5][10].Nc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end    

function Sc()
  if block[1][1].Sc == 0 then
  if block[1][2].Sc == 0 then
  if block[1][3].Sc == 0 then
  if block[1][4].Sc == 0 then
  if block[1][5].Sc == 0 then
  if block[1][6].Sc == 0 then
  if block[1][7].Sc == 0 then
  if block[1][8].Sc == 0 then
  if block[1][9].Sc == 0 then
  if block[1][10].Sc == 0 then
  if block[2][1].Sc == 0 then
  if block[2][2].Sc == 0 then
  if block[2][3].Sc == 0 then
  if block[2][4].Sc == 0 then
  if block[2][5].Sc == 0 then
  if block[2][6].Sc == 0 then
  if block[2][7].Sc == 0 then
  if block[2][8].Sc == 0 then
  if block[2][9].Sc == 0 then
  if block[2][10].Sc == 0 then
  if block[3][1].Sc == 0 then
  if block[3][2].Sc == 0 then
  if block[3][3].Sc == 0 then
  if block[3][4].Sc == 0 then
  if block[3][5].Sc == 0 then
  if block[3][6].Sc == 0 then
  if block[3][7].Sc == 0 then
  if block[3][8].Sc == 0 then
  if block[3][9].Sc == 0 then
  if block[3][10].Sc == 0 then
  if block[4][1].Sc == 0 then
  if block[4][2].Sc == 0 then
  if block[4][3].Sc == 0 then
  if block[4][4].Sc == 0 then
  if block[4][5].Sc == 0 then
  if block[4][6].Sc == 0 then
  if block[4][7].Sc == 0 then
  if block[4][8].Sc == 0 then
  if block[4][9].Sc == 0 then
  if block[4][10].Sc == 0 then
  if block[5][1].Sc == 0 then
  if block[5][2].Sc == 0 then
  if block[5][3].Sc == 0 then
  if block[5][4].Sc == 0 then
  if block[5][5].Sc == 0 then
  if block[5][6].Sc == 0 then
  if block[5][7].Sc == 0 then
  if block[5][8].Sc == 0 then
  if block[5][9].Sc == 0 then
  if block[5][10].Sc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end    

function Ec()
  if block[1][1].Ec == 0 then
  if block[1][2].Ec == 0 then
  if block[1][3].Ec == 0 then
  if block[1][4].Ec == 0 then
  if block[1][5].Ec == 0 then
  if block[1][6].Ec == 0 then
  if block[1][7].Ec == 0 then
  if block[1][8].Ec == 0 then
  if block[1][9].Ec == 0 then
  if block[1][10].Ec == 0 then
  if block[2][1].Ec == 0 then
  if block[2][2].Ec == 0 then
  if block[2][3].Ec == 0 then
  if block[2][4].Ec == 0 then
  if block[2][5].Ec == 0 then
  if block[2][6].Ec == 0 then
  if block[2][7].Ec == 0 then
  if block[2][8].Ec == 0 then
  if block[2][9].Ec == 0 then
  if block[2][10].Ec == 0 then
  if block[3][1].Ec == 0 then
  if block[3][2].Ec == 0 then
  if block[3][3].Ec == 0 then
  if block[3][4].Ec == 0 then
  if block[3][5].Ec == 0 then
  if block[3][6].Ec == 0 then
  if block[3][7].Ec == 0 then
  if block[3][8].Ec == 0 then
  if block[3][9].Ec == 0 then
  if block[3][10].Ec == 0 then
  if block[4][1].Ec == 0 then
  if block[4][2].Ec == 0 then
  if block[4][3].Ec == 0 then
  if block[4][4].Ec == 0 then
  if block[4][5].Ec == 0 then
  if block[4][6].Ec == 0 then
  if block[4][7].Ec == 0 then
  if block[4][8].Ec == 0 then
  if block[4][9].Ec == 0 then
  if block[4][10].Ec == 0 then
  if block[5][1].Ec == 0 then
  if block[5][2].Ec == 0 then
  if block[5][3].Ec == 0 then
  if block[5][4].Ec == 0 then
  if block[5][5].Ec == 0 then
  if block[5][6].Ec == 0 then
  if block[5][7].Ec == 0 then
  if block[5][8].Ec == 0 then
  if block[5][9].Ec == 0 then
  if block[5][10].Ec == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function Wc()
  if block[1][1].Wc == 0 then
  if block[1][2].Wc == 0 then
  if block[1][3].Wc == 0 then
  if block[1][4].Wc == 0 then
  if block[1][5].Wc == 0 then
  if block[1][6].Wc == 0 then
  if block[1][7].Wc == 0 then
  if block[1][8].Wc == 0 then
  if block[1][9].Wc == 0 then
  if block[1][10].Wc == 0 then
  if block[2][1].Wc == 0 then
  if block[2][2].Wc == 0 then
  if block[2][3].Wc == 0 then
  if block[2][4].Wc == 0 then
  if block[2][5].Wc == 0 then
  if block[2][6].Wc == 0 then
  if block[2][7].Wc == 0 then
  if block[2][8].Wc == 0 then
  if block[2][9].Wc == 0 then
  if block[2][10].Wc == 0 then
  if block[3][1].Wc == 0 then
  if block[3][2].Wc == 0 then
  if block[3][3].Wc == 0 then
  if block[3][4].Wc == 0 then
  if block[3][5].Wc == 0 then
  if block[3][6].Wc == 0 then
  if block[3][7].Wc == 0 then
  if block[3][8].Wc == 0 then
  if block[3][9].Wc == 0 then
  if block[3][10].Wc == 0 then
  if block[4][1].Wc == 0 then
  if block[4][2].Wc == 0 then
  if block[4][3].Wc == 0 then
  if block[4][4].Wc == 0 then
  if block[4][5].Wc == 0 then
  if block[4][6].Wc == 0 then
  if block[4][7].Wc == 0 then
  if block[4][8].Wc == 0 then
  if block[4][9].Wc == 0 then
  if block[4][10].Wc == 0 then
  if block[5][1].Wc == 0 then
  if block[5][2].Wc == 0 then
  if block[5][3].Wc == 0 then
  if block[5][4].Wc == 0 then
  if block[5][5].Wc == 0 then
  if block[5][6].Wc == 0 then
  if block[5][7].Wc == 0 then
  if block[5][8].Wc == 0 then
  if block[5][9].Wc == 0 then
  if block[5][10].Wc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NEc()
  if block[1][1].NEc == 0 then
  if block[1][2].NEc == 0 then
  if block[1][3].NEc == 0 then
  if block[1][4].NEc == 0 then
  if block[1][5].NEc == 0 then
  if block[1][6].NEc == 0 then
  if block[1][7].NEc == 0 then
  if block[1][8].NEc == 0 then
  if block[1][9].NEc == 0 then
  if block[1][10].NEc == 0 then
  if block[2][1].NEc == 0 then
  if block[2][2].NEc == 0 then
  if block[2][3].NEc == 0 then
  if block[2][4].NEc == 0 then
  if block[2][5].NEc == 0 then
  if block[2][6].NEc == 0 then
  if block[2][7].NEc == 0 then
  if block[2][8].NEc == 0 then
  if block[2][9].NEc == 0 then
  if block[2][10].NEc == 0 then
  if block[3][1].NEc == 0 then
  if block[3][2].NEc == 0 then
  if block[3][3].NEc == 0 then
  if block[3][4].NEc == 0 then
  if block[3][5].NEc == 0 then
  if block[3][6].NEc == 0 then
  if block[3][7].NEc == 0 then
  if block[3][8].NEc == 0 then
  if block[3][9].NEc == 0 then
  if block[3][10].NEc == 0 then
  if block[4][1].NEc == 0 then
  if block[4][2].NEc == 0 then
  if block[4][3].NEc == 0 then
  if block[4][4].NEc == 0 then
  if block[4][5].NEc == 0 then
  if block[4][6].NEc == 0 then
  if block[4][7].NEc == 0 then
  if block[4][8].NEc == 0 then
  if block[4][9].NEc == 0 then
  if block[4][10].NEc == 0 then
  if block[5][1].NEc == 0 then
  if block[5][2].NEc == 0 then
  if block[5][3].NEc == 0 then
  if block[5][4].NEc == 0 then
  if block[5][5].NEc == 0 then
  if block[5][6].NEc == 0 then
  if block[5][7].NEc == 0 then
  if block[5][8].NEc == 0 then
  if block[5][9].NEc == 0 then
  if block[5][10].NEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NWc()
  if block[1][1].NWc == 0 then
  if block[1][2].NWc == 0 then
  if block[1][3].NWc == 0 then
  if block[1][4].NWc == 0 then
  if block[1][5].NWc == 0 then
  if block[1][6].NWc == 0 then
  if block[1][7].NWc == 0 then
  if block[1][8].NWc == 0 then
  if block[1][9].NWc == 0 then
  if block[1][10].NWc == 0 then
  if block[2][1].NWc == 0 then
  if block[2][2].NWc == 0 then
  if block[2][3].NWc == 0 then
  if block[2][4].NWc == 0 then
  if block[2][5].NWc == 0 then
  if block[2][6].NWc == 0 then
  if block[2][7].NWc == 0 then
  if block[2][8].NWc == 0 then
  if block[2][9].NWc == 0 then
  if block[2][10].NWc == 0 then
  if block[3][1].NWc == 0 then
  if block[3][2].NWc == 0 then
  if block[3][3].NWc == 0 then
  if block[3][4].NWc == 0 then
  if block[3][5].NWc == 0 then
  if block[3][6].NWc == 0 then
  if block[3][7].NWc == 0 then
  if block[3][8].NWc == 0 then
  if block[3][9].NWc == 0 then
  if block[3][10].NWc == 0 then
  if block[4][1].NWc == 0 then
  if block[4][2].NWc == 0 then
  if block[4][3].NWc == 0 then
  if block[4][4].NWc == 0 then
  if block[4][5].NWc == 0 then
  if block[4][6].NWc == 0 then
  if block[4][7].NWc == 0 then
  if block[4][8].NWc == 0 then
  if block[4][9].NWc == 0 then
  if block[4][10].NWc == 0 then
  if block[5][1].NWc == 0 then
  if block[5][2].NWc == 0 then
  if block[5][3].NWc == 0 then
  if block[5][4].NWc == 0 then
  if block[5][5].NWc == 0 then
  if block[5][6].NWc == 0 then
  if block[5][7].NWc == 0 then
  if block[5][8].NWc == 0 then
  if block[5][9].NWc == 0 then
  if block[5][10].NWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SWc()
  if block[1][1].SWc == 0 then
  if block[1][2].SWc == 0 then
  if block[1][3].SWc == 0 then
  if block[1][4].SWc == 0 then
  if block[1][5].SWc == 0 then
  if block[1][6].SWc == 0 then
  if block[1][7].SWc == 0 then
  if block[1][8].SWc == 0 then
  if block[1][9].SWc == 0 then
  if block[1][10].SWc == 0 then
  if block[2][1].SWc == 0 then
  if block[2][2].SWc == 0 then
  if block[2][3].SWc == 0 then
  if block[2][4].SWc == 0 then
  if block[2][5].SWc == 0 then
  if block[2][6].SWc == 0 then
  if block[2][7].SWc == 0 then
  if block[2][8].SWc == 0 then
  if block[2][9].SWc == 0 then
  if block[2][10].SWc == 0 then
  if block[3][1].SWc == 0 then
  if block[3][2].SWc == 0 then
  if block[3][3].SWc == 0 then
  if block[3][4].SWc == 0 then
  if block[3][5].SWc == 0 then
  if block[3][6].SWc == 0 then
  if block[3][7].SWc == 0 then
  if block[3][8].SWc == 0 then
  if block[3][9].SWc == 0 then
  if block[3][10].SWc == 0 then
  if block[4][1].SWc == 0 then
  if block[4][2].SWc == 0 then
  if block[4][3].SWc == 0 then
  if block[4][4].SWc == 0 then
  if block[4][5].SWc == 0 then
  if block[4][6].SWc == 0 then
  if block[4][7].SWc == 0 then
  if block[4][8].SWc == 0 then
  if block[4][9].SWc == 0 then
  if block[4][10].SWc == 0 then
  if block[5][1].SWc == 0 then
  if block[5][2].SWc == 0 then
  if block[5][3].SWc == 0 then
  if block[5][4].SWc == 0 then
  if block[5][5].SWc == 0 then
  if block[5][6].SWc == 0 then
  if block[5][7].SWc == 0 then
  if block[5][8].SWc == 0 then
  if block[5][9].SWc == 0 then
  if block[5][10].SWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SEc()
  if block[1][1].SEc == 0 then
  if block[1][2].SEc == 0 then
  if block[1][3].SEc == 0 then
  if block[1][4].SEc == 0 then
  if block[1][5].SEc == 0 then
  if block[1][6].SEc == 0 then
  if block[1][7].SEc == 0 then
  if block[1][8].SEc == 0 then
  if block[1][9].SEc == 0 then
  if block[1][10].SEc == 0 then
  if block[2][1].SEc == 0 then
  if block[2][2].SEc == 0 then
  if block[2][3].SEc == 0 then
  if block[2][4].SEc == 0 then
  if block[2][5].SEc == 0 then
  if block[2][6].SEc == 0 then
  if block[2][7].SEc == 0 then
  if block[2][8].SEc == 0 then
  if block[2][9].SEc == 0 then
  if block[2][10].SEc == 0 then
  if block[3][1].SEc == 0 then
  if block[3][2].SEc == 0 then
  if block[3][3].SEc == 0 then
  if block[3][4].SEc == 0 then
  if block[3][5].SEc == 0 then
  if block[3][6].SEc == 0 then
  if block[3][7].SEc == 0 then
  if block[3][8].SEc == 0 then
  if block[3][9].SEc == 0 then
  if block[3][10].SEc == 0 then
  if block[4][1].SEc == 0 then
  if block[4][2].SEc == 0 then
  if block[4][3].SEc == 0 then
  if block[4][4].SEc == 0 then
  if block[4][5].SEc == 0 then
  if block[4][6].SEc == 0 then
  if block[4][7].SEc == 0 then
  if block[4][8].SEc == 0 then
  if block[4][9].SEc == 0 then
  if block[4][10].SEc == 0 then
  if block[5][1].SEc == 0 then
  if block[5][2].SEc == 0 then
  if block[5][3].SEc == 0 then
  if block[5][4].SEc == 0 then
  if block[5][5].SEc == 0 then
  if block[5][6].SEc == 0 then
  if block[5][7].SEc == 0 then
  if block[5][8].SEc == 0 then
  if block[5][9].SEc == 0 then
  if block[5][10].SEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SWWc()
  if block[1][1].SWWc == 0 then
  if block[1][2].SWWc == 0 then
  if block[1][3].SWWc == 0 then
  if block[1][4].SWWc == 0 then
  if block[1][5].SWWc == 0 then
  if block[1][6].SWWc == 0 then
  if block[1][7].SWWc == 0 then
  if block[1][8].SWWc == 0 then
  if block[1][9].SWWc == 0 then
  if block[1][10].SWWc == 0 then
  if block[2][1].SWWc == 0 then
  if block[2][2].SWWc == 0 then
  if block[2][3].SWWc == 0 then
  if block[2][4].SWWc == 0 then
  if block[2][5].SWWc == 0 then
  if block[2][6].SWWc == 0 then
  if block[2][7].SWWc == 0 then
  if block[2][8].SWWc == 0 then
  if block[2][9].SWWc == 0 then
  if block[2][10].SWWc == 0 then
  if block[3][1].SWWc == 0 then
  if block[3][2].SWWc == 0 then
  if block[3][3].SWWc == 0 then
  if block[3][4].SWWc == 0 then
  if block[3][5].SWWc == 0 then
  if block[3][6].SWWc == 0 then
  if block[3][7].SWWc == 0 then
  if block[3][8].SWWc == 0 then
  if block[3][9].SWWc == 0 then
  if block[3][10].SWWc == 0 then
  if block[4][1].SWWc == 0 then
  if block[4][2].SWWc == 0 then
  if block[4][3].SWWc == 0 then
  if block[4][4].SWWc == 0 then
  if block[4][5].SWWc == 0 then
  if block[4][6].SWWc == 0 then
  if block[4][7].SWWc == 0 then
  if block[4][8].SWWc == 0 then
  if block[4][9].SWWc == 0 then
  if block[4][10].SWWc == 0 then
  if block[5][1].SWWc == 0 then
  if block[5][2].SWWc == 0 then
  if block[5][3].SWWc == 0 then
  if block[5][4].SWWc == 0 then
  if block[5][5].SWWc == 0 then
  if block[5][6].SWWc == 0 then
  if block[5][7].SWWc == 0 then
  if block[5][8].SWWc == 0 then
  if block[5][9].SWWc == 0 then
  if block[5][10].SWWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SEEc()
  if block[1][1].SEEc == 0 then
  if block[1][2].SEEc == 0 then
  if block[1][3].SEEc == 0 then
  if block[1][4].SEEc == 0 then
  if block[1][5].SEEc == 0 then
  if block[1][6].SEEc == 0 then
  if block[1][7].SEEc == 0 then
  if block[1][8].SEEc == 0 then
  if block[1][9].SEEc == 0 then
  if block[1][10].SEEc == 0 then
  if block[2][1].SEEc == 0 then
  if block[2][2].SEEc == 0 then
  if block[2][3].SEEc == 0 then
  if block[2][4].SEEc == 0 then
  if block[2][5].SEEc == 0 then
  if block[2][6].SEEc == 0 then
  if block[2][7].SEEc == 0 then
  if block[2][8].SEEc == 0 then
  if block[2][9].SEEc == 0 then
  if block[2][10].SEEc == 0 then
  if block[3][1].SEEc == 0 then
  if block[3][2].SEEc == 0 then
  if block[3][3].SEEc == 0 then
  if block[3][4].SEEc == 0 then
  if block[3][5].SEEc == 0 then
  if block[3][6].SEEc == 0 then
  if block[3][7].SEEc == 0 then
  if block[3][8].SEEc == 0 then
  if block[3][9].SEEc == 0 then
  if block[3][10].SEEc == 0 then
  if block[4][1].SEEc == 0 then
  if block[4][2].SEEc == 0 then
  if block[4][3].SEEc == 0 then
  if block[4][4].SEEc == 0 then
  if block[4][5].SEEc == 0 then
  if block[4][6].SEEc == 0 then
  if block[4][7].SEEc == 0 then
  if block[4][8].SEEc == 0 then
  if block[4][9].SEEc == 0 then
  if block[4][10].SEEc == 0 then
  if block[5][1].SEEc == 0 then
  if block[5][2].SEEc == 0 then
  if block[5][3].SEEc == 0 then
  if block[5][4].SEEc == 0 then
  if block[5][5].SEEc == 0 then
  if block[5][6].SEEc == 0 then
  if block[5][7].SEEc == 0 then
  if block[5][8].SEEc == 0 then
  if block[5][9].SEEc == 0 then
  if block[5][10].SEEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NEEc()
  if block[1][1].NEEc == 0 then
  if block[1][2].NEEc == 0 then
  if block[1][3].NEEc == 0 then
  if block[1][4].NEEc == 0 then
  if block[1][5].NEEc == 0 then
  if block[1][6].NEEc == 0 then
  if block[1][7].NEEc == 0 then
  if block[1][8].NEEc == 0 then
  if block[1][9].NEEc == 0 then
  if block[1][10].NEEc == 0 then
  if block[2][1].NEEc == 0 then
  if block[2][2].NEEc == 0 then
  if block[2][3].NEEc == 0 then
  if block[2][4].NEEc == 0 then
  if block[2][5].NEEc == 0 then
  if block[2][6].NEEc == 0 then
  if block[2][7].NEEc == 0 then
  if block[2][8].NEEc == 0 then
  if block[2][9].NEEc == 0 then
  if block[2][10].NEEc == 0 then
  if block[3][1].NEEc == 0 then
  if block[3][2].NEEc == 0 then
  if block[3][3].NEEc == 0 then
  if block[3][4].NEEc == 0 then
  if block[3][5].NEEc == 0 then
  if block[3][6].NEEc == 0 then
  if block[3][7].NEEc == 0 then
  if block[3][8].NEEc == 0 then
  if block[3][9].NEEc == 0 then
  if block[3][10].NEEc == 0 then
  if block[4][1].NEEc == 0 then
  if block[4][2].NEEc == 0 then
  if block[4][3].NEEc == 0 then
  if block[4][4].NEEc == 0 then
  if block[4][5].NEEc == 0 then
  if block[4][6].NEEc == 0 then
  if block[4][7].NEEc == 0 then
  if block[4][8].NEEc == 0 then
  if block[4][9].NEEc == 0 then
  if block[4][10].NEEc == 0 then
  if block[5][1].NEEc == 0 then
  if block[5][2].NEEc == 0 then
  if block[5][3].NEEc == 0 then
  if block[5][4].NEEc == 0 then
  if block[5][5].NEEc == 0 then
  if block[5][6].NEEc == 0 then
  if block[5][7].NEEc == 0 then
  if block[5][8].NEEc == 0 then
  if block[5][9].NEEc == 0 then
  if block[5][10].NEEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NWWc()
  if block[1][1].NWWc == 0 then
  if block[1][2].NWWc == 0 then
  if block[1][3].NWWc == 0 then
  if block[1][4].NWWc == 0 then
  if block[1][5].NWWc == 0 then
  if block[1][6].NWWc == 0 then
  if block[1][7].NWWc == 0 then
  if block[1][8].NWWc == 0 then
  if block[1][9].NWWc == 0 then
  if block[1][10].NWWc == 0 then
  if block[2][1].NWWc == 0 then
  if block[2][2].NWWc == 0 then
  if block[2][3].NWWc == 0 then
  if block[2][4].NWWc == 0 then
  if block[2][5].NWWc == 0 then
  if block[2][6].NWWc == 0 then
  if block[2][7].NWWc == 0 then
  if block[2][8].NWWc == 0 then
  if block[2][9].NWWc == 0 then
  if block[2][10].NWWc == 0 then
  if block[3][1].NWWc == 0 then
  if block[3][2].NWWc == 0 then
  if block[3][3].NWWc == 0 then
  if block[3][4].NWWc == 0 then
  if block[3][5].NWWc == 0 then
  if block[3][6].NWWc == 0 then
  if block[3][7].NWWc == 0 then
  if block[3][8].NWWc == 0 then
  if block[3][9].NWWc == 0 then
  if block[3][10].NWWc == 0 then
  if block[4][1].NWWc == 0 then
  if block[4][2].NWWc == 0 then
  if block[4][3].NWWc == 0 then
  if block[4][4].NWWc == 0 then
  if block[4][5].NWWc == 0 then
  if block[4][6].NWWc == 0 then
  if block[4][7].NWWc == 0 then
  if block[4][8].NWWc == 0 then
  if block[4][9].NWWc == 0 then
  if block[4][10].NWWc == 0 then
  if block[5][1].NWWc == 0 then
  if block[5][2].NWWc == 0 then
  if block[5][3].NWWc == 0 then
  if block[5][4].NWWc == 0 then
  if block[5][5].NWWc == 0 then
  if block[5][6].NWWc == 0 then
  if block[5][7].NWWc == 0 then
  if block[5][8].NWWc == 0 then
  if block[5][9].NWWc == 0 then
  if block[5][10].NWWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NNEc()
  if block[1][1].NNEc == 0 then
  if block[1][2].NNEc == 0 then
  if block[1][3].NNEc == 0 then
  if block[1][4].NNEc == 0 then
  if block[1][5].NNEc == 0 then
  if block[1][6].NNEc == 0 then
  if block[1][7].NNEc == 0 then
  if block[1][8].NNEc == 0 then
  if block[1][9].NNEc == 0 then
  if block[1][10].NNEc == 0 then
  if block[2][1].NNEc == 0 then
  if block[2][2].NNEc == 0 then
  if block[2][3].NNEc == 0 then
  if block[2][4].NNEc == 0 then
  if block[2][5].NNEc == 0 then
  if block[2][6].NNEc == 0 then
  if block[2][7].NNEc == 0 then
  if block[2][8].NNEc == 0 then
  if block[2][9].NNEc == 0 then
  if block[2][10].NNEc == 0 then
  if block[3][1].NNEc == 0 then
  if block[3][2].NNEc == 0 then
  if block[3][3].NNEc == 0 then
  if block[3][4].NNEc == 0 then
  if block[3][5].NNEc == 0 then
  if block[3][6].NNEc == 0 then
  if block[3][7].NNEc == 0 then
  if block[3][8].NNEc == 0 then
  if block[3][9].NNEc == 0 then
  if block[3][10].NNEc == 0 then
  if block[4][1].NNEc == 0 then
  if block[4][2].NNEc == 0 then
  if block[4][3].NNEc == 0 then
  if block[4][4].NNEc == 0 then
  if block[4][5].NNEc == 0 then
  if block[4][6].NNEc == 0 then
  if block[4][7].NNEc == 0 then
  if block[4][8].NNEc == 0 then
  if block[4][9].NNEc == 0 then
  if block[4][10].NNEc == 0 then
  if block[5][1].NNEc == 0 then
  if block[5][2].NNEc == 0 then
  if block[5][3].NNEc == 0 then
  if block[5][4].NNEc == 0 then
  if block[5][5].NNEc == 0 then
  if block[5][6].NNEc == 0 then
  if block[5][7].NNEc == 0 then
  if block[5][8].NNEc == 0 then
  if block[5][9].NNEc == 0 then
  if block[5][10].NNEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function NNWc()
  if block[1][1].NNWc == 0 then
  if block[1][2].NNWc == 0 then
  if block[1][3].NNWc == 0 then
  if block[1][4].NNWc == 0 then
  if block[1][5].NNWc == 0 then
  if block[1][6].NNWc == 0 then
  if block[1][7].NNWc == 0 then
  if block[1][8].NNWc == 0 then
  if block[1][9].NNWc == 0 then
  if block[1][10].NNWc == 0 then
  if block[2][1].NNWc == 0 then
  if block[2][2].NNWc == 0 then
  if block[2][3].NNWc == 0 then
  if block[2][4].NNWc == 0 then
  if block[2][5].NNWc == 0 then
  if block[2][6].NNWc == 0 then
  if block[2][7].NNWc == 0 then
  if block[2][8].NNWc == 0 then
  if block[2][9].NNWc == 0 then
  if block[2][10].NNWc == 0 then
  if block[3][1].NNWc == 0 then
  if block[3][2].NNWc == 0 then
  if block[3][3].NNWc == 0 then
  if block[3][4].NNWc == 0 then
  if block[3][5].NNWc == 0 then
  if block[3][6].NNWc == 0 then
  if block[3][7].NNWc == 0 then
  if block[3][8].NNWc == 0 then
  if block[3][9].NNWc == 0 then
  if block[3][10].NNWc == 0 then
  if block[4][1].NNWc == 0 then
  if block[4][2].NNWc == 0 then
  if block[4][3].NNWc == 0 then
  if block[4][4].NNWc == 0 then
  if block[4][5].NNWc == 0 then
  if block[4][6].NNWc == 0 then
  if block[4][7].NNWc == 0 then
  if block[4][8].NNWc == 0 then
  if block[4][9].NNWc == 0 then
  if block[4][10].NNWc == 0 then
  if block[5][1].NNWc == 0 then
  if block[5][2].NNWc == 0 then
  if block[5][3].NNWc == 0 then
  if block[5][4].NNWc == 0 then
  if block[5][5].NNWc == 0 then
  if block[5][6].NNWc == 0 then
  if block[5][7].NNWc == 0 then
  if block[5][8].NNWc == 0 then
  if block[5][9].NNWc == 0 then
  if block[5][10].NNWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SSWc()
  if block[1][1].SSWc == 0 then
  if block[1][2].SSWc == 0 then
  if block[1][3].SSWc == 0 then
  if block[1][4].SSWc == 0 then
  if block[1][5].SSWc == 0 then
  if block[1][6].SSWc == 0 then
  if block[1][7].SSWc == 0 then
  if block[1][8].SSWc == 0 then
  if block[1][9].SSWc == 0 then
  if block[1][10].SSWc == 0 then
  if block[2][1].SSWc == 0 then
  if block[2][2].SSWc == 0 then
  if block[2][3].SSWc == 0 then
  if block[2][4].SSWc == 0 then
  if block[2][5].SSWc == 0 then
  if block[2][6].SSWc == 0 then
  if block[2][7].SSWc == 0 then
  if block[2][8].SSWc == 0 then
  if block[2][9].SSWc == 0 then
  if block[2][10].SSWc == 0 then
  if block[3][1].SSWc == 0 then
  if block[3][2].SSWc == 0 then
  if block[3][3].SSWc == 0 then
  if block[3][4].SSWc == 0 then
  if block[3][5].SSWc == 0 then
  if block[3][6].SSWc == 0 then
  if block[3][7].SSWc == 0 then
  if block[3][8].SSWc == 0 then
  if block[3][9].SSWc == 0 then
  if block[3][10].SSWc == 0 then
  if block[4][1].SSWc == 0 then
  if block[4][2].SSWc == 0 then
  if block[4][3].SSWc == 0 then
  if block[4][4].SSWc == 0 then
  if block[4][5].SSWc == 0 then
  if block[4][6].SSWc == 0 then
  if block[4][7].SSWc == 0 then
  if block[4][8].SSWc == 0 then
  if block[4][9].SSWc == 0 then
  if block[4][10].SSWc == 0 then
  if block[5][1].SSWc == 0 then
  if block[5][2].SSWc == 0 then
  if block[5][3].SSWc == 0 then
  if block[5][4].SSWc == 0 then
  if block[5][5].SSWc == 0 then
  if block[5][6].SSWc == 0 then
  if block[5][7].SSWc == 0 then
  if block[5][8].SSWc == 0 then
  if block[5][9].SSWc == 0 then
  if block[5][10].SSWc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  

function SSEc()
  if block[1][1].SSEc == 0 then
  if block[1][2].SSEc == 0 then
  if block[1][3].SSEc == 0 then
  if block[1][4].SSEc == 0 then
  if block[1][5].SSEc == 0 then
  if block[1][6].SSEc == 0 then
  if block[1][7].SSEc == 0 then
  if block[1][8].SSEc == 0 then
  if block[1][9].SSEc == 0 then
  if block[1][10].SSEc == 0 then
  if block[2][1].SSEc == 0 then
  if block[2][2].SSEc == 0 then
  if block[2][3].SSEc == 0 then
  if block[2][4].SSEc == 0 then
  if block[2][5].SSEc == 0 then
  if block[2][6].SSEc == 0 then
  if block[2][7].SSEc == 0 then
  if block[2][8].SSEc == 0 then
  if block[2][9].SSEc == 0 then
  if block[2][10].SSEc == 0 then
  if block[3][1].SSEc == 0 then
  if block[3][2].SSEc == 0 then
  if block[3][3].SSEc == 0 then
  if block[3][4].SSEc == 0 then
  if block[3][5].SSEc == 0 then
  if block[3][6].SSEc == 0 then
  if block[3][7].SSEc == 0 then
  if block[3][8].SSEc == 0 then
  if block[3][9].SSEc == 0 then
  if block[3][10].SSEc == 0 then
  if block[4][1].SSEc == 0 then
  if block[4][2].SSEc == 0 then
  if block[4][3].SSEc == 0 then
  if block[4][4].SSEc == 0 then
  if block[4][5].SSEc == 0 then
  if block[4][6].SSEc == 0 then
  if block[4][7].SSEc == 0 then
  if block[4][8].SSEc == 0 then
  if block[4][9].SSEc == 0 then
  if block[4][10].SSEc == 0 then
  if block[5][1].SSEc == 0 then
  if block[5][2].SSEc == 0 then
  if block[5][3].SSEc == 0 then
  if block[5][4].SSEc == 0 then
  if block[5][5].SSEc == 0 then
  if block[5][6].SSEc == 0 then
  if block[5][7].SSEc == 0 then
  if block[5][8].SSEc == 0 then
  if block[5][9].SSEc == 0 then
  if block[5][10].SSEc == 0 then
    return true  
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end 
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end
  else  
  return false
  end      
end 
end  