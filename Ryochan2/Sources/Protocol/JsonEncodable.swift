// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol JsonEncodable {}

extension JsonEncodable {
    
    func saveJson<T>(_ object: T, to path: String) where T: Encodable {
        
        
        
    }
    
    func jsonEncodedData<T>(_ object: T) -> Data where T: Encodable {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        return (try? encoder.encode(object)) ?? Data()
    }
}
