// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension Const {
    
    /// フォーメーション
    struct Formation {
        
        /// チーム名初期値
        static let teamDefaultName = "JAPAN"
        
        /// タイトル初期値
        static let titleDefaultText = "2018.6.9\nCOLOMBIA - JAPAN"
        
        /// ポジション画像の縦横比率
        static let positionRatio: CGFloat = 44 / 70
    }
}

extension Path {
    
    struct Formation {
        
        /// 一覧用のJSONファイルのパス
        static var json: String {
            return documentDirectory.path("formations.json")
        }
    }
}

extension Notification.Name {
    
    /// フォーメーション雛形を選択した時
    static let PositionTemplateDidSelect = Notification.Name("Formation.positionTemplateDidSelect")
}
