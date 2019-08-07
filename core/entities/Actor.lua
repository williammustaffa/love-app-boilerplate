-- File: Actor.lua
local Actor = class('entity.Actor')

function Actor:initialize(options)
  -- Actor creation
  -- TODO: create safe get function in helpers
  self.x = options and options.x or 0
  self.y = options and options.y or 0
  self.solid = options and options.solid or false
  self.speed = options and options.speed or 0
  self.vspeed = options and options.vspeed or 0
  self.hspeed = options and options.hspeed or 0
  self.gravity = options and options.gravity or 0
  self.gravityDirection = options and options.gravityDirection or 270
  self.xScale = options and options.xScale or 1
  self.yScale = options and options.yScale or 1
  self.direction = options and options.direction or 0
  self.width = options and options.width or 0
  self.height = options and options.height or 0
  self.scene = options and options.scene or false
  self.type = options and options.type or 'static'
end

function Actor:checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and
         x2 < x1 + w1 and
         y1 < y2 + h2 and
         y2 < y1 + h1
end

function Actor:placeFree(x, y)
  local collision = false

  if self.scene then
    local instances = self.scene.instances

    local findCollision = function(instance)
      return instance.solid and instance.id ~= self.id and self:checkCollision(x, y, self.width, self.height, instance.x, instance.y, instance.width, instance.height)
    end

    collision = table.find(instances, findCollision)

    -- Check for collision
    for index,instance in ipairs(instances) do
      if instance.solid and instance.id ~= self.id then
        if self:checkCollision(x, y, self.width, self.height, instance.x, instance.y, instance.width, instance.height) then
          hasPlaceFree = false
          break
        end
      end
    end
  end

  return not Boolean(collision)
end

function Actor:processCollision()
  -- Normalize ground landing
  local nextX = self.x + self.hspeed
  local nextY = self.y + self.vspeed

  if not self:placeFree(nextX, nextY) then
    while self:placeFree(nextX, math.round(self.y) + math.sign(self.vspeed)) do
      self.y = math.round(self.y) + math.sign(self.vspeed)
    end

    while self:placeFree(math.round(self.x) + math.sign(self.hspeed), nextY) do
      self.x = math.round(self.x) + math.sign(self.hspeed)
    end

    self.hspeed = 0
    self.vspeed = 0
  end
end

function Actor:processPhyshics()
  -- Apply gravity
  self.vspeed = self.vspeed - self.gravity * math.sin(self.gravityDirection * math.pi / 180);
  self.hspeed = self.hspeed + self.gravity * math.cos(self.gravityDirection * math.pi / 180);

  -- Apply speed
  self.vspeed = self.vspeed - self.speed * math.sin(self.direction * math.pi / 180)
  self.hspeed = self.hspeed + self.speed * math.cos(self.direction * math.pi / 180)
end

function Actor:applyPhysics()
  -- Apply hspeed and vspeed
  self.x = self.x + self.hspeed
  self.y = self.y + self.vspeed
end

function Actor:update()
  -- Actor update
end

function Actor:draw()
  -- Actor drawing
end

function Actor:innerUpdate()
  self:update()

  if (self.type == 'dynamic') then
    self:processPhyshics()
    self:processCollision()
    self:applyPhysics()
  end
end

function Actor:innerDraw()
  self:draw()
end

return Actor