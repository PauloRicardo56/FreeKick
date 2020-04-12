import SpriteKit


protocol Moveable {}

extension Moveable {
    func moveLeftRightAction(
        left: CGFloat, right: CGFloat, duration: Double
    ) -> SKAction {
        let runLeft = SKAction.moveTo(x: left, duration: duration)
        let runRight = SKAction.moveTo(x: right, duration: duration)
        let sequence = SKAction.sequence([runRight, runLeft])
        
        return .repeatForever(sequence)
    }
}
