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
            //self.jsonCoder.saveJson(self.distributeCategorizedResources(), to: Path.Parts.json)
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
    
    private func compareVersion(_ a: String, _ b: String) -> ComparisonResult {
        // 比較結果(aよりbの方が大きい場合に.orderedAscendingを返す)
        return a.compare(b, options: .numeric, range: nil, locale: nil)
    }
    
    private func unzip(completion: @escaping () -> Void) {
        SSZipArchive.unzipFile(
            atPath: Path.Migration.zipSource,
            toDestination: Path.documentDirectory,
            progressHandler: { _, _, _, _ in },
            completionHandler: { _, _, _ in completion() }
        )
    }
    
    // MARK: - categorized resources
    
    private func distributePortraitCategorizedResources() -> [CategorizedResources] {
        return []
    }
    
    private func distributeCategorizedResources() -> [CategorizedResources] {
        let ret = Category.items.reduce(into: [CategorizedResources]()) { res, category in
            let categorizedParts = jsonCoder.instantiate(decodableType: CategorizedResources.self)
            categorizedParts.category = category
            if category.hasEmpty {
                categorizedParts.resources.insert("empty", at: 0)
            }
            res.append(categorizedParts)
        }
        return File.fileNames(in: Path.Migration.zipDestination).reduce(into: ret) { res, resource in
            Category.items.forEach { category in
                if !isMatchedName(resource, for: category) {
                    return
                }
                if isColorMaterialName(resource, for: category) {
                    return
                }
                ret[category]?.resources.append(resource)
            }
        }
    }
    
    /// カテゴリのファイル名に即した名前であるかどうかを返す
    ///
    /// - Parameters:
    ///   - fileName: 対象のファイル名
    ///   - category: カテゴリ
    /// - Returns: カテゴリのファイル名に即した名前であるかどうか
    private func isMatchedName(_ fileName: String, for category: Category) -> Bool {
        return fileName.hasPrefix(category.fileBaseName) && fileName.hasSuffix(Const.Parts.imageExtension)
    }
    
    /// 色素材パーツ用のファイル名であるかどうかを返す
    ///
    /// - Parameters:
    ///   - fileName: 対象のファイル名
    ///   - category: カテゴリ
    /// - Returns: 色素材パーツ用のファイル名であるかどうか
    private func isColorMaterialName(_ fileName: String, for category: Category) -> Bool {
//        if category.partsColorType != .outlinedColorable {
//            return false
//        }
        return fileName.removedBackward(Const.Parts.imageExtension.count).hasSuffix(Const.Parts.colorPartsImageSuffix)
    }
    
    // MARK: - wallpaper
    
    private func distributeWallpapers() -> [Wallpaper] {
        let destinationDirectory = Path.Migration.zipDestination.path("Wallpapers")
        return File.fileNames(in: destinationDirectory).reduce(into: [Wallpaper]()) { res, fileName in
            let wallpaper = Wallpaper(resource: fileName)
            
            let image = UIImage(path: destinationDirectory.path(fileName))!
            image.write(to: Path.Wallpaper.image(of: wallpaper))
            let thumb = image // TODO: リサイズ
            thumb.write(to: Path.Wallpaper.thumb(of: wallpaper))
            
            res.append(wallpaper)
        }
    }
}
