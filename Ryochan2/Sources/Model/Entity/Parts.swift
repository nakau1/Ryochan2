// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// パーツ
class Parts: Codable {
    
    /// カテゴリ
    var category: Category
    
    /// リソースファイル名
    var resource = ""
    
    /// 配置場所
    var position: CGPoint = .zero
    
    /// 中央部分から分離する距離
    var separatedDistance: CGFloat = 0.0
    
    /// パーツ色
    var color: UIColor = .black
    
    /// イニシャライザ
    ///
    /// - Parameter category: パーツカテゴリ
    init(_ category: Category) {
        self.category = category
        self.resource = category.initialResource
        self.position = category.initialPosition
        if category.hasColor {
            self.color = category.colors.first!
        }
    }
    
    /// パーツ画像ディレクトリ
    var imageDirectory: String {
        switch category.kind {
        case .portrait: return Path.Parts.portraitDirectory
        case .uniform:  return Path.Parts.uniformDirectory
        }
    }
    
    /// パーツ画像ファイルパス
    var imagePath: String {
        return imageDirectory.path(resource)
    }
    
    /// パーツ画像
    var image: UIImage? {
        return imagePath.fileImage
    }
    
    /// パーツサムネイル画像ファイルパス
    var thumbImagePath: String {
        return Path.Parts.thumb(of: resource)
    }
    
    /// パーツサムネイル画像
    var thumbImage: UIImage? {
        return thumbImagePath.fileImage
    }
    
    /// パーツ色用画像ファイルパス
    var colorImagePath: String {
        print(imageDirectory.path(Parts.colorResourceName(of: resource)))
        return imageDirectory.path(Parts.colorResourceName(of: resource))
    }
    
    /// 指定したリソース名のパーツ色用ファイル名を取得
    ///
    /// - Parameter resource: リソース名
    /// - Returns: パーツ色用ファイル名
    class func colorResourceName(of resource: String) -> String {
        return "\(resource.withoutExtension).\(Const.Parts.colorResourceSuffix).\(resource.extensionWithoutDot)"
    }
    
    /// パーツ色用画像
    var colorImage: UIImage? {
        return colorImagePath.fileImage
    }
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case category
        case resource = "res"
        case position = "pos"
        case separatedDistance = "separate"
        case color
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        category = container.to(Category.self, .category, Category.contour)
        resource = container.string(.resource)
        position = container.point(.position)
        separatedDistance = container.cgfloat(.separatedDistance)
        color = container.color(.color)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(category, forKey: .category)
        try container.encode(resource, forKey: .resource)
        try container.encode(position, forKey: .position)
        try container.encode(separatedDistance, forKey: .separatedDistance)
        try container.encode(color, forKey: .color)
    }
}
