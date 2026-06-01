Button = Object:extend()

function Button:new(name, text)
    self.name = name
    self.text = text
end

function Button:mousepressed(x, y, button)
    if button == 1 and self.x and self.y and self.width and self.height then 
        if x > self.x and x < self.x + self.width and 
           y > self.y and y < self.y + self.height then 
            print("Button " .. self.name .. " was clicked!") 
            if self.name == 'next' or self.name == "prev" then
            self:clear()
            end
            return true 
        end
    end
    return false 
end

function Button:clear()
    self.x = nil
    self.y = nil
    self.width = nil
    self.height = nil
end

function Button:draw(x, y, width, height, label, label2, label3)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.label = label
    self.label2 = label2
    self.label3 = label3 
    -- for cooking label = name label2 = image label3 = cost
    love.graphics.setColor(.894, .627, .941)
    if self.name == 'next' then  
        love.graphics.polygon('fill', x+width, y-height/2, x+width, y+height+height/2, x+width+width/4, y+height/2)
    end
    if self.name == 'prev' then
        love.graphics.polygon('fill', x, y-height/2, x, y+height+height/2, x-width/4, y+height/2)
    end
    if self.name ~= 'next' and self.name ~= 'prev' then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", x-5, y-5, width+10, height+10)
        love.graphics.setColor(.894, .627, .941)
    end
    if self.name == 'delete' then
          love.graphics.setFont(tinyF)
    elseif self.name == 'next' or self.name == 'prev' or self.name == 'readyMarket' or self.name == "market" or self.name == "task" then
          love.graphics.setFont(smallF)
    else
    love.graphics.setFont(mediumF)
    end
        love.graphics.rectangle("fill", x, y, width, height)
        love.graphics.setColor(0, 0, 0)
        -- Adjust text position based on button size
        local textX, textY = x+15, y+5
        if width < 30 then  -- Small button (like delete)
            textX = x + width/2 - 3
            textY = y + height/2 - 7
        end
        love.graphics.print(self.text, textX, textY)
        love.graphics.setColor(1, 1, 1, 1)

end

-------------------------------Functions---------------------------------------------------


function love.mousepressed(x, y, button)

    if location == "intro" then
         if character == "none" then
             if pennySel:mousepressed(x, y, button) then
                 character = "Penny"
                 characterImage = love.graphics.newImage("assets/images/character/penny.png")
                 characterStall = love.graphics.newImage("assets/images/background/stallPenny.png")
                 characterNeutral = love.graphics.newImage("assets/images/character/emotions/penny.png")
                 characterAnnoy = love.graphics.newImage("assets/images/character/emotions/pennyAnnoy.png")
                 characterMad = love.graphics.newImage("assets/images/character/emotions/pennyMad.png")
                 characterHappy = love.graphics.newImage("assets/images/character/emotions/pennyHappy.png")
                 characterShy = love.graphics.newImage("assets/images/character/emotions/pennyShy.png")
                 sisterImage = love.graphics.newImage("assets/images/character/arty.png")
             end
             if artSel:mousepressed(x, y, button) then
                 character = "Arty"
                 characterImage = love.graphics.newImage("assets/images/character/arty.png")
                 characterStall = love.graphics.newImage("assets/images/background/stallArty.png")
                 characterNeutral = love.graphics.newImage("assets/images/character/emotions/arty.png")
                 characterAnnoy = love.graphics.newImage("assets/images/character/emotions/artyAnnoy.png")
                 characterMad = love.graphics.newImage("assets/images/character/emotions/artyMad.png")
                 characterHappy = love.graphics.newImage("assets/images/character/emotions/artyHappy.png")
                 characterShy = love.graphics.newImage("assets/images/character/emotions/artyShy.png")
                 sisterImage = love.graphics.newImage("assets/images/character/penny.png")
             end
         end
    end

    if day == "WeekEnd" then
        if startWeekButt:mousepressed(x, y, button) then
            timer = 1
            day = "Saturday"
        end
    end
    
    if day == "WeekReview" or day == "ReadyforMarket" then
        if endWeekButt:mousepressed(x, y, button) then
            activeEvent = ''
            newWeekInitialized = false
            weekReviewSongPlayed = false
              resolutionTriggered = false
            timer = 1
            week = week + 1
            day = "NewWeek"
        end
    end

    if day == "Saturday" then
        if kitchButt:mousepressed(x, y, button) then
            pov = "kitchen"
        end
        if computerButt:mousepressed(x, y, button) then
            pov = "computer"
        end
    end

    if day == "Saturday" and pov == "computer" then
    if storePage == 1 then
        if eggItem:mousepressed(x, y, button) and funds >= eggItem.cost then
            funds = funds - eggItem.cost
        end
        if flourItem:mousepressed(x, y, button) and funds >= flourItem.cost then
            funds = funds - flourItem.cost
        end
        if sugarItem:mousepressed(x, y, button) and funds >= sugarItem.cost then
            funds = funds - sugarItem.cost
        end
        if milkItem:mousepressed(x, y, button) and funds >= milkItem.cost then
            funds = funds - milkItem.cost
        end
        if chocItem:mousepressed(x, y, button) and funds >= chocItem.cost then
            funds = funds - chocItem.cost
        end
        if butterItem:mousepressed(x, y, button) and funds >= butterItem.cost then
            funds = funds - butterItem.cost
        end
    end
         if storePage == 2 then
         if strawItem:mousepressed(x, y, button) and funds >= strawItem.cost then
            funds = funds - strawItem.cost
        end
          if banaItem:mousepressed(x, y, button) and funds >= banaItem.cost then
            funds = funds - banaItem.cost
        end
           if raisinItem:mousepressed(x, y, button) and funds >= raisinItem.cost then
            funds = funds - raisinItem.cost
        end
    end
        if  nextButt:mousepressed(x, y, button) and nextButt.label == "store" then
            storePage = storePage + 1
        end
        if prevButt:mousepressed(x, y, button) and prevButt.label == "store" then
            storePage = storePage - 1
        end
            
