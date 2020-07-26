//
//  PhotoCollectionViewCell.swift
//  Assignment
//
//  Created by MacBook Pro on 25/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell
{
     lazy var imageDisplay : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(systemName: "person.fill")
        return img
    }()
    
     lazy var imageAuthorName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Image Name"
        return label
    }()
    
    override init(frame : CGRect)
    {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
        contentView.addSubview(imageDisplay)
        contentView.addSubview(imageAuthorName)
       // contentView.layer.borderWidth = 1
        //contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        imageDisplay.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        imageDisplay.bottomAnchor.constraint(equalToSystemSpacingBelow: imageAuthorName.topAnchor, multiplier: 8).isActive = true
        imageDisplay.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 2).isActive = true
        imageDisplay.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: 2).isActive = true
        
        imageAuthorName.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: contentView.safeAreaLayoutGuide.bottomAnchor, multiplier: 8).isActive = true
        imageAuthorName.centerXAnchor.constraint(equalTo: imageDisplay.centerXAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
