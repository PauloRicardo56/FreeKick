import SpriteKit


class GoalViewModel {
    var goal: SKSpriteNode!
    var goalHeight: CGFloat!
    var goalWidth: CGFloat! { return goalHeight*3 }
    
    init(goalHeight: CGFloat) {
        self.goalHeight = goalHeight
    }
}

// MARK: - GoalToGameScene
extension GoalViewModel: GoalToGameScene {
    var getGoal: SKSpriteNode {
        return goal
    }
    
    func loadGoal() -> SKSpriteNode {
        goal = SKSpriteNode(color: .white, size: CGSize(width: goalWidth, height: goalHeight))
        goal.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        return goal
    }
}

// MARK: - GoalToBall
extension GoalViewModel: GoalToBall {
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint {
        let minX = goal.position.x + goalWidth*side.minX
        let maxX = goal.position.x + goalWidth*side.maxX
        let minY = goal.position.y + goalHeight*side.minY
        let maxY = goal.position.y + goalHeight*side.maxY
        
        let randomX = Int.random(in: Int(minX)...Int(maxX))
        let randomY = Int.random(in: Int(minY)...Int(maxY))
        
        return CGPoint(x: randomX, y: randomY)
    }
    
    func getGoalY() -> CGFloat {
        return self.goal.position.y
    }
}

// MARK: - GoalToGoalkeeper
extension GoalViewModel: GoalToGoalkeeper {
    var goalFrame: CGRect {
        return self.goal.frame
    }
}
