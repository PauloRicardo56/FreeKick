import SpriteKit


class PlayerViewModel {
    var player: SKSpriteNode!
    let playerSpeed = 1.5
    // MARK: Delegates
    var ballViewModel: BallToPlayer!
    var goalkeeper: GoalkeeperToPlayer!
    
    init(ballVM: BallToPlayer) {
        ballViewModel = ballVM
    }
    
    func animate() -> SKAction {
        let frames = Assets.Player.allCases
        var textures = [SKTexture]()
        
        for frame in frames {
            textures.append(SKTexture(imageNamed: frame.rawValue))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: playerSpeed/Double(frames.count))
        
        return action
    }
}

// MARK: - PlayerToGameScene
extension PlayerViewModel: PlayerToGameScene {
    var setGoalkeeper: GoalkeeperToPlayer! {
        get { return goalkeeper }
        set { goalkeeper = newValue }
    }
    
    func loadPlayer() -> SKSpriteNode {
        player = SKSpriteNode(imageNamed: Assets.Player.frame1.rawValue)
        player.anchorPoint = CGPoint(x: 0.5, y: 0.05)
        
        return player
    }
    
    func getPlayerFrame() -> CGRect {
        return player!.frame
    }
}

// MARK: - PlayerToShootButton
extension PlayerViewModel: PlayerToShootButton {
    func runPlayer() -> SKAction {
        let run = SKAction.run {
            let ballPosition = self.ballViewModel.getBallPosition()
            let run = SKAction.move(to: ballPosition, duration: self.playerSpeed)
            
            run.timingMode = .easeInEaseOut
            
            let group = SKAction.group([run, self.animate()])
            let shoot = SKAction.sequence([.wait(forDuration: 1.1), self.ballViewModel.shootBall()])
            let freeKick = SKAction.group([group, shoot])
            
            self.player.run(freeKick)
        }
        
        return run
    }
}
