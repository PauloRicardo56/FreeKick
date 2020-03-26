import Foundation
import SpriteKit


class NewStats: SKSpriteNode {
    var slideButton: SKSpriteNode!
    var fadeOutDuration: TimeInterval = 1.2
    
    init(size: CGSize, statType: Points.NewStatsPoints, buttonSize: CGSize) {
        super.init(texture: nil, color: .black, size: size)
        
        slideButton = SKSpriteNode(color: statType.color, size: buttonSize)
        slideButton.position = .zero
        slideButton.run(moveLeftRightAction(left: 0, right: self.size.width, duration: statType.duration))
        
        self.isUserInteractionEnabled = true
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.addChild(slideButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NewStats: NewStatsToBall {
    var getValue: Int {
        return Int(self.slideButton.position.x/self.size.width*100)
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
    
    func stopSlider() {
        self.slideButton.removeAllActions()
    }
}
