import Foundation
import SpriteKit


class BallViewModel {
    
    var goal: GoalToBall!
    var ball: SKSpriteNode!
    var stats = [String:NewStatsToBall]()
    
    
    init(goal: GoalToBall) {
        self.goal = goal
    }
}


extension BallViewModel: BallToGameScene {
    
    
    var setBallNewStats: [String:NewStatsToBall] {
        get { return stats }
        set { stats = newValue }
    }
    
//    var setBallStats: StatsToBall {
//        get { return stats }
//        set { stats = newValue }
//    }
    
    
    func loadBall() -> SKSpriteNode {
        
        ball = SKSpriteNode(color: .blue, size: CGSize(width: 15, height: 15))
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return ball
    }
}


extension BallViewModel: BallToPlayer {
    
    func shootBall() -> SKAction {
        
        let strValue = self.stats["str"]!.getValue
        let effValue = self.stats["eff"]!.getValue
        var goalPoint: CGPoint!
        var isGoal = false
        
        let shootBall = SKAction.run {
            
            let path = CGMutablePath()
            path.move(to: self.getBallPosition())
            
            if effValue <= strValue {
                
                if effValue >= 12 && strValue <= 35 {
                    // Right Goal
                    isGoal = true
                    goalPoint = self.goal.getGoalPoint(side: Points.GoalsPoints.ValidRight())
                    let controlPoint = (goalPoint | self.getBallPosition())
                    path.addQuadCurve(to: goalPoint, control: (controlPoint ↖︎ 50) | (controlPoint ↑ 170))
                    
                } else if effValue >= 81 && strValue >= 89 {
                    // Left Goal
                    isGoal = true
                    goalPoint = self.goal.getGoalPoint(side: Points.GoalsPoints.ValidLeft())
                    let controlPoint = (goalPoint | self.getBallPosition())
                    path.addQuadCurve(to: goalPoint, control: (controlPoint ↙︎ 100) | (controlPoint ← 100))
                    
                } else {
                    // Left miss
                    goalPoint = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidLeft())
                    let controlPoint = (goalPoint | self.getBallPosition())
                    path.addQuadCurve(to: goalPoint, control: (controlPoint + 100) | (controlPoint ↑ 500))
                    
                }
            } else {
                // Right miss
                goalPoint = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidRight())
                let controlPoint = (goalPoint | self.getBallPosition())
                path.addQuadCurve(to: goalPoint, control: (controlPoint ↑ 300) | (controlPoint ← 300))
            }
            // Right Goal
            // ↖︎(>=50) <= ↑(<=170)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ↖︎ 170) | (controlPoint ↑ 170))
            
            // Left Goal
            // ↙︎(<=100) <= ←(<=200)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ↙︎ 100) | (controlPoint ← 100))
            
            // Left miss
            // +(100) ↑(500)
            //path.addQuadCurve(to: goalPos, control: (controlPoint + 100) | (controlPoint ↑ 500))
            
            // Right miss
            // ←(300) ↑(300)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ↑ 300) | (controlPoint ← 300))
            
            let follow = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 210)
            follow.timingMode = .easeOut
            
            if isGoal {
                
                let bottomGoal = CGPoint(x: goalPoint.x, y: self.goal.getGoalY())
                let fall = SKAction.move(to: bottomGoal, duration: 1.2)
                
                self.ball.run(SKAction.sequence([follow, fall]))
                
            } else { self.ball.run(follow) }
        }
        
        return shootBall
    }
    
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
}

