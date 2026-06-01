customer = Object:extend()

customers = {}
interestList = {"all", "cookies", "bread", "cake", 'trash'}
currentCustomerIndex = 1
customerPurchaseTimer = 0
customerPurchaseInterval = 3
hasSoldTrash = false

local regularImages = nil

local function getCustomerImages()
    if not regularImages then
        regularImages = {cust1Image, cust2Image, cust3Image, cust4Image, cust5Image, cust6Image}
    end
    return regularImages
end


local productNames = {
    cookSugar = "Sugar Cookie",
    cookChoc = "Chocolate Cookie",
    cookRaisin = "Raisin Cookie",
    bread = "Bread",
    breadChoc = "Chocolate Bread",
    breadBana = "Banana Bread",
    cake = "Cake",
    cakeChoc = "Chocolate Cake",
    cakeStraw = "Strawberry Cake",
    Trash = "Trash"
}

function getPrettyProductName(productCode)
    return productNames[productCode] or productCode
end

function customersGet(n)
    _G.purchaseLogEntries = {}  -- Initialize log
     local hasTrash = product1[1]=='Trash' or product2[1]=='Trash' or product3[1]=='Trash' or product4[1]=='Trash' or
                     product5[1]=="Trash" or product6[1]=='Trash' or product7[1]=='Trash' or product8[1]=='Trash'

    for i = 1, n do
        local randInterest
        local img
        if hasTrash and love.math.random(1, 10) == 1 then
            randInterest = love.math.random(1, 5)
              img = blobImage
            if hasSoldTrash == false then
                table.insert(eventList, 'blobDinnerParty')
                hasSoldTrash = true
            end
        else
            randInterest = love.math.random(1, 4)
             local imgs = getCustomerImages()
            img = imgs[love.math.random(#imgs)]
        end

        -- random start side
        local screenWidth = 800
        local startRight = love.math.random(1, 2) == 1
        local startX = startRight and screenWidth + 20 or -80
        local speed = love.math.random(10, 30)
        local dir = startRight and -1 or 1
        local yPos = 450

        newCustomer = customer(interestList[randInterest], img, startX, yPos, speed, dir)
        table.insert(customers, newCustomer)
    end
    currentCustomerIndex = 1
    customerPurchaseTimer = 0
end



function customerUpdate(dt)
    if #customers == 0 then return end

    -- move all customers
    for _, cust in ipairs(customers) do
        cust.x = cust.x + cust.speed * cust.dir * dt
    end

    customerPurchaseTimer = customerPurchaseTimer + dt
    if customerPurchaseTimer >= customerPurchaseInterval then
        if currentCustomerIndex <= #customers then
            customers[currentCustomerIndex]:makePurchase()
            currentCustomerIndex = currentCustomerIndex + 1
        end
        customerPurchaseTimer = 0
    end
end

function shouldCustomerBuyProduct(interest, productName)
    if interest == "all" then
        return productName ~= "Trash" and productName ~= ""
    elseif interest == "cookies" then
        return productName == "cookSugar" or productName == "cookChoc" or productName == "cookRaisin"
    elseif interest == "bread" then
        return productName == "bread" or productName == "breadChoc" or productName == "breadBana"
    elseif interest == "cake" then
        return productName == "cake" or productName == "cakeChoc" or productName == "cakeStraw"
    elseif interest == "trash" then
        return productName == "Trash"
    end
    return false
end

function findAvailableProduct(interest)
    -- Check player's available products
    local availableProducts = {product1, product2, product3, product4, product5, product6, product7, product8}
    
    for _, product in ipairs(availableProducts) do
        if product and product[1] ~= "" and shouldCustomerBuyProduct(interest, product[1]) then
            return product
        end
    end
    return nil
end

function getVendorPrice(productName)
    -- Returns the lowest vendor price for a product, or nil if no vendor has it
    if not vendors then return nil end
    
    local lowestPrice = nil
    for _, vendor in ipairs(vendors) do
        if vendor.prod1 == productName and vendor.price1 > 0 then
            lowestPrice = lowestPrice and math.min(lowestPrice, vendor.price1) or vendor.price1
        end
        if vendor.prod2 == productName and vendor.price2 > 0 then
            lowestPrice = lowestPrice and math.min(lowestPrice, vendor.price2) or vendor.price2
        end
        if vendor.prod3 == productName and vendor.price3 > 0 then
            lowestPrice = lowestPrice and math.min(lowestPrice, vendor.price3) or vendor.price3
        end
    end
    return lowestPrice
end

function logPurchase(seller, productName, price)
    if not _G.purchaseLogEntries then
        _G.purchaseLogEntries = {}
    end
    
    local prettyName = getPrettyProductName(productName)
    local message = ""
    local color = {1, 1, 1}
    
    if seller == "Player" then
        message = "You sold " .. prettyName .. " for $" .. price
        color = {0.2, 0.8, 0.2} 
    else
        message = prettyName .. " bought from rival vendor"
        color = {1, 0.2, 0.2} 
    end
    
    table.insert(_G.purchaseLogEntries, {message = message, color = color, timer = 0})
end

function logCustomerLeft(interest)
    if not _G.purchaseLogEntries then
        _G.purchaseLogEntries = {}
    end
    
    local interestName = interest:sub(1,1):upper() .. interest:sub(2)  -- Capitalize
    local message = "Customer wanted " .. interestName .. ", but none available"
    local color = {0.7, 0.7, 0.7} 
    
    table.insert(_G.purchaseLogEntries, {message = message, color = color, timer = 0})
end

function customer:makePurchase()
    local product = findAvailableProduct(self.interest)
    
    -- If player doesn't have product, check vendors
    if not product or product[1] == "" or not product[3] then 
        print("Customer " .. currentCustomerIndex .. " (" .. self.interest .. ") - No player product found, checking vendors...")
        
        -- Check if any vendor has this product
        local vendorProduct = nil
        local vendorPrice = nil
        if vendors then
            for _, vendor in ipairs(vendors) do
                if shouldCustomerBuyProduct(self.interest, vendor.prod1) then
                    vendorProduct = vendor.prod1
                    vendorPrice = vendor.price1
                    break
                elseif shouldCustomerBuyProduct(self.interest, vendor.prod2) then
                    vendorProduct = vendor.prod2
                    vendorPrice = vendor.price2
                    break
                elseif shouldCustomerBuyProduct(self.interest, vendor.prod3) then
                    vendorProduct = vendor.prod3
                    vendorPrice = vendor.price3
                    break
                end
            end
        end
        
        if vendorProduct then
            -- Vendor has it, customer buys from vendor
            logPurchase("Vendor", vendorProduct, vendorPrice)
        else
            -- Neither player nor vendor has it
            logCustomerLeft(self.interest)
        end
        return 
    end
    
    local playerPrice = product[3]
    local vendorPrice = getVendorPrice(product[1])
    
    -- Determine purchase likelihood based on price comparison
    local buyFromPlayer = false
    
    if vendorPrice then
        -- Compare prices - customer prefers cheaper option
        if playerPrice < vendorPrice then
            -- Player is cheaper - high chance to buy
            buyFromPlayer = love.math.random(1, 10) <= 8
            print("  Player cheaper - 80% chance: " .. (buyFromPlayer and "BUY" or "REJECT"))
        elseif playerPrice == vendorPrice then
            -- Same price - 50/50 chance
            buyFromPlayer = love.math.random(1, 2) == 1
            print("  Same price - 50/50 chance: " .. (buyFromPlayer and "BUY" or "REJECT"))
        else
            -- Vendor is cheaper - low chance to buy from player
            buyFromPlayer = love.math.random(1, 10) <= 2
            print("  Vendor cheaper - 20% chance: " .. (buyFromPlayer and "BUY" or "REJECT"))
        end
    else
        -- No vendor has this item - must buy from player
        buyFromPlayer = true
        print("  No vendor has item - MUST BUY")
    end
    
    -- Execute purchase
    if buyFromPlayer then
        funds = funds + playerPrice
        if productsSold == nil then
            productsSold = {}
        end
        table.insert(productsSold, product)
        
        -- Track for weekly summary
        if productsSoldThisWeek == nil then
            productsSoldThisWeek = {}
        end
        if productsSoldThisWeek[product[1]] == nil then
            productsSoldThisWeek[product[1]] = {count = 0, revenue = 0, cost = 0}
        end
        productsSoldThisWeek[product[1]].count = productsSoldThisWeek[product[1]].count + 1
        productsSoldThisWeek[product[1]].revenue = productsSoldThisWeek[product[1]].revenue + playerPrice
        productsSoldThisWeek[product[1]].cost = (productCosts[product[1]] or 0)
        
        logPurchase("Player", product[1], playerPrice)
        local productName = product[1]
        product[1] = ""
        product[2] = ''
        product[3] = 0
        print("✓ Customer bought your " .. productName .. " for $" .. playerPrice)
    else
        -- Buys from vendor instead
        logPurchase("Vendor", product[1], vendorPrice)
        print("✗ Customer bought " .. product[1] .. " from vendor for $" .. vendorPrice)
    end
end

function customer:new(interest, img, startX, yPos, speed, dir)
    self.interest = interest
    self.img = img
    self.x = startX
    self.y = yPos
    self.speed = speed
    self.dir = dir
end

function customer:draw()
    love.graphics.setColor(1, 1, 1, 1)
    if self.img then
        -- flip sprite based on direction
        local scaleX = self.dir == 1 and 0.75 or -0.75
        local offsetX = self.dir == 1 and 0 or 60  -- offset when flipped so it doesn't draw behind itself
        love.graphics.draw(self.img, self.x + offsetX, self.y, 0, scaleX, 0.75)
    end
end

