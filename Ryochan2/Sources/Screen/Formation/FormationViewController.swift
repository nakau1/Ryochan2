// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class FormationViewController: UIViewController {
    
    private var presenter: FormationPresentable!
    private var adapter: FormationAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = FormationPresenter(view: vc)
        vc.adapter = FormationAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FormationViewController: FormationViewable {
    
}

extension FormationViewController: FormationAdapterDelegate {
    
}
