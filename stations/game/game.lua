local Game = {}

storePage = 1
day = "NewWeek"
funds = 10
leftTogo = 500-funds
pov= "computer"
sundayInitialized = false
sundayDebug = "no"
_G.purchaseLogEntries = {}
noProductsMessage = false
noProductsTimer = 0
newWeekInitialized = false

function Game:load()
    animations() 
end

function Game:update(dt)
    if location == "game" and day == "NewWeek" then
        budgetAnimTimer = 0
        productsSoldThisWeek = {}
        product1 = {"", "", 0}
        product2 = {"", "", 0}
        product3 = {"", "", 0}
        product4 = {"", "", 0}
        -- product5 = {"", "", 0}
        -- product6 = {"", "", 0}
        -- product7 = {"", "", 0}
        -- product8 = {"", "", 0}
    -- random chance of event
     if not newWeekInitialized then
        newWeekInitialized = true
        budgetAnimTimer = 0
        productsSoldThisWeek = {}
        if love.math.random(1, 3) == 1 and activeEvent == '' then
             if  activeEvent == '' then
            local roll = love.math.random(1, #eventList)
                 if week > 1 then
                    -- startEvent(eventList[roll])
            startEvent(eventList[roll])
            scenePhase = 'intro'
            day = "EventScene"
                 end
                end
        end
    end
    end
if location == 'game' and day == 'WeekReview' then
    if activeEvent ~= '' and not resolutionTriggered then
        resolutionTriggered = true
        scenePhase = 'resolution'
        resolveEvent()
        day = "EventScene"
    end
end
    if location == "game" and day == "Weekday" then
        runAnimation(dt) 
    end
    if location == "game" and (day == "Saturday" or day == "Sunday" or day == "Weekday" or day == "NewWeek") then
        clock(dt)
        if day == "Weekday" then
            weeklyBudget:update(dt)
        end
        if cookgame == "on" and cookingStarted then
        cookTimer(dt)
        end
    end
    if location == 'game' and day ~= "Sunday" and day ~= "ReadyforMarket" then
        sundayInitialized = false 
        customers = {}
        vendors = {}
        _G.purchaseLogEntries = {} 
        currentCustomerIndex = 1
        customerPurchaseTimer = 0
    end
    if location == 'game' and day == 'ReadyforMarket' then
        if not sundayInitialized then
            numOfVendorsThisWeek = love.math.random(1,4)
            numOfCustomersThisWeek = love.math.random(4,9)
            vendorsGet(numOfVendorsThisWeek)
            customersGet(numOfCustomersThisWeek)  
            sundayInitialized = true
            sundayDebug = "yes"
        end
        -- Auto-advance after "no products" message displays
        if noProductsMessage then
            noProductsTimer = noProductsTimer + dt
            if noProductsTimer > 2 then
                noProductsMessage = false
                noProductsTimer = 0
                day = "WeekReview"
            end
        end
    end
    if location == 'game' and day == 'Sunday' then
        weather(dt)
        customerUpdate(dt)
    end

if day == "ending" and showCredits then
    creditsOffset = creditsOffset - 40 * dt
    
    local lastLineY = creditsOffset + (#credits - 1) * 40
    if lastLineY < 0 then
        creditsFinished = true
    end

    creditsImageTimer = creditsImageTimer + dt
    if creditsImageFadeIn then
        creditsImageAlpha = creditsImageAlpha + creditsFadeSpeed * dt
        if creditsImageAlpha >= 1 then
            creditsImageAlpha = 1
            creditsImageFadeIn = false
            creditsImageTimer = 0
        end
    else
        if creditsImageTimer >= creditsImageDuration then
            creditsImageAlpha = creditsImageAlpha - creditsFadeSpeed * dt
            if creditsImageAlpha <= 0 then
                creditsImageAlpha = 0
                creditsImageIndex = creditsImageIndex % #imageScroll + 1
                creditsImageFadeIn = true
                creditsImageTimer = 0
            end
        end
    end
end
end


function Game:draw()

    if day == "NewWeek" then
            love.graphics.print("Week", 250, 150)
            love.graphics.print(week, 400, 150)
            love.graphics.print("Funds", 250, 200)
            love.graphics.print(funds, 400, 200)
            love.graphics.print("Left To Go:", 250, 250)
            love.graphics.print(leftTogo, 500, 250)
            --AUTOWIN CONDITION LETS GOOO 
            -- leftTogo = 0
            if leftTogo <= 0 then
                day = "ending"
            end
    end

    if day == "EventScene" then
    scene:draw()
end

    if day == "Weekday" then
    love.graphics.draw(workBack)
    love.graphics.setFont(mediumF)
    if character == 'Arty' then
      love.graphics.draw(typingSheet, artyTyping[math.floor(currentFrame)], 330, 300)
    else
    love.graphics.draw(typingSheet, pennyTyping[math.floor(currentFrame)], 330, 300)
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Monday", 1000-pace, 10)
    love.graphics.print("Tuesday", -300+pace, 130)
    love.graphics.print("Wednesday", 1100-pace, 250)
    love.graphics.print("Thursday", -300+pace, 370)
    love.graphics.print("Friday", 1200-pace, 490)
    weeklyBudget:draw(budgetAnimTimer)

    end

    if day == "WeekEnd" then
         love.graphics.print("Finally the weekend!", 160, 200)
             startWeekButt:draw(200, 475, 350, 50)
    end

    if day == "Saturday" then
        if pov == "kitchen" then
            love.graphics.draw(kitchenBack)
            computerButt:draw(25, 555, 100, 25)
             dayTimer:draw()
             love.graphics.setColor(0, 0, 0 )
             love.graphics.rectangle('fill',345, 345, 135, 60)
             cookButt:draw(350, 350, 125, 50, 'recipe')
             recipe:draw()
              if cookgame == "on" then
                 cook:draw(cookingProduct, cookingTime, cookingPrice, cookingImage)
              end
            else
                love.graphics.draw(computerBack)
                store:draw()
                kitchButt:draw(666, 555, 100, 25)
            love.graphics.setColor(1, 1, 1, 1)
            dayTimer:draw()
    end
    pantry:draw()
end
    if day == "ReadyforMarket" then
        love.graphics.print("Sunday Morning", 250, 200)
        if noProductsMessage then
            love.graphics.setColor(1, 0.2, 0.2)
            love.graphics.print("You have no products to sell!", 200, 150)
            love.graphics.setColor(1, 1, 1)
                   endWeekButt:draw(200, 475, 350, 50)
        else
            readyMarketButt:draw(250, 300, 200, 50)
        end
    end
    if location == 'game' and day == 'Sunday' then
        market:draw()
        purchaseLog:draw()
        dayTimer:draw()

    end

    if day == "WeekReview" then
        love.graphics.print("Week Review", 225, 150)
        if activeEvent == "rainyDay" then
            love.graphics.print("Market Closed due to rain.", 225, 240)
        else
        love.graphics.print("Goods Sold:", 225, 240)
        
        -- Display weekly summary
        love.graphics.setFont(smallF)
        local yOffset = 280
        if productsSoldThisWeek and next(productsSoldThisWeek) then
            for productName, data in pairs(productsSoldThisWeek) do
    local profit = data.revenue - (data.cost * data.count)
    local prettyName = getPrettyProductName(productName)
    
    -- Trash cost is unknown
    if productName == "Trash" then
        love.graphics.print(prettyName .. ": x" .. data.count .. " | Cost: ??? | Revenue: $" .. data.revenue .. " | Profit: ???", 150, yOffset)
    else
        love.graphics.print(prettyName .. ": x" .. data.count .. " | Cost: $" .. (data.cost * data.count) .. " | Revenue: $" .. data.revenue .. " | Profit: $" .. profit, 150, yOffset)
    end
    yOffset = yOffset + 25
end
        else
            love.graphics.print("No products sold this week", 225, yOffset)
        end
    end
        love.graphics.setFont(mediumF)
        endWeekButt:draw(200, 475, 350, 50)
    end

   if day == "ending" then
    if not showCredits then
        -- letter screen
        love.graphics.setColor(.894, .627, .941)
        love.graphics.rectangle("fill", 100, 75, 600, 325)
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(smallF)
        love.graphics.print("Dear Mom and Dad,", 125, 140)
        love.graphics.print("I did it! I saved enough for my own bakeshop!", 125, 180)
        love.graphics.print("I hope you and sister can come visit soon!", 125, 220)
        love.graphics.print("I know you would be proud.", 125, 260)
        love.graphics.print("Love,", 125, 300)
        love.graphics.print(character, 125, 340)
        love.graphics.setColor(1, 1, 1, 1)
        creditsButt:draw(250, 500, 275, 50)
    else
        creditsdraw()
    end
end

end

return Game