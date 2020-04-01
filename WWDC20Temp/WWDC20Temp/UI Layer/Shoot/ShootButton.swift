import SpriteKit


class ShootButton: SKSpriteNode {
    var stats: [StatsToShootButton]!
    var pressed = false
    // MARK: Delegates
    var player: PlayerToShootButton!
    var direction: [DirectionToShoot]!
    
    init(player: PlayerToShootButton?) {
        let texture = SKTexture(imageNamed: Assets.HUD.Shoot.str)
        super.init(texture: texture, color: .black, size: texture.size())
        
        self.player = player
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pressAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        releaseAnimation()
        if pressed {
            isUserInteractionEnabled = false
            alpha = 0.3
            stats[1].stopSlider()
            let interval = SKAction.wait(forDuration: stats[0].getDuration)
            let freeKick = SKAction.sequence([
                stats[0].fadeOutAnimation(),
                stats[1].fadeOutAnimation(),
                interval,
                player!.runPlayer()
            ])
            run(freeKick)
        } else {
            direction[0].deactivate()
            direction[1].deactivate()
            stats[0].stopSlider()
            stats[1].activate()
        }
        pressed = true
    }
    
    func pressAnimation() {
            var t = SKTexture()
            let pressed = SKAction.run {
                t = SKTexture(imageNamed: Assets.HUD.Shoot.pressed)
                self.texture = t
                self.size = t.size()
    //            self.setScale(1.5)
            }
            
            run(pressed)
        }
        
        func releaseAnimation() {
            var t = SKTexture()
            let release = SKAction.run {
                t = SKTexture(imageNamed: Assets.HUD.Shoot.eff)
                self.texture = t
                self.size = t.size()
    //            self.setScale(1.5)
            }
            
            run(release)
        }
}

// MARK: - ShootButtonToStats
//extension ShootButton: ShootButtonToStats {
//    func turnActive() {
//        // TODO: Activate animation
//        isUserInteractionEnabled = true
//        alpha = 1
//    }
//
//    func turnInactive() {
//        // TODO: Deactivate animation
//        isUserInteractionEnabled = false
//        alpha = 0.3
//    }
//}

// MARK: - ShootButtonToLayer
extension ShootButton: ShootButtonToLayer {
    var setStats: [StatsToShootButton]! {
        get { return stats }
        set { stats = newValue }
    }
    var setPlayer: PlayerToShootButton! {
        get { return player }
        set { player = newValue }
    }
    var setDirection: [DirectionToShoot]! {
        get { return direction }
        set { direction = newValue }
    }
}
