local dayTimer = {}
timer = 0
week = 1

function clock(dt)
pace = timer*75
timer = timer + dt


if timer >= 3 and day == "NewWeek"  then
   timer = 1
   day = "Weekday"
end

if timer >= 9 and day == "Weekday" then
   timer = 1
   day = "WeekEnd"
end

if timer >= 30 and day == "Sunday" then
       timer = 1
       day = "WeekReview"
end

 if timer >= 120 and day == "Saturday" then
       timer = 1
        day = "ReadyforMarket"
   
 end
end

function dayTimer:draw()
love.graphics.setColor(0.918, 0.94, 0.647)
if timer >= 60 then 
    love.graphics.setColor(0.918, 0.75, 0.647)
end
if timer >= 90 then 
    love.graphics.setColor(0.969, 0.4, 0.647)
end 
love.graphics.circle("fill", 0, 0, 190, 190)

      love.graphics.setColor(0.9, 0.9, 0.6) 
if timer >= 60 then 
    love.graphics.setColor(0.9, 0.7, 0.6)
end
if timer >= 90 then 
    love.graphics.setColor(0.9, 0.4, 0.6)
end 
love.graphics.circle("fill", 0, 0, 180, 180)
love.graphics.setColor(0, 0, 0)
love.graphics.setFont(smallF)
love.graphics.print( "Week " , 20, 10)
love.graphics.print( week , 125, 10)
love.graphics.print( day , 20, 50)
love.graphics.print("Funds:" , 20, 90)
love.graphics.print("$" ..funds, 20, 110)
love.graphics.line(5,5, 5, 175)
love.graphics.setColor(1, .984, 0)
if day == "Saturday" then
love.graphics.circle("fill", 5, timer*1.45, 10, 10)
end
if day == "Sunday" then
love.graphics.circle("fill", 5, timer*5.8, 10, 10)
end
love.graphics.setColor(1, 1, 1)

end

return dayTimer
   

