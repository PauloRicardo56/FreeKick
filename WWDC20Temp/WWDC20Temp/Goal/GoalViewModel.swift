import Foundation
import SpriteKit


class GoalViewModel {
    
    var goal: SKSpriteNode!
    var goalHeight: CGFloat!
    var goalWidth: CGFloat! { return goalHeight*3 }
    
    
    init(goalHeight: CGFloat) {
        self.goalHeight = goalHeight
    }
}
