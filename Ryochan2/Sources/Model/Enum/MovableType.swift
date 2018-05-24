// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// 可動領域
///
/// - notMovable: 動かせない
/// - vertically: 垂直方向のみ動かせる
/// - freely: 自由に動かせる
/// - both: 左右対象に動かせる
enum MovableType {
    
    /// 動かせない
    case notMovable
    
    /// 垂直方向のみ動かせる
    case vertically(area: CGFloat)
    
    /// 自由に動かせる
    case freely
    
    /// 左右対象に動かせる
    case both(area: CGFloat)
    
}

extension MovableType {
    
    /// 動かせないかどうか
    var isNotMovable: Bool {
        switch self { case .notMovable: return true default: return false }
    }
    
    /// 垂直方向のみ動かせるかどうか
    var isVertically: Bool {
        switch self { case .vertically(_): return true default: return false }
    }
    
    /// 自由に動かせるかどうか
    var isFreely: Bool {
        switch self { case .freely: return true default: return false }
    }
    
    /// 左右対象に動かせるかどうか
    var isBoth: Bool {
        switch self { case .both(_): return true default: return false }
    }
}
