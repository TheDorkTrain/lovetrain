----------------------- Loading-------------------------

--Songs
song1 = love.audio.newSource("assets/audio/bgm/Autumn Leaves part A.ogg", "static" )
-- song3 = love.audio.newSource("assets/audio/bgm/Blithe part A.ogg", "static" )
song5 = love.audio.newSource("assets/audio/bgm/Closed Bakery part A.ogg", "static" )
song7 = love.audio.newSource("assets/audio/bgm/Good Old Days part A.ogg", "static" )
-- song9 = love.audio.newSource("assets/audio/bgm/My Only Love.ogg", "static" )
song10 = love.audio.newSource("assets/audio/bgm/Till Death Do Us Part.ogg", "static" )

------------------------Volumes-------------------------
song1:setVolume(.10)
-- song3:setVolume(.10)
song5:setVolume(.10)
song7:setVolume(.10)
-- song9:setVolume(.10)
song10:setVolume(.10)
----------------------- States--------------------------

----------------------- Credit--------------------------
-- Jan Hehr and add a link to my website https://janhehr.com

--------------------- Functions--------------------------

   setlist = {song1, song5, song7}
   currentSong = song7
   
weekReviewSongPlayed = false

function soundtrack()
    if location == "game" and day == "WeekReview" and not weekReviewSongPlayed then
        randoSong = love.math.random(1,3)
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
