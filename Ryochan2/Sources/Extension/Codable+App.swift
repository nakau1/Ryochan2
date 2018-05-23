// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation
import CoreGraphics

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

extension Decodable {
    
}

extension KeyedDecodingContainerProtocol {
    
    func to<T: Decodable>(_ type: T.Type, _ key: Key, _ substitute: T) -> T {
        guard let tmp = try? decodeIfPresent(type, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
    
    func string(_ key: Key, _ substitute: String = "") -> String {
        guard let tmp = try? decodeIfPresent(String.self, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
    
    func int(_ key: Key, _ substitute: Int = 0) -> Int {
        guard let tmp = try? decodeIfPresent(Int.self, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
    
    func bool(_ key: Key, _ substitute: Bool = false) -> Bool {
        guard let tmp = try? decodeIfPresent(Bool.self, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
    
    func cgfloat(_ key: Key, _ substitute: CGFloat = 0) -> CGFloat {
        guard let tmp = try? decodeIfPresent(CGFloat.self, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
    
    func point(_ key: Key, _ substitute: CGPoint = .zero) -> CGPoint {
        guard let tmp = try? decodeIfPresent(CGPoint.self, forKey: key), let ret = tmp else {
            return substitute
        }
        return ret
    }
}
