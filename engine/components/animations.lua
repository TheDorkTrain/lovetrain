function animations()

    typingSheet = love.graphics.newImage("assets/images/character/animationSheet.png")
    -- 1250 x 600 5 Panels
  
    pennyTyping = {} 
    artyTyping = {}
    fireSparking = {}

    currentFrame = 1
   
    local frame_width = 250
    local frame_height = 300
    local sheet_width = typingSheet:getWidth()
    local sheet_height = typingSheet:getHeight()

    for i=0,4 do
        table.insert(pennyTyping, love.graphics.newQuad(i * frame_width, 0 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(artyTyping, love.graphics.newQuad(i * frame_width, 1 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(fireSparking, love.graphics.newQuad(i * frame_width, 2 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
    end

end

function runAnimation(dt)

    currentFrame = currentFrame + 10 * dt
    if currentFrame >= 5 then
        currentFrame = 1
    end

end