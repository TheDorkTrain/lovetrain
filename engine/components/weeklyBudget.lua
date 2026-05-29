local weeklyBudget = {}

budgetAnimTimer = 0
budgetLineDelay = 0.8 
randomExpense = ""
randomCost = 0
prevDay = day

function getRandomExpense()
currentExpense = love.math.random(1,6)
randExpense = {"Ate Out", "Bought Coffee", "Impulse Shopping", "Paid Parking", "Bought a Game", "Saw a Movie"}
randCost = love.math.random(1,10)
funds = funds + 15 - randCost
leftTogo = 1000-funds
return randExpense[currentExpense] .. " -$" .. randCost
end

function weeklyBudget:update(dt)
     budgetAnimTimer = budgetAnimTimer + dt
            if randomExpense == "" then
                currentExpense = love.math.random(1,6)
                local randExpenseList = {"Ate Out", "Coffee", "Shopping", "Parking", "New Game", "Movies"}
                randomCost = love.math.random(1,10)
                randomExpense = randExpenseList[currentExpense] .. " -$" .. randomCost
                funds = funds + 10 - randomCost
                leftTogo = 1000-funds
            elseif prevDay == "Weekday" and day ~= "Weekday" then
            randomExpense = "" 
        end
        prevDay = day
end

function weeklyBudget:draw(animTimer)
    local lineNum = math.floor(animTimer / budgetLineDelay) + 1
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 205, 220)
    love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle("fill", 0, 0, 200, 215)
    love.graphics.setFont(smallF)
    
    if lineNum >= 1 then
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("Weekly Budget", 5, 10)
    end
    
    if lineNum >= 2 then
        love.graphics.setColor(0, 0.812, 0.055)
        love.graphics.print("Paycheck +100", 5, 40)
    end
    
    if lineNum >= 3 then
        love.graphics.setColor(1, 0.12, 0.055)
        love.graphics.print("Rent Payment -75", 5, 70)
    end
    
    if lineNum >= 4 then
        love.graphics.print("Gas Payment -5", 5, 100)
    end
    
    if lineNum >= 5 then
        love.graphics.print("Phone Bill -5", 5, 130)
    end
    
    if lineNum >= 6 then
            love.graphics.setColor(1, 0.12, 0.055)
        love.graphics.print(randomExpense, 5, 160)
    end
    
    if lineNum >= 7 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Leftovers: $", 5, 190)
    end
    
    if lineNum >= 8 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(10-randomCost, 145, 190)
    end
  love.graphics.setColor(1, 1, 1, 1)
end

return weeklyBudget