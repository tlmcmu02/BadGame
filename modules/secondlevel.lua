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
local Functiondef = require 'core/functiondef'

bullet = {}
table.insert(bullet, Bullet:new(415, 500, 'S'))
block = {}
for i = 1, 5 do
    block[i] = {}
    for t = 1, 10 do
    block[i][t] = Block:new(color[i], t, i + 1)
    end
end
function love.load()
  
Player1 = Player:new(200, 500, 'Breakout')
ball1 = ball:new(64, 650)

hpBar = {
    love.graphics.newImage('assets-1/player/hp_bar/0.png'),
    love.graphics.newImage('assets-1/player/hp_bar/1.png'),
    love.graphics.newImage('assets-1/player/hp_bar/2.png'),
    love.graphics.newImage('assets-1/player/hp_bar/3.png'),
  }
  Livestable = {
    love.graphics.newImage('assets-1/player/lives1.png'),
    love.graphics.newImage('assets-1/player/lives2.png'),
    love.graphics.newImage('assets-1/player/lives3.png'),
    love.graphics.newImage('assets-1/player/lives4.png'),
    love.graphics.newImage('assets-1/player/lives5.png'),
  }


  lose = love.graphics.newImage('assets-1/Player/lose.png')

  win = love.graphics.newImage('assets-1/Player/Win.png')

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
  
  levelend = false
  
  mapc = Map:new(layer1)

end

