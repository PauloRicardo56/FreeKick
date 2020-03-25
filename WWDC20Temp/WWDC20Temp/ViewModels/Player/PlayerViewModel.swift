import Foundation
import SpriteKit


class PlayerViewModel {
    
    var ballViewModel: BallPlayerProtocol!
    var player: SKSpriteNode!
    let playerSpeed = 1.5
    
    
    init(ballVM: BallPlayerProtocol) {
        self.ballViewModel = ballVM
    }
    
    
    func animate() -> SKAction {
        
        var textures = [SKTexture]()
        for i in 1...12 {
            textures.append(SKTexture(imageNamed: "playerFrame\(i)"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: playerSpeed/12)
        return action
    }
}
