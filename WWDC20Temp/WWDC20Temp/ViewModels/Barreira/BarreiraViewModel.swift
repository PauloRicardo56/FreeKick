import SpriteKit


class BarreiraViewModel: SKSpriteNode {
    func move(isLeft: Bool) {
        position.x += isLeft ? 70 : -70
    }
}
