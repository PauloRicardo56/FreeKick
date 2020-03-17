import Foundation
import SpriteKit


extension ShootButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let interval = SKAction.wait(forDuration: stats.getDuration)
        let freeKick = SKAction.sequence([
            
            stats.fadeOutAnimation(),
            interval,
            player!.runPlayer()
        ])
        self.run(freeKick)
    }
    
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        let point = touches.first?.location(in: self)
//        self.position.x = point!.x*0.1 + self.position.x
//    }
}
