protocol BackgroundToDirection {
    func changePosition(leftSide: Bool)
}

protocol BackgroundToBall {
    var getCurrPosition: Int { get }
}
