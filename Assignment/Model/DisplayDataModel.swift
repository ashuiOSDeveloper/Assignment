//
//  DataModel.swift
//  Assignment
//
//  Created by Ashutosh Shukla on 25/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import Foundation
import UIKit

struct DisplayData {
    var imageAuthorName : String?
    var image : UIImage?
    
    init(imageAuthorName : String?,imageURL : String?,image : UIImage?) {
        self.imageAuthorName = imageAuthorName
        self.image = image
    }
}
