import Foundation
import SpriteKit


protocol PlayerShootButtonProtocol {
    
    func runPlayer() -> SKAction
}


extension PlayerViewModel: PlayerShootButtonProtocol {
    
    func runPlayer() -> SKAction {
        let run = SKAction.run {
            
            let ballPosition = self.ballViewModel.getBallPosition()
            let run = SKAction.move(to: ballPosition, duration: self.playerSpeed)
            run.timingMode = .easeInEaseOut
            let group = SKAction.group([run, self.animate()])
            let freeKick = SKAction.sequence([group, self.ballViewModel.shootBall()])
            
            self.player.run(freeKick)
        }
        return run
    }
}
