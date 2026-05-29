------------------------------Asset Staging-----------------------------
require "tickets/fontStaging"
require "tickets/imageStaging"
require "tickets/audioStaging"
require "tickets/characterStaging"

------------------------------ Object Setup ----------------------------
Object = require "engine/components/classic"   
require "engine/components/entity"
require "engine/components/item"
require "engine/components/button"
require "engine/components/shopItem"
require "tickets/propStaging"

------------------------------Object Staging----------------------------
require "tickets/uiStaging"

----------------------------- Game Components---------------------------
tick = require "engine/components/tick"
dayTimer = require "engine/components/dayTimer"
Intro = require "engine/components/intro"
Debug = require "engine/components/debug"
weeklyBudget = require "engine/components/weeklyBudget"
store = require "engine/components/store"
pantry = require "engine/components/pantry"
recipe = require "engine/components/recipe"
cook = require "engine/components/cook"
require "passengers/vendors"
require "passengers/customers"
market = require "engine/components/market"
purchaseLog = require "engine/components/purchaseLog"

------------------------------Station Staging-----------------------------
Menu = require "stations/menu/menu"
Game = require "stations/game/game"
require "stations/game/gameData"
require "engine/components/animations"

-------------------------------------Archive--------------------



