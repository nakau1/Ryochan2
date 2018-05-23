// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation
import CoreGraphics

extension Const {
    
    struct Wallpaper {
        
        /// JSONファイル名
        static let jsonFileName = "wallpapers.json"
        
        /// 画像の拡張子
        static let imageExtension = ".png"
        
        /// 画像のプレフィックス
        static let imagePrefix = "background" //TODO: wallpaper に変更
        
        /// 一覧用の縦横比率
        static let sizeRatio = 3.f / 4.f
    }
}

extension Path {
    
    struct Wallpaper {
        
        /// 壁紙一覧用のJSONファイルのパス
        static var json: String {
            return documentDirectory.path(Const.Wallpaper.jsonFileName)
        }
        
        /// 壁紙サムネイル用ディレクトリのパス
        static var thumbDirectory: String {
            return documentDirectory.path("Wallpaper")
        }
        
        /// 壁紙サムネイル画像ファイルのパス
        ///
        /// - Parameter wallpaper: 壁紙オブジェクト
        /// - Returns: パス文字列
        static func thumb(of wallpaper: Ryochan2.Wallpaper) -> String {
            return thumbDirectory.path(wallpaper.resource)
        }
        
        /// 壁紙画像ファイルのパス
        ///
        /// - Parameter wallpaper: 壁紙オブジェクト
        /// - Returns: パス文字列
        static func image(of wallpaper: Ryochan2.Wallpaper) -> String {
            return "" // TODO
        }
    }
}

extension CGSize {
    
    /// 壁紙のサムネイルサイズ
    static let wallpaperThumb = CGSize(width: 160 * Const.Wallpaper.sizeRatio, height: 160)
}
