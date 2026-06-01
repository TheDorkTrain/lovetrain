require ("tickets/allAboard")
 location = "logo"

 logoTimer = 0
logoFadeAlpha = 0
logoFading = false

function love.load()
 Object = require "engine/components/classic"
   button = Button()
   Game:load()

end

function love.update(dt)
    -- Debug:update(dt)
    Game:update(dt)
  soundtrack()

  if location == "logo" then
    logoTimer = logoTimer + dt
    if logoTimer < 1 then
        logoFadeAlpha = logoTimer
    elseif logoTimer < 2 then
        logoFadeAlpha = 1 
    elseif logoTimer < 3 then
        logoFadeAlpha = 3 - logoTimer 
    else
        location = "menu"  
end
end

end


function love.draw()

  if location == "logo" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, logoFadeAlpha)
    love.graphics.draw(dorkTrainLogo, 150, 50, 0, .25, .25)
end


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

-- Debug:draw()

end