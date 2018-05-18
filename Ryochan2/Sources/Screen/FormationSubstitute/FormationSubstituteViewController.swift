// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class FormationSubstituteViewController: UIViewController {
    
    private var presenter: FormationSubstitutePresentable!
    private var adapter: FormationSubstituteAdapter!
    
    class func create() -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = FormationSubstitutePresenter(view: vc)
        vc.adapter = FormationSubstituteAdapter(delegate: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FormationSubstituteViewController: FormationSubstituteViewable {
    
}

extension FormationSubstituteViewController: FormationSubstituteAdapterDelegate {
    
}
