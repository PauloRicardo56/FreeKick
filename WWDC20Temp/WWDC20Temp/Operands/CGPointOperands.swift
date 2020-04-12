import SpriteKit


infix operator ↖︎
infix operator ↑
infix operator ←
infix operator ↙︎

extension CGPoint {
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        let x = lhs.x - rhs.x
        let y = lhs.y - rhs.y
        
        return .init(x: x, y: y)
    }
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        let x = lhs.x + rhs.x
        let y = lhs.y + rhs.y
        
        return .init(x: x, y: y)
    }
    
    static func +(lhs: CGPoint, rhs: Int) -> CGPoint {
        let x = lhs.x + CGFloat(rhs)
        let y = lhs.y + CGFloat(rhs)
        
        return .init(x: x, y: y)
    }
    
    static func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        let x = lhs.x / rhs.x
        let y = lhs.y / rhs.y
        
        return .init(x: x, y: y)
    }
    
    static func /(lhs: CGPoint, rhs: Int) -> CGPoint {
        let x = lhs.x / CGFloat(rhs)
        let y = lhs.y / CGFloat(rhs)
        
        return .init(x: x, y: y)
    }
    
    static func ↖︎(lhs: CGPoint, rhs: Int) -> CGPoint {
        let x = lhs.x - CGFloat(rhs)
        let y = lhs.y + CGFloat(rhs)
        
        return .init(x: x, y: y)
    }
    
    static func ↑(lhs: CGPoint, rhs: Int) -> CGPoint {
        let y = lhs.y + CGFloat(rhs)
        
        return .init(x: lhs.x, y: y)
    }
    
    static func ←(lhs: CGPoint, rhs: Int) -> CGPoint {
        let x = lhs.x - CGFloat(rhs)
        
        return .init(x: x, y: lhs.y)
    }
    
    static func ↙︎(lhs: CGPoint, rhs: Int) -> CGPoint {
        let x = lhs.x - CGFloat(rhs)
        let y = lhs.y - CGFloat(rhs)
        
        return .init(x: x, y: y)
    }
    
    /// Get the mid point of two vectors.
    static func |(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return rhs + ((lhs - rhs) / 2)
    }
}
