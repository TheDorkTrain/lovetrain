local Menu ={}


function Menu:draw()
    love.graphics.draw(kitchenBack, 0, 0, 0, 1, 1)
            love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle( 'fill', 175, 125, 460, 435)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle( 'fill', 180, 130, 450, 425)
     love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(titleImage, 200, 150, 0, .5, .5)
    love.graphics.setFont(mediumF)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle( 'fill', 270, 470, 260, 60)
    start:draw( 275, 475, 250, 50)
    love.graphics.setColor(1, 1, 1, 1)
end

return Menu