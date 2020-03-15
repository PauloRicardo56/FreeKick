import Foundation
import SpriteKit


protocol GoalGameSceneProtocol {
    
    //Temp
    var getGoal: SKSpriteNode { get }
    
    func loadGoal() -> SKSpriteNode
}


extension GoalViewModel: GoalGameSceneProtocol {
    
    var getGoal: SKSpriteNode {
        get { return goal }
    }
    
    
    func loadGoal() -> SKSpriteNode {
        
        goal = SKSpriteNode(color: .white, size: CGSize(width: goalWidth, height: goalHeight))
        goal.anchorPoint = CGPoint(x: 0.5, y: 0)
        return goal
    }
}
