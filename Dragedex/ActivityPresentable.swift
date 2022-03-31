//
//  ActivityPresentable.swift
//  Dragedex
//
//  Created by Majka on 31/03/2022.
//

import UIKit

protocol ActivityPresentable: AnyObject {
    var activityIndicator: UIActivityIndicatorView? { get set }
    var activityIndicatorContainer: UIView { get }
    var viewsToToggleHidden: [UIView] { get }
    var viewsToToggleEnabled: [UIView] { get }
    func startActivity()
    func stopActivity()
}

extension ActivityPresentable {
    func startActivity() {
        let activity = UIActivityIndicatorView()
        activityIndicator = activity
        activityIndicatorContainer.addSubview(activity)
        
        let xConstraint = activity.centerXAnchor.constraint(equalTo: activityIndicatorContainer.centerXAnchor)
        let yConstraint = activity.centerYAnchor.constraint(equalTo: activityIndicatorContainer.centerYAnchor)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        
        activityIndicator?.startAnimating()
        viewsToToggleHidden.forEach {
            $0.isHidden = true
        }
        viewsToToggleEnabled.forEach {
            $0.isUserInteractionEnabled = false
        }
    }
    
    func stopActivity() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
        viewsToToggleHidden.forEach {
            $0.isHidden = false
        }
        viewsToToggleEnabled.forEach {
            $0.isUserInteractionEnabled = true
        }
    }
}
