//
//  ViewController+UICollectionViewDataSource.swift
//  Assignment
//
//  Created by MacBook Pro on 24/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    //Return number of sections in collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Number of items as received in JSON
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
            else{
                return UICollectionViewCell()
        }
        let displayData = mainDataArray[indexPath.row]
        photoCell.imageAuthorName.text = displayData.imageAuthorName ?? ""
        photoCell.imageDisplay.image = displayData.image
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch UIDevice.current.orientation {
        case .unknown,.portrait,.portraitUpsideDown:
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/3.2)
        case .landscapeRight,.landscapeLeft:
            return CGSize(width: collectionView.frame.width/3.1, height: collectionView.frame.height/1.5)
        default:
            print("default case")
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/4)

        }

    }
    
}
