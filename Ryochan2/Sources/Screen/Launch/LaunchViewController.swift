// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class LaunchViewController: UIViewController {
    
    private var presenter: LaunchPresentable!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = LaunchPresenter(view: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LaunchViewController: LaunchViewable {
    
}
