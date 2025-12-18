  -- areaRadius = Object:extend()

    -- function areaRadius:new(e)
    --     self.x = (e.x - 40)
    --     self.width = (e.width + radiusPadding)
    --     self.y = (e.y - 40 )
    --     self.height = (e.height + radiusPadding)
    -- end


    
-- function checkCollision(a, b)
--     local a_left = a.x
--     local a_right = a.x + a.width
--     local a_top = a.y
--     local a_bottom = a.y + a.height

--     local b_left = (b.x)/2
--     local b_right = (b.x + b.width+20)/2
--     local b_top = (b.y)/2
--     local b_bottom = (b.y + b.height+20)/2

--     return  a_right > b_left
--     and a_left < b_right
--     and a_bottom > b_top
--     and a_top < b_bottom
-- end