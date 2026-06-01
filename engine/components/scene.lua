local scene = {}

currentEmotion = characterNeutral

eventList = {'rainyDay', 'grannieCookieOff', 'grannieBreadOff', 'grannieCakeOff', 'kaylyn', 'darwinLoan', 'cancelledOrder', 'shieldKing', 'sisterVisit', 'kitchenFire', 'blobDinnerParty'}
-- Conditional Events:  blobDinnerParty
activeEvent = ''
scenePhase = 'intro'

dialogIndex = 1
currentDialog = {}
dialogFinished = false
resolutionTriggered = false

taskProgress = 0     
taskTarget = 0       
grannieCount = 0      

taskProducts = {
    grannieCookieOff = {"cookSugar", "cookChoc", "cookRaisin"},
    grannieBreadOff  = {"bread", "breadChoc", "breadBana"},
    grannieCakeOff   = {"cake", "cakeChoc", "cakeStraw"},
    blobDinnerParty  = {"Trash"},
    kaylyn           = {"cakeStraw"},
    shieldKing       = {"breadBana"},
    cancelledOrder   = {"cookSugar","cookChoc","cookRaisin","bread","breadChoc","breadBana","cake","cakeChoc","cakeStraw"},
    kitchenFire      = {"cookRaisin"},
}

function productCountsForTask(productCode)
    if activeEvent == '' then return false end
    local relevant = taskProducts[activeEvent]
    if not relevant then return false end
    for _, code in ipairs(relevant) do
        if code == productCode then return true end
    end
    return false
end

