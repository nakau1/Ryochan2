// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class UniformListViewController: UIViewController {
    
    private var presenter: UniformListPresentable!
    private var adapter: UniformListAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = UniformListPresenter(view: vc)
        vc.adapter = UniformListAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UniformListViewController: UniformListViewable {
    
}

extension UniformListViewController: UniformListAdapterDelegate {
    
}
