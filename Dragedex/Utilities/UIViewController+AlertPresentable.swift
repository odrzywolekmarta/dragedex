//
//  UIViewController+AlertPresentable.swift
//  Dragedex
//
//  Created by Majka on 14/04/2022.
//

import UIKit

extension UIViewController {
    func presentAlert(with error: Error) {
        let alertController = UIAlertController(title: "Oops!", message:
                "Something went wrong :(", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(alertController, animated: true, completion: nil)
    }
}
