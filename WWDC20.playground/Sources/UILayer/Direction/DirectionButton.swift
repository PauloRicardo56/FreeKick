import SpriteKit


class DirectionButton: SKSpriteNode {
    let isLeft: Bool!
    let background: BackgroundToDirection!
    let images = Assets.HUD.Direction.self
    // MARK: Delegates
    var newStats: [NewStatsToDirection]!
    
    init(isLeft: Bool, background: BackgroundToDirection) {
        let texture = SKTexture(imageNamed: isLeft ? images.Left.normal : images.Right.normal)
        self.isLeft = isLeft
        self.background = background
        super.init(texture: texture, color: .black, size: texture.size())
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pressAnimation()
        background.changePosition(leftSide: isLeft)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        releaseAnimation()
    }
    
    func pressAnimation() {
        let release = SKTexture(imageNamed: self.isLeft ? self.images.Left.pressed : self.images.Right.pressed)
        run(.animate(with: [release], timePerFrame: 0, resize: true, restore: false))
    }
    
    func releaseAnimation() {
        let release = SKTexture(imageNamed: self.isLeft ? self.images.Left.normal : self.images.Right.normal)
        run(.animate(with: [release], timePerFrame: 0, resize: true, restore: false))
    }
}

// MARK: - DirectionToShoot
extension DirectionButton: DirectionToShoot {
    func deactivate() {
        isUserInteractionEnabled = false
        alpha = 0.3
    }
}
