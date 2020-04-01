enum Assets {
    enum Player: String, CaseIterable {
        case frame1 = "frame-1"
        case frame2 = "frame-2"
        case frame3 = "frame-3"
        case frame4 = "frame-4"
        case frame5 = "frame-5"
        case frame6 = "frame-6"
        case frame7 = "frame-7"
        case frame8 = "frame-8"
        case frame9 = "frame-9"
        case frame10 = "frame-10"
        case frame11 = "frame-11"
        case frame12 = "frame-12"
    }
    
    enum Gk {
        enum Stay: String, CaseIterable {
            case frame1 = "gkStay-1"
            case frame2 = "gkStay-2"
            case frame3 = "gkStay-3"
        }
        
        enum Jump: String, CaseIterable {
            case frame1 = "gkJump-1"
            case frame2 = "gkJump-2"
            case frame3 = "gkJump-3"
            case frame4 = "gkJump-4"
            case frame5 = "gkJump-5"
            case frame6 = "gkJump-6"
            case frame7 = "gkJump-7"
        }
        
        enum Fall: String, CaseIterable {
            case frame1 = "gkFall-1"
            case frame2 = "gkFall-2"
            case frame3 = "gkFall-3"
            case frame4 = "gkFall-4"
        }
    }
    
    enum Background: String, CaseIterable {
        case frame0 = "background-1"
        case frame1 = "background-2"
        case frame2 = "background-3"
        case frame3 = "background-4"
        case frame4 = "background-5"
        case frame5 = "background-6"
        case frame6 = "background-7"
        case frame7 = "background-8"
        case frame8 = "background-9"
        case frame9 = "background-10"
    }
    
    enum Ball: String, CaseIterable {
        case frame0 = "ballFrame-5"
        case frame1 = "ballFrame-2"
        case frame2 = "ballFrame-3"
        case frame3 = "ballFrame-4"
        case frame4 = "ballFrame-1"
    }
    
    enum Stat {
        enum StatIndicators {
            case str
            case eff

            var point: Points.NewStatsPoints.StatsAnimation {
                switch self {
                case .str:
                    return Points.NewStatsPoints.StatsAnimation.strength
                default:
                    return Points.NewStatsPoints.StatsAnimation.effect
                }
            }

            func indicator() -> String {
                switch self {
                    case .str: return "strIndicador"
                    default: return "effIndicador"
                }
            }
        }
        
        enum StatBar {
            static let blackBar = "blackBar"
            static let greenBar = "greenBar"
        }
    }
    
    enum HUD {
        enum Shoot {
            static let str = "strShoot"
            static let eff = "effShoot"
            static let pressed = "shootButtonPress"
        }
        
        enum Direction {
            enum Left {
                static let normal = "leftButton"
                static let pressed = "leftButtonPress"
            }
            
            enum Right {
                static let normal = "rightButton"
                static let pressed = "rightButtonPress"
            }
        }
    }
}
