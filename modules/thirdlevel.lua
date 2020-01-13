love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local engine = require 'core/engine'
local Functiondef = require 'core/functiondef'
local class = require 'core/middleclass'
local Bullet = require 'core/bullet'

bullet = {}
table.insert(bullet, Bullet:new(415, 500, 'S'))

function love.load() -- The door opens when you get near the switch, the enemy will try to attack you, and there tons of coding in this level.

--player = Entity:new() -- Create the Entity object named player

openDoor = love.graphics.newImage('assets-1/Door/vgate_open_middle.png')
closedDoor = love.graphics.newImage('assets-1/Door/vgate_closed_middle.png')
cyclops = love.graphics.newImage('assets-1/cyclops.png')
switch = love.graphics.newImage('assets-1/Switch/pressure_plate.png')
currentDoor = closedDoor

Player1 = Player:new(200, 300)
hpBar = {
  love.graphics.newImage('assets-1/player/hp_bar/0.png'),
  love.graphics.newImage('assets-1/player/hp_bar/1.png'),
  love.graphics.newImage('assets-1/player/hp_bar/2.png'),
  love.graphics.newImage('assets-1/player/hp_bar/3.png'),
}
state  = 'rest'
x = 128
y = 128
hp = 3
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
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}
-- Create the background map
floor = love.graphics.newImage('assets-1/Floor/cage_0.png')
background = {
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor},
  {floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor},
}
  --Finally create your maps
  mapc = Map:new (collision)
  --background = Map:new (background)
  
  Doom = love.audio.newSource('Doom SNES Soundtrack   E1M1   At Doom.mp3', 'static')

  template = {-- a 10 x 10 map with the floor texture in the middle

  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
  {wall, wall, wall, floor, floor, wall, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
  {wall, wall, wall, floor, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}



 map = Map:new(template)

 cam = gamera.new(0, 0, 1152, 640) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000


 -- Here are the enemy variables; they need to be different!
 ex = 100
 ey = 100
 eimg = love.graphics.newImage('assets-1/cyclops.png')

end
 




function love.update(dt) -- Moves the player, the enemy, and the camera.
  -- Enemy movement stuff
  -- ex = ex + 1
  -- Enemy movement stuff (new)
  if (ex + 16) < Player1.x then
    ex = ex + 4
  end
  if Player1.x < (ex + 16)  then
    ex = ex - 4
  end
  if (ey + 16) < Player1.y then
    ey = ey + 4
  end
  if Player1.y < (ey + 16) then
    ey = ey - 4
  end


  Player1:update(dt)



  if cc(x, y, 64, 64, 200, 200, 64, 64) == true then
    currentDoor = openDoor
  end
  for i = 1, #bullet do
    if bullet[i].animdeletetime >= 0 then
      bullet[i].animdeletetime = bullet[i].animdeletetime - 1
    end
    if bullet[i].cool > 0 then
      bullet[i].cool = bullet[i].cool - 1
    end
    bullet[i]:update(dt)
    if Player1.Iframes == 0 then
      if cc(Player1.x + 16, Player1.y + 16, 32, 32, bullet[i].x, bullet[i].y, 16, 16) then
        bullet[i]:setDelete() -- delete the bullet
        Player1:IFrames() -- decrease player hp
      end
    end
  end
  if Player1.timerIFrames > 0 then
    Player1.timerIFrames = Player1.timerIFrames - 1
    Player1.Iframes = 2
end
if Player1.timerIFrames < 1 then
  Player1.timerIFrames = 0
  Player1.Iframes = 0
  Player1.IFTrigger = false
end
    if love.keyboard.isDown ('escape') then 
      love.audio.stop(Doom)
      love.exitModule();
    end
    Doom:play()
    if x > 800 then
      love.audio.stop(Doom)
      love.exitModule() 
    end
    cam:setPosition(x, y)
end

function love.draw() -- It prints out sentences for the enemy, where the HP bar will be placed, and prints out the player, the enemy, the map, the switch, and the doors. 
    map:draw()
    mapc:draw()
    --Draw The Map
    love.graphics.print('', 0, 0)
    
    love.graphics.draw(currentDoor, 764, 92)
    love.graphics.draw(switch, 200, 200)
    -- Draw the switch
    
    for i = 1, #bullet do
      bullet[i]:draw()       
    end
    map:draw()
    mapc:draw()
    love.graphics.print('', 0, 0)
    love.graphics.draw(currentDoor, 764, 190)
    love.graphics.draw(switch, 200, 200)
    --Draw Bullets

    Player1:Draw()
    --Draw the player
    
      
    cam:draw(function(x, y)



    -- Draw the rectangle in the upper left corner
    love.graphics.rectangle('line', 0, 0, 64, 64)
    love.graphics.draw(cyclops, ex, ey, 0, 0.5)
  
   love.graphics.print("I AM A TRUE GAMER GOD",  350, 100)
  if cc( x, y, 64, 64,   100, 100, 40, 40) == true then
   -- What should go here?
  end
   love.graphics.print("YOU CAN'T BEAT ME!",  350, 120)
  if cc( x, y, 64, 64,   100, 100, 40, 40) == true then
   -- What should go here?
  end
  love.graphics.print("GAMMERRRRS!!!!!!! RIIIIIISSSEEEE UP!!!!!!",  350, 140)
  if cc( x, y, 64, 64,   100, 100, 40, 40) == true then
   -- What should go here?
  end 
  love.graphics.draw(hpBar[hp], 16, 64, 6, 3)
  --player:draw() -- Draw the entity object named player 
end)
end

function endofdash()
  dashattack = 0
end

function love.keypressed(key) -- This code does nothing because the enemy doesn't have an HP code. 
  if key == 'space' then
    --enemyhp = enemyhp - 1
  end
end