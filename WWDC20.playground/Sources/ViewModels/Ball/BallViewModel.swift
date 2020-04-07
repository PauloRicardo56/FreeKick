import SpriteKit


class BallViewModel {
    var ball: SKSpriteNode!
    var goalPoint: CGPoint!
    let frames = Assets.Ball.allCases
    // MARK: Delegates
    var goal: GoalToBall!
    var stats: [String: NewStatsToBall] = [:]
    var background: BackgroundToBall!
    var goalkeeper: GoalkeeperToBall!
    var placar: PlacarToBall!
    var label: LabelToBall!
    var gameScene: GameSceneToBall!
    
    init(goal: GoalToBall) {
        self.goal = goal
    }
}

// MARK: - BallToGameScene
extension BallViewModel: BallToGameScene {
    var setBallNewStats: [String: NewStatsToBall] {
        get { return stats }
        set { stats = newValue }
    }
    var setBackground: BackgroundToBall {
        get { return background }
        set { background = newValue }
    }
    var setGoalkeeper: GoalkeeperToBall! {
        get { return goalkeeper }
        set { goalkeeper = newValue }
    }
    var setLabel: LabelToBall! {
        get { return label }
        set { label = newValue }
    }
    var setGameScene: GameSceneToBall {
        get { return gameScene }
        set { gameScene = newValue }
    }
    
    
    func loadBall() -> SKSpriteNode {
        ball = SKSpriteNode(imageNamed: Assets.Ball.frame4.rawValue)
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        return ball
    }
}

// MARK: - BallToPlayer
extension BallViewModel: BallToPlayer {
    func shootBall() -> SKAction {
        var isGoal = false
        var defense = false
        
        let shootBall = SKAction.run {
            let goalPointsConstant = Points.GoalsPoints.self
            let path: CGMutablePath
            
            if self.background.getCurrPosition <= 4 {
                // MARK: Right goal
                if self.stats["str"]!.contact && self.stats["eff"]!.contact {
                    isGoal = true
                    path = self.makePath(constant: goalPointsConstant.ValidRight())
                } else {
                    // MARK: Right miss
                    let random = Int.random(in: 0...10)
                    if random < 5 {
                        // Outfield
                        path = self.makePath(constant: goalPointsConstant.InvalidRight())
                    } else {
                        // Defense
                        path = self.makePath(constant: goalPointsConstant.GkDefenseRight())
                        self.goalkeeper.jump(isLeft: false, ballPoint: self.goalPoint,
                                             fallPoint: self.goal.getGkFallRight())
                        defense = true
                    }
                }
            } else {
                // MARK: Left goal
                if self.stats["str"]!.contact && self.stats["eff"]!.contact {
                    isGoal = true
                    path = self.makePath(constant: goalPointsConstant.ValidLeft())
                } else {
                    // MARK: Left miss
                    let random = Int.random(in: 0...10)
                    if random < 5 {
                        // Outfield
                        path = self.makePath(constant: goalPointsConstant.InvalidLeft())
                    } else {
                        // Defense
                        path = self.makePath(constant: goalPointsConstant.GkDefenseLeft())
                        self.goalkeeper.jump(isLeft: true, ballPoint: self.goalPoint,
                                             fallPoint: self.goal.getGkFallLeft())
                        defense = true
                    }
                }
            }
            
            let follow = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 400)
            follow.timingMode = .easeOut
            
            let completion1 = {
                self.ball.zPosition = 1
                self.placar.goal()
                self.ball.removeAllActions()
                let group = SKAction.group([self.fall(y: self.goal.getGoalY() + 10),
                                            .sequence([.wait(forDuration: 0.5),
                                                       .run { self.label.animate()
                                            }])
                ])
                self.ball.run(.sequence([group, .wait(forDuration: 1.5)]),
                              completion: { self.gameScene.restart() }
                )
                // MARK: FIM GOAL
            }
            let completion2 = {
                self.placar.miss()
                self.ball.removeAction(forKey: "scale")
                if defense {
                    self.ball.run(.run({ self.ball.removeFromParent() }),
                                  completion: { self.gameScene.restart() })
                } else {
                    self.ball.run(SKAction.scale(to: 0.1, duration: 2),
                                  completion: { self.gameScene.restart() })
                }
                // MARK: FIM NO GOAL
            }
            
            if isGoal {
                self.ball.run(.sequence([.wait(forDuration: 0.8), .run { self.goal.animate() }]))
                self.ball.run(follow, completion: completion1)
            } else {
                self.ball.run(follow, completion: completion2)
            }
            
            self.ball.run(SKAction.animate(with: self.makeTextures(), timePerFrame: 0.1))
            self.ball.run(SKAction.scale(to: 0.1, duration: 1.5), withKey: "scale")
        }
        
        return shootBall
    }
    
    func fall(y: CGFloat) -> SKAction {
        let ballHeight = self.ball.size.height
        let speed = 0.8
        let frames = [
            SKTexture(imageNamed: Assets.Ball.frame2.rawValue),
            SKTexture(imageNamed: Assets.Ball.frame3.rawValue)
        ]
        let frame1 = SKAction.animate(with: [frames[0]], timePerFrame: 0)
        let frame2 = SKAction.animate(with: [frames[1]], timePerFrame: 0)
        
        let fall1 = SKAction.moveTo(y: y, duration: speed)
        fall1.timingMode = .easeIn
        let up1 = SKAction.moveTo(y: y + ballHeight*2, duration: speed)
        up1.timingMode = .easeOut
        let fall2 = SKAction.moveTo(y: y, duration: speed)
        fall2.timingMode = .easeIn
        let up2 = SKAction.moveTo(y: y + ballHeight*0.7, duration: speed*0.5)
        up2.timingMode = .easeOut
        let fall3 = SKAction.moveTo(y: y, duration: speed*0.7)
        fall3.timingMode = .easeIn
        
        return SKAction.sequence([fall1, frame1, up1, fall2, frame2, up2, fall3])
    }
    
    func getBallPosition() -> CGPoint {
        return ball.position
    }
    
    func makePath(constant: GoalPointsProtocol) -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: getBallPosition())
        
        goalPoint = goal.getGoalPoint(side: constant)
        let controlPoint = (goalPoint | getBallPosition())
        
        path.addQuadCurve(to: goalPoint, control: constant.control(controlPoint: controlPoint))
        
        return path
    }
    
    func makeTextures() -> [SKTexture] {
        var textures: [SKTexture] = []
        
        for _ in 0...6 {
            for texture in frames {
                textures.append(SKTexture(imageNamed: texture.rawValue))
            }
        }
            
        
        return textures
    }
}
