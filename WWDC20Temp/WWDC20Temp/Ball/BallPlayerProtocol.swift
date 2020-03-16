import Foundation
import SpriteKit


protocol BallPlayerProtocol {
    
    func shootBall() -> SKAction
    
    func getBallPosition() -> CGPoint
}


extension BallViewModel: BallPlayerProtocol {
    
    func shootBall() -> SKAction {
        
        let shootBall = SKAction.run {
            
            let path = CGMutablePath()
            path.move(to: self.getBallPosition())
            
            if self.stats.effectValue <= self.stats.strengthValue {
                
                if self.stats.effectValue >= 50 && self.stats.strengthValue <= 170 {
                    // Right Goal
                    let goalPos = self.goal.getGoalPoint(side: Points.GoalsPoints.ValidRight())
                    let controlPoint = (goalPos | self.getBallPosition())
                    path.addQuadCurve(to: goalPos, control: (controlPoint ↖︎ self.stats.effectValue) | (controlPoint ↑ self.stats.strengthValue))
                    
                } else if self.stats.effectValue <= 100 && self.stats.strengthValue <= 200 {
                    // Left Goal
                    let goalPos = self.goal.getGoalPoint(side: Points.GoalsPoints.ValidLeft())
                    let controlPoint = (goalPos | self.getBallPosition())
                    path.addQuadCurve(to: goalPos, control: (controlPoint ↙︎ self.stats.effectValue) | (controlPoint ← self.stats.strengthValue))
                    
                } else {
                    // Left miss
                    let goalPos = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidLeft())
                    let controlPoint = (goalPos | self.getBallPosition())
                    path.addQuadCurve(to: goalPos, control: (controlPoint + 100) | (controlPoint ↑ 500))
                    
                }
            } else {
                // Right miss
                let goalPos = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidRight())
                let controlPoint = (goalPos | self.getBallPosition())
                path.addQuadCurve(to: goalPos, control: (controlPoint ↑ 300) | (controlPoint ← 300))
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
            
            self.ball.run(follow)
        }
        return shootBall
    }
    
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
}
