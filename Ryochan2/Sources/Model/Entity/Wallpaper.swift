// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// 壁紙
class Wallpaper: Codable {
    
    /// リソース名
    let resource: String
    
    /// イニシャライザ
    ///
    /// - Parameter resource: リソース名
    init(resource: String) {
        self.resource = resource
    }
}

extension Wallpaper {
    
    /// 画像
    var image: UIImage? {
        return UIImage(path: Path.Wallpaper.image(of: self))
    }
    
    /// サムネイル画像
    var thumbImage: UIImage? {
        return UIImage(path: Path.Wallpaper.thumb(of: self))
    }
}

extension Wallpaper: Equatable {
    
    static func ==(lhs: Wallpaper, rhs: Wallpaper) -> Bool {
        return lhs.resource == rhs.resource
    }
}
