//
//  UIImage+Extensions.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIImage {
    static func downloadImage(fromURL urlString: String,_ completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(UIImage().withTintColor(.gray, renderingMode: .alwaysTemplate))
                }

            case .failure:
                completion(UIImage().withTintColor(.gray, renderingMode: .alwaysTemplate))
            }
        }
    }
}
