// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// CodableとJSONの変換を行うクラス
struct JsonCoder {
    
    /// オブジェクトをJSONにエンコードしてファイルに保存する
    ///
    /// - Parameters:
    ///   - object: エンコード可能なオブジェクト
    ///   - path: 保存先のJSONファイルのパス
    func saveJson<T>(_ object: T, to path: String) where T: Encodable {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
            
            let encodedData = (try? encoder.encode(object)) ?? Data()
            try encodedData.write(to: URL(fileURLWithPath: path))
        } catch let error {
            print("JsonCoder Error: failed save json: \(error.localizedDescription)")
        }
    }
    
    /// 指定したパスのJSONファイルをデコードしてオブジェクトを生成する
    ///
    /// - Parameters:
    ///   - path: JSONファイルのパス
    ///   - type: 型
    ///   - defaultValue: 失敗した場合のデフォルト値
    /// - Returns: デコードして作成されたオブジェクト
    func loadJson<T>(path: String, to type: T.Type, default defaultValue: T) -> T where T: Decodable {
        guard
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let decoded = try? JSONDecoder().decode(type, from: data)
            else {
                return defaultValue
        }
        return decoded
    }
    
    /// 新しいオブジェクトを生成する
    ///
    /// - Parameter type: 型
    /// - Returns: 新しいオブジェクト
    func instantiate<T>(decodableType type: T.Type) -> T where T: Decodable {
        let emptyJsonData = "{}".data(using: .utf8)!
        return try! JSONDecoder().decode(type, from: emptyJsonData)
    }
    
    /// 指定のオブジェクトを複写した新しいオブジェクトを生成する
    ///
    /// - Parameters:
    ///   - value: 複写元のオブジェクト
    ///   - type: 型
    /// - Returns: 複写された新しいオブジェクト
    func clone<T>(_ value: T, type: T.Type) -> T where T: Codable {
        guard
            let encodedData = try? JSONEncoder().encode(value),
            let decodedObject = try? JSONDecoder().decode(type, from: encodedData)
            else {
                fatalError("JsonCoder Error: failed copy instance")
        }
        return decodedObject
    }
}
