love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'

function love.load()

--player = Entity:new() -- Create the Entity object named player

openDoor = love.graphics.newImage('assets-1/Door/vgate_open_middle.png')
closedDoor = love.graphics.newImage('assets-1/Door/vgate_closed_middle.png')
switch = love.graphics.newImage('assets-1/Switch/pressure_plate.png')
currentDoor = closedDoor

PlayerLoad()

state = 'rest'

if x > 100 then
if y > 200 then
  state = 'move'
  y = y - 1
else
  state = 'rest'
end
state = 'move'
x = x - 1
end
-- Create the collision map, with walls around the edge of the map
print(x..", "..y..", state: "..state)
wall = love.graphics.newImage('assets-1/Wall/hell_1.png')
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
floor = love.graphics.newImage('assets-1/Floor/cage_0.png')
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
  mapc = Map:new (collision)
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


end
 
 cam = gamera.new(0, 0, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000

cam:setPosition(400, 400)


function love.update(dt)
  if cc(x, y, 64, 64, 200, 200, 64, 64) == true then
    currentDoor = openDoor
  end
  engineupdate(dt)
    if love.keyboard.isDown ('escape') then 
      love.exitModule();
    end
    if x > 800 then
      love.exitModule()
    end
end

function love.draw()
    map:draw()
    mapc:draw()
    love.graphics.print('', 0, 0)
    
    love.graphics.draw(currentDoor, 764, 92)
    love.graphics.draw(switch, 200, 200)
    -- Draw the enemy
    
    DrawPlayer()
    
    cam:draw(function(x, y)
  
    -- Draw the player
   
    -- Draw the rectangle in the upper left corner
    love.graphics.rectangle('line', 0, 0, 64, 64)
  
   -- Print the player's HP in the top left corner
  
   love.graphics.print("",  100, 100)
  if cc( x, y, 64, 64,   100, 100, 40, 40) == true then
   -- What should go here?
  
  end
   --player:draw() -- Draw the entity object named player 
end)
end


function endofdash()
  dashattack = 0
end