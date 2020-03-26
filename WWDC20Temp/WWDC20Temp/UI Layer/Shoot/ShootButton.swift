import Foundation
import SpriteKit


class ShootButton: SKSpriteNode {
    
    var player: PlayerToShootButton?
    var stats: [StatsToShootButton]!
    
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
        
        let interval = SKAction.wait(forDuration: stats[0].getDuration)
        let freeKick = SKAction.sequence([
            
            stats[0].fadeOutAnimation(),
            stats[1].fadeOutAnimation(),
            interval,
            player!.runPlayer()
        ])
        self.run(freeKick)
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
