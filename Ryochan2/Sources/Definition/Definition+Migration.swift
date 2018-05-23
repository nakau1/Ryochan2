// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation

extension Const {
    
    struct Migration {
        
        /// パーツ素材のZIPファイル名(拡張子なし)
        static let zipFileName = "Resources"
    }
}

extension Path {
    
    struct Migration {
        
        /// ZIPファイルのパス
        static var zipSource: String {
            return Bundle.main.path(forResource: Const.Migration.zipFileName, ofType: "zip")!
        }
    }
}
