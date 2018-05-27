// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation

extension Const {
    
    struct Parts {
        
        /// 色素材画像のサフィックス
        static let colorResourceSuffix = "color"
    }
}

extension Path {
    
    struct Parts {
        
        /// 似顔絵パーツ素材のJSONファイル
        static var portraitJson: String {
            return documentDirectory.path("portrait.parts.json")
        }
        
        /// ユニフォームパーツ素材のJSONファイル
        static var uniformJson: String {
            return documentDirectory.path("uniform.parts.json")
        }
        
        /// 似顔絵パーツ素材のディレクトリ
        static var portraitDirectory: String {
            return documentDirectory.path("parts", makeDirectory: true).path("portrait", makeDirectory: true)
        }
        
        /// ユニフォームパーツ素材のディレクトリ
        static var uniformDirectory: String {
            return documentDirectory.path("parts", makeDirectory: true).path("uniform", makeDirectory: true)
        }
    }
}
