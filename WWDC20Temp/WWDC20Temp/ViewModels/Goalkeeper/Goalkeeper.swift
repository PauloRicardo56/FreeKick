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
        runAction()
    }
    
    func runAction() {
        let left = -self.goal.goalFrame.size.width*0.4
        let right = -self.goal.goalFrame.size.width*0.12
        
        let runLeft = SKAction.moveTo(x: left, duration: 3)
        let runRight = SKAction.moveTo(x: right, duration: 3)
        let sequence = SKAction.sequence([runLeft, runRight])
        self.run(SKAction.repeatForever(sequence))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
