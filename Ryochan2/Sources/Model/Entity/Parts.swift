// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class Parts: Codable {
    
    /// カテゴリ
    var category: Category
    
    /// リソースファイル名
    var resource = ""
    
    /// 配置場所
    var position = CGPoint.zero
    
    /// 中央部分から分離する距離
    var separate: CGFloat = 0.0
    
    /// パーツ色
    var color: UIColor = .black
    
    /// イニシャライザ
    ///
    /// - Parameter category: パーツカテゴリ
    init(_ category: Category) {
        self.category = category
        self.resource = category.initialResource
        self.position = category.initialPosition
//        if category.hasColor {
//            self.color = category.colors.first!
//        }
    }
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case category
        case resource
        case position
        case separate
        case color
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        category = container.to(Category.self, .category, Category.contour)
        resource = container.string(.resource)
        position = container.point(.position)
        separate = container.cgfloat(.separate)
        color    = container.color(.color)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(category, forKey: .category)
        try container.encode(resource, forKey: .resource)
        try container.encode(position, forKey: .position)
        try container.encode(separate, forKey: .separate)
        try container.encode(color, forKey: .color)
    }
}
