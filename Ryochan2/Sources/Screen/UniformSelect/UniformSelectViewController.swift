// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class UniformSelectViewController: UIViewController {
    
    private var presenter: UniformSelectPresentable!
    private var adapter: UniformSelectAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = UniformSelectPresenter(view: vc)
        vc.adapter = UniformSelectAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UniformSelectViewController: UniformSelectViewable {
    
}

extension UniformSelectViewController: UniformSelectAdapterDelegate {
    
}
