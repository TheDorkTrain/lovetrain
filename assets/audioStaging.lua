----------------------- Loading-------------------------
--Sound Effects
scream = love.audio.newSource("assets/audio/scream.wav", "static")
spook = love.audio.newSource("assets/audio/spook.wav", "static")
teleportfx = love.audio.newSource("assets/audio/teleport.wav", "static")
powerfx = love.audio.newSource("assets/audio/powerup.wav", "static")
stepsfx = love.audio.newSource("assets/audio/footstep.wav", "static")
shieldsfx = love.audio.newSource("assets/audio/shield.wav", "static")
wrongfx = love.audio.newSource("assets/audio/wrong.wav", "static")
rightfx = love.audio.newSource("assets/audio/right.wav", "static")
stompfx = love.audio.newSource("assets/audio/stomp.wav", "static")

--Songs
menuSong = love.audio.newSource("assets/audio/menu.mp3", "static")
daySong = love.audio.newSource("assets/audio/day.mp3", "static")
nightSong = love.audio.newSource("assets/audio/night.mp3", "static")
idlesong = love.audio.newSource("assets/audio/idlesong.wav", "static")

------------------------Volumes-------------------------
menuSong:setVolume(.10)
daySong:setVolume(.10)
nightSong:setVolume(.10)
scream:setVolume(.10)
idlesong:setVolume(2)
stepsfx:setVolume(0.1)

----------------------- States--------------------------
teleportPlay = true
teleportFirst = true
teleportTimer = 0
powerPlay = true


--------------------- Functions--------------------------
function playPower()
 if powerPlay then
    powerfx:play()
    powerPlay = false
 end
end

function playTeleport()
    if teleportPlay then
        teleportfx:play()
        teleportPlay = false
    end
   end

   
 function soundtrack()
    if location == "game" and phase == "Day" then
        spook:stop()
        scream:stop()
        nightSong:stop()
        menuSong:stop()  
        daySong:play()       
    elseif location == "game" and phase == "Night" then
        spook:stop()
        scream:stop()
        daySong:stop()
        menuSong:stop()      
        nightSong:play()     
    elseif location == "dayChange" and phase == "Night"  then
        daySong:stop()
        menuSong:stop()      
        nightSong:stop()
        spook:play()
        scream:play()       
    else
        spook:stop()
        scream:stop()
        daySong:stop()
        nightSong:stop()  
            menuSong:play()
    end
 end
