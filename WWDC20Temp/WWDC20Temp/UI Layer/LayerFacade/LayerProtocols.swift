import UIKit
import SpriteKit


protocol LayerToGameScene {
    func loadStat(statType: Assets.Stat.StatIndicators) -> NewStats
    
    func loadButton(directions: [DirectionToShoot], player: PlayerToShootButton) -> SKSpriteNode
    
    func setButtonStats(stats: [NewStats])
}
