import SpriteKit


protocol NewStatsToBall {
    
    var getValue: Int { get }
}


protocol StatsToShootButton: class {
    
    var getDuration: TimeInterval { get }
    
    func fadeOutAnimation() -> SKAction
}
