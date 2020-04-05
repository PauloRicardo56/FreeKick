import SpriteKit


protocol GoalkeeperToBackground {
    func resetAnimation()
}

protocol GoalkeeperToPlayer {
//    func stop() -> SKAction
}

protocol GoalkeeperToBall {
    func jump(isLeft: Bool, ballPoint: CGPoint, fallPoint: CGPoint)
}
