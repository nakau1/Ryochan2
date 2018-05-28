// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class WallpaperImageGenerator {
    
    func generateThumb(_ image: UIImage) -> UIImage {
        return image.scaled(to: .wallpaperThumb)
    }
}
