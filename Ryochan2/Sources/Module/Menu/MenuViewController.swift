// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class MenuViewController: UIViewController {
    
    class func show(from viewController: UIViewController) -> UIViewController {
        let vc = create().withinNavigation(navigationBarHidden: true)
        Dialog.show(vc, from: viewController, behavior: .menu)
        return vc
    }
    
    class func create() -> UIViewController {
        return instantiate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
