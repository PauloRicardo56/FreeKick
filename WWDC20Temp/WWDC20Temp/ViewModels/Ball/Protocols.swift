import Foundation
import SpriteKit

protocol BallToGameScene {
    
    var setBallNewStats: [String:NewStatsToBall] { get set }
    
    func loadBall() -> SKSpriteNode
}


protocol BallToPlayer {
    
    func shootBall() -> SKAction
    
    func getBallPosition() -> CGPoint
}
