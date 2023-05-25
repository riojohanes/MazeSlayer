//
//  Character.swift
//  Maze
//
//  Created by Rio Johanes Sumolang on 23/05/23.
//

import Foundation
import SpriteKit

class HeroNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0085")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MageNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0084")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GhostNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0121")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SlimeNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0108")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MouseNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "tile_0124")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        let scale: CGFloat = 2.0
        self.setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
