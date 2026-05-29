shopItem = Object:extend()

function shopItem:new( imagepath, add, cost)
    self.image = love.graphics.newImage(imagepath)
    self.width = self.image:getWidth() * 2
    self.height = self.image:getHeight() * 2
    self.add = add
    self.cost = cost
end

function shopItem:mousepressed(x, y, button)
    if button == 1 and self.x and self.y then  -- Add these checks
        if x > self.x and x < self.x + self.width and 
           y > self.y and y < self.y + self.height then
            if funds >= self.cost then
               _G[self.add] = (_G[self.add] or 0) + 1
            end
            return true 
        end
    end
    return false 
end

function shopItem:draw(x, y, r, sx, sy)
    self.x = x 
    self.y = y
    self.sx = sx or 1
    self.sy = sy or 1
    r = r or 0
    love.graphics.setFont(smallF)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, x, y, r, sx, sy) 
    love.graphics.setColor(1, 1, 1, 1)
end

-------------------------------Functions---------------------------------------------------


