//
//  MyIndicator.swift
//  Assignment
//
//  Created by MacBook Pro on 25/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import UIKit

class MyIndicator: UIActivityIndicatorView
{
     override init(frame: CGRect) {
        super.init(frame: frame)
        self.style = .large
        self.startAnimating()
        self.hidesWhenStopped = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
