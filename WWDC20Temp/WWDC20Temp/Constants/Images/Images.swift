enum Images {
    enum Player: String, CaseIterable {
        case frame1 = "frame1"
        case frame2 = "frame2"
        case frame3 = "frame3"
        case frame4 = "frame4"
        case frame5 = "frame5"
        case frame6 = "frame6"
        case frame7 = "frame7"
        case frame8 = "frame8"
        case frame9 = "frame9"
        case frame10 = "frame10"
        case frame11 = "frame11"
        case frame12 = "frame12"
    }
    
    enum Background: String, CaseIterable {
        case frame0 = "background1"
        case frame1 = "background2"
        case frame2 = "background3"
        case frame3 = "background4"
        case frame4 = "background5"
        case frame5 = "background6"
        case frame6 = "background7"
        case frame7 = "background8"
        case frame8 = "background9"
        case frame9 = "background10"
    }
    
    enum Ball: String, CaseIterable {
        case frame0 = "ballFrame5"
        case frame1 = "ballFrame2"
        case frame2 = "ballFrame3"
        case frame3 = "ballFrame4"
        case frame4 = "ballFrame1"
    }
    
    enum Stat {
        enum StatIndicator {
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
                    case .eff: return "effIndicador"
                }
            }
        }
        
        enum StatBar {
            static let blackBar = "blackBar"
            static let greenBar = "greenBar"
        }
    }
}
