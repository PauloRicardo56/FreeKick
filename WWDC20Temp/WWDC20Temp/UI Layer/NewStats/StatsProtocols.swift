import SpriteKit


protocol NewStatsToBall {
    var getValue: Int { get }
    
    var contact: Bool { get }
}

protocol StatsToShootButton: class {
    /// Fade out duration
    var getDuration: TimeInterval { get }
    
    func fadeOutAnimation() -> SKAction
    
    func stopSlider()
}

protocol NewStatsToDirection {
    var width: CGFloat { get }
    
    func moveGreenBar(isLeft: Bool)
}