function love.update(dt)
  if levelend == false then

  for i = 1, 5 do
  for t = 1, 10 do

      if block[1][1].destroyed == 1 then
      if block[1][2].destroyed == 1 then
      if block[1][3].destroyed == 1 then
      if block[1][4].destroyed == 1 then
      if block[1][5].destroyed == 1 then
      if block[1][6].destroyed == 1 then
      if block[1][7].destroyed == 1 then
      if block[1][8].destroyed == 1 then
      if block[1][9].destroyed == 1 then
      if block[1][10].destroyed == 1 then
      if block[2][1].destroyed == 1 then
      if block[2][2].destroyed == 1 then
      if block[2][3].destroyed == 1 then
      if block[2][4].destroyed == 1 then
      if block[2][5].destroyed == 1 then
      if block[2][6].destroyed == 1 then
      if block[2][7].destroyed == 1 then
      if block[2][8].destroyed == 1 then
      if block[2][9].destroyed == 1 then
      if block[2][10].destroyed == 1 then
      if block[3][1].destroyed == 1 then
      if block[3][2].destroyed == 1 then
      if block[3][3].destroyed == 1 then
      if block[3][4].destroyed == 1 then
      if block[3][5].destroyed == 1 then
      if block[3][6].destroyed == 1 then
      if block[3][7].destroyed == 1 then
      if block[3][8].destroyed == 1 then
      if block[3][9].destroyed == 1 then
      if block[3][10].destroyed == 1 then
      if block[4][1].destroyed == 1 then
      if block[4][2].destroyed == 1 then
      if block[4][3].destroyed == 1 then
      if block[4][4].destroyed == 1 then
      if block[4][5].destroyed == 1 then
      if block[4][6].destroyed == 1 then
      if block[4][7].destroyed == 1 then
      if block[4][8].destroyed == 1 then
      if block[4][9].destroyed == 1 then
      if block[4][10].destroyed == 1 then
      if block[5][1].destroyed == 1 then
      if block[5][2].destroyed == 1 then
      if block[5][3].destroyed == 1 then
      if block[5][4].destroyed == 1 then
      if block[5][5].destroyed == 1 then
      if block[5][6].destroyed == 1 then
      if block[5][7].destroyed == 1 then
      if block[5][8].destroyed == 1 then
      if block[5][9].destroyed == 1 then
      if block[5][10].destroyed == 1 then
        levelend = true
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
      if Player1.lives == 0 then
        levelend = true
      end

  for i = 1, 5 do
  for t = 1, 10 do
  for y = 1, #bullet do

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
      if cc(Player1.x + 10, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].leftcollision = 0
      else
      block[i][t].leftcollision = 1
      end
      if cc(Player1.x + 4, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].leftdashcollision = 0
      else
      block[i][t].leftdashcollision = 1
      end
      if cc(Player1.x + 16, Player1.y + 22, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].downcollision = 0
      else
      block[i][t].downcollision = 1
      end
      if cc(Player1.x + 16, Player1.y + 28, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].downdashcollision = 0
      else
      block[i][t].downdashcollision = 1
      end
      if cc(Player1.x + 22, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].rightcollision = 0
      else
      block[i][t].rightcollision = 1
      end
      if cc(Player1.x + 28, Player1.y + 16, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].rightdashcollision = 0
      else
      block[i][t].rightdashcollision = 1
      end
      if cc(ball1.x + 3, ball1.y + 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SEcollision = 0
      else
      block[i][t].SEcollision = 1
      end
      if cc(ball1.x - 3, ball1.y + 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].SWcollision = 0
      else
      block[i][t].SWcollision = 1
      end
      if cc(ball1.x + 3, ball1.y - 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NEcollision = 0
      else
      block[i][t].NEcollision = 1
      end
      if cc(ball1.x - 3, ball1.y - 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == false then
      block[i][t].NWcollision = 0
      else
      block[i][t].NWcollision = 1
      end
      if bullet[y].animdeletetime >= 0 then
        bullet[y].animdeletetime = bullet[y].animdeletetime - 1
      end
      if bullet[y].cool > 0 then
        bullet[y].cool = bullet[y].cool - 1
      end
  end
  end
  end
  CR()
  ballCR()



  ball1:update(dt)
  for i = 1, #bullet do
    bullet[i]:update(dt)
    if Player1.Iframes == 0 then
      if cc(Player1.x + 16, Player1.y + 16, 32, 32, bullet[i].x, bullet[i].y, 16, 16) then
        bullet[i]:setDelete() -- delete the bullet
        Player1:IFrames() -- decrease player hp
      end
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
  Player1.IFTrigger = false
end

  Player1:breakoutupdate(dt)
  if Player1.lifelost == 1 then
    Player1.lives = Player1.lives - 1
    Player1.x = 128
    Player1.y = 500
    Player1.hpnum = 3
    Player1.timerIFrames = 120
    Player1.Iframes = 0
    Player1.lifelost = 0
  end



  cam:setPosition(Player1.x, Player1.y)

end

end

function love.draw()
    cam:draw(function(l, t, w, h)
        
        mapc:draw()
        ball1:draw()
       
        Player1:Draw()
        for i = 1, 5 do
          for t = 1, 10 do
          block[i][t]:draw()
          end
        end 
        for i = 1, #bullet do
          bullet[i]:draw()       
        end

        
        
      end)
      
  if Player1.lives > 0 then
    if Player1.hpnum == 3 then
      love.graphics.draw(hpBar[4], 16, 32, 6, 3)
    end
    if Player1.hpnum == 2 then
      love.graphics.draw(hpBar[3], 16, 32, 6, 3)
    end
    if Player1.hpnum == 1 then
      love.graphics.draw(hpBar[2], 16, 32, 6, 3)
    end
  end

if Player1.lives == 1 then
  love.graphics.draw(Livestable[1], 700, 0)
end
if Player1.lives == 2 then
  love.graphics.draw(Livestable[2], 700, 0)
end
if Player1.lives == 3 then
  love.graphics.draw(Livestable[3], 700, 0)
end
if Player1.lives == 4 then
  love.graphics.draw(Livestable[4], 700, 0)
end
if Player1.lives == 5 then
  love.graphics.draw(Livestable[5], 700, 0)
end

if levelend == true then
if Player1.lives < 1 then
  love.graphics.draw(lose, 0, 0)
else
  love.graphics.draw(win, 0, 0)
end
end

end

