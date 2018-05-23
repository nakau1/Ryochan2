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
        exexuteMigration()
        view.showResultExecuteLaunching()
    }
    
    private func exexuteMigration() {
        let migration = Migration()
        
        migration.reset()
        migration.printDirectory()
        if migration.needsMigration {
            migration.migrate()
        }
    }
}
