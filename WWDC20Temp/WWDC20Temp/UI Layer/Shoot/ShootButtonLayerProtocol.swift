import Foundation


protocol ShootButtonLayerProtocol {
    
    var setStats: StatsShootButtonProtocol! { get set }
    
    var setPlayer: PlayerShootButtonProtocol! { get set }
}


extension ShootButton: ShootButtonLayerProtocol {
    
    var setStats: StatsShootButtonProtocol! {
        get { return stats }
        set { stats = newValue }
    }
    
    var setPlayer: PlayerShootButtonProtocol! {
        get { return player }
        set { player = newValue }
    }
}
