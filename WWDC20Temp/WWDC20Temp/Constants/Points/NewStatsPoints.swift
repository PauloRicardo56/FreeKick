import Foundation
import SpriteKit


extension Points {
    
    enum NewStatsPoints {
        
        case strength
        case effect
        
        var multiplier: CGFloat {
            get {
                switch self {
                case .strength: return 0.8
                case .effect: return 0.2
                }
            }
        }
        
        var color: UIColor {
            get {
                switch self {
                case .strength: return .red
                case .effect: return .green
                }
            }
        }
    }
}
