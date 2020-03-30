import SpriteKit


protocol BallToGameScene {
    var setBallNewStats: [String: NewStatsToBall] { get set }
    var setBackground: BackgroundToBall { get set }
    var setGameVC: GameVCToBall { get set }
    
    func loadBall() -> SKSpriteNode
}

protocol BallToPlayer {
    func shootBall() -> SKAction
    
    func getBallPosition() -> CGPoint
}
