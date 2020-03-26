import Foundation
import SpriteKit


class ShootButton: SKSpriteNode {
    
    var player: PlayerToShootButton?
    var stats: [StatsToShootButton]!
    var pressed = false
    
    init(color: UIColor, size: CGSize, player: PlayerToShootButton?) {
        super.init(texture: nil, color: color, size: size)
        
        self.player = player
        self.alpha = 0.3
        self.isUserInteractionEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if pressed {
            stats[1].stopSlider()
            let interval = SKAction.wait(forDuration: stats[0].getDuration)
            let freeKick = SKAction.sequence([
                stats[0].fadeOutAnimation(),
                stats[1].fadeOutAnimation(),
                interval,
                player!.runPlayer()
            ])
            self.run(freeKick)
        } else {
            stats[0].stopSlider()
            //TODO: Animate of the background line (with the green space for a good shot)
            pressed = true
        }
    }
}


extension ShootButton: ShootButtonToStats {
    
    func turnActive() {
        // TODO: Activate animation
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
    
    
    func turnInactive() {
        // TODO: Deactivate animation
        self.isUserInteractionEnabled = false
        self.alpha = 0.3
    }
}


extension ShootButton: ShootButtonToLayer {
    
    var setStats: [StatsToShootButton]! {
        get { return stats }
        set { stats = newValue }
    }
    
    var setPlayer: PlayerToShootButton! {
        get { return player }
        set { player = newValue }
    }
}
