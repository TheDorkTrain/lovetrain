local Intro ={}

function Intro:draw()

    if character == "none" then
        pennySel:draw(408, 30, 278, 370)
        love.graphics.draw(pennyImage, 350, -20, 0, 2, 2)
        artSel:draw(73, 30, 301, 370)
        love.graphics.draw(artyImage, 23, -20, 0, 2, 2)
        
    love.graphics.setFont(mediumF)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Arty", 174, 404 )
    love.graphics.print("Penny", 500, 404 )
    love.graphics.print("Select your Character", 165, 504 )
    end

    if character == "Penny" or character == "Arty" then
    love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle("fill", 100, 75, 600, 350)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(smallF)
    love.graphics.print("Dear Mom and Dad,", 125, 140 )
    love.graphics.print("I haven't given up on my dream of owning a bakery.", 125, 180 )
    love.graphics.print("I've been baking at the Farmers Market every Sunday.", 125, 220 )
    love.graphics.print("Finances are tight but I think I can save up enough.", 125, 260 )
    love.graphics.print("$500 should be enough to get me started.", 125, 300 )
    love.graphics.print("Love,", 125, 340 )
    love.graphics.print(character, 125, 380)
    love.graphics.setColor(.894, .627, .941)
    love.graphics.setFont(mediumF)
    love.graphics.setColor(1, 1, 1)
    press:draw(300, 475, 350, 50)
    end
end

return Intro