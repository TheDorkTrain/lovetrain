
 function changeShine(e) 
    if e == "redPrl" then
        shine = {1, 0.639, 0.329, 1} 
        show = "red"
        hiddenPoint1.spawn = true
    end
    if e == "grnPrl" then
        shine = {0.329, 1, 0.557, 1} 
        show = "grn"
        hiddenPoint2.spawn = true
    end
    if e == "bluPrl" then
        shine = {0.329, 0.847, 1, 1} 
        show = "blu"
        hiddenPoint3.spawn = true
    end
    if e == "none" then 
        shine = {1, 1, 1}
        show = "none"
        hiddenPoint1.spawn = false
        hiddenPoint2.spawn = false
        hiddenPoint3.spawn = false
    end 
end