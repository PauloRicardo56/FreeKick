import Foundation
import SpriteKit


class NewStats: SKSpriteNode {
    
    var slideButton: SKSpriteNode!
    
    init(size: CGSize, statType: Points.NewStatsPoints, buttonSize: CGSize) {
        super.init(texture: nil, color: .black, size: size)
        
        slideButton = SKSpriteNode(color: statType.color, size: buttonSize)
        slideButton.position = CGPoint(x: self.frame.width*statType.multiplier, y: 0)
        
        self.isUserInteractionEnabled = true
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.addChild(slideButton)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
