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
        goal = SKSpriteNode(imageNamed: "goal")
        goal.setScale(1.85)
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
        return goal.position.y + goal.position.y * 0.02
    }
}

// MARK: - GoalToGoalkeeper
extension GoalViewModel: GoalToGoalkeeper {
    var size: CGSize {
        return goal.frame.size
    }
    var position: CGPoint {
        return goal.position
    }
}

// MARK: GoalToBackground
extension GoalViewModel: GoalToBackground {
    func move(isLeft: Bool) {
        goal.position.x += isLeft ? 70 : -70
    }
}
