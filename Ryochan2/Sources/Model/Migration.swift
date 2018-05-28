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
            self.jsonCoder.saveJson(self.distributePortraitCategorizedResources(), to: Path.Parts.portraitJson)
            self.jsonCoder.saveJson(self.distributeUniformCategorizedResources(), to: Path.Parts.uniformJson)
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
        return distributeCategorizedResources(
            src: Path.Parts.portraitDirectory,
            dst: Path.Migration.zipDestination.path("Portraits", makeDirectory: true),
            categories: Category.portraitItems
        )
    }
    
    private func distributeUniformCategorizedResources() -> [CategorizedResources] {
        return distributeCategorizedResources(
            src: Path.Parts.uniformDirectory,
            dst: Path.Migration.zipDestination.path("Uniforms", makeDirectory: true),
            categories: Category.uniformItems
        )
    }
    
    private func distributeCategorizedResources(src: String, dst: String, categories: [Category]) -> [CategorizedResources] {
        let ret = categories.reduce(into: [CategorizedResources]()) { res, category in
            let categorizedParts = jsonCoder.instantiate(decodableType: CategorizedResources.self)
            categorizedParts.category = category
            if category.hasEmpty {
                categorizedParts.resources.insert("empty", at: 0)
            }
            res.append(categorizedParts)
        }
        return File.fileNames(in: dst).reduce(into: ret) { res, resource in
            categories.forEach { category in
                if !isPartsResource(name: resource, for: category) {
                    return
                }
                if !isColorResource(name: resource, for: category) {
                    ret[category]?.resources.append(resource)
                }
                let image = UIImage(path: dst.path(resource))
                image?.write(to: src.path(resource))
            }
        }
    }
    
    /// カテゴリのファイル命名規則に即した名前であるかどうか
    private func isPartsResource(name: String, for category: Category) -> Bool {
        return name.hasPrefix(category.fileBaseName) && name.hasSuffix(".png")
    }
    
    /// 色素材パーツ用のファイル名であるかどうか
    private func isColorResource(name: String, for category: Category) -> Bool {
        if category.partsColorType != .outlinedColorable {
            return false
        }
        var l = name.withoutExtension
        l = l.extensionWithoutDot
        
        return name.withoutExtension.extensionWithoutDot == Const.Parts.colorResourceSuffix
    }
    
    // MARK: - wallpaper
    
    private func distributeWallpapers() -> [Wallpaper] {
        let destinationDirectory = Path.Migration.zipDestination.path("Wallpapers")
        let imageGenerator = WallpaperImageGenerator()
        return File.fileNames(in: destinationDirectory).reduce(into: [Wallpaper]()) { res, fileName in
            let wallpaper = Wallpaper(resource: fileName)
            
            let image = UIImage(path: destinationDirectory.path(fileName))!
            image.write(to: Path.Wallpaper.image(of: wallpaper))
            let thumb = imageGenerator.generateThumb(image)
            thumb.write(to: Path.Wallpaper.thumb(of: wallpaper))
            
            res.append(wallpaper)
        }
    }
}
