// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

/// パーツの合成画像を作成するイメージジェネレータプロトコル
protocol CompoundedImageGeneratorProtocol {
    
    /// 合成するパーツの順番
    var compoundOrder: [Parts] { get }
    
    /// 作成後の画像サイズ
    var destinationImageSize: CGSize { get }
    
    /// 合成前の処理
    func beforeCompound()
    
    /// 合成後の処理
    func afterCompound()
}

extension CompoundedImageGeneratorProtocol {
    
    /// 画像を生成する
    /// - Returns: 似顔絵画像
    func generateImage() -> UIImage {
        return UIImage.imageFromContext(destinationImageSize) { _ in
            beforeCompound()
            compoundOrder.forEach { parts in
                draw(parts: parts)
            }
            afterCompound()
        }
    }
    
    private func draw(parts: Parts) {
        guard let image = imageByColorType(of: parts) else {
            return
        }
        if parts.category.movableType.isBoth {
            drawSeparatedImage(image, position: parts.position, separate: parts.separatedDistance)
        } else if parts.category.movableType.isVertically {
            drawImage(image, position: positionForVertically(image, position: parts.position))
        } else {
            var pos = parts.position
            if parts.category.movableType.isVertically {
                pos = positionForVertically(image, position: pos)
            }
            drawImage(image, position: pos)
        }
    }
    
    private func drawSeparatedImage(_ image: UIImage, position: CGPoint, separate: CGFloat) {
        let positions = calculatedImagePositions(image, position: position, separate: separate)
        let images = image.separated()
        images.left.draw(in: CGRect(positions.left, images.left.size))
        images.right.draw(in: CGRect(positions.right, images.right.size))
    }
    
    func drawImage(_ image: UIImage, position: CGPoint) {
        image.draw(in: CGRect(position, image.size))
    }
    
    private func imageByColorType(of parts: Parts) -> UIImage? {
        switch parts.category.partsColorType {
        case .none:              return parts.image
        case .colorable:         return coloredImage(of: parts, isColorMaterial: false)
        case .outlinedColorable: return outlinedColoredImage(of: parts)
        }
    }
    
    private func coloredImage(of parts: Parts, isColorMaterial: Bool) -> UIImage? {
        let image = isColorMaterial ? parts.colorImage : parts.image
        return image?.masked(color: parts.color)
    }
    
    private func outlinedColoredImage(of parts: Parts) -> UIImage? {
        guard
            let outline = parts.image,
            let colored = coloredImage(of: parts, isColorMaterial: true)
            else {
                return nil
        }
        return UIImage.imageFromContext(outline.size) { _ in
            let rect = CGRect(origin: .zero, size: outline.size)
            colored.draw(in: rect)
            outline.draw(in: rect)
        }
    }
    
    private func positionForVertically(_ image: UIImage, position: CGPoint) -> CGPoint {
        let x = (destinationImageSize.width - image.size.width) / 2
        let y = position.y
        return CGPoint(x, y)
    }
    
    private func calculatedLeftImagePosition(_ image: UIImage, position: CGPoint, separate: CGFloat) -> CGPoint {
        var position = position
        position.x -= separate
        return position
    }
    
    private func calculatedRightImagePosition(_ image: UIImage, position: CGPoint, separate: CGFloat) -> CGPoint {
        var position = position + image.size.horizontalHalfPoint
        position.x += separate
        return position
    }
    
    private func calculatedImagePositions(_ image: UIImage, position: CGPoint, separate: CGFloat) -> (left: CGPoint, right: CGPoint) {
        return (
            left:  calculatedLeftImagePosition(image, position: position, separate: separate),
            right: calculatedRightImagePosition(image, position: position, separate: separate)
        )
    }
}
