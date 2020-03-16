import Foundation
import SpriteKit

extension Points.GoalsPoints {
    
    struct ValidRight: GoalPointsProtocol {
        
        var minX: CGFloat { get { return 0.35 } }
        var maxX: CGFloat { get { return 0.46 } }
        var minY: CGFloat { get { return 0.60 } }
        var maxY: CGFloat { get { return 0.88 } }
    }
    
    
    struct ValidLeft: GoalPointsProtocol {
        
        var minX: CGFloat { get { return -0.46 } }
        var maxX: CGFloat { get { return -0.44 } }
        var minY: CGFloat { get { return  0.58 } }
        var maxY: CGFloat { get { return  0.88 } }
    }
}
