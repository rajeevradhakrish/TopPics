//
//  AlertManager.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation

import SCLAlertView

class AlertManager{
    
    static let shared=AlertManager()

    private func initializedView()->SCLAlertView
    {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        return SCLAlertView(appearance: appearance)
    }
    public func showAlertError(forMessage message:String,desc:String)
    {
        let view=initializedView()
        view.addButton("OK", action: {})
        view.showError("Error", subTitle: message)
    }
    public func showAlertError(forMessage message:String,desc:String,completion: (()->Void)?)
    {
        let view=initializedView()
        view.addButton("OK", action: {
            completion?()
        })
        view.showError("Error", subTitle: message)
        print(desc)
    }
    public func showWarning(forMessage message:String,completion: (()->Void)?)
    {
        let view=initializedView()
        view.addButton("Yes", action: {
            completion?()
        })
        view.addButton("Cancel", action: {
        })
        view.showWarning("", subTitle: message)
    }
    
    public func showWarning(forMessage message:String,agreeText:String,cancelText:String, completion: (()->Void)?)
    {
        let view=initializedView()
        view.addButton(agreeText, action: {
            completion?()
        })
        view.addButton(cancelText, action: {
        })
        view.showWarning("", subTitle: message)
    }
    
    public func showSuccess(forMessage message:String,completion: (()->Void)?)
    {
        let view=initializedView()
        view.addButton("OK", action: {
            completion?()
        })
        view.showSuccess("", subTitle: message)
    }
    
    public func showForcedAlert(forMessage message:String,completion: (()->Void)?)
    {
        let view=initializedView()
        view.addButton("OK", action: {
            completion?()
        })
        view.showWarning("", subTitle: message)
    }
    
    
    
    public func showAlertActionSheet(onView:UIViewController,type:UIAlertController.Style,message:String, completion:@escaping ()->Void,cancel:@escaping ()->Void)
    {
        let alert=UIAlertController(title: "Alert", message: message, preferredStyle: type)
        let remove=UIAlertAction(title: "Yes", style: .destructive, handler: {_ in
            completion()
        })
        let cancel=UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            cancel()
        })
        alert.addAction(remove)
        alert.addAction(cancel)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = onView.view
            popoverController.sourceRect = CGRect(x: onView.view.bounds.midX, y: onView.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        onView.present(alert, animated: true, completion: nil)
    }
    
    public func showMoreAlertActionSheet(onView:UIViewController, type:UIAlertController.Style, header:String?, message:String?, actionNames:[String], actionCompletions:[(UIAlertAction)->Void],cancelAction: ((UIAlertAction)->Void)?)
    {
        let alert = UIAlertController(title: header, message: message, preferredStyle: type)
        actionNames.enumerated().forEach({(index,value) in alert.addAction(UIAlertAction(title: value, style: .default, handler: actionCompletions[index]))})
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: cancelAction)
        alert.addAction(cancel)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = onView.view
            popoverController.sourceRect = CGRect(x: onView.view.bounds.midX, y: onView.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        onView.present(alert, animated: true, completion: nil)
    }
        
}

public extension UIAlertController {
    func show() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}

