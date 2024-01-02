//
//  BaseViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    private var loadingView: UIView?
  
    func showLoading() {
          if loadingView == nil {
              loadingView = UIView(frame: view.bounds)
              loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.03)
              let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
              activityIndicator.center = loadingView!.center
              activityIndicator.color = .black
              loadingView?.addSubview(activityIndicator)
              view.addSubview(loadingView!)
              loadingView?.alpha = 0.0 // Establecer la opacidad inicial en 0
              UIView.animate(withDuration: 0.3) {
                  self.loadingView?.alpha = 1.0 // Animación para mostrar suavemente el indicador de carga
              }
              activityIndicator.startAnimating()
          }
      }

    func hideLoading() {
        DispatchQueue.main.async {
            if let loadingView = self.loadingView {
             UIView.animate(withDuration: 0.4, animations: {
                 loadingView.alpha = 0.1 // Animación para ocultar suavemente el indicador de carga
             }) { _ in
                 self.loadingView?.removeFromSuperview()
                 self.loadingView = nil
             }
          }
        }
     }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
