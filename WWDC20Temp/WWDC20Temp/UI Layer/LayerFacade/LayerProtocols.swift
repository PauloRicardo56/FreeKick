import UIKit
import SpriteKit


protocol LayerToGameScene {
    func loadStat(statType: Images.Stat.StatIndicator) -> NewStats
    
    func loadButton(color: UIColor, size: CGSize, player: PlayerToShootButton) -> SKSpriteNode
    
    func setButtonStats(stats: [NewStats])
}
