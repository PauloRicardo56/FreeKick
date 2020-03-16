import Foundation
import SpriteKit


class BallViewModel {
    
    var goal: GoalBallProtocol!
    var ball: SKSpriteNode!
    var stats: StatsBallProtocol!
    
    
    init(goal: GoalBallProtocol) {
        self.goal = goal
    }
}
