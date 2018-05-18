// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol UniformListPresentable: class {
    
}

protocol UniformListViewable: class {
    
}

class UniformListPresenter: UniformListPresentable {
    
    weak var view: UniformListViewable!
    
    init(view: UniformListViewable) {
        self.view = view
    }
}
