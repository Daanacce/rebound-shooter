function spawnEnemySquare(x, y)
  local test = {} --simple test enemy
  test.shape = collider:addRectangle(x, y, 30, 30)  --enemies shape
  test.hp = 50 --health
  test.time = love.timer.getTime()
  test.movement = {{move = "dl", switch = 1.0},{move = "dr", switch =  1.0}}
  test.speed = 50 --speed at which the enemy moves
  test.rate = 0.25 --time between bullets in seconds
  test.n = 1 --accumulator for test.p to function
  test.p = 4 --defines that the 4th bullet will be negated
  test.nextShot = love.timer.getTime() + test.rate --first 'ghost' bullet, yet to be fired
  table.insert(enemies, test)
end
function moveEnemy(shape, dir, speed, dt)
  if dir == "l" then
   shape:move(-speed*dt, 0)
  elseif dir == "r" then
   shape:move(speed*dt, 0)
  elseif dir == "d" then
   shape:move(0, speed*dt)
  elseif dir == "u" then
   shapeLmove(0, -speed*dt)
  elseif dir == "dr" then
   shape:move(speed*dt, speed*dt)
  elseif dir == "dl" then
   shape:move(-speed*dt, speed*dt)
  elseif dir == "ur" then
   shape:move(speed*dt, -speed*dt)
  elseif dir == "dl" then
   shape:move(-speed*dt, -speed*dt)
  end
end
function spawnEnemyMine(x, y)
  if y = nil then
    y = 0
  local mine = {} --just creating the mine now
  mine.shape = collider:addCircle(x, y, 10) --twice the size of a bullet
  mine.hp = 1 --if it hits something, it dies
  mine.movement = {{move = "d", switch = 1}, {move = "u", switch = 0.25}} --floating effect
  mine.speed = 40 -- will edit later to scroll speed * 1.25
  mine.damage = 50 -- only from collision
  table.insert(enemies, mine)
end
function spawnEnemyMach(x, y)
  if y = nil then
    y = 0
  local mach = {} --machine gun enemy, should move down until a point, then left-right
  mach.shape = collider:addPolygon(x, y, x + 4, y - 12, x - 4, y - 12)
  mach.hp = 25 -- easy to kill
  mach.movement = {{move = "d", switch = 1}, {move = "d", switch = 1}} --just down for now
  mach.speed = 50
  mach.rate = 0.1
  mach.damage = 25
  mach.n = 1
  mach.p = 7
  mach.nextShot = love.timer.getTime() + mach.rate
  table.insert(enemies, mach)
end
