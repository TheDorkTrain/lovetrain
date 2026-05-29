require ("tickets/allAboard")
 location = "menu"

function love.load()
 Object = require "engine/components/classic"
   button = Button()
   Game:load()

end

function love.update(dt)
    Debug:update(dt)
    Game:update(dt)
  soundtrack()
end


function love.draw()


    if location == "ending" then
        -- Draw Bake Shop Ending

        love.graphics.setFont(largeF)
                love.graphics.setColor(.894, .627, .941)
       love.graphics.print("Thanks for Playing!", 175, 405)
       close:draw( 250, 500, 275, 50)
    end

if location == "menu" then
	Menu:draw()
end
if location == "intro" then
  Intro:draw()
end

if location == "game" then
  Game:draw()
end

Debug:draw()

end