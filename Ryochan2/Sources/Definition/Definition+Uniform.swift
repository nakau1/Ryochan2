// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension Const {
    
    /// ユニフォーム
    struct Uniform {
        
        /// デフォルト名
        static let defaultName = "ユニフォーム名"
        
        /// 最小登録数
        static let minimumNumber = 2
        
        /// 最大登録数
        static let limitedNumber = 15
    }
}

extension Path {
    
    /// ユニフォーム
    struct Uniform {
        
        /// 一覧用のJSONファイルのパス
        static var json: String {
            return documentDirectory.path("uniforms.json")
        }
        
        /// ディレクトリのパス
        static var directory: String {
            return documentDirectory.path("Uniforms")
        }
        
        /// サムネイル画像ファイルのパス
        ///
        /// - Parameter uniform: ユニフォームオブジェクト
        /// - Returns: パス文字列
        static func thumb(of uniform: Ryochan2.Uniform) -> String {
            return directory.path("\(uniform.id)_thumb.png")
        }
    }
}

extension Notification.Name {
    
    /// ユニフォームが更新された時
    static let UniformDidUpdate = Notification.Name("Uniform.didUpdate")
}

extension UIColor {
    
    /// 肌の色
    static let skinColors = [#colorLiteral(red: 0.9764705882, green: 0.8431372549, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.7843137255, green: 0.6196078431, blue: 0.4823529412, alpha: 1), #colorLiteral(red: 1, green: 0.9411764706, blue: 0.8901960784, alpha: 1), #colorLiteral(red: 0.9960784314, green: 0.8352941176, blue: 0.6274509804, alpha: 1), #colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.8039215686, alpha: 1)]
    
    /// ベース髪の色
    static let baseHairColors = [#colorLiteral(red: 0.6352941176, green: 0.5019607843, blue: 0.3764705882, alpha: 1), #colorLiteral(red: 0.5058823529, green: 0.3098039216, blue: 0.1098039216, alpha: 1), #colorLiteral(red: 0.137254902, green: 0.09411764706, blue: 0.08235294118, alpha: 1), #colorLiteral(red: 0.3098039216, green: 0.2705882353, blue: 0.1921568627, alpha: 1)]
    
    /// 髪の色
    static let hairColors = [#colorLiteral(red: 0.2862745098, green: 0.1607843137, blue: 0.04705882353, alpha: 1), #colorLiteral(red: 0.5058823529, green: 0.3098039216, blue: 0.1098039216, alpha: 1), #colorLiteral(red: 0.2862745098, green: 0.1607843137, blue: 0.04705882353, alpha: 1), #colorLiteral(red: 0.137254902, green: 0.09411764706, blue: 0.08235294118, alpha: 1), #colorLiteral(red: 0.4117647059, green: 0.3568627451, blue: 0.1803921569, alpha: 1), #colorLiteral(red: 0.7058823529, green: 0.6352941176, blue: 0.4156862745, alpha: 1), #colorLiteral(red: 0.5843137255, green: 0.3960784314, blue: 0.07843137255, alpha: 1), #colorLiteral(red: 0.3450980392, green: 0.1411764706, blue: 0.01960784314, alpha: 1), #colorLiteral(red: 0.4274509804, green: 0.2509803922, blue: 0.03921568627, alpha: 1), #colorLiteral(red: 0.2666666667, green: 0.1882352941, blue: 0.03137254902, alpha: 1)]
    
    /// スパイクの色
    static let spikeColors = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9841352105, green: 0.9841352105, blue: 0.9841352105, alpha: 1), #colorLiteral(red: 0, green: 0.9098039216, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.7882352941, green: 0.07843137255, blue: 0.07843137255, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0, green: 0.4039215686, blue: 0.7607843137, alpha: 1), #colorLiteral(red: 1, green: 0, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 1, green: 0.3529411765, blue: 0.1490196078, alpha: 1), #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)]
}

