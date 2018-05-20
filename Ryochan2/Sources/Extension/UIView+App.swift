// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension UIView {
    
    class func instantiate<T>(_ type: T.Type) -> T where T: UIView {
        let className = NSStringFromClass(self).components(separatedBy: ".").last!
        let nib = UINib(nibName: className, bundle: nil)
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? T {
            return view
        } else {
            fatalError("can not instantiate. \(className)")
        }
    }
    
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            var r = frame
            r.size.width = newValue
            frame = r
        }
    }
}
