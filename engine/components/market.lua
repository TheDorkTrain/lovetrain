local market = {}

weatherTime = 0

function weather(dt)
    weatherTime = weatherTime-dt
end

function market:draw()
    if weatherTime < 0 then
        weatherTime = 0
    end

    love.graphics.draw(marketBack)
    love.graphics.draw(cloudImage, weatherTime, 0) 
    love.graphics.draw(characterImage, 50, 375, 0, .75, .75)
    love.graphics.draw(characterStall1, 10, 250, 0, 1, 1)
    
    if vendors then
        for _, vendor in ipairs(vendors) do
        if vendor.stall == 3 or vendor.stall == 4 then
            vendor:draw()
        end
    end
    for _, vendor in ipairs(vendors) do
        if vendor.stall == 1 or vendor.stall == 2 then
            vendor:draw()
        end
    end
end

    if customers then
        for _, cust in ipairs(customers) do
            if cust.draw then
                cust:draw()
            end
        end
    end

end
    

return market