import SpriteKit


class Goalkeeper: SKSpriteNode, Moveable {
    var goal: GoalToGoalkeeper!
    
    init(goal: GoalToGoalkeeper) {
        let texture = SKTexture(imageNamed: Images.Player.frame3.rawValue)
        super.init(texture: texture, color: .black, size: texture.size())
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.setScale(0.7)
        self.goal = goal
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        let left = -self.goal.goalFrame.size.width*0.4
        let right = -self.goal.goalFrame.size.width*0.2
        
        self.run(moveLeftRightAction(left: left, right: right, duration: 1.5))
    }
}
