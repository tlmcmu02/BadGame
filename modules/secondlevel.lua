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
table.insert(bullets, Bullet:new(140, 140, 'S'))
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
          block[i][t]:draw()
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


function reflect()

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
  if mapc:cc(bullets[p].x - 3, bullets[p].y, 16, 16) == true then  
    bullets[p].direction = 'NE'
  end 
  if mapc:cc(bullets[p].x, bullets[p].y - 3, 16, 16) == true then   
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





