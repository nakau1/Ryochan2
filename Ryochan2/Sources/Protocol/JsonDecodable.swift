// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol JsonDecodable {}

extension JsonDecodable {
    
    /// 指定したパスのJSONをデコードしてオブジェクトを作成する
    ///
    /// - Parameters:
    ///   - path: JSONファイルのパス
    ///   - type: デコード可能な型
    ///   - defaultValue: 失敗した場合のデフォルト値
    /// - Returns: デコード作成されたオブジェクト
    func loadJson<T>(path: String, to type: T.Type, default defaultValue: T) -> T where T: Decodable {
        guard
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let decoded = try? JSONDecoder().decode(type, from: data)
            else {
                return defaultValue
        }
        return decoded
    }
    
    /// <#Description#>
    ///
    /// - Parameter type: <#type description#>
    /// - Returns: <#return value description#>
    func instantiate<T>(decodableType type: T.Type) -> T where T: Decodable {
        let emptyJsonData = "{}".data(using: .utf8)!
        return try! JSONDecoder().decode(type, from: emptyJsonData)
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - value: <#value description#>
    ///   - type: <#type description#>
    /// - Returns: <#return value description#>
    func clone<T>(_ value: T, type: T.Type) -> T where T: Codable {
        guard
            let encodedData = try? JSONEncoder().encode(value),
            let decodedObject = try? JSONDecoder().decode(type, from: encodedData)
            else {
                fatalError("JsonDecodable Error: failed copy instance")
        }
        return decodedObject
    }
}
