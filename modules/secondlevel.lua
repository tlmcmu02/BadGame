love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local Block = require 'core/block'
local class = require 'core/middleclass'

function love.load()
  
PlayerLoad()



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
    {f, f, f, f, f, f, f, f, f, f, f, f, },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    {f, f, f, f, f, f, f, f, f, f, f, f,  },
    
  }
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
  
  map = Map:new(background)
  mapc = Map:new(layer1)

end

function love.update(dt)

  

  enginebreakoutupdate(dt)
  --if lifelost == 1 then
    --lives = lives - 1
    --player.x = 64
    --player.y = 320
    --hpnum = 10
    --timerIFrames = 0
    --Iframes = 0
    --lifelost = 0
  --end



  cam:setPosition(x, y)

end

function love.draw()
    cam:draw(function(l, t, w, h)
        map:draw()
        mapc:draw()
       
        DrawPlayer()
       
        

        --love.graphics.draw(ball.img, ball.x, ball.y)

        
        
      end)
love.graphics.draw(hpBar[11], 16, 64, 6, 3)
      
end

function endofdash()
  dashattack = 0
end





