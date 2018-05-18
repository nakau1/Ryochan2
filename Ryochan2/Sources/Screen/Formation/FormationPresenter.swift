// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol FormationPresentable: class {
    
}

protocol FormationViewable: class {
    
}

class FormationPresenter: FormationPresentable {
    
    weak var view: FormationViewable!
    
    init(view: FormationViewable) {
        self.view = view
    }
}
