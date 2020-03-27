import SpriteKit


enum Points {
    //MARK: - Player points
    enum PlayerPoints {
        case feet, thigh, knee

        func getPos(playerFrame: CGRect) -> CGPoint {
            var x, y: CGFloat
            
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
    
    //MARK: - Goal points
    enum GoalsPoints {
        struct InvalidLeft: GoalPointsProtocol {
            var minX: CGFloat { return -0.75 }
            var maxX: CGFloat { return -0.53 }
            var minY: CGFloat { return  0.06 }
            var maxY: CGFloat { return  1.50 }
            
            func control(controlPoint: CGPoint) -> CGPoint {
                return (controlPoint + 100) | (controlPoint ↑ 500)
            }
        }
        
        struct InvalidRight: GoalPointsProtocol {
            var minX: CGFloat { return 0.00 }
            var maxX: CGFloat { return 0.48 }
            var minY: CGFloat { return 1.10 }
            var maxY: CGFloat { return 1.50 }
            
            func control(controlPoint: CGPoint) -> CGPoint {
                return (controlPoint ↑ 300) | (controlPoint ← 300)
            }
        }
        
        struct ValidRight: GoalPointsProtocol {
            var minX: CGFloat { return 0.35 }
            var maxX: CGFloat { return 0.46 }
            var minY: CGFloat { return 0.60 }
            var maxY: CGFloat { return 0.88 }
            
            func control(controlPoint: CGPoint) -> CGPoint {
                return (controlPoint ↖︎ 50) | (controlPoint ↑ 170)
            }
        }
        
        struct ValidLeft: GoalPointsProtocol {
            var minX: CGFloat { return -0.46 }
            var maxX: CGFloat { return -0.44 }
            var minY: CGFloat { return  0.58 }
            var maxY: CGFloat { return  0.88 }
            
            func control(controlPoint: CGPoint) -> CGPoint {
                return (controlPoint ↙︎ 100) | (controlPoint ← 100)
            }
        }
    }
    
    //MARK: - Stats points
    enum NewStatsPoints {
        case strength, effect
        
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
        var duration: Double {
            get {
                switch self {
                case .strength: return 2
                case .effect: return 1.3
                }
            }
        }
    }
}
