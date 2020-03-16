import Foundation
import SpriteKit


protocol GoalBallProtocol {
    
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint
}


extension GoalViewModel: GoalBallProtocol {
    
    func getGoalPoint(side: GoalPointsProtocol) -> CGPoint {
        
        let minX = goal.position.x + goalWidth*side.minX
        let maxX = goal.position.x + goalWidth*side.maxX
        let minY = goal.position.y + goalHeight*side.minY
        let maxY = goal.position.y + goalHeight*side.maxY
        
        let randomX = Int.random(in: Int(minX)...Int(maxX))
        let randomY = Int.random(in: Int(minY)...Int(maxY))
        
        return CGPoint(x: randomX, y: randomY)
    }
}
