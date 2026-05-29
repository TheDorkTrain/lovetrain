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
song1 = love.audio.newSource("assets/audio/bgm/Autumn Leaves part A.ogg", "static")
song2 = love.audio.newSource("assets/audio/bgm/Autumn Leaves part B.ogg", "static")
song3 = love.audio.newSource("assets/audio/bgm/Blithe part A.ogg", "static")
song4 = love.audio.newSource("assets/audio/bgm/Blithe part B.ogg", "static")
song5 = love.audio.newSource("assets/audio/bgm/Closed Bakery part A.ogg", "static")
song6 = love.audio.newSource("assets/audio/bgm/Closed Bakery part B.ogg", "static")
song7 = love.audio.newSource("assets/audio/bgm/Good Old Days part A.ogg", "static")
song8 = love.audio.newSource("assets/audio/bgm/Good Old Days part B.ogg", "static")
song9 = love.audio.newSource("assets/audio/bgm/My Only Love.ogg", "static")
song10 = love.audio.newSource("assets/audio/bgm/Till Death Do Us Part.ogg", "static")

------------------------Volumes-------------------------
song1:setVolume(.10)
song2:setVolume(.10)
song3:setVolume(.10)
song4:setVolume(.10)
song5:setVolume(.10)
song6:setVolume(.10)
song7:setVolume(.10)
song8:setVolume(.10)
song9:setVolume(.10)
song10:setVolume(.10)
----------------------- States--------------------------

----------------------- Credit--------------------------
-- Jan Hehr and add a link to my website https://janhehr.com

--------------------- Functions--------------------------

   setlist = {song1, song2, song3, song4, song5, song6, song7, song8, song9}
   currentSong = song7
   
weekReviewSongPlayed = false

function soundtrack()
    if location == "game" and day == "WeekReview" and not weekReviewSongPlayed then
        randoSong = love.math.random(1,9)
        love.audio.stop(currentSong)
        currentSong = setlist[randoSong]
        currentSong:play()
        weekReviewSongPlayed = true
    end
    if day == "ending" and not weekReviewSongPlayed then
         love.audio.stop(currentSong)
        currentSong = song10
        currentSong:play()
        weekReviewSongPlayed = true
    end
    currentSong:play()
 end
