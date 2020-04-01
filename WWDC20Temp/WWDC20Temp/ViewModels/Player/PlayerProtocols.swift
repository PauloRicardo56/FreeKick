import SpriteKit


protocol PlayerToGameScene {
    var setGoalkeeper: GoalkeeperToPlayer! { get set }
    
    func loadPlayer() -> SKSpriteNode
    
    func getPlayerFrame() -> CGRect
}

protocol PlayerToShootButton {
    func runPlayer() -> SKAction
}
