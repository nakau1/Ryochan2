// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// カテゴライズされたリソース
class CategorizedResources: Codable {
    
    /// カテゴリ
    var category: Category
    
    /// リソース名の配列
    var resources: [String]
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case category
        case resources
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        category = container.to(Category.self, .category, Category.contour)
        resources = container.to([String].self, .resources, [])
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(category, forKey: .category)
        try container.encode(resources, forKey: .resources)
    }
}

extension Array where Element: CategorizedResources {
    
    subscript(category: Category) -> CategorizedResources? {
        for categorizedResources in self {
            if category == categorizedResources.category {
                return categorizedResources
            }
        }
        return nil
    }
}
