local Debug ={}

function Debug:update(dt)
if love.keyboard.isDown("p") then
      mouseX = love.mouse.getX()
      mouseY = love.mouse.getY()
      showMouse = true
else
      showMouse = false
end
end

function Debug:draw()

if showMouse == true then
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.rectangle("fill", 0, 10, 200, 200)
      love.graphics.setColor(.6, 1, 1)
      love.graphics.setFont(smallF)
      love.graphics.print("Mouse X: " .. mouseX, 20, 25)
      love.graphics.print("Mouse Y: " .. mouseY, 20, 50)
      love.graphics.print("Burnt " .. burnt, 20, 75)

      love.graphics.setColor(1, 1, 0)
love.graphics.setFont(smallF)
love.graphics.print("P1: " .. tostring(product1[1]) .. " / " .. tostring(product1[3]), 20, 300)
love.graphics.print("P2: " .. tostring(product2[1]) .. " / " .. tostring(product2[3]), 20, 320)
love.graphics.print("P3: " .. tostring(product3[1]) .. " / " .. tostring(product3[3]), 20, 340)
love.graphics.print("P4: " .. tostring(product4[1]) .. " / " .. tostring(product4[3]), 20, 360)


      -- love.graphics.print("Recipe " .. recipeShow, 20, 75)
      -- love.graphics.print("CookGame: " .. cookgame, 20, 100)
      -- love.graphics.print("Eggs: " .. itemEgg, 20, 125)
      -- love.graphics.print("Flour: " .. itemFlour, 20, 150)
      -- love.graphics.print("Butter: " ..  itemButter, 20, 175)
      -- love.graphics.print("Milk: " .. itemMilk, 20, 200)
      -- love.graphics.print("Sugar: " .. itemSugar, 20, 225)
      
      -- Market debug info
      -- love.graphics.print("Vendors: " .. (vendors and #vendors or 0), 20, 250)
      -- love.graphics.print("Customers: " .. (customers and #customers or 0), 20, 275)
      -- love.graphics.print("Funds: $" .. (funds or 0), 20, 300)
      -- love.graphics.print("Sunday Init:" .. sundayDebug, 20, 325)
      -- love.graphics.print("Current Customer: " .. (currentCustomerIndex or 0), 20, 345)
      -- love.graphics.print("Purchase Timer: " .. string.format("%.1f", customerPurchaseTimer or 0) .. "s", 20, 365)
end

end

return Debug
