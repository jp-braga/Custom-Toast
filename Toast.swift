//
//  Toast.swift
//  SuperApp
//
//  Created by Mac on 05/11/21.
//

import UIKit


class Toast {
    
    static private func show(backgroundColor: UIColor?, image: UIImage?, text: String, viewController: UIViewController) {
        
        let toastContainer = UIView(frame: .zero)
        toastContainer.backgroundColor = backgroundColor != nil ? backgroundColor : UIColor(withHex: "#00A6EB")
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 15.0
        toastContainer.clipsToBounds = true
        toastContainer.setShadowColor()
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.setShadowColor()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let message = UILabel(frame: .zero)
        message.textAlignment = .left
        message.text = text
        message.numberOfLines = 0
        message.sizeToFit()
        message.textColor = .white
        message.setShadowColor()
        message.translatesAutoresizingMaskIntoConstraints = false
        
        toastContainer.addSubview(imageView)
        toastContainer.addSubview(message)
        viewController.view.addSubview(toastContainer)
        viewController.navigationController?.isNavigationBarHidden = true
        viewController.view.bringSubviewToFront(toastContainer)
        
        NSLayoutConstraint.activate([toastContainer.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 20),
                                     toastContainer.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 40),
                                     toastContainer.rightAnchor.constraint(equalTo: viewController.view.rightAnchor,constant: -20),
                                     toastContainer.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 20),
                                     imageView.widthAnchor.constraint(equalToConstant: 30),
                                     imageView.heightAnchor.constraint(equalToConstant: 30),
                                     imageView.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor)])
        
        NSLayoutConstraint.activate([message.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
                                     message.topAnchor.constraint(equalTo: toastContainer.topAnchor, constant: 10),
                                     message.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -20),
                                     message.bottomAnchor.constraint(equalTo: toastContainer.bottomAnchor, constant: -10)])
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, delay: 2.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: { _ in
                toastContainer.removeFromSuperview()
                viewController.navigationController?.isNavigationBarHidden = false
            })
        })
    }
    
    
    static func showWarningAlert(withText text: String, insideViewController viewController: UIViewController) {
        self.show(backgroundColor: UIColor(withHex: "#FF9700"), image: UIImage(named: "warning"), text: text, viewController: viewController)
    }
    
    static func showSuccessAlert(withText text: String, insideViewController viewController: UIViewController) {
        self.show(backgroundColor: UIColor(withHex: "#38B13D"), image: UIImage(named: "success"), text: text, viewController: viewController)
    }
    
    static func showErrorAlert(withText text: String, insideViewController viewController: UIViewController) {
        self.show(backgroundColor: UIColor(withHex: "#E51C24"), image: UIImage(named: "error"), text: text, viewController: viewController)
    }
    
    static func showMessageAlert(withText text: String, insideViewController viewController: UIViewController) {
        self.show(backgroundColor: UIColor(withHex: "#00A6EB"), image: UIImage(named: "about"), text: text, viewController: viewController)
    }
}
