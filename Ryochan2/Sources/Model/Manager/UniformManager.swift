// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// ユニフォームマネージャ
class UniformManager {
    
    private var storedList: [Uniform]!
    private var jsonCoder = JsonCoder()
    
    // MARK: - list -
    
    /// 一覧をファイルに保存する
    ///
    /// - Parameter list: ユニフォームオブジェクトの配列
    private func saveList(_ list: [Uniform]) {
        jsonCoder.saveJson(list, to: Path.Uniform.json)
    }
    
    /// ファイルに保存された一覧を読み込む
    ///
    /// - Returns: ユニフォームオブジェクトの配列
    func loadList() -> [Uniform] {
        if let list = storedList { return list }
        
        if File.makeTextFileIfNeeded(to: Path.Uniform.json) {
            makeDefaultList()
        }
        storedList = jsonCoder.loadJson(path: Path.Uniform.json, to: [Uniform].self, default: [])
        return storedList
    }
    
    /// IDからユニフォームを検索して返す
    ///
    /// - Parameter id: ID
    /// - Returns: ユニフォームオブジェクト
    func search(id: String) -> Uniform? {
        if id.isEmpty { return nil }
        for portrait in loadList() {
            if portrait.id == id {
                return portrait
            }
        }
        return nil
    }
    
    private func makeDefaultList() {
        let uniforms = (0..<Const.Uniform.minimumNumber).map { _ -> Uniform in
            let uniform = jsonCoder.instantiate(decodableType: Uniform.self)
            writeImages(of: uniform)
            return uniform
        }
        saveList(uniforms)
    }
    
    private func index(of uniform: Uniform) -> Int? {
        let list = loadList()
        for (i, element) in list.enumerated() {
            if element == uniform {
                return i
            }
        }
        return nil
    }
    
    // MARK: - add -
    
    /// 新たなユニフォームオブジェクトを追加保存する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    func add(_ uniform: Uniform) {
        var list = loadList()
        list.append(uniform)
        saveList(list)
        writeImages(of: uniform)
    }
    
    // MARK: - update -
    
    /// ユニフォームオブジェクトを更新して保存する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    func update(_ uniform: Uniform) {
        var list = loadList()
        if let i = index(of: uniform) {
            list[i] = uniform
            saveList(list)
            writeImages(of: uniform)
        }
    }
    
    // MARK: - copy -
    
    /// ユニフォームオブジェクトをコピーして追加保存する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    func copy(_ uniform: Uniform) {
        let cloned = jsonCoder.clone(uniform, type: Uniform.self)
        cloned.id = String.generateIdentifier()
        add(uniform)
    }
    
    // MARK: - delete -
    
    /// ユニフォームオブジェクトを削除する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    func delete(_ uniform: Uniform) {
        let filteredList = loadList().filter { $0 != uniform }
        saveList(filteredList)
        deleteImages(of: uniform)
    }
    
    /// すべてのユニフォームオブジェクトを削除する
    func deleteAll() {
        loadList().forEach {
            deleteImages(of: $0)
        }
        saveList([])
    }
    
    // MARK: - manage resource -
    
    /// 指定したユニフォームオブジェクトのパーツのリソースを変更する(保存はしない)
    ///
    /// - Parameters:
    ///   - resource: リソース名
    ///   - uniform: ユニフォームオブジェクト
    ///   - category: カテゴリ
    func setResource(_ resource: String, to uniform: Uniform, for category: Category) {
        category.parts(of: uniform).resource = resource
    }
    
    // MARK: - generate image -
    
    /// 画像を生成する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    /// - Returns: ユニフォーム画像
    func generateImage(of uniform: Uniform) -> UIImage {
        return UIImage() // TODO: 未実装
//        return PortraitImageGenerator().generateImage(of: self)
    }
    
    /// サムネイル画像を生成する
    ///
    /// - Parameter uniform: ユニフォームオブジェクト
    /// - Returns: ユニフォームサムネイル画像
    func generateThumbImage(of uniform: Uniform) -> UIImage {
        return UIImage() // TODO: 未実装
//        return generateImage().scaled(to: .portraitThumb)
    }
    
    /// サムネイル画像の一覧を取得する
    ///
    /// - Returns: サムネイル画像の一覧
    func loadThumbList() -> [UIImage?] {
        return loadList().map { uniform -> UIImage? in
            return UIImage(path: Path.Uniform.thumb(of: uniform))
        }
    }
    
    // MARK: - write image -
    
    private func writeImages(of uniform: Uniform) {
        writeImage(of: uniform)
        writeThumbImage(of: uniform)
    }
    
    private func writeImage(of uniform: Uniform) {
        _ = File.makeDirectoryIfNeeded(to: Path.Uniform.directory)
        // TODO: 未実装
    }
    
    private func writeThumbImage(of uniform: Uniform) {
        _ = File.makeDirectoryIfNeeded(to: Path.Uniform.directory)
        // TODO: 未実装
//        generateImage().write(to: Path.portraitImage(self))
    }
    
    // MARK: - delete image -
    
    private func deleteImages(of uniform: Uniform) {
        deleteImage(of: uniform)
        deleteThumbImage(of: uniform)
    }
    
    private func deleteImage(of uniform: Uniform) {
        File.delete(at: Path.Uniform.image(of: uniform))
    }
    
    private func deleteThumbImage(of uniform: Uniform) {
        File.delete(at: Path.Uniform.thumb(of: uniform))
    }
}
