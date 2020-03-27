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
    func loadStat(size: CGSize, statType: Points.NewStatsPoints) -> NewStats {
        let stat = NewStats(size: size, statType: statType, buttonSize: CGSize(width: 40, height: 40))
        
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
