## Love App Boilerplate

### Running the project
This project uses Löve2d along with lua language. To prepare your development environment you`ll need to install both.

**Löve2D:** Go to [Löve2d website](https://love2d.org) and follow the instructions for your OS

**Lua:** Go to [Lua's website](https://www.lua.org/start.html) and follow the instructions for your OS

### Structure
* [libs/](./libs)
  * [middleclass.lua](./libs/middleclass.lua)
  * [debugger.lua](./libs/debugger.lua)
* [core/](./core)
  * [entities/](./core/entities)
    * [Game.lua](./core/entities/Game.lua)
    * [Object.lua](./core/entities/Object.lua)
    * [Room.lua](./core/entities/Room.lua)
    * [Sound.lua](./core/entities/Sound.lua)
    * [Sprite.lua](./core/entities/Sprite.lua)
    * [Background.lua](./core/entities/Background.lua)
    * [Tileset.lua](./core/entities/Tileset.lua)
    * [Viewport.lua](./core/entities/Viewport.lua)
* [src/](./src)
  * [assets/](./src/assets)
    * [images](./src/assets/images)
    * [sounds](./src/assets/sounds)
  * [objects/](./src/objects)
  * [rooms/](./src/rooms)
  * [App.lua](./src/App.lua)
* [main.lua](./main.lua)
* [conf.lua](./conf.lua)
* [README.md](./README.md)

### Libs
- **[middleclass](https://github.com/kikito/middleclass)**: Object-orientation for Lua with class support
- **[debugger](https://github.com/slembcke/debugger.lua)**: A simple, embedabble CLI debugger for Lua.
- **[STALKER-X](https://github.com/adnzzzzZ/STALKER-X)**: Camera module for LÖVE

## Usage
TODO
