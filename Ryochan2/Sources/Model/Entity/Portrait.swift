// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// 似顔絵
class Portrait: Codable {
    
    /// ID
    var id = String.generateIdentifier()
    
    /// 選手名
    var name = Const.Portrait.defaultName
    
    /// ベースのユニフォーム
    var baseUniform: Uniform
    
    /// 背番号
    var uniformNumber = 10
    
    /// スパイクの色
    var spikeColor: UIColor!
    
    /// ゴールキーパーかどうかのフラグ
    var goalkeeper = false
    
    /// 輪郭
    var contour = Parts(.contour)
    
    /// ベース髪
    var baseHair = Parts(.baseHair)
    
    /// 髪型
    var hair = Parts(.hair)
    
    /// 後ろ髪
    var backHair = Parts(.backHair)
    
    /// 目
    var eye = Parts(.eye)
    
    /// 眉毛
    var brows = Parts(.brows)
    
    /// 鼻
    var nose = Parts(.nose)
    
    /// 口
    var mouth = Parts(.mouth)
    
    /// 口ヒゲ
    var mustache = Parts(.mustache)
    
    /// 顎ヒゲ
    var beard = Parts(.beard)
    
    /// アクセサリ
    var accessory = Parts(.accessory)
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case id
        case name
        case baseUniform = "uniform"
        case uniformNumber = "number"
        case goalkeeper = "gk"
        case spikeColor
        case contour
        case baseHair = "base_hair"
        case hair
        case backHair = "back_hair"
        case eye
        case brows
        case nose
        case mouth
        case mustache
        case beard
        case accessory
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        id = container.string(.id, String.generateIdentifier())
        name = container.string(.name, Const.Portrait.defaultName)
        baseUniform = try! Uniform(from: decoder) // TODO: 仮実装
        //baseUniform = Uniform.search(id: container.string(.baseUniform)) ?? Uniform.defaultBaseUniform
        uniformNumber = container.int(.uniformNumber, 10)
        goalkeeper = container.bool(.goalkeeper)
        spikeColor = container.color(.spikeColor, UIColor.spikeColors.first!)
        
        contour   = container.to(Parts.self, .contour,   Parts(.contour))
        baseHair  = container.to(Parts.self, .baseHair,  Parts(.baseHair))
        hair      = container.to(Parts.self, .hair,      Parts(.hair))
        backHair  = container.to(Parts.self, .backHair,  Parts(.backHair))
        eye       = container.to(Parts.self, .eye,       Parts(.eye))
        brows     = container.to(Parts.self, .brows,     Parts(.brows))
        nose      = container.to(Parts.self, .nose,      Parts(.nose))
        mouth     = container.to(Parts.self, .mouth,     Parts(.mouth))
        mustache  = container.to(Parts.self, .mustache,  Parts(.mustache))
        beard     = container.to(Parts.self, .beard,     Parts(.beard))
        accessory = container.to(Parts.self, .accessory, Parts(.accessory))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(id,            forKey: .id)
        try container.encode(name,          forKey: .name)
        try container.encode(uniformNumber, forKey: .uniformNumber)
        try container.encode(goalkeeper,    forKey: .goalkeeper)
        try container.encode(contour,       forKey: .contour)
        try container.encode(baseHair,      forKey: .baseHair)
        try container.encode(hair,          forKey: .hair)
        try container.encode(backHair,      forKey: .backHair)
        try container.encode(eye,           forKey: .eye)
        try container.encode(brows,         forKey: .brows)
        try container.encode(nose,          forKey: .nose)
        try container.encode(mouth,         forKey: .mouth)
        try container.encode(mustache,      forKey: .mustache)
        try container.encode(beard,         forKey: .beard )
        try container.encode(accessory,     forKey: .accessory)
        
        try container.encode(spikeColor.rgb, forKey: .spikeColor)
        try container.encode(baseUniform.id, forKey: .baseUniform)
    }
}

extension Portrait {
    
    /// 肌の色
    var skinColor: UIColor {
        return contour.color
    }
    
    /// 背番号と名前
    var nameWithNumber: String {
        return "\(uniformNumber).\(name)"
    }
}

extension Portrait: Equatable {
    
    static func ==(lhs: Portrait, rhs: Portrait) -> Bool {
        return lhs.id == rhs.id
    }
}