end
    if day == "Saturday" and pov == "kitchen" then
        if nextButt:mousepressed(x, y, button) and nextButt.label == "book" then
            book = book + 1
        end
        if prevButt:mousepressed(x, y, button) and prevButt.label == "book" then
        book = book - 1
        end
        if delButt:mousepressed(x, y, button) and delButt.label == "book" then
                book = 0
                end
        if del1Butt:mousepressed(x, y, button) then
                    product1 = {"", 0}
                end
        if del2Butt:mousepressed(x, y, button) then
                    product2 = {"", 0}
                end
                if del3Butt:mousepressed(x, y, button) then
                    product3 = {"", 0}
                end
                if del4Butt:mousepressed(x, y, button) then
                    product4 = {"", 0}
                end
    if cookingFinished then
    local currentPrice = tonumber(inputAmount) or cookingPrice
    if priceUpButt:mousepressed(x, y, button) then
        local newPrice = currentPrice + 1
        if newPrice <= cookingPrice + 10 then
            inputAmount = tostring(newPrice)
            finalNumber = newPrice
        end
    end
   if priceDownButt:mousepressed(x, y, button) then
    local newPrice = currentPrice - 1
    if newPrice >= 1 then  -- never go below 1 for anything
        inputAmount = tostring(newPrice)
        finalNumber = newPrice
    end
end
end
    end

    if day == "ReadyforMarket" then
        if readyMarketButt:mousepressed(x, y, button) then
            if product1[1] == "" and product2[1] == "" and product3[1] == "" and product4[1] == "" then
                noProductsMessage = true
                noProductsTimer = 0
            elseif activeEvent == 'rainyDay' then
                timer = 1
                day = "WeekReview"
            else
                timer = 1
                day = "Sunday"
            end
        end
    end

    if day == "EventScene" then
    if nextDialogButt:mousepressed(x, y, button) then
        advanceDialog()
    end
    if scenePhase == 'intro' and dialogFinished then
        if acceptButt:mousepressed(x, y, button) then
            if activeEvent == 'darwinLoan' then
                loanActive = true    
                loanWeeksLeft = 6 
                funds = funds + 100
            end
            day = "NewWeek"  -- continue with event active
        end
        if declineButt:mousepressed(x, y, button) then
            activeEvent = ''
            day = "NewWeek"
        end
        if closeSceneButt:mousepressed(x, y, button) then
            day = "NewWeek"
        end
    end
    if scenePhase == 'resolution' and dialogFinished then
        if closeSceneButt:mousepressed(x, y, button) then
            resolutionTriggered = false
            activeEvent = ''
            day = "WeekReview"
            newWeekInitialized = false
        end
    end
end
    
--  =======================================================================  
    if location == "menu" then
        if start:mousepressed(x, y, button) then
            location = "intro"
        end
    end
    if location == "intro" then
        if press:mousepressed(x, y, button) then
            location = "game"
        end
    end
    if location == "gameover" then
        if press:mousepressed(x, y, button) then
            dayTimer = 5
            phase = "Day"
            dailyReset()
            location = "menu"
        end
    end
   if day == "ending" then
    if creditsButt:mousepressed(x, y, button) then
          buildCredits() 
    showCredits = true
    creditsOffset = 600
    creditsImageIndex = 1
    creditsImageAlpha = 0
    creditsImageTimer = 0
    creditsImageFadeIn = true
    end
