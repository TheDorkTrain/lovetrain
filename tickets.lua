------------------------------Asset Staging-----------------------------
require "assets/audioStaging"
require "assets/fontStaging"
require "assets/imageStaging"
require "engine/components/messages"
------------------------------ Object Setup ----------------------------
Object = require "engine/components/classic"   
require "engine/components/entity"
require "conductor/player"
require "conductor/playerShooter"
require "engine/components/item"
require "engine/components/button"
require "engine/components/gatherPoints"
require "engine/components/collect"

------------------------------Object Staging----------------------------
require "conductor/characterStaging"
PlayerStaging = require "conductor/playerStaging"
require "engine/components/dailyGoal"
require "stations/game/props/propStaging"
require "stations/menu/uiStaging"

----------------------------- Game Components---------------------------
tick = require "engine/components/tick"
Map =  require "engine/components/map"
Prompts = require "engine/components/prompts"
Intro = require "engine/components/intro"
Debug = require "engine/components/debug"

require("conductor/playerAnimations")
require("engine/components/promptAnimations")

require "engine/components/tile"
require "engine/components/dayTimer"

------------------------------Station Staging-----------------------------
Menu = require "stations/menu/menu"
Game = require "stations/game/game"
require "stations/game/gameData"


-------------------------------------Archive--------------------



