// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol UniformSelectPresentable: class {
    
}

protocol UniformSelectViewable: class {
    
}

class UniformSelectPresenter: UniformSelectPresentable {
    
    weak var view: UniformSelectViewable!
    
    init(view: UniformSelectViewable) {
        self.view = view
    }
}
