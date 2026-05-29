local cook = {}
cookgame = "off"
cookingStarted = false

cookingProduct = ''
cookingPrice = 0
cookingImage = ''

burnt = 0
cookTime = 5
heat = 5
cookingFinished = false  
priceConfirmed = false 
inputAmount = ""
finalNumber = 0
activeButton = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
buttonTimer = 0
nextButtonTime = math.random(3, 6)
currentButton = activeButton[math.random(#activeButton)]

function randomizeButton()
    currentButton = activeButton[math.random(#activeButton)]
    buttonTimer = 0
    nextButtonTime = math.random(3, 6)
end

function love.textinput(t)
    if tonumber(t) or t == "." then
        inputAmount = inputAmount .. t
    end
end
function love.keypressed(key)
    if key == "backspace" then
        inputAmount = inputAmount:sub(1, -2)
    elseif key == "return" then
        finalNumber = tonumber(inputAmount) or 0
    end
end


function cookTimer(dt)
    if cookTime > 0 then
        cookTime = cookTime - dt
        heat = heat - dt * 3
         if heat < 0 then
            heat = 0
        end
         if heat > 10 then
            heat = 10
        end
        if heat > 6 or heat < 4 then
            burnt = burnt + dt
        end
        buttonTimer = buttonTimer + dt
        if buttonTimer >= nextButtonTime then
            currentButton = activeButton[math.random(#activeButton)]
            buttonTimer = 0
            nextButtonTime = math.random(3, 6)
        end
        if love.keyboard.isDown(currentButton) then
            heat = heat + dt * 5
        end
    end
end

function addProduct(productCode, image, price)
     if product1[1] ~= "" and product2[1] ~= "" and product3[1] ~= "" and product4[1] == "" then
        product4 = {productCode, image, price}
        cookgame = "off"
        cookingStarted = false
        cookingFinished = false
        priceConfirmed = false
        inputAmount = ""
        finalNumber = 0
        recipeShow = "off" 
    end
    if product1[1] ~= "" and product2[1] ~= "" and product3[1] == "" then
        product3 = {productCode, image, price}
         cookgame = "off"
         cookingStarted = false
         cookingFinished = false
         priceConfirmed = false
         inputAmount = ""
         finalNumber = 0
         recipeShow = "off" 
    end
    if product1[1] ~= "" and product2[1] == "" then
        product2 = {productCode, image, price}
       cookgame = "off"
       cookingStarted = false
       cookingFinished = false
       priceConfirmed = false
       inputAmount = ""
       finalNumber = 0
       recipeShow = "off" 
    end
    if product1[1] == "" then
        product1 = {productCode, image, price}
      cookgame = "off"
      cookingStarted = false
      cookingFinished = false
      priceConfirmed = false
      inputAmount = ""
      finalNumber = 0
      recipeShow = "off"  
    end
end

function cook:draw(product, productTimer, marketPrice, image)
    if cookgame == "on" then
       if not cookingStarted then
            cookTime = productTimer
            burnt = 0  
            buttonTimer = 0 
            cookingStarted = true
            heat = 5  -- Reset heat
            randomizeButton()  -- Get a new random button
            cookingFinished = false
            priceConfirmed = false
            inputAmount = ""
            finalNumber = 0  -- Reset price confirmation
        end
        
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 60, 90, 530, 480)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", 70, 100, 510, 460)
        love.graphics.setColor(1, 1, 1, 1)
        
        if cookTime > 0 then
            love.graphics.setColor(0, 0, 0)
            love.graphics.setFont(largeF)
            love.graphics.print("Let's Cook!", 250, 100)
            love.graphics.print(math.floor(cookTime), 275, 150)
            love.graphics.setFont(smallF)
            if heat > 6 then
            love.graphics.print("You are burning!", 200, 200) 
            end
            if heat < 4 then
            love.graphics.print("You need more heat!", 200, 200) 
            end
            -- full line
            love.graphics.rectangle("fill", 300, 300, 100, 20)
            -- safe zone
            love.graphics.setColor(0.28, 1, 0)
            love.graphics.rectangle("fill", 340, 300, 30, 20)
            -- user controlled square
             love.graphics.setColor(.894, .627, .941)
            love.graphics.rectangle("fill", 300 + heat * 10, 300, 10, 20)
            love.graphics.setColor(0, 0, 0)
            love.graphics.print("Press and hold:  " .. currentButton .. "  to increase the heat!", 200, 335)
            love.graphics.setColor(1, 1, 1, 1)
        end
        
        if cookTime <= 0 and not cookingFinished then
            cookingFinished = true
            if burnt >= 4 then
                inputAmount = "0"
            else
                inputAmount = tostring(marketPrice)
            end
        end
        
        if cookingFinished then
            love.graphics.setColor(0, 0, 0)
            if burnt >= 4 then
                love.graphics.print('Oops, you made Trash', 200, 100)
                love.graphics.print('Market Price: $0', 200, 150)
                cookingCode = "Trash"
                image = trashImage
            else
                love.graphics.print('Well done!', 200, 100)
                love.graphics.print('You made ' .. product, 200, 150)
                love.graphics.print('Market Price: $' .. marketPrice, 200, 200)
            end
            love.graphics.print("Enter your price (Press ENTER to confirm):", 75, 300)
            love.graphics.print("Your price: $" .. inputAmount, 200, 330)
            if priceConfirmed or finalNumber > 0 then
                markButt:draw(200, 400, 325, 50, cookingCode, image, tonumber(inputAmount) or 0)
            end
        end
    end
end
    

return cook