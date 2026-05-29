local purchaseLog = {}

function purchaseLog:draw()
    if not _G.purchaseLogEntries then
        _G.purchaseLogEntries = {}
    end
    
    local screenWidth = love.graphics.getWidth()
    local logX = screenWidth - 250
    local logY = 10
    local lineHeight = 20
    local boxWidth = 240
    local maxLines = 10
    
    -- Draw background box
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", logX - 5, logY - 5, boxWidth + 10, (maxLines * lineHeight) + 10)
    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.rectangle("fill", logX, logY, boxWidth, (maxLines * lineHeight))
    
    -- Draw title
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(smallF)
    love.graphics.print("Customer Purchases", logX + 5, logY + 5)
    
    if #_G.purchaseLogEntries == 0 then
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.setColor(1, 1, 1)
        return
    end
    
    -- Draw purchase log entries
    local displayCount = math.min(#_G.purchaseLogEntries, maxLines)
    for i = 1, displayCount do
        local entry = _G.purchaseLogEntries[#_G.purchaseLogEntries - displayCount + i]
        if entry then
            love.graphics.setColor(entry.color[1], entry.color[2], entry.color[3])
            local text = entry.message
            -- Truncate if too long
            if string.len(text) > 50 then
                text = string.sub(text, 1, 27) .. "..."
            end
             love.graphics.setFont(tinyF)
            love.graphics.print(text, logX + 5, logY + 25 + ((i - 1) * lineHeight))
        end
    end
    
    love.graphics.setColor(1, 1, 1, 1)
end

return purchaseLog
