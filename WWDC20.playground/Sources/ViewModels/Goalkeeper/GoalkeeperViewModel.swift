import SpriteKit


class Goalkeeper: SKSpriteNode, Moveable {
    var goal: GoalToGoalkeeper!
    
    init(goal: GoalToGoalkeeper) {
        let texture = SKTexture(imageNamed: Assets.Gk.Stay.frame1.rawValue)
        super.init(texture: texture, color: .black, size: texture.size())
        
        anchorPoint = CGPoint(x: 0.5, y: 0.65)
        self.goal = goal
        
        stayAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stayAnimation() {
        var textures: [SKTexture] = []
        
        for t in Assets.Gk.Stay.allCases {
            textures.append(SKTexture(imageNamed: t.rawValue))
        }
        textures.append(SKTexture(imageNamed: Assets.Gk.Stay.frame2.rawValue))
        
        let animation = SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.3, resize: true, restore: false))
        run(animation)
    }
}

// MARK: - GoalkeeperToBackground
extension Goalkeeper: GoalkeeperToBackground {
    func resetAnimation() {
        position.x = -goal.size.width*0.2 + goal.position.x
        
//        setUp()
    }
}

// MARK: - GoalkeeperToPlayer
extension Goalkeeper: GoalkeeperToPlayer {
//    func stop() -> SKAction {
//        return SKAction.run {
//            self.removeAllActions()
//        }
//    }
}

// MARK: - GoalkeeperToBall
extension Goalkeeper: GoalkeeperToBall {
    func jump(isLeft: Bool, ballPoint: CGPoint, fallPoint: CGPoint) {
        var tJump: [SKTexture] = []
        var tFall: [SKTexture] = []
        var sequenceJump: SKAction
        var sequenceFall: SKAction
        let moveJump = SKAction.move(to: ballPoint, duration: 0.5)
        let moveFall = SKAction.move(to: fallPoint, duration: 1)
        
        if !isLeft {
            self.xScale = self.xScale * -1
        }
        
        removeAllActions()
        
        moveJump.timingMode = .easeInEaseOut
        for t in Assets.Gk.Jump.allCases {
            tJump.append(SKTexture(imageNamed: t.rawValue))
        }
        sequenceJump = .group([moveJump, .animate(with: tJump, timePerFrame: 0.1,
                                                  resize: true, restore: false)]
        )
        
        moveFall.timingMode = .easeIn
        for t in Assets.Gk.Fall.allCases {
            tFall.append(SKTexture(imageNamed: t.rawValue))
        }
        sequenceFall = .group([moveFall, .animate(with: tFall, timePerFrame: 0.3,
                                                  resize: true, restore: false)]
        )
        
        run(.sequence([sequenceJump, sequenceFall]))
    }
}
