local Menu ={}


function Menu:draw()
    love.graphics.draw(titleScreen, 325, 0, 0, 1, 1.75)
    love.graphics.setFont(mediumF)
   love.graphics.setColor(.894, .627, .941)
    love.graphics.print("Dough", 50, 250)
      love.graphics.print("for Dreams", 50, 300)
    love.graphics.setColor(1, 1, 1)
    start:draw( 50, 375, 250, 50)
    close:draw( 50, 450, 250, 50)
end

return Menu