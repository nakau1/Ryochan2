// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class PortraitSelectViewController: UIViewController {
    
    private var presenter: PortraitSelectPresentable!
    private var adapter: PortraitSelectAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = PortraitSelectPresenter(view: vc)
        vc.adapter = PortraitSelectAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PortraitSelectViewController: PortraitSelectViewable {
    
}

extension PortraitSelectViewController: PortraitSelectAdapterDelegate {
    
}
