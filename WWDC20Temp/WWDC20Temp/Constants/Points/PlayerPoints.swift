import Foundation
import SpriteKit


enum Points {
    enum PlayerPoints {
        
        case feet
        case thigh
        case knee

        
        func getPos(playerFrame: CGRect) -> CGPoint {

            var x: CGFloat
            var y: CGFloat
            
            switch self {
            case .feet:
                x = playerFrame.origin.x + (playerFrame.width*0.3)
                y = playerFrame.origin.y + (playerFrame.height*0.05)
                return CGPoint(x: x, y: y)
                
            case .thigh:
                x = playerFrame.origin.x + (playerFrame.width*0.5)
                y = playerFrame.origin.y + (playerFrame.height*0.3)
                return CGPoint(x: x, y: y)
                
            case .knee:
                x = playerFrame.origin.x + (playerFrame.width*0.3)
                y = playerFrame.origin.y + (playerFrame.height*0.1)
                return CGPoint(x: x, y: y)
            }
        }
    }
}
