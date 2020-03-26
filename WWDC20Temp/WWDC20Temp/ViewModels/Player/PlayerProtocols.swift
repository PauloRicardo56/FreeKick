import SpriteKit


protocol PlayerToGameScene {
    
    func loadPlayer() -> SKSpriteNode
    
    func getPlayerFrame() -> CGRect
}


protocol PlayerToShootButton {
    
    func runPlayer() -> SKAction
}
