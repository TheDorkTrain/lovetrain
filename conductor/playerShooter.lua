PlayerShooter = Entity:extend()

function PlayerShooter:new(x, y)
    PlayerShooter.super.new(self, x, y, "assets/images/character/hero.png")
    self.shootCooldown = 0.5
    self.shootTimer = 0

    if self.action == "idle" then
        self.animationFrames = idleFrames
    end
    if self.action == "shoot" then
        self.animationFrames = battleAttackFrames
    end
    if self.action == "special" then
        self.animationFrames = battleSpAttackFrames
    end
end