import Foundation
import SpriteKit


class Goalkeeper: SKSpriteNode {
    
    var goal: GoalToGoalkeeper!
    
    init(goal: GoalToGoalkeeper) {
        let texture = SKTexture(imageNamed: Images.Player.frame3.rawValue)
        super.init(texture: texture, color: .black, size: texture.size())
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.setScale(0.7)
        self.goal = goal
        setUp()
    }
    
    func setUp() {
        let left = -self.goal.goalFrame.size.width*0.4
        let right = -self.goal.goalFrame.size.width*0.2
        
        self.run(moveLeftRightAction(left: left, right: right, duration: 1.5))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


func moveLeftRightAction(left: CGFloat, right: CGFloat, duration: Double) -> SKAction {
    let runLeft = SKAction.moveTo(x: left, duration: duration)
    let runRight = SKAction.moveTo(x: right, duration: duration)
    let sequence = SKAction.sequence([runRight, runLeft])
    
    return SKAction.repeatForever(sequence)
}
