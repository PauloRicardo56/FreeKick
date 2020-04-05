import SpriteKit


protocol GoalToGameScene {
    //Temp
    var getGoal: SKSpriteNode { get }
    
    func loadGoal() -> SKSpriteNode
}

protocol GoalToBall {
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint
    
    func getGkFallLeft() -> CGPoint
    
    func getGkFallRight() -> CGPoint
    
    func getGoalY() -> CGFloat
    
    func animate()
}

protocol GoalToGoalkeeper {
    var size: CGSize  { get }
    var position: CGPoint  { get }
    
    //Temp
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint
    
    //Temp
    func getGkFallRight() -> CGPoint
    
    //Temp
    func getGkFallLeft() -> CGPoint
}

protocol GoalToBackground {
    func move(isLeft: Bool)
}
