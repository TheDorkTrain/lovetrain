-----------------------Gather Points ------------------------
    stand = Item(standImage, "stand", "stand", 100, 2000 , 1)
    standRadius = Gatherpoint("stand", 130, 2040, 0, 0, "pearl", nil, true)
    altar = Item(altarImage, "stand", "altar", 689, 1138 , 1)

    hiddenstand1 = Item(standImage, "stand", "stand", 1460, 1383 , 1)
    hiddenstand2 = Item(standImage, "stand", "stand", -74, 1593 , 1)
    hiddenstand3 = Item(standImage, "stand", "stand", -1289, 2078 , 1)

    dock = Gatherpoint("dock", -500, 2793, 175, 175, "log", nil, true)

    gatherPoints = {standRadius, altar1, altar2, altar3, hiddenPoint1, hiddenPoint2, hiddenPoint3, dock}

---------------------- Items ---------------------------------

    tree1 = Item(tree, "tree", "tree", -400, 2300, 2, true)
    tree2 = Item(tree, "tree", "tree", 676, 2678, 2, true)
    tree3 = Item(tree, "tree", "tree", 2280, 1803, 2, true)
    tree4 = Item(tree, "tree", "tree", -264, 1612, 2, true)
    trees = {tree1, tree2, tree3, tree4} 

    log1 = Item(log, "log", "log", -400, 2300, 1, false)
    log2 = Item(log, "log", "log", 676, 2678, 1,  false)
    log3 = Item(log, "log", "log", 2280, 1803, 1,  false)
    log4 = Item(log, "log", "log", -264, 1612, 1,  false)

    asteroidCrash = Collect(asteroid, 3186, 2132, 1, shieldText, "shield", false)
    bottle1 = Collect(bottleImage, 350, 2842, .5, bottleText1, "none", true)
    bottle2 = Collect(bottleImage, 1136, 1107, .5, bottleText2, "none", true)
    bottle3 = Collect(bottleImage, 3136, 1932, .5, bottleText3, "none", true)
    bottle4 = Collect(bottleImage, -528, 2555, .5, bottleText4, "none", false)
    bottle5 = Collect(bottleImage, 111, 2358, .5, bottleText5, "none", false)
    collectionItems = {asteroidCrash, bottle1, bottle2, bottle3, bottle4, bottle5}

    randomizeValues()
    randomizeSpawn()
    pickupItems = {log1, log2, log3, log4, pearlItem, pearlItem2, pearlItem3, pearlItem4, pearlItem5, pearlItem6, pearlItem7, pearlItem8}
    pickupNames = {"log1", "log2", "log3", "log4", "pearlItem", "pearlItem2", "pearlItem3", "pearlItem4", "pearlItem5", "pearlItem6", "pearlItem7", "pearlItem8"}
