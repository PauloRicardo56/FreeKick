enum Assets {
    static let placar = "placar/placar"
    static let barreira = "barreira/barreira"
    
    enum Player: String, CaseIterable {
        case frame1 = "player/frame-1"
        case frame2 = "player/frame-2.png"
        case frame3 = "player/frame-3.png"
        case frame4 = "player/frame-4.png"
        case frame5 = "player/frame-5.png"
        case frame6 = "player/frame-6.png"
        case frame7 = "player/frame-7.png"
        case frame8 = "player/frame-8.png"
        case frame9 = "player/frame-9.png"
        case frame10 = "player/frame-10.png"
        case frame11 = "player/frame-11.png"
        case frame12 = "player/frame-12.png"
    }
    
    enum Goal: String, CaseIterable {
        case frame1 = "goal/goalFrame-1"
        case frame2 = "goal/goalFrame-2"
        case frame3 = "goal/goalFrame-3"
        case frame4 = "goal/goalFrame-4"
    }
    
    enum Gk {
        enum Stay: String, CaseIterable {
            case frame1 = "goalkeeper/stay/gkStay-1"
            case frame2 = "goalkeeper/stay/gkStay-2"
            case frame3 = "goalkeeper/stay/gkStay-3"
        }
        
        enum Jump: String, CaseIterable {
            case frame1 = "goalkeeper/jump/gkJump-1"
            case frame2 = "goalkeeper/jump/gkJump-2"
            case frame3 = "goalkeeper/jump/gkJump-3"
            case frame4 = "goalkeeper/jump/gkJump-4"
            case frame5 = "goalkeeper/jump/gkJump-5"
            case frame6 = "goalkeeper/jump/gkJump-6"
            case frame7 = "goalkeeper/jump/gkJump-7"
        }
        
        enum Fall: String, CaseIterable {
            case frame1 = "goalkeeper/fall/gkFall-1"
            case frame2 = "goalkeeper/fall/gkFall-2"
            case frame3 = "goalkeeper/fall/gkFall-3"
            case frame4 = "goalkeeper/fall/gkFall-4"
        }
    }
    
    enum Background: String, CaseIterable {
        case frame0 = "background/background-1"
        case frame1 = "background/background-2"
        case frame2 = "background/background-3"
        case frame3 = "background/background-4"
        case frame4 = "background/background-5"
        case frame5 = "background/background-6"
        case frame6 = "background/background-7"
        case frame7 = "background/background-8"
        case frame8 = "background/background-9"
        case frame9 = "background/background-10"
    }
    
    enum Ball: String, CaseIterable {
        case frame0 = "ball/ballFrame-5"
        case frame1 = "ball/ballFrame-2"
        case frame2 = "ball/ballFrame-3"
        case frame3 = "ball/ballFrame-4"
        case frame4 = "ball/ballFrame-1"
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
                    case .str: return "stats/strIndicador"
                    default: return "stats/effIndicador"
                }
            }
        }
        
        enum StatBar {
            static let blackBar = "stats/blackBar"
            static let greenBar = "stats/greenBar"
        }
    }
    
    enum HUD {
        enum Shoot {
            static let str = "hud/strShoot"
            static let eff = "hud/effShoot"
            static let pressed = "hud/shootButtonPress"
        }
        
        enum Direction {
            enum Left {
                static let normal = "hud/leftButton"
                static let pressed = "hud/leftButtonPress"
            }
            
            enum Right {
                static let normal = "hud/rightButton"
                static let pressed = "hud/rightButtonPress"
            }
        }
    }
    
    enum Label {
        static let up = "label/goalLabel-1"
        static let down = "label/goalLabel-2"
        static let flash = "label/labelFlash"
    }
}
