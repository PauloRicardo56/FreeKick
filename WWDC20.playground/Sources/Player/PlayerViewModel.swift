import Foundation
import SpriteKit


class PlayerViewModel: PlayerViewModelProtocol {
    
    var scene: GameScene!
    var ballViewModel: BallViewModelProtocol!
    var player: SKSpriteNode!
    
    init(ballVM: BallViewModelProtocol, scene: GameScene) {
        self.ballViewModel = ballVM
        self.scene = scene
    }
    
    
    func loadPlayer() {
        
        player = SKSpriteNode(color: .blue, size: CGSize(width: 30, height: 110))
        player.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        scene.showPlayer(playerNode: player!)
    }
    
    
    func runPlayer() {
        
        let ballPosition = ballViewModel.getBallPosition()
        let run = SKAction.move(to: ballPosition, duration: 1.5)
        player!.run(run)
    }
}


protocol PlayerViewModelProtocol {
    
    func loadPlayer()
    
    
    func runPlayer()
}
