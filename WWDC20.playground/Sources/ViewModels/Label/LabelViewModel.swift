import SpriteKit


class LabelViewModel: SKSpriteNode {
    let up: SKSpriteNode!
    let down: SKSpriteNode!
    let flash: SKSpriteNode!
    let ball: SKSpriteNode!
    var tLabel: SKTexture!
    
    init() {
        tLabel = .init(imageNamed: Assets.Label.up)
        up = .init(texture: tLabel, color: .black, size: tLabel.size())
        up.anchorPoint = .init(x: 0.5, y: 0.5)
        
        tLabel = .init(imageNamed: Assets.Label.down)
        down = .init(texture: tLabel, color: .black, size: tLabel.size())
        down.anchorPoint = .init(x: 0.5, y: 0.5)
        
        tLabel = .init(imageNamed: Assets.Label.flash)
        flash = .init(texture: tLabel, color: .black, size: tLabel.size())
        flash.anchorPoint = .init(x: 0.5, y: 0.5)
        flash.zPosition = 15
        flash.alpha = 0
        
        ball = SKSpriteNode(imageNamed: Assets.Ball.frame0.rawValue)
        ball.anchorPoint = .init(x: 0.5, y: 0.5)
        
        super.init(texture: nil, color: .init(red: 1, green: 1, blue: 1, alpha: 0.3), size: .init(width: 2000, height: 1600))
        anchorPoint = .init(x: 0.5, y: 0.5)
        setScale(1.3)
        alpha = 0
        
        flash.position = .init(x: -size.width*0.01, y: -size.height*0.005)
        ball.position.x = -size.width*0.12
        
        addChild(up)
        addChild(down)
        addChild(flash)
        addChild(ball)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -
extension LabelViewModel: LabelToBall {
    func animate() {
        var t: [SKTexture] = []
        let animation: SKAction
        let pointUp = SKAction.moveTo(y: self.size.height*0.1, duration: 0.5)
        let pointDown = SKAction.moveTo(y: -self.size.height*0.1, duration: 0.5)
        let pointZero = SKAction.moveTo(y: 0, duration: 0.5)
        
        let seq1 = SKAction.sequence([pointUp, pointDown, pointZero])
        let seq2 = SKAction.sequence([pointDown, pointUp, pointZero])
        
        let flash = SKAction.run {
            let flash1 = SKAction.run {
                self.flash.alpha = 1
            }
            let flash2 = SKAction.run {
                self.flash.alpha = 0
            }
            self.run(.sequence([flash1, .wait(forDuration: 0.1), flash2]))
        }
        
        let movement = SKAction.run {
            self.up.run(seq1)
            self.down.run(seq2, completion: {
                self.run(.sequence([flash, .wait(forDuration: 0.2), flash]))
            })
        }
        
        for textures in Assets.Ball.allCases {
            t.append(.init(imageNamed: textures.rawValue))
        }
        animation = .animate(with: t, timePerFrame: 0.15)
        
        ball.run(.scale(to: 4, duration: 1.3))
        ball.run(.repeat(animation, count: 15))
        self.run(.sequence([.fadeIn(withDuration: 0.3), movement, .wait(forDuration: 2), movement]))
    }
}
