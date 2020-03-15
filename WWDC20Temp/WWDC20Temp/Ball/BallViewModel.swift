import Foundation
import SpriteKit


class BallViewModel {
    
    var goal: GoalBallProtocol!
    var ball: SKSpriteNode!
    
    
    init(goal: GoalBallProtocol) {
        self.goal = goal
    }
}
