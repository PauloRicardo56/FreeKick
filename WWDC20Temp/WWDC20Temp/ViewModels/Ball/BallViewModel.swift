import SpriteKit


class BallViewModel {
    var goal: GoalToBall!
    var ball: SKSpriteNode!
    var stats: [String: NewStatsToBall] = [:]
    var goalPoint: CGPoint!
    
    init(goal: GoalToBall) {
        self.goal = goal
    }
}

// MARK: - BallToGameScene
extension BallViewModel: BallToGameScene {
    var setBallNewStats: [String: NewStatsToBall] {
        get { return stats }
        set { stats = newValue }
    }
    
    func loadBall() -> SKSpriteNode {
        ball = SKSpriteNode(color: .blue, size: CGSize(width: 15, height: 15))
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        return ball
    }
}

// MARK: - BallToPlayer
extension BallViewModel: BallToPlayer {
    func shootBall() -> SKAction {
        let strValue = self.stats["str"]!.getValue
        let effValue = self.stats["eff"]!.getValue
        var isGoal = false
        
        let shootBall = SKAction.run {
            let goalPointsConstant = Points.GoalsPoints.self
            let path: CGMutablePath

            if effValue <= strValue {
                if effValue >= 12 && strValue <= 35 {
                    // MARK: Right Goal
                    isGoal = true
                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidRight())
                    path = self.makePath(constant: goalPointsConstant.ValidRight())
                    
                } else if effValue >= 81 && strValue >= 89 {
                    // MARK: Left Goal
                    isGoal = true
                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidLeft())
                    path = self.makePath(constant: goalPointsConstant.ValidLeft())
                    
                } else {
                    // MARK: Left miss
                    path = self.makePath(constant: goalPointsConstant.InvalidLeft())
                }
                
            } else {
                // MARK: Right miss
                path = self.makePath(constant: goalPointsConstant.ValidRight())
//                goalPoint = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidRight())
//                let controlPoint = (goalPoint | self.getBallPosition())
//                path.addQuadCurve(to: goalPoint, control: (controlPoint ↑ 300) | (controlPoint ← 300))
            }
            
            let follow = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 210)
            follow.timingMode = .easeOut
            
            if isGoal {
                let bottomGoal = CGPoint(x: self.goalPoint.x, y: self.goal.getGoalY())
                let fall = SKAction.move(to: bottomGoal, duration: 1.2)
                
                self.ball.run(SKAction.sequence([follow, fall]))
            } else { self.ball.run(follow) }
        }
        
        return shootBall
    }
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
    
    func makePath(constant: GoalPointsProtocol) -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: self.getBallPosition())
        
        goalPoint = self.goal.getGoalPoint(side: constant)
        let controlPoint = (goalPoint | self.getBallPosition())
        
        path.addQuadCurve(to: goalPoint, control: constant.control(controlPoint: controlPoint))
        
        return path
    }
}
