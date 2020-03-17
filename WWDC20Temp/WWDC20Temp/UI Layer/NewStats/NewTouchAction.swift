import Foundation
import SpriteKit


extension NewStats {
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point = touches.first?.location(in: self)
        let newPos = point!.x
        if newPos <= self.frame.width && newPos >= 0 {
            self.slideButton.position.x = newPos
        }
    }
}
