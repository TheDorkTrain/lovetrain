require ("tickets")
 location = "menu"

function love.load()
 Object = require "stations/game/components/classic"
   button = Button()
   Game:load()

end

function love.update(dt)
    Game:update(dt)
  soundtrack()
end


function love.draw()

    if location == "gameover" then
        love.graphics.setFont(largeF)
        love.graphics.print("Game Over", 100, 300, 0, 2, 2)
        love.graphics.setFont(mediumF)
        press:draw()
    end

    if location == "ending" then
        -- Draw scrolling ocean background
       creditsdraw()
    end

    if location == "menu" then
	Menu:draw()
end
if location == "intro" then
    Intro:draw()
end

 if location == "game" or "dayChange" then
Game:draw()
end

end