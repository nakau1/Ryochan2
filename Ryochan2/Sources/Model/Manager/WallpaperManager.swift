// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class WallpaperManager: JsonDecodable {
    
    func list() -> [Wallpaper] {
        return jsonDecode(path: "", to: [Wallpaper].self, default: [])
    }
    
    func thumbImages() -> [UIImage?] {
        return []
    }
    
    func writeImages(of wallpaper: Wallpaper) {
        
    }
}
