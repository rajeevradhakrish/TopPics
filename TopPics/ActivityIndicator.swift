//
//  ActivityIndicator.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import Foundation
import NVActivityIndicatorView
class ActivityIndicator {
    
    static let shared=ActivityIndicator()
    var activityIndicator:NVActivityIndicatorView
    init() {
        let bounds=UIScreen.main.bounds
        let frame=CGRect(x: (bounds.size.width/2)-25, y: bounds.size.height/2-25, width: 50, height: 50)
        self.activityIndicator=NVActivityIndicatorView(frame: frame, type: .ballSpinFadeLoader, color: .white, padding: 0)
        
    }
    func showLoader(onView view:UIView,clearFlag:Bool)
    {
        activityIndicator.startAnimating()
        let parentView=UIVisualEffectView(frame: UIScreen.main.bounds)
        parentView.effect = UIBlurEffect(style: clearFlag ? .extraLight : .dark)
        parentView.backgroundColor =  .clear
        parentView.contentView.addSubview(activityIndicator)
        view.addSubview(parentView)
    }
    
    func removeLoader()
    {
        activityIndicator.stopAnimating()
        let view=activityIndicator.superview?.superview
        view?.removeFromSuperview()
    }
    
}

