import Foundation
import SpriteKit


class PlayerViewModel {
    
    var ballViewModel: BallToPlayer!
    var player: SKSpriteNode!
    let playerSpeed = 1.5
    
    
    init(ballVM: BallToPlayer) {
        self.ballViewModel = ballVM
    }
    
    
    func animate() -> SKAction {
        
        let frames = Images.Player.allCases
        var textures = [SKTexture]()
        
        for frame in frames {
            textures.append(SKTexture(imageNamed: frame.rawValue))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: playerSpeed/Double(frames.count))
        return action
    }
}


extension PlayerViewModel: PlayerToGameScene {
    
    func loadPlayer() -> SKSpriteNode {
        
        player = SKSpriteNode(imageNamed: "playerFrame1")
        player.anchorPoint = CGPoint(x: 0.5, y: 0)
        return player
    }
    
    
    func getPlayerFrame() -> CGRect {
        return player!.frame
    }
}


extension PlayerViewModel: PlayerToShootButton {
    
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
