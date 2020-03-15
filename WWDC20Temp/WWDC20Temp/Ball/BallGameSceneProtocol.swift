import Foundation
import SpriteKit

protocol BallGameSceneProtocol {
    
    func loadBall() -> SKSpriteNode
}


extension BallViewModel: BallGameSceneProtocol {
    
    func loadBall() -> SKSpriteNode {
        
        ball = SKSpriteNode(color: .blue, size: CGSize(width: 15, height: 15))
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return ball
    }
}
