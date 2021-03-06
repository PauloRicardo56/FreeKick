protocol ShootButtonToStats {
    func turnActive()
    
    func turnInactive()
}

protocol ShootButtonToLayer {
    var setStats: [StatsToShootButton]! { get set }
    var setPlayer: PlayerToShootButton! { get set }
    var setDirection: [DirectionToShoot]! { get set }
}
