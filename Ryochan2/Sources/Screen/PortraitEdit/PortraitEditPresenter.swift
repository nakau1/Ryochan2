// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol PortraitEditPresentable: class {
    
}

protocol PortraitEditViewable: class {
    
}

class PortraitEditPresenter: PortraitEditPresentable {
    
    weak var view: PortraitEditViewable!
    
    init(view: PortraitEditViewable) {
        self.view = view
    }
}
