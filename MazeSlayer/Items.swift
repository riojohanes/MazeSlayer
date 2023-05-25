//
//  Items.swift
//  Maze
//
//  Created by Rio Johanes Sumolang on 24/05/23.
//

import Foundation
import SpriteKit

class AxeNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0118")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StaffNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0130")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
