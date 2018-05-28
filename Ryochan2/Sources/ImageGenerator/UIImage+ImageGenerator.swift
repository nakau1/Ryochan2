// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

extension UIImage {
    
    /// 指定のサイズに拡大縮小した画像を生成して返す
    /// - parameter size: サイズ
    /// - returns: 拡大縮小した画像
    func scaled(to size: CGSize) -> UIImage {
        return UIImage.imageFromContext(size) { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    /// 指定の領域で切り取った画像を生成して返す
    /// - parameter rect: 切り取る領域
    /// - returns: 切り取った画像
    func cropped(to rect: CGRect) -> UIImage {
        guard let ref = cgImage?.cropping(to: rect) else {
            return UIImage.imageFromContext(rect.size) { _ in } // 空の画像
        }
        return UIImage(cgImage: ref, scale: scale, orientation: imageOrientation)
    }
    
    /// 指定のサイズで中央から切り取った画像を生成して返す
    ///
    /// - Parameter size: 切り取るサイズ
    /// - Returns: 切り取った画層
    func fixed(size: CGSize) -> UIImage {
        return UIImage.imageFromContext(size) { _ in
            let rect = CGRect(
                (size.width - self.size.width) / 2,
                (size.height - self.size.height) / 2,
                self.size.width,
                self.size.height
            )
            draw(in: rect)
        }
    }
    
    /// 画像を半分に分割して返す
    /// - Returns: 左半分と右半分の画像
    func separated() -> (left: UIImage, right: UIImage) {
        let leftImage = cropped(to: CGRect(.zero, size.horizontalHalfSize))
        let rightImage = cropped(to: CGRect(size.horizontalHalfPoint, size.horizontalHalfSize))
        return(left: leftImage, right: rightImage)
    }
    
    /// 指定した色でマスクした画像を返す
    ///
    /// - Parameter color: 色
    /// - Returns: マスクした色
    func masked(color: UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let bitmap = CGImageAlphaInfo.premultipliedLast.rawValue
        let space = CGColorSpaceCreateDeviceRGB()
        
        let contextOrNil = CGContext(
            data: nil,
            width: Int(rect.width),
            height: Int(rect.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: space,
            bitmapInfo: bitmap
        )
        guard let context = contextOrNil else { return nil }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let imageRef = context.makeImage()!
        context.clear(rect)
        context.clip(to: rect, mask: cgImage!)
        context.draw(imageRef, in: rect)
        return UIImage(cgImage: context.makeImage()!)
    }
    
    /// 文字列を画像化する
    ///
    /// - Parameters:
    ///   - text: 文字列
    ///   - color: 文字色
    ///   - font: フォント
    /// - Returns: 画像化された文字
    class func text(_ text: String, color: UIColor = .black, font: UIFont = .systemFont(ofSize: 32)) -> UIImage {
        let ns = (text as NSString)
        let attributes: [NSAttributedStringKey : Any] = [
            .font: font,
            .foregroundColor: color,
            ]
        let size = ns.size(withAttributes: attributes)
        return UIImage.imageFromContext(size) { _ in
            ns.draw(at: .zero, withAttributes: attributes)
        }
    }
    
    class func imageFromContext(_ size: CGSize, _ block: (CGContext) -> Void) -> UIImage {
        UIGraphicsBeginImageContext(size)
        block(UIGraphicsGetCurrentContext()!)
        let ret = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return ret!
    }
}