eventData = {
    rainyDay = {
        introDialog = {
            "The clouds are rolling in...",
            "It looks like it will rain on market day...",
            {"I spent all week looking forward to this weekend,",
             "but the market closes during rain."},
            {"I could spend the day practicing my recipes...",
             "or I could just skip..."},
        },
        challenge = nil,
    },
    grannieCookieOff = {
        introDialog = {
            {"Hey there New Baker-",
             "I've been baking since before you were born!"},
            {"Around here I'm known as the cooking grannie.",
             "I thought I would drop by and issue a friendly little challenge..."},
            {"If you can bake more cookies than me,",
             "I'll buy all your cookies for $30!"},
        },
        challenge = "Bake more Cookies than Grannie (any kind)",
        reward = "$50",
        taskTarget = 0,
        resolutionSuccess = "Oh drat... looks like you won our little competition.",
               resolutionFail = "I baked more cookies than you! Better luck next time!",
    },
    grannieBreadOff = {
        introDialog = {
            {"Hey there New Baker-",
             "I've been baking since before you were born!"},
            {"Around here I'm known as the cooking grannie.",
             "I thought I would drop by and issue a friendly little challenge..."},
            {"If you can bake more Bread than me,",
             "I'll buy all your Bread for $50!"},
        },
        challenge = "Bake more Bread than Grannie (any kind)",
        reward = "$75",
        resolutionSuccess = "You have the makings of greatness about you, kid!",
        resolutionFail = "I baked more bread than you! Better luck next time!",
    },
    grannieCakeOff = {
        introDialog = {
            {"Hey there New Baker-",
             "I've been baking since before you were born!"},
            {"Around here I'm known as the cooking grannie.",
             "I thought I would drop by and issue a friendly little challenge..."},
            {"If you can bake more Cakes than me,",
             "I'll buy all your Cakes for $100!"},
        },
        challenge = "Bake more Cakes than Grannie (any kind)",
        reward = "$100",
        resolutionSuccess = "You have the makings of greatness about you, kid!",
                resolutionFail = "I baked more Cakes than you! Better luck next time!",
    },
    blobDinnerParty = {
        introDialog = {
            {"Hey... You are the baker that makes the yummy trash.",
             "yum yum yum yum"},
            {"I am throwing a dinner party on Sunday...",
             "can you make me 10 Trash?"},
            {"If you can bake me 10 Trash,",
             "I'll pay you $75!"},
        },
        challenge = "Bake 10 Trash for Blobert",
        reward = "$75",
        taskTarget = 10,
        resolutionSuccess = "I lied about the dinner party.. its all for me",
        resolutionFail = "OH NO!! What am I going to feed my guests!",
    },
    kaylyn = {
        introDialog = {
            {"Hi there! I'm a friend of your mom's.",
             "Would you bake me a strawberry cake?"},
            {"It's for a special occasion.",
             "I'll pay you $50!"},
        },
        challenge = "Bake a Strawberry Cake for your mom's friend",
        reward = "$50",
        taskTarget = 1,
        resolutionSuccess = "She lights up seeing the cake. 'Your mom would be proud!'",
        resolutionFail = "Kaylyn looks a little sad. Maybe next time?",
    },
    darwinLoan = {
        introDialog = {
            {"SCHNEEELLO There, It's me the dashing Darwin.",
             "I saw your pitiful stand at the market."},
            {"You must be poor, and I am a man of independent wealth,",
             "I am in a position to offer you a loan."},
        },
        challenge = "Take a loan of $100 and pay it off $25 a week for 6 weeks.",
        reward = "$100",
    },
    cancelledOrder = {
        introDialog = {
            {"SCHNEEELLO There, It's me the dashing Darwin.",
             "I can tell you are a baker of *groans* great talent."},
            {"I have a challenge for you. Don't bake anything at all.",
             "I  promise to pay you like- $2000"},
        },
         challenge = nil,
    },
    shieldKing = {
        introDialog = {
            "I come from the island of Shields.",
            "Baked Goods, I was hoping you'd yield.",
        },
        challenge = "Bake a Banana Bread for the Shield King",
        reward = "$30",
        taskTarget = 1,
        resolutionSuccess = "Shield King nods ponders a rhyme and then runs off",
        resolutionFail = "'No yield for shield?' Shield King runs off",
    },
    sisterVisit = {
        introDialog = {
            {"Hey Sister! I thought I would surprise you with a visit",
             "I will gladly lend you a helping hand with baking!"},
             "I'll be over saturday! See you then!",
        },
        challenge = nil,
    },
    kitchenFire = {
        introDialog = {
            {"Hey, it's me! One of the fires in your kitchen!",
             "We want Cookie. All the time you bake cookie for others."},
            {"We want one with Raisins.",
             "We pay nice!"},
        },
        challenge = "Bake a Raisin Cookie for the kitchen fire",
        reward = "$25",
        taskTarget = 1,
        resolutionSuccess = "The fire crackles with delight!",
        resolutionFail = "The fire dims sadly. No raisin cookie...",
    },
}

local npcMap = {
    grannieCookieOff = function() return vendor3Image end,
    grannieBreadOff  = function() return vendor3Image end,
    grannieCakeOff   = function() return vendor3Image end,
    blobDinnerParty  = function() return blobImage end,
    kaylyn           = function() return cust6Image end,
    darwinLoan       = function() return darwinImage end,
    cancelledOrder   = function() return darwinImage end,
    shieldKing       = function() return shieldImage end,
    sisterVisit      = function() return sisterImage end,
    kitchenFire      = function() return fireImage end,
}

local function getEmotion(eventName)
    local map = {
        rainyDay = characterAnnoy,
        grannieCookieOff = characterNeutral,
        grannieBreadOff = characterNeutral,
        grannieCakeOff = characterNeutral,
        blobDinnerParty = characterShy,
        kaylyn = characterNeutral,
        darwinLoan = characterMad,
        cancelledOrder = characterMad,
        shieldKing = characterShy,
        sisterVisit = characterHappy,
        kitchenFire = characterShy,
    }
    return map[eventName] or characterNeutral
end

