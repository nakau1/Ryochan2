// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol FormationSubstitutePresentable: class {
    
}

protocol FormationSubstituteViewable: class {
    
}

class FormationSubstitutePresenter: FormationSubstitutePresentable {
    
    weak var view: FormationSubstituteViewable!
    
    init(view: FormationSubstituteViewable) {
        self.view = view
    }
}
