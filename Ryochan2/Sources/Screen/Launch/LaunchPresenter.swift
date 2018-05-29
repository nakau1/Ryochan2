// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol LaunchPresentable: class {
    
    func executeLaunching()
}

protocol LaunchViewable: class {
    
    func showResultExecuteLaunching()
}

class LaunchPresenter: LaunchPresentable {
    
    weak var view: LaunchViewable!
    
    init(view: LaunchViewable) {
        self.view = view
    }
    
    func executeLaunching() {
        // マイグレーション
        let migration = Migration()
        if migration.needsMigration {
            migration.migrate() { [unowned self] in
                self.view.showResultExecuteLaunching()
            }
        } else {
            view.showResultExecuteLaunching()
        }
    }
}
