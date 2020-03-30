import SpriteKit


class NewStats: SKSpriteNode, Moveable {
    var slideButton: SKSpriteNode!
    var fadeOutDuration: TimeInterval = 1.2
    var greenBar: SKSpriteNode!
    let statType: Images.Stat.StatIndicator!
    
    init(statType: Images.Stat.StatIndicator) {
        let texture = SKTexture(imageNamed: Images.Stat.StatBar.blackBar)
        self.statType = statType
        super.init(texture: texture, color: .black, size: texture.size())
        setScale()
        
        setUpSlideButton()
        setUpGreenBar()
        
        isUserInteractionEnabled = true
        anchorPoint = CGPoint(x: 0, y: 0.5)
        addChild(slideButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpGreenBar() {
        greenBar = SKSpriteNode(imageNamed: Images.Stat.StatBar.greenBar)
        greenBar.physicsBody = SKPhysicsBody()
        greenBar.physicsBody?.affectedByGravity = false
        greenBar.physicsBody?.collisionBitMask = 1
        greenBar.anchorPoint = CGPoint(x: 0, y: 0.5)
        greenBar.zPosition = 1
        greenBar.size.height *= 1.4
        if statType == Images.Stat.StatIndicator.str {
            greenBar.position.x = size.width*0.2
            greenBar.size.width = size.width*0.1
        } else {
            greenBar.position.x = size.width*0.7
            greenBar.size.width = size.width*0.18
        }
        
        addChild(greenBar)
    }
    
    func setUpSlideButton() {
        slideButton = SKSpriteNode(imageNamed: statType.indicator())
        slideButton.physicsBody = SKPhysicsBody()
        slideButton.physicsBody?.affectedByGravity = false
        slideButton.physicsBody?.collisionBitMask = 1
        slideButton.setScale(1.7)
        slideButton.zPosition = 2
        slideButton.position = .zero
        slideButton.run(moveLeftRightAction(
            left: 0,
            right: size.width,
            duration: statType.point.duration)
        )
    }
    
    func setScale() {
        size.width *= 1.9
        size.height *= 1.5
        zPosition = 0
    }
}

// MARK: - NewStatsToBall
extension NewStats: NewStatsToBall {
    var getValue: Int {
        return Int(slideButton.position.x/size.width*100)
    }
    var contact: Bool {
        return slideButton.frame.intersects(greenBar.frame)
    }
}

// MARK: - StatsToShootButton
extension NewStats: StatsToShootButton {
    var getDuration: TimeInterval {
        get { fadeOutDuration }
    }
    
    func fadeOutAnimation() -> SKAction {
        return SKAction.run {
            self.run(SKAction.fadeOut(withDuration: self.fadeOutDuration))
        }
    }
    
    func stopSlider() {
        slideButton.removeAllActions()
    }
}

// MARK: - NewStatsToDirection
extension NewStats: NewStatsToDirection {
    var width: CGFloat {
        return size.width
    }
    
    func moveGreenBar(isLeft: Bool) {
        if statType == Images.Stat.StatIndicator.str {
            if isLeft {
                greenBar.position.x += size.width*0.1
            } else {
                greenBar.position.x -= size.width*0.1
            }
        } else {
            if isLeft {
                greenBar.position.x -= size.width*0.06
            } else {
                greenBar.position.x += size.width*0.06
            }
        }
    }
}
