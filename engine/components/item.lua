Item = Object:extend()

function Item:new(imagepath, name, price, unlock)
    self.image = love.graphics.newImage(imagepath)
    self.name = name
    self.price = price
    self.unlock = unlock
    -- self.width = (self.image:getWidth() * .01 + z )
    -- self.height = (self.image:getHeight() * .01 + z)


end

function Item:update(dt)
    if self.carried then
        if player.direction2 == "up" then
        self.x = player.x
        self.y = player.y + 5
        end
        if player.direction2 == "down" then
            self.x = player.x +5
        self.y = player.y + 5
        end
    end
end


function Item:draw()
    -- love.graphics.rectangle("fill",  self.x, self.y, self.width*60 , self.height*60) 

    love.graphics.draw(self.image, self.x, self.y, 0, .01, .01)
end