// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation
import SSZipArchive

class Migration {
    
    private var jsonCoder = JsonCoder()
    
    /// データ移行の必要性
    var needsMigration: Bool {
        guard let stored = storedVersion else { return true }
        return compareVersion(stored, currentVersion) == .orderedAscending
    }
    
    /// データのパスをコンソール出力する
    func printDirectory() {
        print("open \(Path.documentDirectory)")
    }
    
    /// データ移行を必須に変更する
    func reset() {
        storedVersion = nil
    }
    
    /// データ移行を実行する
    func migrate() {
        unzip() { [unowned self] in
            // TODO: パーツデータのJSON化
            self.jsonCoder.saveJson(self.distributeWallpapers(), to: Path.Wallpaper.json)
            self.storedVersion = self.currentVersion
        }
    }
    
    /// アプリ情報から取得した現在のバージョン番号
    private var currentVersion: String {
        let dic = Bundle.main.infoDictionary!
        return dic["CFBundleShortVersionString"]! as! String
    }
    
    /// アプリ保存されたバージョン番号
    private var storedVersion: String? {
        get {
            return UserDefaults.standard.string(forKey: "Migration.storedVersion")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "Migration.storedVersion")
            UserDefaults.standard.synchronize()
        }
    }
    
    /// バージョン番号を比較する
    ///
    /// - Parameters:
    ///   - a: 比較対象
    ///   - b: 比較対象
    /// - Returns: 比較結果(aよりbの方が大きい場合に.orderedAscendingを返す)
    private func compareVersion(_ a: String, _ b: String) -> ComparisonResult {
        return a.compare(b, options: .numeric, range: nil, locale: nil)
    }
    
    /// ZIPファイルを解凍する
    /// - Parameter completion: 完了時の処理
    private func unzip(completion: @escaping () -> Void) {
        SSZipArchive.unzipFile(
            atPath: Path.Migration.zipSource,
            toDestination: Path.documentDirectory,
            progressHandler: { _, _, _, _ in },
            completionHandler: { _, _, _ in completion() }
        )
    }
    
    // MARK: - parts
    
    /// ZIP解凍先のファイルから壁紙であるファイルを抽出してオブジェクトで返却する
    ///
    /// - Returns: 壁紙オブジェクトの配列
    private func distributeParts() -> [Parts] {
        return []
    }
    
    /// カテゴリのファイル名に即した名前であるかどうかを返す
    ///
    /// - Parameters:
    ///   - fileName: 対象のファイル名
    ///   - category: カテゴリ
    /// - Returns: カテゴリのファイル名に即した名前であるかどうか
    func isMatchedName(_ fileName: String, for category: Category) -> Bool {
        return fileName.hasPrefix(category.fileBaseName) && fileName.hasSuffix(Const.Parts.imageExtension)
    }
    
    /// 色素材パーツ用のファイル名であるかどうかを返す
    ///
    /// - Parameters:
    ///   - fileName: 対象のファイル名
    ///   - category: カテゴリ
    /// - Returns: 色素材パーツ用のファイル名であるかどうか
    func isColorMaterialName(_ fileName: String, for category: Category) -> Bool {
//        if category.partsColorType != .outlinedColorable {
//            return false
//        }
        return fileName.removedBackward(Const.Parts.imageExtension.count).hasSuffix(Const.Parts.colorPartsImageSuffix)
    }
    
    // MARK: - wallpaper
    
    /// ZIP解凍先のファイルから壁紙であるファイルを抽出してオブジェクトで返却する
    ///
    /// - Returns: 壁紙オブジェクトの配列
    private func distributeWallpapers() -> [Wallpaper] {
        let manager = WallpaperManager()
        return File.fileNames(in: Path.Migration.zipDestination).reduce(into: [Wallpaper]()) { res, fileName in
            if isBackgroundName(fileName) {
                let wallpaper = Wallpaper(resource: fileName)
                manager.writeImages(of: wallpaper)
                res.append(wallpaper)
            }
        }
    }
    
    /// 壁紙用のファイル名かどうか
    ///
    /// - Parameter fileName: ファイル名
    /// - Returns: "wallpaper(hoge).png"という形式かどうか
    private func isBackgroundName(_ fileName: String) -> Bool {
        return fileName.hasPrefix(Const.Wallpaper.imagePrefix) && fileName.hasSuffix(Const.Wallpaper.imageExtension)
    }
}
