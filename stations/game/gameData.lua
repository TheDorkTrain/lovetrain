---------------------------------- Inventory-----------------------------
itemEgg = 0
itemFlour = 0
itemSugar = 0
itemMilk = 0
itemChoc = 0
itemStraw = 0
itemRaisin = 0
itemBanana = 0
itemButter = 0
itemCream = 0
-- product= product, image, marketprice
productsSold= {}
product1= {"", "", 0}
product2= {"", "", 0}
product3= {"", "", 0}
product4= {"", "", 0}
product5= {"", "", 0}
product6= {"", "", 0}
product7= {"", "", 0}
product8= {"", "", 0}


ingredientCosts = {
    butter = 1,
    egg = 1,
    flour = 1,
    sugar = 1,
    milk = 1,
    choc = 2,
    straw = 5,
    raisin = 5,
    banana = 5
}

productCosts = {
    cookSugar = 5, 
    cookChoc = 7, 
    cookRaisin = 10,
    bread = 8,    
    breadChoc = 10,
    breadBana = 13, 
    cake = 11,    
    cakeChoc = 15, 
    cakeStraw = 21, 
}

productsSoldThisWeek = {}
mediumStall = false
largeStall = false
ovenPro = false
momsRecipe = false
-----------------------------------States----------------------------
character = "none"
characterImage = "none"
characterStall = "none"
sisterImage = "none"


