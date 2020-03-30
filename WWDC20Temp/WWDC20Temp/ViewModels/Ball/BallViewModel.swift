import SpriteKit


class BallViewModel {
    var ball: SKSpriteNode!
    var goalPoint: CGPoint!
    let frames = Images.Ball.allCases
    // MARK: Delegates
    var goal: GoalToBall!
    var stats: [String: NewStatsToBall] = [:]
    var background: BackgroundToBall!
    var gameVC: GameVCToBall!
    
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
    var setGameVC: GameVCToBall {
        get { return gameVC }
        set { gameVC = newValue }
    }
    
    func loadBall() -> SKSpriteNode {
        ball = SKSpriteNode(imageNamed: Images.Ball.frame4.rawValue)
        ball.setScale(1.8)
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        return ball
    }
}

// MARK: - BallToPlayer
extension BallViewModel: BallToPlayer {
    func shootBall() -> SKAction {
        var isGoal = false
        
        let shootBall = SKAction.run {
            let goalPointsConstant = Points.GoalsPoints.self
            let path: CGMutablePath
            
            if self.background.getCurrPosition <= 4 {
                // MARK: Right goal
                if self.stats["str"]!.contact && self.stats["eff"]!.contact {
                    isGoal = true
                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidRight())
                    path = self.makePath(constant: goalPointsConstant.ValidRight())
                } else {
                    // MARK: Right miss
                    path = self.makePath(constant: goalPointsConstant.ValidRight())
                }
            } else {
                // MARK: Left goal
                if self.stats["str"]!.contact && self.stats["eff"]!.contact {
                    isGoal = true
                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidLeft())
                    path = self.makePath(constant: goalPointsConstant.ValidLeft())
                } else {
                    // MARK: Left miss
                    path = self.makePath(constant: goalPointsConstant.InvalidLeft())
                }
            }

//            if effValue <= strValue {
//                if effValue >= 12 && strValue <= 35 {
//                    // MARK: Right Goal
//                    isGoal = true
//                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidRight())
//                    path = self.makePath(constant: goalPointsConstant.ValidRight())
//
//                } else if effValue >= 81 && strValue >= 89 {
//                    // MARK: Left Goal
//                    isGoal = true
//                    self.goalPoint = self.goal.getGoalPoint(side: goalPointsConstant.ValidLeft())
//                    path = self.makePath(constant: goalPointsConstant.ValidLeft())
//
//                } else {
//                    // MARK: Left miss
//                    path = self.makePath(constant: goalPointsConstant.InvalidLeft())
//                }
//
//            } else {
//                // MARK: Right miss
//                path = self.makePath(constant: goalPointsConstant.ValidRight())
//            }
            
            let follow = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 310)
            follow.timingMode = .easeOut
            
            let bottomGoal = CGPoint(x: self.goalPoint.x, y: self.goal.getGoalY())
            let fall = SKAction.move(to: bottomGoal, duration: 1.2)
            let completion1 = {
                self.ball.removeAllActions()
                self.ball.run(fall, completion: { self.gameVC.restart() })
                // MARK: FIM 1
            }
            let completion2 = {
                self.ball.removeAction(forKey: "scale")
                self.ball.run(SKAction.scale(to: 0.1, duration: 2), completion: { self.gameVC.restart() })
                // MARK: FIM 2
            }
            
            if isGoal {
                self.ball.run(follow, completion: completion1)
            } else {
                self.ball.run(follow, completion: completion2)
            }
            
            self.ball.run(SKAction.animate(with: self.makeTextures(), timePerFrame: 0.1))
            self.ball.run(SKAction.scale(to: 0.1, duration: 3), withKey: "scale")
        }
        
        return shootBall
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
