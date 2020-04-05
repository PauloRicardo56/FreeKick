import Foundation
import SpriteKit


class UILayer {
    var shootButton: (SKSpriteNode & ShootButtonToLayer)!
    var newStats: NewStatsToBall!
    
    init() {
        shootButton = ShootButton(player: nil)
    }
}

// MARK: - LayerToGameScene
extension UILayer: LayerToGameScene {
    func loadStat(statType: Assets.Stat.StatIndicators) -> NewStats {
        let stat = NewStats(statType: statType)
        
        return stat
    }
    
    func loadButton(directions: [DirectionToShoot], player: PlayerToShootButton) -> SKSpriteNode {
        shootButton.setPlayer = player
        shootButton.setDirection = directions
        
        return shootButton
    }
    
    func setButtonStats(stats: [NewStats]) {
        shootButton.setStats = stats
    }
}
