import SpriteKit


class Background: SKSpriteNode {
    let frames = Assets.Background.allCases
    var currPosition = 2
    let totalPositions: Int!
    // MARK: Delegates
    let goal: GoalToBackground!
    let goalkeeper: GoalkeeperToBackground!
    var stats: [NewStatsToDirection]? = nil
    
    init(goal: GoalToBackground, goalkeeper: GoalkeeperToBackground) {
        let texture = SKTexture(imageNamed: Assets.Background.frame2.rawValue)
        totalPositions = frames.count - 1
        self.goal = goal
        self.goalkeeper = goalkeeper
        
        super.init(texture: texture, color: .black, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - BackgroundToDirection
extension Background: BackgroundToDirection {
    func changePosition(leftSide: Bool) {
        var newTexture: SKTexture
        var newPosition: Int
        // TODO: Clean
        if leftSide {
            newPosition = currPosition + 1
            
            if newPosition <= totalPositions {
                newTexture = SKTexture(imageNamed: frames[newPosition].rawValue)
                currPosition = newPosition
                self.texture = newTexture
                goal.move(isLeft: leftSide)
                goalkeeper.resetAnimation()
                stats![0].moveGreenBar(isLeft: leftSide)
                stats![1].moveGreenBar(isLeft: leftSide)
            }
        } else {
            newPosition = currPosition - 1
            
            if newPosition >= 0 {
                newTexture = SKTexture(imageNamed: frames[newPosition].rawValue)
                currPosition = newPosition
                self.texture = newTexture
                goal.move(isLeft: leftSide)
                goalkeeper.resetAnimation()
                stats![0].moveGreenBar(isLeft: leftSide)
                stats![1].moveGreenBar(isLeft: leftSide)
            }
        }
    }
}


extension Background: BackgroundToBall {
    var getCurrPosition: Int {
        return currPosition
    }
}
