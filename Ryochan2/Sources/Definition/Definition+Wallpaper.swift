// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation
import CoreGraphics

extension Const {
    
    /// 壁紙
    struct Wallpaper {
        
        /// 一覧用の縦横比率
        static let sizeRatio = 3.f / 4.f
    }
}

extension Path {
    
    /// 壁紙
    struct Wallpaper {
        
        /// 一覧用のJSONファイルのパス
        static var json: String {
            return documentDirectory.path("wallpapers.json")
        }
        
        /// ディレクトリのパス
        static var directory: String {
            return documentDirectory.path("wallpapers", makeDirectory: true)
        }
        
        /// 画像ファイルのパス
        ///
        /// - Parameter wallpaper: 壁紙オブジェクト
        /// - Returns: パス文字列
        static func image(of wallpaper: Ryochan2.Wallpaper) -> String {
            return directory.path(wallpaper.resource)
        }
        
        /// サムネイル画像ファイルのパス
        ///
        /// - Parameter wallpaper: 壁紙オブジェクト
        /// - Returns: パス文字列
        static func thumb(of wallpaper: Ryochan2.Wallpaper) -> String {
            return directory.path(wallpaper.resource.thumbName)
        }
    }
}

extension CGSize {
    
    /// 壁紙のサムネイルサイズ
    static let wallpaperThumb = CGSize(width: 160 * Const.Wallpaper.sizeRatio, height: 160)
}