function startEvent(eventName)
    activeEvent = eventName
    dialogIndex = 1
    dialogFinished = false
    taskProgress = 0
    local data = eventData[eventName]
    currentNpc = npcMap[eventName] and npcMap[eventName]() or nil
    if data then
        currentDialog = data.introDialog
        currentEmotion = getEmotion(eventName)
        
        -- set grannie's random count at event start
        if eventName == 'grannieCookieOff' or eventName == 'grannieBreadOff' or eventName == 'grannieCakeOff' then
            grannieCount = love.math.random(3, 6)
            taskTarget = grannieCount
        else
            taskTarget = data.taskTarget or 0
        end
    end
end

function advanceDialog()
    if dialogIndex < #currentDialog then
        dialogIndex = dialogIndex + 1
    else
        dialogFinished = true
    end
end

function resolveEvent()
    scenePhase = 'resolution'
    dialogIndex = 1
    dialogFinished = false
    local data = eventData[activeEvent]
    if not data then return end

    local success = taskProgress >= taskTarget

    -- grant reward on success
    if success and data.reward then
        local amount = tonumber(data.reward:match("%d+")) or 0
        funds = funds + amount
    end

    local line = success and (data.resolutionSuccess or "Well done!") or (data.resolutionFail or "Better luck next time.")
    currentDialog = {line}
    currentEmotion = success and characterHappy or characterAnnoy
end

function scene:draw()
    love.graphics.draw(marketBack, 0, -400, 0, 2, 2)
    love.graphics.draw(cloudImage)
    love.graphics.draw(characterStall, 10, 0, 0, 1.5, 1.5)
    love.graphics.draw(characterImage, 250, 285, 0, 1.5, 1.5)

    local data = eventData[activeEvent]

    if currentNpc then
    if activeEvent == 'kitchenFire' then
        love.graphics.draw(currentNpc, 500, 300, 0, .75, .75)
    elseif activeEvent == 'shieldKing' then
        love.graphics.draw(currentNpc, 650, 500, 0, -1.5, 1.5)
    else
        love.graphics.draw(currentNpc, 500, 285, 0, 1.5, 1.5)
    end
end

  if currentEmotion then
    love.graphics.draw(currentEmotion, 250, 285, 0, 1.5, 1.5)
end


    -- dialog box
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 55, 15, 720, 150)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 60, 20, 710, 140)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(smallF)

  if currentDialog and currentDialog[dialogIndex] then
    local entry = currentDialog[dialogIndex]
    if type(entry) == "table" then
        love.graphics.print(entry[1], 75, 45)
        love.graphics.print(entry[2], 75, 75)
    else
        love.graphics.print(entry, 75, 75)
    end
end

    if not dialogFinished then
        nextDialogButt:draw(680, 120, 50, 25)
    else
        if scenePhase == 'intro' then
            if data and data.challenge then
                love.graphics.setFont(tinyF)
                love.graphics.print("Challenge: " .. data.challenge, 75, 115)
                if data.reward then
                    love.graphics.print("Reward: " .. data.reward, 75, 132)
                end
                acceptButt:draw(200, 500, 150, 50)
                declineButt:draw(400, 500, 160, 50)
            else
                love.graphics.setColor(0, 0, 0)
                       love.graphics.rectangle("fill", 295, 495, 160, 60)
             love.graphics.setColor(1, 1, 1)
                closeSceneButt:draw(300, 500, 150, 50)
            end
        else
             love.graphics.setColor(0, 0, 0)
             love.graphics.rectangle("fill", 295, 495, 160, 60)
             love.graphics.setColor(1, 1, 1)
            closeSceneButt:draw(300, 500, 150, 50)
        end
    end

    -- task progress tracker (shows during Saturday if event is active)
    if activeEvent ~= '' and taskTarget > 0 and day == "Saturday" then
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(tinyF)
        love.graphics.print("Task: " .. taskProgress .. " / " .. taskTarget, 10, 560)
    end

    love.graphics.setColor(1, 1, 1, 1)
end

return scene