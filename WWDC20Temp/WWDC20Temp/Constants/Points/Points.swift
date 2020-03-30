import SpriteKit


enum Points {
    // MARK: - Player points
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
    
    // MARK: - Goal points
    enum GoalsPoints {
        struct InvalidLeft: GoalPointsProtocol {
            var minX: CGFloat { return -0.75 }
            var maxX: CGFloat { return -0.53 }
            var minY: CGFloat { return  0.60 }
            var maxY: CGFloat { return  1.80 }
            
            func control(controlPoint: CGPoint) -> CGPoint {
                return (controlPoint + 100) | (controlPoint ↑ 500)
            }
        }
        
        struct InvalidRight: GoalPointsProtocol {
            var minX: CGFloat { return 0.30 }
            var maxX: CGFloat { return 0.80 }
            var minY: CGFloat { return 1.10 }
            var maxY: CGFloat { return 1.80 }
            
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
    
    // MARK: - Stats points
    enum NewStatsPoints {
        enum StatsAnimation {
            case strength, effect
            
            var duration: Double {
                get {
                    switch self {
                    case .strength: return 2
                    case .effect: return 1.3
                    }
                }
            }
        }
        
//        enum GreenBarPoints {
//            case position0, position1, position2, position3,
//            position4, position5, position6, position7,
//            position8, position9
//
//            var width: CGFloat {
//                switch self {
//                case .position0:
//                    <#code#>
//                case .position1:
//                    <#code#>
//                case .position2:
//                    <#code#>
//                case .position3:
//                    <#code#>
//                case .position4:
//                    <#code#>
//                case .position5:
//                    <#code#>
//                case .position6:
//                    <#code#>
//                case .position7:
//                    <#code#>
//                case .position8:
//                    <#code#>
//                case .position9:
//                    <#code#>
//                }
//            }
//        }
    }
}
