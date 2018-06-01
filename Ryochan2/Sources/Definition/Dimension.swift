// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension CGFloat {
    
    /// 画面の幅
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    /// 画面の高さ
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    /// アラートダイアログの幅
    static let alertDialogWidth: CGFloat = screenWidth * 0.8
    
    /// 右ドローメニューの幅
    static let rightDrawWidth: CGFloat = screenWidth * 0.8
}

extension CGSize {
    
    /// 似顔絵の生サイズ
    static let portrait = CGSize(width: 500, height: 500)
    
    /// ユニフォームの生サイズ
    static let uniform = CGSize(width: 500, height: 500)
}
