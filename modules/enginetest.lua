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

function love.load()

  PlayerLoad()
  
  Bullet1 = bullet:new(140, 140, 'S')
  


  wall = love.graphics.newImage('assets-1/Wall/catacombs_0.png')

  mapc = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, 'nil','nil','nil','nil','nil','nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', 'nil','nil','nil', wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  mapc = Map:new(mapc)

  cam = gamera.new(0, 0, 832, 11000)

  Music = love.audio.newSource('Great Temple (Zelda II   The Adventure of Link)   Super Smash Bros Wii U.mp3', 'static')
  Music:setVolume(0.5)
end

function love.update(dt)

  engineupdate(dt)
  Bullet1:update(dt)

  Music:play()


  if love.keyboard.isDown ('space') then 
    love.exitModule();
  end

  cam:setPosition(x, y)

end

function love.draw()
  cam:draw(function(l, t, w, h)
    Bullet1:draw()

  mapc:draw()


  
  DrawPlayer()

  end)

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