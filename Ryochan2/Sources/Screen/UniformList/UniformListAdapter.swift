// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

protocol UniformListAdapterDelegate: class {
    
}

class UniformListAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    weak var delegate: UniformListAdapterDelegate!
    
    init(delegate: UniformListAdapterDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UniformListAdapterCell
        
        return cell
    }
}

class UniformListAdapterCell: UICollectionViewCell {
    
}
