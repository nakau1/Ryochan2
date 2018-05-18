// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol UniformEditPresentable: class {
    
}

protocol UniformEditViewable: class {
    
}

class UniformEditPresenter: UniformEditPresentable {
    
    weak var view: UniformEditViewable!
    
    init(view: UniformEditViewable) {
        self.view = view
    }
}
