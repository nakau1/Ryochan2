// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// SNS共有用クラス
class Sns {
    
    /// SNSに共有する画面を表示する
    ///
    /// - Parameters:
    ///   - viewController: 表示元の画面
    ///   - items: 共有に含めるアイテムの配列
    class func show(from viewController: UIViewController, items: [Any]) {
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        viewController.present(vc, animated: true, completion: nil)
    }
    
    /// 画像をSNSに共有する画面を表示する
    ///
    /// - Parameters:
    ///   - viewController: 表示元の画面
    ///   - image: 画像
    class func show(from viewController: UIViewController, image: UIImage) {
        show(from: viewController, items: [" #似顔絵アプリ", image])
    }
}
