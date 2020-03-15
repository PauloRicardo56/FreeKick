import Foundation
import SpriteKit


protocol PlayerShootButtonProtocol {
    
    func runPlayer() -> SKAction
}


extension PlayerViewModel: PlayerShootButtonProtocol {
    
    func runPlayer() -> SKAction {
        let run = SKAction.run {
            
            let ballPosition = self.ballViewModel.getBallPosition()
            let run = SKAction.move(to: ballPosition, duration: 1.5)
            let freeKick = SKAction.sequence([run, self.ballViewModel.shootBall()])
            
            self.player.run(freeKick)
        }
        return run
    }
}
