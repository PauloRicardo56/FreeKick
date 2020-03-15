import Foundation
import SpriteKit


protocol BallViewModelProtocol {
    
    func getBallPosition() -> CGPoint
}


class BallViewModel: BallViewModelProtocol {
    
    var scene: GameScene!
    var ball: SKSpriteNode!
    
    
    init(scene: GameScene) {
        
        self.scene = scene
        
        ball = SKSpriteNode(color: .yellow, size: CGSize(width: 15, height: 15))
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
}
