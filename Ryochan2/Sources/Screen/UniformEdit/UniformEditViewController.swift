// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class UniformEditViewController: UIViewController {
    
    private var presenter: UniformEditPresentable!
    private var adapter: UniformEditAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = UniformEditPresenter(view: vc)
        vc.adapter = UniformEditAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UniformEditViewController: UniformEditViewable {
    
}

extension UniformEditViewController: UniformEditAdapterDelegate {
    
}
