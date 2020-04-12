import SpriteKit


protocol GoalkeeperToBackground {
    func resetAnimation()
}

protocol GoalkeeperToBall {
    func jump(isLeft: Bool, ballPoint: CGPoint, fallPoint: CGPoint)
}
