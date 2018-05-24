// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// フォーメーション
class Formation: Codable {
    
    /// チーム名
    var teamName = Const.Formation.teamDefaultName
    
    /// タイトル
    var title = Const.Formation.titleDefaultText
    
    /// スタメン
    var startings = [Position]()
    
    /// サブメンバー
    var substitutes = [Position]()
    
    /// フィールドプレイヤーユニフォーム
    var fieldUniform: Uniform?
    
    /// ゴールキーパー
    var keeperUniform: Uniform?
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case teamName = "team_name"
        case title
        case startings
        case substitutes
        case fieldUniform = "field_uniform"
        case keeperUniform = "keeper_uniform"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        teamName      = container.string(.teamName, Const.Formation.teamDefaultName)
        title         = container.string(.title, Const.Formation.titleDefaultText)
        startings     = container.to([Position].self, .startings, [])
        substitutes   = container.to([Position].self, .substitutes, [])
//        fieldUniform  = Uniform.search(id: container.string(.fieldUniform)) ?? Uniform.list()[0]
//        keeperUniform = Uniform.search(id: container.string(.keeperUniform)) ?? Uniform.list()[1]
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(teamName,          forKey: .teamName)
        try container.encode(title,             forKey: .title)
        try container.encode(startings,         forKey: .startings)
        try container.encode(substitutes,       forKey: .substitutes)
        try container.encode(fieldUniform?.id,  forKey: .fieldUniform)
        try container.encode(keeperUniform?.id, forKey: .keeperUniform)
    }
}
