import UIKit
import SpriteKit


protocol LayerToGameScene {
    
    func loadStat(size: CGSize, statType: Points.NewStatsPoints) -> NewStats
    
    func loadButton(color: UIColor, size: CGSize, player: PlayerToShootButton) -> SKSpriteNode
    
    func setButtonStats(stats: [NewStats])
}
