// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol FormationSubstituteAdapterDelegate: class {
    
}

class FormationSubstituteAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    weak var delegate: FormationSubstituteAdapterDelegate!
    
    init(delegate: FormationSubstituteAdapterDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FormationSubstituteAdapterCell
        
        return cell
    }
}

class FormationSubstituteAdapterCell: UICollectionViewCell {
    
}
