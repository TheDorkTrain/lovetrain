local recipe = {}

recipeShow = "off"
book = 1

function recipe:draw()
    if recipeShow == "on" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 60, 90, 530, 480)
    love.graphics.setColor(0.702, 0.98, 0.902)
    love.graphics.rectangle("fill", 70, 100, 510, 460)
    love.graphics.setColor(0, 0, 0)
    bookButt:draw(550, 100, 30, 30, 'recipe')
    love.graphics.setColor(0, 0, 0)
    
    if book == 1 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Sugar Cookies", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cooksugarImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x1", 205, 380)
        love.graphics.print("x1", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x1", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 1 and itemFlour >= 1 and itemSugar >= 1 and itemMilk >= 1 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "cookSugar")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
    if book == 2 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Chocolate Cookies", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cookchocImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x1", 205, 380)
        love.graphics.print("x1", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x1", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x1", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(chocImage, 500, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 1 and itemFlour >= 1 and itemSugar >= 1 and itemMilk >= 1 and itemChoc >= 1 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "cookChoc")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
    if book == 3 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Raisin Cookies", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cookraisinImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x1", 205, 380)
        love.graphics.print("x1", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x1", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x1", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(raisinImage, 500, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 1 and itemFlour >= 1 and itemSugar >= 1 and itemMilk >= 1 and itemRaisin >= 1 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "cookRaisin")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
     if book == 4 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Bread", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(breadImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x2", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 2 and itemSugar >= 1 and itemMilk >= 2 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "bread")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
      if book == 5 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Chocolate Bread", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(breadchocImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x2", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x1", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(chocImage, 500, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 2 and itemSugar >= 1 and itemMilk >= 2 and itemChoc >= 1 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "breadChoc")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
       if book == 6 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Banana Bread", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(breadbanaImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x2", 265, 380)
        love.graphics.print("x1", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x1", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(banaImage, 500, 325, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 2 and itemSugar >= 1 and itemMilk >= 2 and itemBanana >= 1 then
                love.graphics.setColor(0, 0, 0)
                --  love.graphics.print("items gathered", 300, 400)
                cookButt:draw(275, 425, 125, 45, "breadBana")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
        if book == 7 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Cake", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cakeImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x3", 265, 380)
        love.graphics.print("x3", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        -- love.graphics.print("x1", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        -- love.graphics.draw(banaImage, 500, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 3 and itemSugar >= 3 and itemMilk >= 2 then
                love.graphics.setColor(0, 0, 0)
                cookButt:draw(275, 425, 125, 45, "cake")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
    if book == 8 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Chocolate Cake", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cakechocImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x3", 265, 380)
        love.graphics.print("x3", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x2", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(chocImage, 500, 330, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 3 and itemSugar >= 3 and itemMilk >= 2 and itemChoc >= 2 then
                love.graphics.setColor(0, 0, 0)
                cookButt:draw(275, 425, 125, 45, "cakeChoc")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end
      if book == 9 then
        love.graphics.setFont(mediumF)
        love.graphics.print("Strawberry Cake", 200, 100)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cakestrawImage, 250, 150, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Ingredients:", 200, 290)
        love.graphics.print("x2", 205, 380)
        love.graphics.print("x3", 265, 380)
        love.graphics.print("x3", 325, 380)
        love.graphics.print("x2", 385, 380)
        love.graphics.print("x1", 445, 380)
        love.graphics.print("x2", 505, 380)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(eggImage, 200, 330, 0, 1, 1)
        love.graphics.draw(flourImage, 260, 330, 0, 1, 1)
        love.graphics.draw(sugarImage, 320, 330, 0, 1, 1)   
        love.graphics.draw(milkImage, 380, 330, 0, 1, 1)
        love.graphics.draw(butterImage, 440, 330, 0, 1, 1)
        love.graphics.draw(strawImage, 500, 325, 0, 1, 1)
        
        if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] ~= "" then
             love.graphics.setColor(0, 0, 0)
            love.graphics.print("Market Slots are filled up!", 200, 400)
                love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 275, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 450)
                   love.graphics.setColor(1, 1, 1,1)
        else
            if itemButter >= 1 and itemEgg >= 2 and itemFlour >= 3 and itemSugar >= 3 and itemMilk >= 2 and itemStraw >= 2 then
                love.graphics.setColor(0, 0, 0)
                cookButt:draw(275, 425, 125, 45, "cakeStraw")
            else
                love.graphics.setColor(0, 0, 0)
                   love.graphics.print("You need more Ingredients", 200, 425)
                   love.graphics.setColor(0.529, 0.529, 0.529)
                   love.graphics.rectangle("fill", 250, 450, 125, 45)
                   love.graphics.setColor(0, 0, 0)
                   love.graphics.print("Cook", 275, 460)
                   love.graphics.setColor(1, 1, 1,1)
            end
        end
    end


    if book == 1 then
    nextButt:draw(455, 520, 100, 25, "book")
    elseif book == 9 then
    prevButt:draw(130, 520, 100, 25, "book")
    else
    nextButt:draw(455, 520, 100, 25, "book")
    prevButt:draw(130, 520, 100, 25, "book")
    end

    love.graphics.setColor(1, 1, 1, 1)
end
end
    

return recipe