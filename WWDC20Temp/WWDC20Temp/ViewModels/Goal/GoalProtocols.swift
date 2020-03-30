import SpriteKit


protocol GoalToGameScene {
    //Temp
    var getGoal: SKSpriteNode { get }
    
    func loadGoal() -> SKSpriteNode
}

protocol GoalToBall {
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint
    
    func getGoalY() -> CGFloat
}

protocol GoalToGoalkeeper {
    var size: CGSize  { get }
    
    var position: CGPoint  { get }
}

protocol GoalToBackground {
    func move(isLeft: Bool)
}
