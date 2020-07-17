-- Global libraries
class = require 'core.libs.middleclass'

-- Include helpers
require 'core.modules.graphics.utils'
require 'core.modules.table.utils'
require 'core.modules.math.utils'
require 'core.modules.string.utils'
require 'core.modules.type.utils'
require 'core.modules.window.utils'
require 'core.modules.keyboard.alias'

-- App
App = require(__conf__.entry)

function love.load()
  app = App:new()
end

function love.update()
  app:__step()
end

function love.draw()
  app:__draw()
end