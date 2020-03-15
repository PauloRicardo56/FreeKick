import Foundation
import SpriteKit


class PlayerViewModel {
    
    var ballViewModel: BallPlayerProtocol!
    var player: SKSpriteNode!
    
    
    init(ballVM: BallPlayerProtocol) {
        self.ballViewModel = ballVM
    }
}
