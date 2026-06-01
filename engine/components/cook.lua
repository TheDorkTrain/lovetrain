local cook = {}
cookgame = "off"
cookingStarted = false

cookingProduct = ''
cookingPrice = 0
cookingImage = ''

local centerX = 325

  if activeEvent == "sisterVisit" then
 minHeat = 10
            maxHeat = 20
        else
            minHeat = 12
            maxHeat = 18
        end
burnt = 0
cookTime = 0
heat = 0
fireScale = .33

cookingFinished = false  
priceConfirmed = false 
inputAmount = ""
finalNumber = 0
activeButton = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
-- For Gabs and girls to play on Steam Deck
-- activeButton = {'a', 'b', 'x', 'y'}
buttonTimer = 0
nextButtonTime = math.random(3, 6)
currentButton = activeButton[math.random(#activeButton)]

function randomizeButton()
    currentButton = activeButton[math.random(#activeButton)]
    buttonTimer = 0
    nextButtonTime = math.random(3, 6)
end


function cookTimer(dt)
        runAnimation(dt) 
    if cookTime > 0 then
--         if activeEvent == "sisterVisit" then
--  minHeat = 10
--             maxHeat = 20
--         else
--             minHeat = 12
--             maxHeat = 18
--         end

        cookTime = cookTime - dt
        heat = heat - dt * 4
         if heat < 0 then
            heat = 0
        end
         if heat > 30 then
            heat = 30
        end
          if activeEvent == "sisterVisit" then
            cookTime = cookTime - dt/2
        end
        if heat < minHeat or heat > maxHeat then
            burnt = burnt + dt
        end

        if activeEvent == "sisterVisit" then
            buttonTimer = buttonTimer + dt/2
        else
        buttonTimer = buttonTimer + dt
        end
  
        if buttonTimer >= nextButtonTime then
            currentButton = activeButton[math.random(#activeButton)]
            buttonTimer = 0
            nextButtonTime = math.random(3, 6)
        end
        if love.keyboard.isDown(currentButton) then
            heat = heat + dt * 9
        end
    end
end

function addProduct(productCode, image, price)
    if product1[1] == "" then
        product1 = {productCode, image, price}
    elseif product2[1] == "" then
        product2 = {productCode, image, price}
    elseif product3[1] == "" then
        product3 = {productCode, image, price}
    elseif product4[1] == "" then
        product4 = {productCode, image, price}
    end
    cookgame = "off"
    cookingStarted = false
    cookingFinished = false
    priceConfirmed = false
    inputAmount = ""
    finalNumber = 0
    recipeShow = "off"
end

function cook:draw(product, productTimer, marketPrice, image)
    if cookgame == "on" then
       if not cookingStarted then
            cookTime = productTimer
            burnt = 0  
            buttonTimer = 0 
            cookingStarted = true
            heat = 15  
            randomizeButton() 
            cookingFinished = false
            priceConfirmed = false
            inputAmount = ""
            finalNumber = 0 


             if activeEvent == "sisterVisit" then
        minHeat = 10
        maxHeat = 20
    else
        minHeat = 12
        maxHeat = 18
    end
        end
        
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 60, 90, 530, 480)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", 70, 100, 510, 460)
        love.graphics.setColor(1, 1, 1, 1)
        
        if cookTime > 0 then
            if activeEvent == 'sisterVisit' then
                love.graphics.draw(sisterImage, 450, 260, 0, .75, .75 ) 
            end
            love.graphics.draw(characterNeutral, 75, 260, 0, .75, .75 )
            love.graphics.setColor(0, 0, 0)
            love.graphics.setFont(largeF)
            love.graphics.print("Let's Cook!", 200, 100)
            love.graphics.print(math.floor(cookTime), 255, 150)
            love.graphics.setFont(smallF)
            if heat > maxHeat then
            love.graphics.print("You are burning!", 200, 200) 
              fireScale = .36
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(characterAnnoy, 75, 260, 0, .75, .75 )
            end
            if heat < minHeat then
            love.graphics.print("You need more heat!", 200, 200)
            fireScale = .30
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(characterAnnoy, 75, 260, 0, .75, .75 )
            end
            if heat > minHeat and heat < maxHeat then
            fireScale = .33
            end
            -- full line
            love.graphics.setColor(0, 0, 0)
            love.graphics.rectangle("fill", 175, 275, 300, 40)
            -- safe zone
            if activeEvent == "sisterVisit" then
                -- 10 / 20
            love.graphics.setColor(0.28, 1, 0)
            love.graphics.rectangle("fill", 285, 275, 100, 40)
            else
            love.graphics.setColor(0.28, 1, 0)
            love.graphics.rectangle("fill", 305, 275, 60, 40)
            end
            -- user controlled square
            love.graphics.setColor(0, 0, 0)
            -- love.graphics.print("Heat:  " .. heat, 100, 225)
            love.graphics.print("Press and hold:  " .. string.upper(currentButton) .. "  to increase the heat!", 150, 250)
            love.graphics.setColor(.894, .627, .941)
              love.graphics.draw(image, 175 + heat *10, 275, 0, .75, .75 )
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(typingSheet, fireSparking[math.floor(currentFrame)], 200, 310, 0, fireScale, fireScale)
            love.graphics.draw(typingSheet, fireSparking[math.floor(currentFrame)], 300, 310, 0, fireScale, fireScale)
            love.graphics.draw(typingSheet, fireSparking[math.floor(currentFrame)], 400, 310, 0, fireScale, fireScale)
            -- love.graphics.rectangle("fill", 200 + heat * 10, 300, 20, 40)
        end
        
  if cookTime <= 0 and not cookingFinished then
    cookingFinished = true
    if burnt >= 5 then
        inputAmount = "1"
        finalNumber = 1
        cookingCode = "Trash"
        cookingImage = trashImage
    else
        inputAmount = tostring(marketPrice)
        finalNumber = marketPrice 
    end
end

   
        if cookingFinished then
            love.graphics.setColor(0, 0, 0)
            if burnt >= 5 then
                love.graphics.print('Oops, you made Trash', centerX - smallF:getWidth('Oops, you made Trash')/2, 110)
                love.graphics.print('Market Price: $1', centerX - smallF:getWidth('Market Price: $1')/2, 150)
                 love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(image, centerX-20, 200, 0, 1.5, 1.5 )
                love.graphics.draw(characterMad, 75, 260, 0, .75, .75 )
            else
                love.graphics.print('Well done!', centerX - smallF:getWidth('Well done!')/2, 110)
                love.graphics.print('You made ' .. product, centerX - smallF:getWidth('You made ' .. product)/2, 150)
                love.graphics.setColor(1, 1, 1,1)
                love.graphics.draw(image, centerX-20, 200, 0, 1.5, 1.5 )
                love.graphics.draw(characterHappy, 75, 260, 0, .75, .75 )
            end

              if activeEvent == 'sisterVisit' then
                love.graphics.draw(sisterImage, 450, 260, 0, .75, .75 ) 
            end

            local currentPrice = tonumber(inputAmount) or marketPrice
            love.graphics.setColor(0, 0, 0)
            love.graphics.setFont(mediumF)
            love.graphics.print('Your Price: $' .. currentPrice, centerX - mediumF:getWidth('Your Price: $' .. currentPrice)/2, 280)

            priceDownButt:draw(200, 320, 50, 40)
            priceUpButt:draw(420, 320, 50, 40)

            love.graphics.setColor(1, 1, 1, 1)

            if finalNumber > 0 then
                 if productCountsForTask(cookingCode) then
        markButt:draw(180, 390, 180, 50, cookingCode, cookingImage, currentPrice)
        taskButt:draw(370, 390, 150, 50)

    else
        markButt:draw(260, 390, 200, 50, cookingCode, cookingImage, currentPrice)
    end
            end
        end
    end 
end 

return cook