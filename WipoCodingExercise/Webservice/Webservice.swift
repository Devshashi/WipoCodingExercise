//
//  Webservice.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import Foundation
import SystemConfiguration


// MARK: Webservice Class Implementation

class Webservices{
    
    
    func getArtical(url:URL,completion: @escaping (ListDataModel?)->()){
        
        var string: String? = nil
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
        
        do {
            if let url = URL(string: urlString) {
                string = try String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.isoLatin1.rawValue))
            }
        } catch {
        }
        
        
        let responseData = string?.data(using: .utf8)
        var _: Any? = nil
        do {
            if let responseData = responseData {
                let decoder = JSONDecoder()
                let displayData = try? decoder.decode(ListDataModel.self, from: responseData)
                if let displayData = displayData {
                    completion(displayData)
                }
            }
        }
        
        
        
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

