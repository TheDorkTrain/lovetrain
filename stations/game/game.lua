local Game = {}

-- require ("example")
-- require ("spawnTimer")

function Game:load()

    Map:load()
  
    randomizeValues()
    randomizeSpawn()


end

animations()
promptAnimations()

function gameTimerCount(dt)

    if gameTime > 0 then
        gameTime = gameTime - dt
       timeleft = math.floor(gameTime - dt)
    end
    if gameTime <= 0 then
       timeleft = "GAME OVER"
    end
   
   end

function Game:update(dt)
    gameTimerCount(dt)
    player:update(dt)
    Debug:update(dt)
    Map:update(dt)

    runAnimation(dt)
    runPromptAnimation(dt)

    Tile:update(dt)
    pearlItem:update(dt)

    if location == "game" then DayTimerCount(dt) end
    
    player:resolveCollision(stand)
    player:resolveCollision(altar)


    for i, tree in ipairs(trees) do
        if tree.destroy == false then
            player:resolveCollision(tree)
        elseif tree.destroy == true and pickupItems[i] then
            pickupItems[i].spawn = true  
        end
    end

    
    for i, item in ipairs(collectionItems) do
        if item.spawn == true then
            player:collectCheck(item)
        end
    end


    if crabAttack == true then
    bigCrab:update(dt)
    end

    for i, item in ipairs(pickupItems) do
        item:update(dt)
    end

    if location == "dayChange" then
        dayChange(dt)
    end

    if location == "gameover" then
        crabAttack = false
        dailyReset()
    end

    if dock.total == 3 then
        location = "ending"
    end

    if location == "ending" then
        creditsupdate(dt)
    end

    if value4 == hiddenPoint1.goal and value5 == hiddenPoint2.goal and value6 == hiddenPoint3.goal and player.unlock == "no" then
        local teleportTimer = 0
            playTeleport()
            asteroidCrash.spawn = true
            
    end

    if love.keyboard.isDown("space") then
        activeText = false
    end


end


function Game:draw()
-- love.graphics.setColor(0.3, 0.2, 0.5)

 if location == "game" then
love.graphics.setColor(shine)  -- Semi-transparent red
love.graphics.translate(-player.x + 400, -player.y + 300)

Map:draw()
Prompts:draw()

stand:draw()
altar:draw()

for i, item in ipairs(collectionItems) do
if item.spawn == true then
    item:draw()
end
end

if show == "red" then
 hiddenstand1:draw()
 hiddenPoint1:draw()
end

if show == "grn" then
    hiddenstand2:draw()
    hiddenPoint2:draw()
   end

   if show == "blu" then
    hiddenstand3:draw()
    hiddenPoint3:draw()
   end

for i, tree in ipairs(trees) do
    if tree.destroy == false then
    tree:draw()
    end
end

if crabAttack == true then
bigCrab:draw()
end

if player.direction2 == "up" then
    for i, item in ipairs(pickupItems) do
        if item.spawn == true then
        item:draw()
    end
    end
    player:draw()
end

if player.direction2 == "down" then
    player:draw()
    for i, item in ipairs(pickupItems) do
        if item.spawn == true then
        item:draw()
        end
    end
end

for i, point in ipairs(gatherPoints) do
    point:draw()
end

if day > 1 then
    love.graphics.print( dock.total.."/3" , -575, 2825)
    bottle4.spawn = true
end

if day > 10 then
    bottle5.spawn = true
end
-- love.graphics.setColor(1, 0, 0, 1)
-- love.graphics.rectangle("fill", standRadius.x, standRadius.y, standRadius.width+60, standRadius.height+60)
-- love.graphics.setColor(1, 1, 1)


love.graphics.translate(player.x - 400, player.y - 300)

-- Print Scoreboard
if phase == "Day" then
love.graphics.setColor(0, 0, 0)
love.graphics.circle("fill", 0, 0, 210, 210)
love.graphics.setColor(1, 1, 1)
love.graphics.circle("fill", 0, 0, 200, 200)
love.graphics.setColor(0, 0, 0)
love.graphics.setFont(mediumF)
love.graphics.print( "Day " , 50, 10)
love.graphics.print( day , 75, 60)
love.graphics.line(5,5, 5, 175)
love.graphics.setColor(1, .984, 0)
love.graphics.circle("fill", 5, dayTimer, 10, 10)
end

if phase == "Night" then
love.graphics.setColor(0, 0, 0, .5)
love.graphics.circle("fill", 0, 0, 210, 210)
love.graphics.setColor(1, 1, 1)
love.graphics.circle("fill", 0, 0, 200, 200)
love.graphics.setColor(0, 0, 0)
love.graphics.setFont(mediumF)
love.graphics.print( "Night ", 50, 10)
love.graphics.print( day , 75, 60)
love.graphics.line(5,5, 5, 175)
love.graphics.setColor(1, 1, 1)
love.graphics.draw(crabIcon, 0, dayTimer, 0, .05, .05)

end

if activeText then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 190, 140, 525, 325)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 200, 150, 500, 300)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(smallF)
    love.graphics.print(loadedText, 210, 160)
    love.graphics.print("Press Action to Close", 250, 400)
end

 if debugMode == true then
Debug:draw()
 end

love.graphics.setColor(1, 0, 0, 0.5)
-- love.graphics.circle("line", arm.x, arm.y, (arm.width * arm.scale * 2) + 50)
love.graphics.setColor(1, 1, 1, 1)

elseif location == "dayChange" then
    if phase == "Night" and value1 == altar1.goal and value2 == altar2.goal and value3 == altar3.goal then
        love.graphics.setFont(largeF)
        love.graphics.print( "Day " .. day , 325, 300)
        love.graphics.print( phase , 325, 250)
        love.graphics.setFont(smallF)
        love.graphics.print( "The Crab is pleased with your offering" , 175, 350)
    elseif phase =="Day" then
        love.graphics.setFont(largeF)
    love.graphics.print( "Day " .. day , 325, 300)
    love.graphics.print( phase , 325, 300)
    else
        love.graphics.setFont(largeF)
        love.graphics.print( "Day " .. day , 325, 200)
        love.graphics.print( phase , 325, 250)
        love.graphics.setFont(smallF)
        love.graphics.print( "The Crab is unhappy with your offering" , 175, 325)
    end
end
end

return Game