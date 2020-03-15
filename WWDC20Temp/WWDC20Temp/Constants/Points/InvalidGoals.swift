//
//  Goals.swift
//  WWDC20Temp
//
//  Created by Paulo Ricardo on 3/15/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import SpriteKit


protocol GoalPointsProtocol {
    
    var minX: CGFloat { get }
    var maxX: CGFloat { get }
    var minY: CGFloat { get }
    var maxY: CGFloat { get }
}


extension Points {
    enum GoalsPoints {
        
        struct InvalidLeft: GoalPointsProtocol {
            
            var minX: CGFloat { get { return -0.75 } }
            var maxX: CGFloat { get { return -0.53 } }
            var minY: CGFloat { get { return  0.06 } }
            var maxY: CGFloat { get { return  1.50 } }
        }
        
        
        struct InvalidRight: GoalPointsProtocol {
            
            var minX: CGFloat { get { return 0.00 } }
            var maxX: CGFloat { get { return 0.48 } }
            var minY: CGFloat { get { return 1.10 } }
            var maxY: CGFloat { get { return 1.50 } }
        }
    }
}
