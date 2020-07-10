//
//  Webservice.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import Foundation
import SystemConfiguration


// MARK: Error enum Declaration

enum NetworkError:Error {
    case domainError
    case decodingError
    case urlError
}

// MARK: Http Method enum Declaration

enum  HttpMethod:String {
    case get = "GET"
}


// MARK: Webservice Class Implementation

class Webservices{
    

    //MARK: Methods For calling Api
    
    func getArtical(completion:   @escaping(Result<ListDataModel, NetworkError>)->()){
    
             var string: String? = nil
             let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
             let url = URL(string: urlString)
            
             do {
                     if let url = URL(string: urlString) {
                         string = try String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.isoLatin1.rawValue))
                     }
                 } catch {

                     print("Error in Api")
            }
             
            var request = URLRequest(url: url!)
            request.httpBody = nil
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                 
            URLSession.shared.dataTask(with: request){ data , response, error in
                guard  let _  =  data , error == nil else{
                    completion(.failure(.domainError))
                    return
                }
                
            let response = string?.data(using: .utf8)
            let result = try? JSONDecoder().decode(ListDataModel.self, from: response!)
           
    
            if let result = result{
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                }else{

                    completion(.failure(.decodingError))
                }
                                      
            }.resume()
    }
    
    
}

// MARK: Reachbility  Class Implementation


public class Reachability {
    
    static let shared = Reachability()
    
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}

