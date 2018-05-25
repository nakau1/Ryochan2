// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class WallpaperManager {
    
    private var storedList: [Wallpaper]!
    private var jsonCoder = JsonCoder()
    
    /// 一覧をファイルに保存する
    ///
    /// - Parameter list: 似顔絵オブジェクトの配列
    private func saveList(_ list: [Wallpaper]) {
        jsonCoder.saveJson(list, to: Path.Wallpaper.json)
    }
    
    /// ファイルに保存された一覧を読み込む
    ///
    /// - Returns: 似顔絵オブジェクトの配列
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
            return UIImage(path: Path.Wallpaper.thumb(of: wallpaper))
        }
    }
    
    // MARK: - write image -
    
    func writeImages(of wallpaper: Wallpaper) {
        writeThumbImage(of: wallpaper)
    }
    
    private func writeThumbImage(of wallpaper: Wallpaper) {
        _ = File.makeDirectoryIfNeeded(to: Path.Wallpaper.directory)
        // TODO: 未実装
//        generateImage().write(to: Path.portraitImage(self))
    }
}
