import Alamofire
import Foundation

class Result: Codable {
    let url: String
}


class NetworkManager {
    
    private static var sessionToken: String = ""
    static let endpoint = "https://thriftacahackchallenge.herokuapp.com"
    
    static func loginUser(email: String, password: String, completion: @escaping (UserResult) -> Void) {
        let parameters: [String: String] = [
            "email": email,
            "password": password,
        ]

        AF.request("\(endpoint)/login/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(UserResult.self, from: data) {
                    sessionToken = postResponse.session_token
                    completion(postResponse)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func createUser(email: String, password: String, contact_info: String, completion: @escaping (UserResult) -> Void) {
        let parameters: [String: String] = [
            "email": email,
            "password": password,
            "contact_info": contact_info
        ]

        AF.request("\(endpoint)/register/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(UserResult.self, from: data) {
                    sessionToken = postResponse.session_token
                    completion(postResponse)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getAllItems(completion: @escaping ([Item]) -> Void) {
        AF.request("\(endpoint)/get/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                do {
                    let postResponse = try jsonDecoder.decode(ItemsResponse.self, from: data)
                    completion(postResponse.posts)
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func createProduct(post_title: String, category: String, price: Double, description: String, image_url: String, completion: @escaping (Item) -> Void) {
        let parameters: [String: Any] = [
            "post_title": post_title,
            "category": category,
            "price": price,
            "description": description,
            "image_url": image_url,
        ]
        
        let headers: HTTPHeaders = [
                    "Authorization": "Bearer \(sessionToken)",
                    "Content-Type": "application/json" ]

        AF.request("\(endpoint)/post/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(Item.self, from: data) {
                    completion(postResponse)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    

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
