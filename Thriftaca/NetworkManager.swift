//
//  NetworkManager.swift
//  Thriftaca
//
//  Created by David Solsona on 01/12/2021.
//

import Alamofire
import Foundation

class Result: Codable {
    let url: String
}


class NetworkManager {

    static let endpoint = "https://hw534-course-demo.herokuapp.com"

    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        let parameters: [String: String] = [
            "upload_preset": "thriftaca",
        ]
        
        let imageData = image.jpegData(compressionQuality: 0.50)

        AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(imageData!, withName: "file", fileName: "file.pnggg", mimeType: "image/png")
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: "https://api.cloudinary.com/v1_1/dcbacnafu/upload").validate().responseData { response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let response = try? jsonDecoder.decode(Result.self, from: data) {
                        completion(response.url)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
}
