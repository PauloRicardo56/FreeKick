import Foundation
import SpriteKit


class UILayer {
    
    var shootButton: (ShootButtonLayerProtocol & SKSpriteNode)!
    var playerStats: StatsLayerProtocol!
    
    
    init() {
        playerStats = PlayerStats()
        shootButton = ShootButton(color: .clear, size: .zero, player: nil)
        shootButton.setStats = (playerStats as! StatsShootButtonProtocol)
    }
}
