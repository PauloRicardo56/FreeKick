import Foundation
import SpriteKit


class NewStats: SKSpriteNode {
    
    var slideButton: SKSpriteNode!
    var fadeOutDuration: TimeInterval = 1.2
    
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
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point = touches.first?.location(in: self)
        let newPos = point!.x
        if newPos <= self.frame.width && newPos >= 0 {
            self.slideButton.position.x = newPos
        }
        
        print(Int(self.slideButton.position.x/self.size.width*100))
    }
}


extension NewStats: NewStatsToBall {
    
    var getValue: Int {
        get { return Int(self.slideButton.position.x/self.size.width*100) }
    }
}


extension NewStats: StatsToShootButton {
    
    var getDuration: TimeInterval {
        get { fadeOutDuration }
    }
    
    func fadeOutAnimation() -> SKAction {
        return SKAction.run {
            self.run(SKAction.fadeOut(withDuration: self.fadeOutDuration))
        }
    }
}
