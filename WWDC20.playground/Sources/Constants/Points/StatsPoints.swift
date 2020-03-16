import Foundation
import SpriteKit


extension Points {
    enum StatsPoints {
        
        case strength
        case effect
        case knee
        
        
        func getPos(statusFrame: CGRect) -> CGPoint {
            
            let x: CGFloat
            let y: CGFloat = statusFrame.origin.y - statusFrame.size.height*0.5
            
            switch self {
            case .strength:
                x = statusFrame.origin.x
                return CGPoint(x: x, y: y)
            
            case .effect, .knee:
                x = statusFrame.origin.x + statusFrame.width
                return CGPoint(x: x, y: y)
            }
        }
    }
}
