// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// パーツ色の種別
enum PartsColorType {
    
    /// パーツ色を変更できない
    case none
    
    /// パーツ色を変更できる(輪郭線なし)
    case colorable
    
    /// パーツ色を変更できる(輪郭線あり)
    case outlinedColorable
}
