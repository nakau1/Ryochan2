// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class PortraitEditViewController: UIViewController {
    
    private var presenter: PortraitEditPresentable!
    private var adapter: PortraitEditAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = PortraitEditPresenter(view: vc)
        vc.adapter = PortraitEditAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PortraitEditViewController: PortraitEditViewable {
    
}

extension PortraitEditViewController: PortraitEditAdapterDelegate {
    
}
