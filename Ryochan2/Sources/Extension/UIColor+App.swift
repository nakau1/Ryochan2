// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension UIColor {
    
    /// RGB値で初期化
    ///
    /// - Parameter rgb: RGB値
    convenience init(rgb: Int) {
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >>  8) / 255.0
        let b = CGFloat( rgb & 0x0000FF       ) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// RGB値
    var rgb: Int {
        var r: CGFloat = -1, g: CGFloat = -1, b: CGFloat = -1, a: CGFloat = -1
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (int(float: r) * 0x010000) + (int(float: g) * 0x000100) + int(float: b)
    }
    
    private static func int(float: CGFloat) -> Int {
        return Int(round(float * 255.0))
    }
    
    private func int(float: CGFloat) -> Int {
        return UIColor.int(float: float)
    }
}

extension UIColor {
    
    /// ホワイトの強さ
    var whiteness: CGFloat {
        var r: CGFloat = -1, g: CGFloat = -1, b: CGFloat = -1, a: CGFloat = -1
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (77 * r + 151 * g + 28 * b) / 255
    }
    
    /// ホワイトが強いかどうか
    var isWhiter: Bool {
        return whiteness >= 0.5
    }
}

extension UIColor {
    
    static func ==(lhs: UIColor, rhs: UIColor) -> Bool {
        var lr: CGFloat = -1, lg: CGFloat = -1, lb: CGFloat = -1, la: CGFloat = -1
        lhs.getRed(&lr, green: &lg, blue: &lb, alpha: &la)
        
        var rr: CGFloat = -1, rg: CGFloat = -1, rb: CGFloat = -1, ra: CGFloat = -1
        rhs.getRed(&rr, green: &rg, blue: &rb, alpha: &ra)
        
        let equalR = int(float: lr) == int(float: rr)
        let equalG = int(float: lg) == int(float: rg)
        let equalB = int(float: lb) == int(float: rb)
        let equalA = int(float: la) == int(float: ra)
        
        return equalR && equalG && equalB && equalA
    }
}
