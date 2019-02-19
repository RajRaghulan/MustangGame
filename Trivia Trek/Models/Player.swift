//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

// Represents the current player object and properties
class Player {
    
    // The tile the player is currently positioned on
    var pos: Int
    
    // The image (optional) of the player
    var photo: UIImage?
    
    // Initializes a new player with an optional photo
    init(photo: UIImage? = UIImage(named: "avatar-sample")) {
        if photo != nil {
            self.photo = photo
        }
        
        self.pos = 0
    }
    
}
