-------------------------------------------Player--------------------------------------
--  player = Player(-454, 2793)
player = Player(250, 400, 0, .5, .5)

-------------------------------------------Basic Setup---------------------------------
function love.keyreleased(key)
    player:keyreleased(key)
end