local asteroidGame = {}

function asteroidGame:load()

    testmap = love.graphics.newImage("assets/images/background/testback.png")

end

animations()

function asteroidGame:update(dt)
    runAnimation(dt)
end

function asteroidGame:draw()
    love.graphics.draw(testmap, 0, 0, 0, 1, 1)
   
end