------------------------------ Menu Buttons ----------------------------------------------
    start = Button("start", "Start Game")
    close = Button("close", "Close Game")
    press = Button("press", "Click to Continue")
    nextButt = Button("next", "")
    prevButt = Button("prev", "")
    delButt = Button("delete", "x")
    pennySel = Button("Penny", "")
    artSel = Button("Arty", "")
    startWeekButt = Button("startWeek", "Start Weekend")
    endWeekButt = Button("endWeek", "End Weekend")
    readyMarketButt = Button("readyMarket", "Go To Market")  
    cookButt = Button("cook", "Cook")      
    markButt = Button("market", "Send to Market")
    kitchButt = Button("next", "Kitchen")
    computerButt = Button("prev", "Shop")
    del1Butt = Button("delete", "x")
    del2Butt = Button("delete", "x")
    del3Butt = Button("delete", "x")
    del4Butt = Button("delete", "x")
    bookButt = Button('delete', "x")
    creditsButt = Button('credits', "Credits")
    priceUpButt = Button("priceUp", "+")
priceDownButt = Button("priceDown", "-")
------------------------------- Credits ---------------------------------------------------

-- oceanOffset = 0
-- oceanSpeed = 50 
showCredits = false
creditsOffset = love.graphics.getHeight() 
creditsSpeed = 20

creditsImageIndex = 1
creditsImageAlpha = 0
creditsImageTimer = 0
creditsImageFadeIn = true
creditsImageDuration = 2
creditsFadeSpeed = 0.25 
creditsFinished = false

credits = {
    "",
    "Dough",
    "for Dreams",
    "",
    "Programmed by Bryce McWhirter",
    "",
    "Art by Gabby McWhirter",
    "",
    "Background music by Jan Hehr",
    "https://janhehr.com",
     "",
     "Tracks Include: ",
    "Autumn Leaves",
    "Blithe",
    "Closed Bakery",
    "Good Old Days",
    "My Only Love",
    "Till Death Do Us Part",
    "",
    "Special Thanks:",
    "Penny McWhirter",
    "Arty McWhirter",
    "",
    "Built with LÖVE2D",
    "",
}


function creditsdraw() 

    imageScroll= {cooksugarImage, breadImage, cakeImage, cookchocImage, breadchocImage, cakechocImage, cookraisinImage, breadbanaImage, cake }

    if imageScroll and imageScroll[creditsImageIndex] then
        love.graphics.setColor(1, 1, 1, creditsImageAlpha)
            love.graphics.draw(imageScroll[creditsImageIndex], 100, 200, 0, 3, 3)
    end

    if not creditsFinished then
        -- scrolling credits text
        love.graphics.setColor(1, 1, 1, 1)
        for i, line in ipairs(credits) do
            local y = creditsOffset + (i - 1) * 40
            if y > -30 and y < love.graphics.getHeight() + 30 then
                local x = 375
                love.graphics.setFont(debugF)
                if line == "GAME TITLE" or (line ~= "" and i <= 3) then
                     love.graphics.setFont(largeF)
                    love.graphics.print(line, x, y, 0) 
                    love.graphics.setFont(mediumF)
                else
                    love.graphics.print(line, x, y)
                end
            end
        end
    else
        -- end screen
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setFont(mediumF)
        love.graphics.print("Thanks for Playing!", 350, 250)
        close:draw(350, 350, 250, 50)
    end
end