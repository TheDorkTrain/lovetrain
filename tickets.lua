------------------------------Asset Staging-----------------------------
require "assets/audioStaging"
require "assets/fontStaging"
require "assets/imageStaging"
require "stations/game/components/messages"
------------------------------ Object Setup ----------------------------
Object = require "stations/game/components/classic"   
require "stations/game/components/entity"
require "stations/game/character/player"
require "stations/game/components/item"
require "stations/game/character/boss"
require "stations/game/components/button"
require "stations/game/components/gatherPoints"
require "stations/game/components/collect"

------------------------------Object Staging----------------------------
require "stations/game/character/characterStaging"
PlayerStaging = require "stations/game/character/playerStaging"
require "stations/game/components/dailyGoal"
require "stations/game/props/propStaging"
require "stations/menu/uiStaging"

----------------------------- Game Components---------------------------
tick = require "stations/game/components/tick"
Map =  require "stations/game/components/map"
Prompts = require "stations/game/components/prompts"
Menu = require "stations/game/components/menu"
Intro = require "stations/game/components/intro"
Debug = require "stations/game/components/debug"

require("stations/game/character/playerAnimations")
require("stations/game/components/promptAnimations")

require "stations/game/components/tile"
require "stations/game/components/dayTimer"

------------------------------Game Staging-----------------------------
Game = require "stations/game/game"
require "stations/game/gameData"


-------------------------------------Archive--------------------



