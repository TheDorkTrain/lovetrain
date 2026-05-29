local store = {}

function store:draw()

    if storePage == 1 then
    nextButt:draw(550, 456, 100, 25, "store")
    eggItem:draw(175,175, 0, 2, 2)
    flourItem:draw(375,175, 0, 2, 2)
    sugarItem:draw(575,175, 0, 2, 2)
    milkItem:draw(175,325, 0, 2, 2)
    butterItem:draw(375,325, 0, 2, 2)
    chocItem:draw(575,325, 0, 2, 2)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Eggs: $1", 175, 300)
    love.graphics.print("Flour: $1", 375, 300)
    love.graphics.print("Sugar: $1", 615, 300)
    love.graphics.print("Milk: $1", 175, 425)
    love.graphics.print("Butter: $1", 375, 425)
    love.graphics.print("Chocolate: $2", 575, 425)
    love.graphics.setColor(1, 1, 1, 1)

    end
    if storePage == 2 then
        -- nextButt:draw(550, 456, 100, 25, "store")
        strawItem:draw(175,175, 0, 2, 2)
        raisinItem:draw(375,175, 0, 2, 2)
        banaItem:draw(575,175, 0, 2, 2)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("Berries: $5", 175, 300)
        love.graphics.print("Raisins: $5", 375, 300)
        love.graphics.print("Bananas: $5", 575, 300)
        -- creamItem:draw(175,325, 0, 2, 2)
        prevButt:draw(175, 456,  100, 25, "store")
    end
    if storePage == 3 then
        prevButt:draw(175, 456,  100, 25, "store")
    end
end
    

return store