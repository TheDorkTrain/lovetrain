function animations()

    testKrillo = love.graphics.newImage("assets/images/character/krillo.png")
    testLucky = love.graphics.newImage("assets/images/character/animationtestLucky.png")

    idleFrames = {} 
    battleIdleFrames = {}
    battleAttackFrames = {}
    battleAttackGoFrames = {}
    battleSpAttackFrames = {}
    battleSpAttackGoFrames = {}
    moveFrames = {}
    hurtFrames = {}
    defeatframes = {}
    victoryFrames = {}
    partyFrames = {}
    shipFrames = {}
    supportFrames ={}

    currentFrame = 1
   
    local frame_width = 320
    local frame_height = 320
    local sheet_width = testKrillo:getWidth()
    local sheet_height = testKrillo:getHeight()

    for i=0,4 do
        table.insert(idleFrames, love.graphics.newQuad(i * frame_width, 0 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(battleIdleFrames, love.graphics.newQuad(i * frame_width, 1 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(battleAttackFrames, love.graphics.newQuad(i * frame_width, 2 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(battleAttackGoFrames, love.graphics.newQuad(i * frame_width, 3 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(battleSpAttackFrames, love.graphics.newQuad(i * frame_width, 4 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(battleSpAttackGoFrames, love.graphics.newQuad(i * frame_width, 5 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(moveFrames, love.graphics.newQuad(i * frame_width, 6 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(hurtFrames, love.graphics.newQuad(i * frame_width, 7 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(defeatframes, love.graphics.newQuad(i * frame_width, 8 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(victoryFrames, love.graphics.newQuad(i * frame_width, 9 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(partyFrames, love.graphics.newQuad(i * frame_width, 10 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(shipFrames, love.graphics.newQuad(i * frame_width, 11 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
        table.insert(supportFrames, love.graphics.newQuad(i * frame_width, 12 * frame_height, frame_width, frame_height, sheet_width, sheet_height))
    end

end

function runAnimation(dt)

    currentFrame = currentFrame + 10 * dt
    if currentFrame >= 5 then
        currentFrame = 1
    end

end