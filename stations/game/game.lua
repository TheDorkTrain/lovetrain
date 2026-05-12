local Game = {}

-- require ("example")
-- require ("spawnTimer")

function Game:load()

    testmap = love.graphics.newImage("assets/images/background/testback.png")

end

animations()

function Game:update(dt)

    runAnimation(dt)
 

end


function Game:draw()
      love.graphics.draw(testmap, 0, 0, 0, 1, 1)
                --   love.graphics.draw(testSheet, battleAttackFrames[math.floor(currentFrame)], 100, 400, 0, .5, .5)
            -- love.graphics.draw(testSheet, battleAttackFrames[math.floor(currentFrame)], 200, 250, 0, .5, .5)
    --   love.graphics.draw(testKrillo, battleIdleFrames[math.floor(currentFrame)], 250, 400, 0, .5, .5)
    love.graphics.draw(testLucky, idleFrames[math.floor(currentFrame)], 75, 350, 0, .75, .75)
    --   love.graphics.draw(testSheet, battleIdleFrames[math.floor(currentFrame)], 50, 0, 1, 1, 1)
    --   love.graphics.draw(testSheet, battleAttackFrames[math.floor(currentFrame)], 50, 0, 1, 1, 1)


end

return Game