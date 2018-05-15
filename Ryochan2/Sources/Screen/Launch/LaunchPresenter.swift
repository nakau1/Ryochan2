// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol LaunchPresentable: class {
    
}

protocol LaunchViewable: class {
    
}

class LaunchPresenter: LaunchPresentable {
    
    weak var view: LaunchViewable!
    
    init(view: LaunchViewable) {
        self.view = view
    }
}
