//
//  ServerClass.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation
import Alamofire

//Helper Class which manages all the server api calls

class NetworkCall : NSObject{

    enum services :String{
        case posts = "posts"
    }
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = ""
    var encoding: ParameterEncoding! = JSONEncoding.default
    var tokenRefresh = false

    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if url == nil, service != nil{
            self.url += service!.rawValue
        }else{
            self.url = url
        }
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print("Service: \(service?.rawValue ?? self.url ?? "") \n data: \(parameters)")
    }

    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void,failure: @escaping (() -> Void),tokenRefresh:Bool = false) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    case 400...500:
                        print(response)
                        code == 401 && tokenRefresh ? completion(.success(try! JSONDecoder().decode(T.self, from: res))) : failure()
                    default:
                        let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}


