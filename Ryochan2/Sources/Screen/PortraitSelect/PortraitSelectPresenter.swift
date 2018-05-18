// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol PortraitSelectPresentable: class {
    
}

protocol PortraitSelectViewable: class {
    
}

class PortraitSelectPresenter: PortraitSelectPresentable {
    
    weak var view: PortraitSelectViewable!
    
    init(view: PortraitSelectViewable) {
        self.view = view
    }
}
