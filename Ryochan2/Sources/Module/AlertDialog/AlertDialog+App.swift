// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension AlertDialog {
    
    class func showConfirmDelete(from viewController: UIViewController, whenDelete: @escaping AlertDialogAction.Handler) {
        showDeleteCancel(from: viewController, message: "削除しますか", whenDelete: whenDelete)
    }
    
    class func showErrorDueMinimumNumber(from viewController: UIViewController) {
        showOK(from: viewController, message: "これ以上削除できません") {}
    }
}
