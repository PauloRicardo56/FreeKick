import SpriteKit


protocol GoalPointsProtocol {
    var minX: CGFloat { get }
    var maxX: CGFloat { get }
    var minY: CGFloat { get }
    var maxY: CGFloat { get }
    
    func control(controlPoint: CGPoint) -> CGPoint
}
