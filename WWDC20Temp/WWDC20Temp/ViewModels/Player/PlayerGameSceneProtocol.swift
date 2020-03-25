import Foundation
import SpriteKit


protocol PlayerGameSceneProtocol {
    
    func loadPlayer() -> SKSpriteNode
    
    func getPlayerFrame() -> CGRect
}


extension PlayerViewModel: PlayerGameSceneProtocol {
    
    func loadPlayer() -> SKSpriteNode {
        
        player = SKSpriteNode(imageNamed: "playerFrame1")
        player.anchorPoint = CGPoint(x: 0.5, y: 0)
        return player
    }
    
    
    func getPlayerFrame() -> CGRect {
        return player!.frame
    }
}
