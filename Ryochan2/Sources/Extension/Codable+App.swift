// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation
import CoreGraphics

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
