// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class PartsThumbImageGenerator {
     
    func generate(path: String, category: Category) -> UIImage {
        let base = thumbBaseImage(of: category)
        let rect = CGRect(.zero, base.size)
        let ret = UIImage.imageFromContext(rect.size) { _ in
            if let partsImage = UIImage(path: path) {
                let partsRect = CGRect(category.initialPosition, partsImage.size)
                base.draw(in: rect)
                if category.hasColor {
                    if let color = UIImage(path: path.colorResourceName) {
                        let masked = color.masked(color: category.thumbDisplayColor)
                        masked?.draw(in: partsRect)
                        partsImage.draw(in: partsRect)
                    } else {
                        let masked = partsImage.masked(color: category.thumbDisplayColor)
                        masked?.draw(in: partsRect)
                    }
                } else {
                    partsImage.draw(in: partsRect)
                }
            }
        }
        return resizeImage(ret)
    }
    
    private func thumbBaseImage(of category: Category) -> UIImage {
        switch category.kind {
        case .portrait: return UIImage(named: "portrait_thumb_base")!
        case .uniform:  return UIImage(named: "uniform_thumb_base")!
        }
    }
    
    private func resizeImage(_ image: UIImage) -> UIImage {
        let width = (CGFloat.screenWidth / 5) * 2 // 2 = @2x  // TODO:5を定数化
        return image.scaled(to: CGSize(width, width))
    }
}
