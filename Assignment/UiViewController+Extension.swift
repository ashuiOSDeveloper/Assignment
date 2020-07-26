//
//  UiViewController+Extension.swift
//  Assignment
//
//  Created by Ashutosh Shukla on 25/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import UIKit

extension UIViewController
{
    func createAlert(withTitle title : String?,andMessage message : String?)
    {
        let messageAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        messageAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(messageAlert, animated: true, completion: nil)
    }
}
