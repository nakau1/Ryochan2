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
    func jsonDecode<T>(path: String, to type: T.Type, default defaultValue: T) -> T where T: Decodable {
        guard
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let decoded = try? JSONDecoder().decode(type, from: data)
            else {
                return defaultValue
        }
        return decoded
    }
    
    func create<T>(_ type: T.Type) -> T where T: Decodable {
        let emptyJsonData = "{}".data(using: .utf8)!
        return try! JSONDecoder().decode(type, from: emptyJsonData)
    }
}
