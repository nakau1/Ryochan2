// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation

/// 定数
struct Const {
    
}

/// ファイルパス
struct Path {
    
    /// ドキュメントディレクトリ
    static var documentDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    }
}
