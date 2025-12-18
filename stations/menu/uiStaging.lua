------------------------------ Menu Buttons ----------------------------------------------
    start = Button("start", 100, 450, 275, 50, "Start Game")
    close = Button("close", 100, 525, 275, 50, "Close Game")
    press = Button("press", 300, 475, 350, 50, "Click to Continue")
    winPress = Button("press", 125, 450, 250, 50, "Play Again")
    nextButt = Button("debug1", 575, 500, 125, 50, "Next")
    prevButt = Button("debug2", 25, 500, 125, 50, "Prev")
-------------------------------Functions---------------------------------------------------
function love.mousepressed()
    button:mousepressed(1)
end


function love.mousepressed(x, y, button)
    if location == "menu" then
        if start:mousepressed(x, y, button) then
            location = "intro"
        end
        if close:mousepressed(x, y, button) then
            love.event.quit()
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
    if location == "ending" then
        if winPress:mousepressed(x, y, button) then
            location = "menu"
        end
    end
    if debugMode == true then
        if nextButt:mousepressed(x, y, button) and debugMenu < 4 then
            debugMenu = debugMenu + 1
        elseif prevButt:mousepressed(x,y, button) and debugMenu > 1 then
            debugMenu = debugMenu - 1
        end
    end

end




------------------------------- Credits ---------------------------------------------------

oceanOffset = 0
oceanSpeed = 50 
creditsOffset = love.graphics.getHeight() 
creditsSpeed = 20

function creditsupdate(dt)
     oceanOffset = oceanOffset - oceanSpeed * dt
        local oceanWidth = ocean:getWidth() * 0.5
        if oceanOffset <= -oceanWidth then
            oceanOffset = 0
        end
        
        creditsOffset = creditsOffset - creditsSpeed * dt
        
        local totalCreditsHeight = #credits * 40 
        if creditsOffset < -totalCreditsHeight then
            creditsOffset = love.graphics.getHeight()
        end
end

function creditsdraw() 
  local oceanWidth = ocean:getWidth() * 0.5
        love.graphics.draw(ocean, oceanOffset, 0, 0, .5, .5)
        love.graphics.draw(ocean, oceanOffset + oceanWidth, 0, 0, .5, .5)
        
        -- Draw character animation
        love.graphics.draw(escapeSheet, escapeFrames[math.floor(currentFrame)], 100, 150, 0)
        
        -- Draw scrolling credits
        love.graphics.setColor(1, 1, 1, 1) -- White text
        local font = mediumF
        local screenWidth = love.graphics.getWidth()
        
        for i, line in ipairs(credits) do
            local y = creditsOffset + (i - 1) * 40 -- 40 pixels between lines
            
            -- Only draw if the line is visible on screen
            if y > -30 and y < love.graphics.getHeight() + 30 then
                local textWidth = font:getWidth(line)
                local x = 375 -- Center the text
                love.graphics.setFont(debugF)
                
                -- Make title lines bigger
                if line == "GAME TITLE" or (line ~= "" and i <= 3) then
                    love.graphics.print(line, x, y, 0, 2, 2) -- Bigger scale for title
                else
                    love.graphics.print(line, x, y)
                end
            end
        end
    end