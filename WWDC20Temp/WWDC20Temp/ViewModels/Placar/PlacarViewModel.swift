import SpriteKit


class Placar: SKSpriteNode {
    static var goals = 3
    static var goalsOpp = 3
    var placar: String!
    var label: SKLabelNode!
    
    init() {
        let texture = SKTexture(imageNamed: Assets.placar)
        super.init(texture: texture, color: .black, size: texture.size())
        setScale(2)
        zPosition = 1
        
        label = .init(text: "VAS  \(Placar.goals) - \(Placar.goalsOpp)  PAL")
        label.horizontalAlignmentMode = .center
        label.fontName = "Arial Rounded MT Bold"
        label.fontColor = .black    // .init(red: 2, green: 35, blue: 60, alpha: 1)
        label.fontSize = 11
        label.position = .init(x: size.width*0.075, y: size.height*0.03)
        label.zPosition = 2
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -
extension Placar: PlacarToBall {
    func goal() {
        Placar.goals += 1
    }
    
    func miss() {
        Placar.goalsOpp += 1
    }
}
