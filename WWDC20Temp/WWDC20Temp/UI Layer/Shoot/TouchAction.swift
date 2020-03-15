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
}
