// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol JsonEncodable {}

extension JsonEncodable {
    
    func saveJson<T>(_ object: T, to path: String) where T: Encodable {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
            
            let encodedData = (try? encoder.encode(object)) ?? Data()
            try encodedData.write(to: URL(fileURLWithPath: path))
        } catch let error {
            print("JsonEncodable Error: failed save json: \(error.localizedDescription)")
        }
    }
}
