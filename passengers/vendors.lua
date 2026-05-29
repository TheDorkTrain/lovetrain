vendor = Object:extend()

isDarwinThere = false
vendors = {}
randVendor = {vendor1Image, vendor2Image, vendor3Image, vendor4Image}
randStall = {stall1Image, stall2Image, stall3Image}
productList = {"cookSugar", "cookChoc", "cookRaisin", 'bread', 'breadChoc', 'breadBana', 'cake', 'cakeChoc', 'cakeStraw'}
currentProducts = {}

function currentProdPrice(currentProd)

    if currentProd == "cookSugar" then
    return 10
    end
    if currentProd == "cookChoc" then
    return 13
    end
    if currentProd == "cookRaisin" then
    return 20
    end
    if currentProd == "bread" then
    return 14
    end
    if currentProd == "breadChoc" then
    return 17
    end
      if currentProd == "breadBana" then
    return 22
    end
      if currentProd == "cake" then
    return 19
    end
      if currentProd == "cakeChoc" then
    return 25
    end
      if currentProd == "cakeStraw" then
    return 34
    end
end


function vendorsGet(n)
    for i = 1, n, 1 do
        isThisDarwin = love.math.random(1,3)
        if isThisDarwin == 3 and isDarwinThere == false then
            randProdNum = love.math.random(3,4)
            for i = 1, randProdNum, 1 do
            randProduct = love.math.random(1,9)
            table.insert(currentProducts, productList[randProduct])
            table.insert(currentProducts, currentProdPrice(productList[randProduct])/2)
            end
        else
            randProdNum = love.math.random(1,4)
            for i = 1, randProdNum, 1 do
            randProduct = love.math.random(1,9)
            table.insert(currentProducts, productList[randProduct])
            table.insert(currentProducts, currentProdPrice(productList[randProduct]))
            end
        end
        if isThisDarwin == 3 and isDarwinThere == false then
        newVendor = vendor(darwinImage, stallDarwinImage, i, currentProducts)
        table.insert(vendors, newVendor)
        isDarwinThere = true
        else
        randVendorNum = love.math.random(1,4)
        newVendor = vendor(randVendor[randVendorNum], randStall[i % 3 + 1], i, currentProducts)
        table.insert(vendors, newVendor)
        end
        for k in pairs(currentProducts) do
        currentProducts[k] = nil
        end
    end
    isDarwinThere = false
end

function vendor:new( image, stallImage, stall, products)
    self.image = image
    self.stallImage = stallImage
    self.stall = stall
    self.prod1 =  products[1]
    self.price1 = products[2]
    self.prod2 =  products[3]
    self.price2 = products[4]
    self.prod3 = products[5]
    self.price3 = products[6]
end

function vendor:draw()
    local x, y, stallScale
    if self.stall == 1 then
        x = 255
        y = 250
        stallScale = 1
    elseif self.stall == 2 then
        x = 475
        y = 250
        stallScale = 1
    elseif self.stall == 3 then
        x = 200
        y = 200
        stallScale = .5
    elseif self.stall == 4 then
        x = 400
        y = 200
        stallScale = .5
    end
    if x and y and self.image and self.stallImage then
        if self.stall == 1 or self.stall == 2 then
        love.graphics.draw(self.image, x+50, y+125, 0, stallScale/1.3, stallScale/1.3)
        end
        if self.stall == 3 or self.stall == 4 then
        love.graphics.draw(self.image, x+10, y+75, 0, stallScale/1.3, stallScale/1.3)
        end
        love.graphics.draw(self.stallImage, x, y, 0, stallScale, stallScale)
    end
end