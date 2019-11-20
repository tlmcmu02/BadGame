love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()

--player = Entity:new() -- Create the Entity object named player

openDoor = love.graphics.newImage('asset-1/dungeon/doors/vgate_closed_middle.png')
closedDoor = love.graphics.newImage('asset-1/dungeon/doors/vgate_open_middle.png')
switch = love.graphics.newImage('asset-1/dungeon/traps/pressure_plates.png')
currentDoor = closedDoor


x = 100
y = 146

state = 'rest'

if x > 100 then
if y > 200 then
  state = 'move'
  y = y - 1
else
  state = 'rest'
end
else
state = 'move'
x = x - 1
end
-- Create the collision map, with walls around the edge of the map
print(x..", "..y..", state: "..state)
wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_4.png')
collision = {
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}
-- Create the background map
floor = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
background = {
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
}
  --Finally create your maps
  collision = Map:new (collision)
  --background = Map:new (background)
  
  
  template = {-- a 10 x 10 map with the floor texture in the middle

  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
  {wall, wall, wall, floor, floor, wall, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, wall, wall, floor, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}



map = Map:new(template)
player = {
 
    playerimg = love.graphics.newImage('Untitled.png')
    playerx = 200
    playery = 200
    img = love.graphics.newImage('assets-1/player/hp_bar/empty.png')
     x = 64
     y = 64
     w = 44
     h = 19
     hp = 10
     gp = 0
     s = 4
 }
 
 hp bar = }
 love.graphics.newImage('assets-1/player/hp_bar/empty.png')
 love.graphics.newImage('assets-1/player/hp_bar/critical.png')
 love.graphics.newImage('assets-1/player/hp_bar/2.png')
 love.graphics.newImage('assets-1/player/hp_bar/3.png')
 love.graphics.newImage('assets-1/player/hp_bar/4.png')
 love.graphics.newImage('assets-1/player/hp_bar/5.png')
 love.graphics.newImage('assets-1/player/hp_bar/6.png')
 love.graphics.newImage('assets-1/player/hp_bar/7.png')
 love.graphics.newImage('assets-1/player/hp_bar/8.png')
 love.graphics.newImage('assets-1/player/hp_bar/full.png')
 love.graphics.newImage('assets-1/player/hp_bar/game over.png')


playerImg = love.graphics.newImage('')
x = 400
y = 300
w = 200   -- The player's width is 50
h = 200   -- The player's height is 50
hp = 100 -- Set the player's HP to 100 at the start of the game
PNG = love.graphics.newImage('')
z = 100 -- The enemy's width is 50
g = 250 -- The enemy's height is 50
--img = love.graphics.newImage('assets')
end
function love.update(dt)
    if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
        currentDoor = openDoor
      end
      if love.keyboard.isDown('right' or 'd') then
        if collision:cc(x + 5, y, 64, 64) == false then
          if currentDoor == closedDoor then
            if cc(x, y, 64, 64,    764, 92, 263, 263) == false then
              x = x + 5
            end
          else
            x = x + 5
          end
        end
      end
      if love.keyboard.isDown('down' or 's') then
        if collision:cc(x, y + 4, 64, 64) == false then
          y = y + 5
        end
      end
      if love.keyboard.isDown('left' or 'a') then
        if collision:cc(x - 4, y, 64, 64) == false then
          x = x - 5
        end
      end
      if love.keyboard.isDown('up' or 'w') then 
        if collision:cc(x, y - 4, 64, 64) == false then
          y = y - 5
        end
      end
      if love.keyboard.isDown ('escape') then 
        love.exitModule();
      end
      if x > 800 then
        love.exitModule()
      end
    -- nothing to update
    end
    -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
    
      -- if true, decrease HP:
      if love.keyboard.isDown('right' or 'd') then  
       
        if love.keyboard.isDown('down' or 's') then  
        h = h + 200
        end
        if love.keyboard.isDown('left' or 'a') then  
        w = w - 200
        end
        if love.keyboard.isDown('up' or 'w') then 
          h = h - 200
        end 
      
        love.graphics.draw(img, x1,y2)
        
        if love.keyboard.isDown ('B') then
          if cc(x1, y1, -1, w1, h1,    100, 200, 64, 64) ==  false then
            y = y - 1
          end
        end
    end
end

function love.draw()
    map:draw()
    collision:draw()
    love.graphics.print('Octopod-cast!', 0, 0)
    
    love.graphics.draw(currentDoor, 764, 92)
    love.graphics.draw(switch, 200, 200)
    -- Draw the enemy
    love.graphics.draw(PNG, z, g)
  
    -- Draw the player
    love.graphics.draw(playerImg, x, y)
   
    -- Draw the rectangle in the upper left corner
    love.graphics.rectangle('line', 0, 0, 64, 64)
  
   -- Print the player's HP in the top left corner
   love.graphics.print(hp, 10, 40)
  
   love.graphics.print("So you must be Bob the shape-shifting alien? You have to solve all the puzzles in order to get out of here.",  100, 100)
  if cc(x, y, 64, 64,   100, 100, 40, 40) == true then
   -- What should go here?
  end
  end
   --player:draw() -- Draw the entity object named player 
   
end
