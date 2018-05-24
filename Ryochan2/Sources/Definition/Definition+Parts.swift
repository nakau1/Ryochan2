// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Foundation

extension Const {
    
    struct Parts {
        
        /// JSONファイル名
        static let jsonFileName = "parts.json"
        
        /// 画像の拡張子
        static let imageExtension = ".png"
        
        /// 色素材画像のサフィックス
        static let colorPartsImageSuffix = ".color"
    }
}

extension Path {
    
    struct Parts {
        
        /// 一覧用のJSONファイルのパス
        static var json: String {
            return documentDirectory.path(Const.Parts.jsonFileName)
        }
    }
}
