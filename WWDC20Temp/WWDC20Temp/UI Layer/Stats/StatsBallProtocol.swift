import Foundation


protocol StatsBallProtocol {
    
    var strengthValue: Int { get }
    var kneeValue: Int { get }
    var effectValue: Int { get }
}


extension PlayerStats: StatsBallProtocol {
    
    var strengthValue: Int {
        get  { return Int(activeFields[0].text!)! * 10 }
    }
    
    var kneeValue: Int {
        get  { return Int(activeFields[1].text!)! }
    }
    
    var effectValue: Int {
        get  { return Int(activeFields[2].text!)! * 10 }
    }
}