end

-- ============================Recipes===================================

    if day == "Saturday" and pov == "kitchen" then
         if readyMarketButt:mousepressed(x, y, button) then
            timer = 1
            day = "ReadyforMarket"
            pov = "computer"
        end
         if cookButt:mousepressed(x, y, button) and cookButt.label == "recipe" then
            recipeShow = "on"
         end
         if bookButt:mousepressed(x, y, button) and (bookButt.label == "recipe" or recipeShow == "on") then
            recipeShow = "off"
         end
        if cookButt:mousepressed(x, y, button) and cookButt.label == "cookSugar" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 1
                itemFlour = itemFlour - 1
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 1
                cookingProduct = 'Sugar Cookies'
                cookingCode = 'cookSugar'
                cookingTime = 10
                cookingPrice = 10
                cookingImage = cooksugarImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
          if cookButt:mousepressed(x, y, button) and cookButt.label == "cookChoc" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 1
                itemFlour = itemFlour - 1
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 1
                itemChoc = itemChoc - 1
                cookingProduct = 'Chocolate Cookies'
                cookingCode = 'cookChoc'
                cookingTime = 10
                cookingPrice = 13
                cookingImage = cookchocImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
                if cookButt:mousepressed(x, y, button) and cookButt.label == "cookRaisin" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 1
                itemFlour = itemFlour - 1
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 1
                itemRaisin = itemRaisin - 1
                cookingProduct = 'Raisin Cookies'
                cookingCode = 'cookRaisin'
                cookingTime = 10
                cookingPrice = 20
                cookingImage = cookraisinImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
                        if cookButt:mousepressed(x, y, button) and cookButt.label == "bread" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 2
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 2
                cookingProduct = 'Bread'
                cookingCode = 'bread'
                cookingTime = 20
                cookingPrice = 14
                cookingImage = breadImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
        if cookButt:mousepressed(x, y, button) and cookButt.label == "breadChoc" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 2
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 2
                itemChoc = itemChoc - 1
                cookingProduct = 'Chocolate Bread'
                cookingCode = 'breadChoc'
                cookingTime = 20
                cookingPrice = 17
                cookingImage = breadchocImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
            if cookButt:mousepressed(x, y, button) and cookButt.label == "breadBana" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 2
                itemSugar = itemSugar - 1
                itemMilk = itemMilk - 2
                itemBanana = itemBanana - 1
                cookingProduct = 'Banana Bread'
                cookingCode = 'breadBana'
                cookingTime = 20
                cookingPrice = 22
                cookingImage = breadbanaImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
        if cookButt:mousepressed(x, y, button) and cookButt.label == "cake" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 3
                itemSugar = itemSugar - 3
                itemMilk = itemMilk - 2
                cookingProduct = 'Cake'
                cookingCode = 'cake'
                cookingTime = 30
                cookingPrice = 19
                cookingImage = cakeImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
         if cookButt:mousepressed(x, y, button) and cookButt.label == "cakeChoc" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 3
                itemSugar = itemSugar - 3
                itemMilk = itemMilk - 2
                itemChoc = itemChoc - 2
                cookingProduct = 'Chocolate Cake'
                cookingCode = 'cakeChoc'
                cookingTime = 30
                cookingPrice = 25
                cookingImage = cakechocImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
             if cookButt:mousepressed(x, y, button) and cookButt.label == "cakeStraw" then
                itemButter = itemButter - 1
                itemEgg = itemEgg - 2
                itemFlour = itemFlour - 3
                itemSugar = itemSugar - 3
                itemMilk = itemMilk - 2
                itemStraw = itemStraw - 2
                cookingProduct = 'Strawberry Cake'
                cookingCode = 'cakeStraw'
                cookingTime = 30
                cookingPrice = 34
                cookingImage = cakestrawImage
                cookingStarted = false
                cookingFinished = false
                priceConfirmed = false
                inputAmount = ""
                finalNumber = 0
                cookgame = "on"
        end
         if taskButt:mousepressed(x, y, button) and cookingFinished and finalNumber > 0 then
    if productCountsForTask(cookingCode) then
        taskProgress = taskProgress + 1
    end
    cookgame = "off"
    cookingStarted = false
    cookingFinished = false
    priceConfirmed = false
    inputAmount = ""
    finalNumber = 0
    recipeShow = "off"
end
        if markButt:mousepressed(x, y, button) and cookingFinished and (priceConfirmed or finalNumber > 0) then
            addProduct(markButt.label, markButt.label2, markButt.label3)
        end
    end

end
