import Foundation
import SpriteKit


class UILayer {
    var shootButton: (SKSpriteNode & ShootButtonToLayer)!
    var newStats: NewStatsToBall!
    
    init() {
        shootButton = ShootButton(color: .clear, size: .zero, player: nil)
    }
}

// MARK: - LayerToGameScene
extension UILayer: LayerToGameScene {
    func loadStat(statType: Images.Stat.StatIndicator) -> NewStats {
        let stat = NewStats(statType: statType)
        
        return stat
    }
    
    func loadButton(color: UIColor, size: CGSize, player: PlayerToShootButton) -> SKSpriteNode {
        shootButton.color = color
        shootButton.size = size
        shootButton.setPlayer = player
        
        return shootButton
    }
    
    func setButtonStats(stats: [NewStats]) {
        shootButton.setStats = stats
    }
}
