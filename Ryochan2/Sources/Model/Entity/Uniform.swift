// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// ユニフォーム
class Uniform: Codable {
    
    /// ID
    var id = String.generateIdentifier()
    
    /// ユニフォーム名
    var name = Const.Uniform.defaultName
    
    /// シャツ色
    var shirtsColor: UIColor
    
    /// パンツ色
    var pantsColor: UIColor
    
    /// 背番号色のRGB値
    var numberColor: UIColor
    
    /// 背番号の位置
    var numberPosition: UniformNumberPosition = .center
    
    /// 袖1
    var sleeve1 = Parts(.sleeve1)
    
    /// 袖2
    var sleeve2 = Parts(.sleeve2)
    
    /// 袖3
    var sleeve3 = Parts(.sleeve3)
    
    /// 襟
    var collar = Parts(.collar)
    
    /// シャツパーツ(大)1
    var shirtsLarge1 = Parts(.shirtsLarge1)
    
    /// シャツパーツ(大)2
    var shirtsLarge2 = Parts(.shirtsLarge2)
    
    /// シャツパーツ(大)3
    var shirtsLarge3 = Parts(.shirtsLarge3)
    
    /// シャツパーツ(大)4
    var shirtsLarge4 = Parts(.shirtsLarge4)
    
    /// シャツパーツ(中)1
    var shirtsMiddle1 = Parts(.shirtsMiddle1)
    
    /// シャツパーツ(中)2
    var shirtsMiddle2 = Parts(.shirtsMiddle2)
    
    /// シャツパーツ(中)3
    var shirtsMiddle3 = Parts(.shirtsMiddle3)
    
    /// シャツパーツ(中)4
    var shirtsMiddle4 = Parts(.shirtsMiddle4)
    
    /// シャツパーツ(小)1
    var shirtsSmall1 = Parts(.shirtsSmall1)
    
    /// シャツパーツ(小)2
    var shirtsSmall2 = Parts(.shirtsSmall2)
    
    /// シャツパーツ(小)3
    var shirtsSmall3 = Parts(.shirtsSmall3)
    
    /// シャツパーツ(小)4
    var shirtsSmall4 = Parts(.shirtsSmall4)
    
    // MARK: - Decodable & Encodable
    
    enum Keys: String, CodingKey {
        case id
        case name
        case shirtsColor = "shirts_color"
        case pantsColor = "pants_color"
        case numberColor = "number_color"
        case numberPosition = "number_pos"
        case sleeve1
        case sleeve2
        case sleeve3
        case collar
        case shirtsLarge1 = "shirts_large1"
        case shirtsLarge2 = "shirts_large2"
        case shirtsLarge3 = "shirts_large3"
        case shirtsLarge4 = "shirts_large4"
        case shirtsMiddle1 = "shirts_middle1"
        case shirtsMiddle2 = "shirts_middle2"
        case shirtsMiddle3 = "shirts_middle3"
        case shirtsMiddle4 = "shirts_middle4"
        case shirtsSmall1 = "shirts_small1"
        case shirtsSmall2 = "shirts_small2"
        case shirtsSmall3 = "shirts_small3"
        case shirtsSmall4 = "shirts_small4"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        id             = container.string(.id, String.generateIdentifier())
        name           = container.string(.name, Const.Uniform.defaultName)
        shirtsColor    = container.color(.shirtsColor, UIColor.uniformColors[0])
        pantsColor     = container.color(.pantsColor,  UIColor.uniformColors[1])
        numberColor    = container.color(.numberColor, UIColor.uniformColors[1])
        numberPosition = container.to(UniformNumberPosition.self, .numberPosition, UniformNumberPosition.center)
        sleeve1        = container.to(Parts.self, .sleeve1,       Parts(.sleeve1))
        sleeve2        = container.to(Parts.self, .sleeve2,       Parts(.sleeve2))
        sleeve3        = container.to(Parts.self, .sleeve3,       Parts(.sleeve3))
        collar         = container.to(Parts.self, .collar,        Parts(.collar))
        shirtsLarge1   = container.to(Parts.self, .shirtsLarge1,  Parts(.shirtsLarge1))
        shirtsLarge2   = container.to(Parts.self, .shirtsLarge2,  Parts(.shirtsLarge2))
        shirtsLarge3   = container.to(Parts.self, .shirtsLarge3,  Parts(.shirtsLarge3))
        shirtsLarge4   = container.to(Parts.self, .shirtsLarge4,  Parts(.shirtsLarge4))
        shirtsMiddle1  = container.to(Parts.self, .shirtsMiddle1, Parts(.shirtsMiddle1))
        shirtsMiddle2  = container.to(Parts.self, .shirtsMiddle2, Parts(.shirtsMiddle2))
        shirtsMiddle3  = container.to(Parts.self, .shirtsMiddle3, Parts(.shirtsMiddle3))
        shirtsMiddle4  = container.to(Parts.self, .shirtsMiddle4, Parts(.shirtsMiddle4))
        shirtsSmall1   = container.to(Parts.self, .shirtsSmall1,  Parts(.shirtsSmall1))
        shirtsSmall2   = container.to(Parts.self, .shirtsSmall2,  Parts(.shirtsSmall2))
        shirtsSmall3   = container.to(Parts.self, .shirtsSmall3,  Parts(.shirtsSmall3))
        shirtsSmall4   = container.to(Parts.self, .shirtsSmall4,  Parts(.shirtsSmall4))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(id,              forKey: .id)
        try container.encode(name,            forKey: .name)
        try container.encode(shirtsColor.rgb, forKey: .shirtsColor)
        try container.encode(pantsColor.rgb,  forKey: .pantsColor)
        try container.encode(numberColor.rgb, forKey: .numberColor)
        try container.encode(numberPosition,  forKey: .numberPosition)
        try container.encode(sleeve1,         forKey: .sleeve1)
        try container.encode(sleeve2,         forKey: .sleeve2)
        try container.encode(sleeve3,         forKey: .sleeve3)
        try container.encode(collar,          forKey: .collar)
        try container.encode(shirtsLarge1,    forKey: .shirtsLarge1)
        try container.encode(shirtsLarge2,    forKey: .shirtsLarge2)
        try container.encode(shirtsLarge3,    forKey: .shirtsLarge3)
        try container.encode(shirtsLarge4,    forKey: .shirtsLarge4)
        try container.encode(shirtsMiddle1,   forKey: .shirtsMiddle1)
        try container.encode(shirtsMiddle2,   forKey: .shirtsMiddle2)
        try container.encode(shirtsMiddle3,   forKey: .shirtsMiddle3)
        try container.encode(shirtsMiddle4,   forKey: .shirtsMiddle4)
        try container.encode(shirtsSmall1,    forKey: .shirtsSmall1)
        try container.encode(shirtsSmall2,    forKey: .shirtsSmall2)
        try container.encode(shirtsSmall3,    forKey: .shirtsSmall3)
        try container.encode(shirtsSmall4,    forKey: .shirtsSmall4)
    }
}

extension Uniform: Equatable {
    
    static func ==(lhs: Uniform, rhs: Uniform) -> Bool {
        return lhs.id == rhs.id
    }
}
