local pantry = {}

function pantry:draw()
    -- Market Items
    if pov == "kitchen" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 595, 0, 205, 260)
      love.graphics.setColor(0.702, 0.98, 0.902)
      love.graphics.rectangle("fill", 600, 5, 200, 250)
        love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(smallF)
    love.graphics.print("Market Goods", 615, 10)
        love.graphics.setColor(1, 1, 1, 1)
    if product1[1] ~= "" then
        love.graphics.draw(product1[2], 600, 30, 0, 1, 1)
        del1Butt:draw(650, 30, 10, 10, 'del1')
    end
     if product2[1] ~= "" then
         love.graphics.draw(product2[2], 700, 30, 0, 1, 1)
        del2Butt:draw(750, 30, 10, 10, 'del2')
    end
     if product3[1] ~= "" then
        love.graphics.draw(product3[2], 600, 130, 0, 1, 1)
        del3Butt:draw(650, 130, 10, 10, 'del3')
    end
     if product4[1] ~= "" then
        love.graphics.draw(product4[2], 700, 130, 0, 1, 1)
        del4Butt:draw(750, 130, 10, 10, 'del4')
    end
     readyMarketButt:draw(600, 210, 400, 50)
end

    -- Inventory
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 297, 7, 276, 71)
    love.graphics.setFont(smallF)
    love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle("fill", 300, 10, 270, 65)
    love.graphics.setColor(1, 1, 1, 1) 
    love.graphics.draw(eggImage, 300, 10, 0, .5, .5)
    love.graphics.draw(flourImage, 330, 10, 0, .5, .5)
    love.graphics.draw(sugarImage, 360, 10, 0, .5, .5)
    love.graphics.draw(milkImage, 390, 10, 0, .5, .5)
    love.graphics.draw(chocImage, 420, 10, 0, .5, .5)
    love.graphics.draw(butterImage, 450, 10, 0, .5, .5)
    love.graphics.draw(raisinImage, 480, 10, 0, .5, .5)
    love.graphics.draw(strawImage, 510, 10, 0, .5, .5)
    love.graphics.draw(banaImage, 540, 10, 0, .5, .5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(itemEgg, 310, 50)
    love.graphics.print(itemFlour, 340, 50)
    love.graphics.print(itemSugar, 370, 50)
    love.graphics.print(itemMilk, 400, 50)
    love.graphics.print(itemChoc, 430, 50)
    love.graphics.print(itemButter, 460, 50)
    love.graphics.print(itemRaisin, 490, 50)
    love.graphics.print(itemStraw, 520, 50)
    love.graphics.print(itemBanana, 550, 50)
     love.graphics.setColor(1, 1, 1, 1)


end
    

return pantry