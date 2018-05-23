// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class Wallpaper: Codable {
    
    let resource: String
    
    init(resource: String) {
        self.resource = resource
    }
}

extension Wallpaper {
    
    var image: UIImage? {
        return nil
    }
    
    var thumbImage: UIImage? {
        return nil
    }
}

extension Wallpaper: Equatable {
    
    static func ==(lhs: Wallpaper, rhs: Wallpaper) -> Bool {
        return lhs.resource == rhs.resource
    }
}
