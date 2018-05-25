// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class WallpaperManager {
    
    private var storedList: [Wallpaper]!
    private var jsonCoder = JsonCoder()
    
    /// ファイルに保存された一覧を読み込む
    ///
    /// - Returns: 壁紙オブジェクトの配列
    func loadList() -> [Wallpaper] {
        if let list = storedList { return list }
        
        _ = File.makeTextFileIfNeeded(to: Path.Wallpaper.json)
        storedList = jsonCoder.loadJson(path: Path.Wallpaper.json, to: [Wallpaper].self, default: [])
        return storedList
    }
    
    /// サムネイル画像の一覧を取得する
    ///
    /// - Returns: サムネイル画像の一覧
    func loadThumbList() -> [UIImage?] {
        return loadList().map { wallpaper -> UIImage? in
            return wallpaper.thumbImage
        }
    }
}
