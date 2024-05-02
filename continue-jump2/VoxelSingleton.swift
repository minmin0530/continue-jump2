//
//  VoxelSingleton.swift
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/05/02.
//

import Foundation

class VoxelSingleton {
        
    static func sendServerRequest(urlString: String, params: [String:Any], completion: @escaping (_: Data?) -> Void) {
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
                if error == nil {
//                    print("server response: \(String(describing: response))")
//                    print(data)
                    completion(data)
                } else {
                    print("server error:\(String(describing:error))")
                }
            })
            task.resume()
        } catch {
            print("error:\(error)")
        }
    }
}
