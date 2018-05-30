// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class PortraitImageGenerator: CompoundedImageGeneratorProtocol {

    private var portrait: Portrait!
    
    func generateImage(of portrait: Portrait) -> UIImage {
        self.portrait = portrait
        return generateImage()
    }
    
    var compoundOrder: [Parts] {
        return [
            portrait.backHair,
            portrait.contour,
            portrait.baseHair,
            portrait.brows,
            portrait.eye,
            portrait.nose,
            portrait.mouth,
            portrait.mustache,
            portrait.beard,
            portrait.hair,
            portrait.accessory,
        ]
    }
    
    var destinationImageSize: CGSize {
        return .portrait
    }
    
    func beforeCompound() {
        // NOP.
    }
    
    func afterCompound() {
        // NOP.
    }
}
