import Foundation
import SpriteKit


class UILayer {
    
    var shootButton: (SKSpriteNode & ShootButtonLayerProtocol & ShootButtonStatsProtocol)!
    var playerStats: (StatsLayerProtocol & StatsShootButtonProtocol & StatsBallProtocol)!
    
    
    init() {
        
        playerStats = PlayerStats()
        shootButton = ShootButton(color: .clear, size: .zero, player: nil)
        shootButton.setStats = playerStats
        playerStats.setButton = shootButton
    }
}
