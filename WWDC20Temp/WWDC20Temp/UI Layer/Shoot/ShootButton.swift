import Foundation
import SpriteKit


class ShootButton: SKSpriteNode {
    
    var player: PlayerShootButtonProtocol?
    var stats: StatsShootButtonProtocol!
    
    init(color: UIColor, size: CGSize, player: PlayerShootButtonProtocol?) {
        super.init(texture: nil, color: color, size: size)
        
        self.player = player
        self.alpha = 0.3
        self.isUserInteractionEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
