local weeklyBudget = {}

budgetAnimTimer = 0
budgetLineDelay = 0.8
randomExpense = ""
randomCost = 0
prevDay = day
loanActive = false 
loanWeeksLeft = 0    
loanDeducted = false 

function weeklyBudget:update(dt)
    budgetAnimTimer = budgetAnimTimer + dt

    if randomExpense == "" then
        local currentExpense = love.math.random(1, 6)
        local randExpenseList = {"Ate Out", "Coffee", "Shopping", "Parking", "New Game", "Movies"}
        randomCost = love.math.random(1, 10)
        randomExpense = randExpenseList[currentExpense] .. " -" .. randomCost
        funds = funds + 20 - randomCost

        if loanActive and loanWeeksLeft > 0 and not loanDeducted then
            funds = funds - 25
            loanWeeksLeft = loanWeeksLeft - 1
            loanDeducted = true
            if loanWeeksLeft <= 0 then
                loanActive = false
            end
        end

        leftTogo = 500 - funds
    end
end

function weeklyBudget:draw(animTimer)
    local lineNum = math.floor(animTimer / budgetLineDelay) + 1

    if loanActive == true then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 205, 250)
    love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle("fill", 0, 0, 200, 245)
    else
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 205, 220)
    love.graphics.setColor(.894, .627, .941)
    love.graphics.rectangle("fill", 0, 0, 200, 215)
    end
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
        love.graphics.print("Rent Payment -70", 5, 70)
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

    local nextLine = 7
    local leftoverY = 190

    if loanActive or (loanWeeksLeft > 0) then
        if lineNum >= nextLine then
            love.graphics.setColor(1, 0.4, 0.4)
            love.graphics.print("Loan Payment -25", 5, leftoverY)
            leftoverY = leftoverY + 30
            nextLine = nextLine + 1
        end
    end

    if lineNum >= nextLine then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Leftovers: $" .. tostring(20 - randomCost - (loanActive and 25 or 0)), 5, leftoverY)
    end

    love.graphics.setColor(1, 1, 1, 1)
end

return weeklyBudget