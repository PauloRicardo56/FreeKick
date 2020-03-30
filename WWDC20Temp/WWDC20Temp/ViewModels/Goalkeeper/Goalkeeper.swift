import SpriteKit


class Goalkeeper: SKSpriteNode, Moveable {
    var goal: GoalToGoalkeeper!
    
    init(goal: GoalToGoalkeeper) {
        let texture = SKTexture(imageNamed: Images.Player.frame3.rawValue)
        super.init(texture: texture, color: .black, size: texture.size())
        
        anchorPoint = CGPoint(x: 0.5, y: 0)
        setScale(0.7)
        self.goal = goal
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        let left = -goal.size.width*0.4 + goal.position.x
        let right = -goal.size.width*0.2 + goal.position.x
        
        run(moveLeftRightAction(
            left: left,
            right: right,
            duration: 1.5)
        )
    }
}

// MARK: - GoalkeeperToBackground
extension Goalkeeper: GoalkeeperToBackground {
    func resetAnimation() {
        removeAllActions()
        position.x = -goal.size.width*0.4 + goal.position.x
        
        setUp()
    }
}
