import Foundation
import SpriteKit


protocol BallPlayerProtocol {
    
    func shootBall() -> SKAction
    
    func getBallPosition() -> CGPoint
}


extension BallViewModel: BallPlayerProtocol {
    
    func shootBall() -> SKAction {
        
        let shootBall = SKAction.run {
            
            let goalPos = self.goal.getGoalPoint(side: Points.GoalsPoints.InvalidLeft())
            let controlPoint = (goalPos | self.getBallPosition())
            let path = CGMutablePath()
            
            path.move(to: self.getBallPosition())
            // Right Goal
            // ↑(<=170) >= ↖︎(>=50)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ↑ 200) | (controlPoint ↖︎ 170))
            
            // Left Goal
            // ←(<=200) >= ↑(<=130)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ← 200) | (controlPoint ↑ 130))
            
            // Left miss
            // ←(0) ↑(<=400)
            path.addQuadCurve(to: goalPos, control: (controlPoint ← 0) | (controlPoint ↑ 400))
            
            // Right miss
            // ←(300) ↑(300)
            //path.addQuadCurve(to: goalPos, control: (controlPoint ↑ 300) | (controlPoint ← 300))
            
            let follow = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 250)
            follow.timingMode = .easeOut
            
            self.ball.run(follow)
        }
        return shootBall
    }
    
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
}
