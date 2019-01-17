//
//  SKNode+Extra.swift
//  TextShooter
//
//  Created by Molly Maskrey on 7/21/16.
//  Copyright © 2016 Apress Inc. All rights reserved.
//

import SpriteKit

extension SKNode {
    @objc func receiveAttacker(_ attacker: SKNode, contact: SKPhysicsContact) {
        // 默认的实现不执行任何操作 | Default implementation does nothing
    }
    
    @objc func friendlyBumpFrom(_ node: SKNode) {
        // Default implementation does nothing
    }
}
