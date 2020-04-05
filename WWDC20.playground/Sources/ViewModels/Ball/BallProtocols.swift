import SpriteKit


protocol BallToGameScene {
    var setBallNewStats: [String: NewStatsToBall] { get set }
    var setBackground: BackgroundToBall { get set }
    var setGoalkeeper: GoalkeeperToBall! { get set }
    var setLabel: LabelToBall! { get set }
    var setGameScene: GameSceneToBall { get set }
    
    func loadBall() -> SKSpriteNode
}

protocol BallToPlayer {
    func shootBall() -> SKAction
    
    func getBallPosition() -> CGPoint
}
