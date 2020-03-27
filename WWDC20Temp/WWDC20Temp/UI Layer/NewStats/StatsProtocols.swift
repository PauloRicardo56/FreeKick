import SpriteKit


protocol NewStatsToBall {
    var getValue: Int { get }
}

protocol StatsToShootButton: class {
    /// Fade out duration
    var getDuration: TimeInterval { get }
    
    func fadeOutAnimation() -> SKAction
    
    func stopSlider()
}
