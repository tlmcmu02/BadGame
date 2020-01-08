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
function love.load()
  
Player1 = Player:new(128, 368, 'Breakout')
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

  
  ball1:update(dt)
  for i = 1, #bullets do
    bullets[i]:update(dt)
    if cc(Player1.x + 16, Player1.y + 16, 32, 32, bullets[i].x, bullets[i].y, 16, 16) then
      bullets[i]:setDelete()-- then delete the bullet
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
        

        love.graphics.print(Player1.Iframes, x, y)

        
        
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

function updashblockcc()
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


function upblockcc()
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

function love.keypressed(key)
  if key == 'space' then
    table.insert(bullets, Bullet:new(140, 140, 'S'))
  end
end





