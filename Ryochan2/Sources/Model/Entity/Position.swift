// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// フォーメーションポジション
class Position: Codable {
    
    /// 配置場所(左上からのパーセンテージ)
    var percentage: CGPoint = .zero
    
    /// 紐づく似顔絵オブジェクト
    var portrait: Portrait?
    
    /// ゴールキーパーかどうか
    var goalkeeper = false
    
    /// キャプテンかどうか
    var captain = false
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - x: x座標(パーセンテージ)
    ///   - y: y座標(パーセンテージ)
    ///   - goalkeeper: ゴールキーパーかどうか
    init(_ x: CGFloat, _ y: CGFloat, gk goalkeeper: Bool = false) {
        self.percentage = CGPoint(x, y)
        self.goalkeeper = goalkeeper
    }
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case percentage
        case portrait
        case goalkeeper
        case captain
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        percentage = container.point(.percentage)
        goalkeeper = container.bool(.goalkeeper)
        captain    = container.bool(.captain)
//        portrait   = Portrait.search(id: container.string(.portrait))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(percentage, forKey: .percentage)
        try container.encode(goalkeeper, forKey: .goalkeeper)
        try container.encode(captain, forKey: .captain)
        try container.encode(portrait?.id, forKey: .portrait)
    }
}
